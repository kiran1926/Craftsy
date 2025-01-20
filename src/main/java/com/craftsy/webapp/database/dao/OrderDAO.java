package com.craftsy.webapp.database.dao;

import com.craftsy.webapp.database.entity.Order;
import com.craftsy.webapp.database.entity.Product;
import org.aspectj.weaver.ast.Or;
import org.springframework.data.jpa.repository.JpaRepository;

import java.sql.Timestamp;
import java.util.List;

public interface OrderDAO extends JpaRepository<Order, Long> {

    Order findByUserId(Integer userId);

    List<Order> findOrderByOrderDate(Timestamp orderDate);

    Order findOrderByUserIdAndOrderStatus(Integer userId, String orderStatus);
}
