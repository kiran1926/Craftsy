package com.craftsy.webapp.controller;

import com.craftsy.webapp.database.dao.UserDAO;
import com.craftsy.webapp.security.AuthenticatedUserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Slf4j
@Controller
public class LoginController {

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private UserDAO userDAO;

    @Autowired
    private AuthenticatedUserService authenticatedUserService;

    // -----------------------------  login page  --------------------------


    @GetMapping("/login/login")
    public ModelAndView theLoginPage() {
        ModelAndView response = new ModelAndView();
        response.setViewName("login/loginPage");

        return response;
    }

    @GetMapping("/login/signup")
    public ModelAndView signup() {
        ModelAndView response = new ModelAndView();
        response.setViewName("login/signUp");

        return response;
    }
}