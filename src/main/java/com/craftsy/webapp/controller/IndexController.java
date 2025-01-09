package com.craftsy.webapp.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Slf4j
@Controller
public class IndexController {
    //Homepage controller
    @GetMapping(value = {"/", "/homepage", "/homepage.html"})
    public ModelAndView homepage(){
        ModelAndView response = new ModelAndView();
        response.setViewName("homepage/homepage");
        return response;
    }

    @GetMapping("/index")
    public ModelAndView index(){
        ModelAndView response = new ModelAndView();
        response.setViewName("index");
        return response;
    }
}
