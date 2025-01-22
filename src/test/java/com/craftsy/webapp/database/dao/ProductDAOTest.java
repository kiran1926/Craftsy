package com.craftsy.webapp.database.dao;


import com.craftsy.webapp.database.entity.Product;
import com.craftsy.webapp.services.ProductService;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestInstance;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.test.web.servlet.MockMvc;
@DataJpaTest
@AutoConfigureTestDatabase(replace = AutoConfigureTestDatabase.Replace.NONE)
public class ProductDAOTest {

    @Autowired
    private ProductDAO productDAO;

    @Test
    public void findProductByIdTest(){

       // Product findProductById(Integer id);

        //given
        Integer givenProductId = 4;

        //when
        Product e = productDAO.findProductById(givenProductId);

        //then
        Assertions.assertEquals("The Jade Serpent Vase", e.getName());
        Assertions.assertEquals("Pottery", e.getCategory());

    }
}
