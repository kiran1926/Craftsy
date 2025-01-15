package com.craftsy.webapp.services;

import com.craftsy.webapp.database.dao.OrderDAO;
import com.craftsy.webapp.database.dao.OrderDetailDAO;
import com.craftsy.webapp.database.dao.ProductDAO;
import com.craftsy.webapp.database.entity.Order;
import com.craftsy.webapp.database.entity.OrderDetail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;

@Service
public class OrderService {

    @Autowired
    private OrderDAO orderDAO;

    @Autowired
    private ProductDAO productDAO;

    @Autowired
    private OrderDetailDAO orderDetailDAO;

    public Order createNewOrder (Integer userId){

        Order newOrder = new Order();
        newOrder.setUserId(userId);
        newOrder.setOrderStatus("CART");

//        OrderDetail newOrderDetail = orderDetailDAO.findOrderDetailByProductIdAndOrderId()
//        newOrder.setOrderDetails();
        Timestamp currentTimestamp = new Timestamp(System.currentTimeMillis());
        newOrder.setOrderDate(currentTimestamp);

        return orderDAO.save(newOrder);
    }
}
