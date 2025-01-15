package com.craftsy.webapp.controller;

import com.craftsy.webapp.database.dao.*;
import com.craftsy.webapp.database.entity.Order;
import com.craftsy.webapp.database.entity.OrderDetail;
import com.craftsy.webapp.database.entity.Product;
import com.craftsy.webapp.database.entity.User;
import com.craftsy.webapp.security.AuthenticatedUserService;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
@Controller
@PreAuthorize("hasAuthority('CUSTOMER')")
public class CartController {

    @Autowired
    private ProductDAO productDAO;

    @Autowired
    private UserDAO userDAO;



    @Autowired
    private OrderDetailDAO orderDetailDAO;

    @Autowired
    private AuthenticatedUserService authenticatedUserService;

    @Autowired
    private OrderDAO orderDAO;

    // ----------------    Add to Cart    -----------------

    @GetMapping("/cart/view")
    public ModelAndView viewCart() {
        ModelAndView response = new ModelAndView();

        // Retrieve the order\
        User loggedInUser = authenticatedUserService.loadCurrentUser();
        Integer userId = loggedInUser.getId();
        Order cartOrder = orderDAO.findOrderByUserId(userId);

        List<OrderDetail> cartItems = new ArrayList<>();
        double totalPrice = 0;

        if (cartOrder != null) {
            // Fetch all items in the cart (order_details for the cart order)
            cartItems = orderDetailDAO.findOrderDetailByOrderId(cartOrder.getId());

            // Calculate total price
            for (OrderDetail item : cartItems) {
                totalPrice += item.getProduct().getPrice() * item.getQuantity();
            }
        }

        response.addObject("cartItems", cartItems);
        response.addObject("totalPrice", totalPrice);
        response.setViewName("cart/view");
        return response;
    }

    @GetMapping("/cart/add/{productId}")
    public ModelAndView addToCart(@PathVariable Integer productId) {
        ModelAndView response = new ModelAndView();
        response.setViewName("cart/view");

        // Validate productId
        if (productId == null || productId <= 0) {
            response.setViewName("redirect:/error");
            return response;
        }
        User loggedInUser = authenticatedUserService.loadCurrentUser();
        Integer userId = loggedInUser.getId();

        //Check for existing order
        Order order = orderDAO.findOrderByUserIdAndOrderStatus(userId, "CART");
        if (order == null) {
            // Create a new order if not found
            order = new Order();
            order.setUserId(userId);
            order.setOrderStatus("CART");
            Timestamp currentTimestamp = new Timestamp(System.currentTimeMillis());
            order.setOrderDate(currentTimestamp);
            orderDAO.save(order);
        }

        // Fetch product from productId
        Product product = productDAO.findProductById(productId);

        // Check for existing order details
        OrderDetail orderDetails = orderDetailDAO.findOrderDetailByProductIdAndOrderId(product.getId(), order.getId());
        if (orderDetails == null) {
            // Create a new orderDetail if not found
            orderDetails = new OrderDetail();
            orderDetails.setOrderId(order.getId());
            orderDetails.setProductId(product.getId());
            orderDetails.setQuantity(1);
        }else {
            // Increment quantity in orderDetails
            orderDetails.setQuantity(orderDetails.getQuantity() + 1);
        }

        orderDetailDAO.save(orderDetails);

        response.addObject("cartItems", orderDetails);

        //redirect to cart page
        response.setViewName("redirect:/cart");

        return response;

    }
}



//select * from order where user_id = authenticated user id and status = cart
//if ( order is not found ) then create a new order in the database
//Query the product from the database using the id
//Query the orderDetails using the orderId and the product id ..
//if a record is found then increment the quantity by 1 and save
//if a record is not found then create a new orderDetails and set quantity to 1 and save
