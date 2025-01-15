package com.craftsy.webapp.database.dao;

import com.craftsy.webapp.database.entity.Product;
import com.craftsy.webapp.database.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface ProductDAO extends JpaRepository<Product, Long> {

    @Query( value = "SELECT p FROM Product p WHERE p.name LIKE %:name%")
    List<Product> findProductByNameIgnoreCase (String name);

    //harry potter magic way

    List<Product> findProductsById(Integer id);

    Product findProductById(Integer id);

    List<Product> findProductByDescription(String description);

    List<Product> findProductByUser(User user);
}
