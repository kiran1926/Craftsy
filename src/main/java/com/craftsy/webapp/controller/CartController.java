package com.craftsy.webapp.controller;

import com.craftsy.webapp.database.dao.*;
import com.craftsy.webapp.database.entity.Order;
import com.craftsy.webapp.database.entity.OrderDetail;
import com.craftsy.webapp.database.entity.Product;
import com.craftsy.webapp.database.entity.User;
import com.craftsy.webapp.security.AuthenticatedUserService;
import com.craftsy.webapp.services.CartService;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.ObjectUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.web.csrf.CsrfToken;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
@Controller
@PreAuthorize("hasAnyAuthority('CUSTOMER', 'ADMIN','ARTISAN')")
public class CartController {

    @Autowired
    private ProductDAO productDAO;

    @Autowired
    private OrderDetailDAO orderDetailDAO;

    @Autowired
    private AuthenticatedUserService authenticatedUserService;

    @Autowired
    private OrderDAO orderDAO;

    @Autowired
    private CartService cartService;

    // ----------------    Add to Cart    -----------------

    @GetMapping("/cart/view")
    public ModelAndView viewCart() {
        ModelAndView response = new ModelAndView();

        // Retrieve the order\
        User loggedInUser = authenticatedUserService.loadCurrentUser();
        Integer userId = loggedInUser.getId();
        Order cartOrder = orderDAO.findOrderByUserIdAndOrderStatus(userId, "CART");

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
        response.setViewName("product/view-product");

        // Validate productId
        if (productId == null || productId <= 0) {
            response.setViewName("redirect:/error");
            return response;
        }
        Integer userId = authenticatedUserService.loadCurrentUser().getId();
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
        product.setStockQuantity(product.getStockQuantity()- orderDetails.getQuantity());
        productDAO.save(product);

        if(ObjectUtils.isEmpty(orderDetails)){
            response.addObject("error", "Product add to cart failed.");
            response.setViewName("product/list");
        }else{
            response.addObject("message", "Product added to the cart");
            response.setViewName("products/list");
        }

        response.addObject("cartItems", orderDetails);
        response.addObject("product", product);

        //redirect to cart page
        response.setViewName("redirect:/products");
        return response;
    }

    //  ----------   Remove from cart --------------
    @GetMapping("/cart/remove/{productId}")
    public ModelAndView removeFromCart(@PathVariable Integer productId){
        ModelAndView response = new ModelAndView();
        response.setViewName("cart/view");

        // Validate productId
        if (productId == null || productId <= 0) {
            response.setViewName("redirect:/error");
            return response;
        }

        Integer userId = authenticatedUserService.loadCurrentUser().getId();

        //Check for existing order
        Product product = productDAO.findProductById(productId);
        Order order = orderDAO.findOrderByUserIdAndOrderStatus(userId, "CART");
        if(order != null){
            OrderDetail orderDetails = orderDetailDAO.findOrderDetailByProductIdAndOrderId(productId, order.getId());
             if(orderDetails != null) {
                 //remove from cart
                 Integer quantity = orderDetails.getQuantity();
                 orderDetailDAO.delete(orderDetails);
                 product.setStockQuantity(product.getStockQuantity()+ quantity);
                 productDAO.save(product);
                 log.debug("removed "+ orderDetails);
                 response.setViewName("redirect:/cart/view");
             }
        }
        return response;
    }

    // --------------- adjust cart quantity  -----------

    @PostMapping("/cart/adjustQuantity")
    public ModelAndView adjustCartQuantity (@RequestParam("productId") Integer productId,
                                            @RequestParam("adjustment") int adjustment){
        ModelAndView response = new ModelAndView();
        try{
            cartService.adjustCartQuantity(productId, adjustment);
            response.setViewName("redirect:/cart/view");
        }catch(IllegalArgumentException e ){
            response.addObject("error", e.getMessage());
            response.setViewName("cart/view");
        }
        response.addObject("adjustment", adjustment);
        return response;
    }

    // --------------- Order checkout  -----------

    @GetMapping("/cart/confirmation")
        public ModelAndView orderConfirmation(){
            ModelAndView response = new ModelAndView();
        Integer userId = authenticatedUserService.loadCurrentUser().getId();
        Order cartOrder = orderDAO.findOrderByUserIdAndOrderStatus(userId,"CART");
        List<OrderDetail> cartItems =  orderDetailDAO.findOrderDetailByOrderId(cartOrder.getId());
        double subtotal = 0;
        for (OrderDetail item : cartItems) {
            subtotal = subtotal + (item.getProduct().getPrice() * item.getQuantity());
        }
        double totalPrice = subtotal + (subtotal * 0.10);
        response.addObject("subtotal", subtotal);
        response.addObject("totalPrice", totalPrice);
            response.setViewName("cart/checkout");
        return response;
    }

    @PostMapping("/cart/checkout")
    public ModelAndView cartCheckout (){
        ModelAndView response = new ModelAndView();

        try{
            cartService.cartCheckout();
            response.addObject("message", "Order placed successfully!");
            response.setViewName("cart/checkout");
        } catch (Exception e) {
            response.addObject("error", e.getMessage());
            response.setViewName("cart/view");
        }
        return response;
    }
}

