package com.craftsy.webapp.database.dao;

import com.craftsy.webapp.database.entity.OrderDetail;
import com.craftsy.webapp.database.entity.Product;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface OrderDetailDAO extends JpaRepository<OrderDetail, Long> {

    List<OrderDetail> findOrderDetailByOrderId(Integer orderId);

    OrderDetail findOrderDetailByProductIdAndOrderId(Integer productId, Integer orderId);

}
