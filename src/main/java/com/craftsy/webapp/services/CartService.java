package com.craftsy.webapp.services;


import com.craftsy.webapp.database.dao.OrderDAO;
import com.craftsy.webapp.database.dao.OrderDetailDAO;
import com.craftsy.webapp.database.dao.ProductDAO;
import com.craftsy.webapp.database.entity.Order;
import com.craftsy.webapp.database.entity.OrderDetail;
import com.craftsy.webapp.database.entity.Product;
import com.craftsy.webapp.security.AuthenticatedUserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;

@Slf4j
@Service
public class CartService {

    @Autowired
    private OrderDAO orderDAO;

    @Autowired
    private OrderDetailDAO orderDetailDAO;

    @Autowired
    private AuthenticatedUserService authenticatedUserService;
    @Autowired
    private ProductDAO productDAO;


    // -----------------  Adjust cart quantity   ---------------------
    public void adjustCartQuantity (Integer productId, int adjustment){

        Integer userId = authenticatedUserService.loadCurrentUser().getId();
        Order cartOrder = orderDAO.findOrderByUserIdAndOrderStatus(userId, "CART");
        Product product = productDAO.findProductById(productId);

        if( cartOrder == null){
            throw new IllegalArgumentException( "Cart not found for user with userID : " + userId);
        }
        OrderDetail orderDetails = orderDetailDAO.findOrderDetailByProductIdAndOrderId(productId, cartOrder.getId());
        if( orderDetails == null){
            throw new IllegalArgumentException( "Product not found in the cart");
        }

        int newQuantity = orderDetails.getQuantity() + adjustment ;
        if (newQuantity <= 0 ){
            orderDetailDAO.delete(orderDetails);
        }else {
            orderDetails.setQuantity(newQuantity);
            orderDetailDAO.save(orderDetails);
            product.setStockQuantity(product.getStockQuantity() - adjustment);
            productDAO.save(product);
        }
    }

    // -----------------  Checkout   ---------------------

    public void cartCheckout (){

        Integer userId = authenticatedUserService.loadCurrentUser().getId();
        Order cartOrder = orderDAO.findOrderByUserIdAndOrderStatus(userId,"CART");
        if( cartOrder == null) {
            throw new IllegalArgumentException("Cart not found for user with userID : " + userId);
        }
        if(cartOrder.getOrderDetails() == null ||
                cartOrder.getOrderDetails().stream().noneMatch(orderDetail -> orderDetail != null)){
            throw new IllegalArgumentException("Cart is empty. Add items before checkout.");
        }
        cartOrder.setOrderStatus("PLACED");
        cartOrder.setOrderDate(new Timestamp(System.currentTimeMillis()));
        orderDAO.save(cartOrder);
    }
}
