package com.craftsy.webapp.database.dao;

import com.craftsy.webapp.database.entity.OrderDetail;
import com.craftsy.webapp.database.entity.Product;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface OrderDetailDAO extends JpaRepository<OrderDetail, Long> {

    List<OrderDetail> findOrderDetailById(Long id);

    List<OrderDetail> findOrderDetailByOrderId(Long orderId);

    List<OrderDetail> findOrderDetailByProductId(Long productId);

}
