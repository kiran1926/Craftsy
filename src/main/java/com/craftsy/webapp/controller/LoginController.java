package com.craftsy.webapp.controller;

import com.craftsy.webapp.database.dao.UserDAO;
import com.craftsy.webapp.database.dao.UserRoleDAO;
import com.craftsy.webapp.database.entity.User;
import com.craftsy.webapp.database.entity.UserRole;
import com.craftsy.webapp.form.SignupFormBean;
import com.craftsy.webapp.security.AuthenticatedUserService;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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
    @Autowired
    private UserRoleDAO userRoleDAO;

    // -----------------------------  login page  --------------------------


    @GetMapping("/login/login")
    public ModelAndView theLoginPage() {
        ModelAndView response = new ModelAndView();
        response.setViewName("login/login");
        return response;
    }


    @GetMapping("/login/signup")
    public ModelAndView signup() {
        ModelAndView response = new ModelAndView();
        response.setViewName("login/signup");

        return response;
    }

    //for Don't have an account redirect to signup
    @GetMapping("/login/login/signup")
    public ModelAndView noAccSignup() {
        ModelAndView response = new ModelAndView();
        response.setViewName("login/signup");

        return response;
    }

    @PostMapping("/login/signupSubmit")
    public ModelAndView signupSubmit(@Valid SignupFormBean form, BindingResult bindingResult, HttpSession session){
        ModelAndView response = new ModelAndView();

        //could manually check the email from the database and ADD an error to the binding

        if (bindingResult.hasErrors()) {
            response.setViewName("login/signup");
            response.addObject("bindingResult", bindingResult);
            response.addObject("form", form);
        }else {
            User user = new User();

            user.setEmail(form.getUsername());
            user.setFullName(form.getFullname());

            String encryptedPassword = passwordEncoder.encode(form.getPassword());
            user.setPassword(encryptedPassword);

            userDAO.save(user);
            UserRole userRole = new UserRole();
            userRole.setUser(user);
            userRole.setUserId(user.getId());
            userRole.setRoleName("CUSTOMER");
            userRoleDAO.save(userRole);
            //since this is a new user we can manually authenticate them for the first time
            authenticatedUserService.changeLoggedInUsername(session, form.getUsername(), form.getPassword());

            //redirect
            response.setViewName("redirect:/");
        }
        return response;
    }
}