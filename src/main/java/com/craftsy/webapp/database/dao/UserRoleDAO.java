package com.craftsy.webapp.database.dao;

import com.craftsy.webapp.database.entity.Product;
import com.craftsy.webapp.database.entity.UserRole;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface UserRoleDAO extends JpaRepository<UserRole, Long> {

    UserRole findUserRoleById(Integer id);

    List<UserRole> findUserRoleByUserId(Integer userId);

    List<UserRole> findUserRoleByRoleName(String roleName);

    List<UserRole> findUserById(Integer id);
}
