package com.craftsy.webapp.database.dao;

import com.craftsy.webapp.database.entity.OrderDetail;
import com.craftsy.webapp.database.entity.Product;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.CsvSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;

@DataJpaTest
@AutoConfigureTestDatabase(replace = AutoConfigureTestDatabase.Replace.NONE)
public class OrderDetailDAOTest {

    @Autowired
    private OrderDetailDAO orderDetailDAO;

    @ParameterizedTest
    @CsvSource({
            "1, 1, 2",
            "1, 2, 1",
            "2, 3, 1"
    })
    public void findOrderDetailByProductIdAndOrderIdTest(Integer productId, Integer orderId, Integer quantity ){
//        OrderDetail findOrderDetailByProductIdAndOrderId(Integer productId, Integer orderId);

        //when
        OrderDetail actual = orderDetailDAO.findOrderDetailByProductIdAndOrderId(productId, orderId);

        //then
        Assertions.assertEquals(quantity, actual.getQuantity());

    }
}
