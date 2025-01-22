package com.craftsy.webapp.controller;

import com.craftsy.webapp.database.dao.ProductDAO;
import com.craftsy.webapp.database.entity.Product;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestInstance;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.MockitoAnnotations;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import static org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestPostProcessors.user;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.view;
//
//@SpringBootTest
//@AutoConfigureMockMvc
//@TestInstance(TestInstance.Lifecycle.PER_CLASS)
//public class ProductControllerTest {
//
//    @Autowired
//    private MockMvc mockMvc;
//
//    //google and read mockmvc
//    @Mock
//    private ProductDAO productDAO; // Mock ProductDAO
//
//    @BeforeEach
//    public void setUp() {
//            // Initialize mocks before each test
//            MockitoAnnotations.openMocks(this);
//    }
//
//    @Test
//    public void searchProductTest_withName() throws Exception {
//        // Given
//        String searchName = "Vase";
//        (List<Product> mockProducts = Arrays.asList)(
////                new Product().setId(1).setName("The Jade Serpent Vase").setCategory("Pottery"),
////                new Product().setId(2).setName("The Golden Vase").setCategory("Ceramics")
//        );
//        // Mock the behavior of findProductByNameIgnoreCase method
//        Mockito.when(productDAO.findProductByNameIgnoreCase(searchName)).thenReturn(mockProducts);
//
//        // When & Then
//        mockMvc.perform(MockMvcRequestBuilders.get("/product/search")
//                        .param("name", searchName)) // Simulate GET request with query parameter 'name'
//                .andExpect(MockMvcResultMatchers.status().isOk()) // Check that the status is OK (200)
//                .andExpect(MockMvcResultMatchers.view().name("product/list")) // Check that the view name is "product/list"
//                .andExpect(MockMvcResultMatchers.model().attribute("search", searchName)) // Check that the "search" attribute is added to the model
//                .andExpect(MockMvcResultMatchers.model().attribute("products", mockProducts)); // Check that the "products" attribute contains the mock products
//    }
//
//    @Test
//    public void searchProductTest_withNoName() throws Exception {
//        // Given
//        String searchName = null; // No search term provided
//
//        // When & Then
//        mockMvc.perform(MockMvcRequestBuilders.get("/product/search")
//                        .param("name", searchName)) // Simulate GET request with no 'name' parameter
//                .andExpect(MockMvcResultMatchers.status().isOk()) // Check that the status is OK (200)
//                .andExpect(MockMvcResultMatchers.view().name("product/list")) // Check that the view name is "product/list"
//                .andExpect(MockMvcResultMatchers.model().attribute("search", searchName)) // Check that the "search" attribute is null
//                .andExpect(MockMvcResultMatchers.model().attributeDoesNotExist("products")); // Ensure that "products" attribute is not added when no search term is provided
//    }
//
//    @Test
//    public void searchProductTest_withEmptyName() throws Exception {
//        // Given
//        String searchName = ""; // Empty search term
//
//        // When & Then
//        mockMvc.perform(MockMvcRequestBuilders.get("/product/search")
//                        .param("name", searchName)) // Simulate GET request with empty 'name' parameter
//                .andExpect(MockMvcResultMatchers.status().isOk()) // Check that the status is OK (200)
//                .andExpect(MockMvcResultMatchers.view().name("product/list")) // Check that the view name is "product/list"
//                .andExpect(MockMvcResultMatchers.model().attribute("search", searchName)) // Check that the "search" attribute is empty
//                .andExpect(MockMvcResultMatchers.model().attributeDoesNotExist("products")); // Ensure that "products" attribute is not added when the search term is empty
//    }
//}
