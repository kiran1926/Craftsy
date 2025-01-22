package com.craftsy.webapp.database.dao;

import com.craftsy.webapp.database.entity.Order;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.CsvSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;

@DataJpaTest
@AutoConfigureTestDatabase(replace = AutoConfigureTestDatabase.Replace.NONE)
public class OrderDAOTest {

    @Autowired
    private OrderDAO orderDAO;

    @ParameterizedTest
    @CsvSource({
            "1, CART, 7",
            "3, CART, 8"
    })
    public void findOrderByUserIdAndOrderStatusTest(Integer userId, String orderStatus, Integer id){

        Order actual = orderDAO.findOrderByUserIdAndOrderStatus(userId, orderStatus);

        Assertions.assertEquals(id, actual.getId());

    }
}
