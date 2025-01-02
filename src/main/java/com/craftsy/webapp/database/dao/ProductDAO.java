package com.craftsy.webapp.database.dao;

import com.craftsy.webapp.database.entity.Product;
import com.craftsy.webapp.database.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface ProductDAO extends JpaRepository<Product, Long> {

    @Query( "select p from Product p where p.name = : name ")
    List<Product> findProductByName (String name);

    //harry potter magic way

    List<Product> findProductById(Long id);

    List<Product> findProductByDescription(String description);

    List<Product> findProductByUser(User user);

}
