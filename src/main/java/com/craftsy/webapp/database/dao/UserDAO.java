package com.craftsy.webapp.database.dao;

import com.craftsy.webapp.database.entity.Product;
import com.craftsy.webapp.database.entity.User;
import com.craftsy.webapp.database.entity.UserRole;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.Map;

public interface UserDAO extends JpaRepository<User, Long> {

    List<User> findByFullName(String firstName);
    User findUserByFullName(String fullName);

    User findUserByEmailIgnoreCase(String email);

    //Native Query
    @Query(value = "select * from users order by full_name asc;", nativeQuery = true)
    List<User> findAllUsers();

    //Native
    @Query(value= " select u.id, u.full_name, u.email, u.password from users u, user_roles ur where u.id = ur.user_id and ur.role_name = 'ARTISAN';", nativeQuery = true)
    List<User> findAllUsersByUserRoles();

}
