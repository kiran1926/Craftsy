package com.craftsy.webapp.controller;

import com.craftsy.webapp.database.dao.ProductDAO;
import com.craftsy.webapp.database.entity.Product;
import com.craftsy.webapp.services.ProductService;
import lombok.Getter;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.ObjectUtils;
import org.eclipse.tags.shaded.org.apache.xpath.operations.Bool;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Slf4j
@Controller
@RequestMapping("/admin")
@PreAuthorize("hasAuthority('ADMIN')")
public class AdminController {

    @Autowired
    private ProductDAO productDAO;
    @Autowired
    private ProductService productService;

    @GetMapping("/")
    public ModelAndView index(){
        ModelAndView response = new ModelAndView("admin/index");
        return response;
    }

    @GetMapping("/category")
    public ModelAndView category(){
        ModelAndView response = new ModelAndView("categories/categoryAdd");
        return response;
    }

    @GetMapping("/products")
    public ModelAndView viewProducts(){
        ModelAndView response = new ModelAndView("admin/products");
        List<Product> products = productDAO.findAll();
        response.addObject("products", products);
        return response;
    }

    @GetMapping("/deleteProduct/{productId}")
    public ModelAndView deleteProduct(@PathVariable Integer productId){
        ModelAndView response = new ModelAndView("categories/categoryAdd");
        Boolean deleteProduct = productService.deleteProduct(productId);
        if(deleteProduct){
            response.addObject("message", "Product delete success");
            response.setViewName("redirect:/admin/products");
        }else{
            response.addObject("error", "Product delete failed");
            response.setViewName("admin/products");
        }
        return response;
    }
}
