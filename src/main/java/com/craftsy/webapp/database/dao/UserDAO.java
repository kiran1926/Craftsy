package com.craftsy.webapp.database.dao;

import com.craftsy.webapp.database.entity.Product;
import com.craftsy.webapp.database.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface UserDAO extends JpaRepository<User, Long> {

    User findUserById(Integer id);

    List<User> findUserByFullName(String firstName);

    User findUserByEmailIgnoreCase(String email);

}
