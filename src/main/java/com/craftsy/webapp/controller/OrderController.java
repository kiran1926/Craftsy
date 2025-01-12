package com.craftsy.webapp.controller;

import com.craftsy.webapp.database.dao.OrderDAO;
import com.craftsy.webapp.database.dao.ProductDAO;
import com.craftsy.webapp.database.dao.UserDAO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
@Slf4j
@Controller
@PreAuthorize("hasAuthority('CUSTOMER')")
public class OrderController {

    @Autowired
    private OrderDAO orderDAO;

    @Autowired
    private ProductDAO productDAO;

    @Autowired
    private UserDAO userDAO;

}
