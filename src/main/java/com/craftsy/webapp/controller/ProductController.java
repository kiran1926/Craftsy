package com.craftsy.webapp.controller;

import com.craftsy.webapp.database.dao.ProductDAO;
import com.craftsy.webapp.database.dao.UserDAO;
import com.craftsy.webapp.database.dao.UserRoleDAO;
import com.craftsy.webapp.database.entity.Product;
import com.craftsy.webapp.database.entity.User;
import com.craftsy.webapp.database.entity.UserRole;
import com.craftsy.webapp.form.CreateProductFormBean;
import com.craftsy.webapp.security.AuthenticatedUserService;
import com.craftsy.webapp.services.ProductService;
import jakarta.validation.Valid;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.List;

@Slf4j
@Controller
public class ProductController {

    @Autowired
    private ProductDAO productDAO;

    @Autowired
    private AuthenticatedUserService authenticatedUserService;

    @Autowired
    private ProductService productService;

    // ----------------    View Product list   -----------------

    @GetMapping("/products")
    public ModelAndView listProducts() {
        ModelAndView response = new ModelAndView("product/list");
        List<Product> products = productDAO.findAll();
        response.addObject("products", products);
        return response;
    }

    // ----------------    View Product details   -----------------
    @GetMapping("/product/{productId}")
    public ModelAndView viewProduct(@PathVariable Integer productId){
        ModelAndView response = new ModelAndView("product/view-product");
        Product product = productDAO.findProductById(productId);
        response.addObject("product", product);
        return response;
    }

    // ----------------    Category search   -----------------
    @GetMapping("/products/category")
    public ModelAndView searchByCategory(@RequestParam("category") String category) {
        ModelAndView response = new ModelAndView();
        try {
            List<Product> products = productService.getProductsByCategory(category);
            response.addObject("products", products);
            response.addObject("category", category);
        } catch (Exception e) {
            response.addObject("error", e.getMessage());
        }
        response.setViewName("product/list");
        return response;
    }


    // ----------------    Search Product    -----------------

    @GetMapping("/product/search")
    public ModelAndView searchProduct(@RequestParam(required = false) String name){
        ModelAndView response = new ModelAndView();
        response.setViewName("product/list");
        //add the search field to the model so we can use it on the jsp page
        response.addObject("search", name);

//        String searchUrl = "/defaultSearch";
//        if (request.getRequestURI().contains("/products")) {
//            searchUrl = "/search/products";
//        } else if (request.getRequestURI().contains("/categories")) {
//            searchUrl = "/search/categories";
//        }
//        request.setAttribute("searchUrl", searchUrl);

        if (name != null && !name.trim().isEmpty()){
            List<Product> products = productDAO.findProductByNameIgnoreCase(name);
            response.addObject("products", products );
            log.debug("product found " + products.toString() );
        }
        return response;
    }

    // ----------------    Create Product    -----------------

    @PreAuthorize("hasAnyAuthority('ADMIN','ARTISAN')")
    @GetMapping("/product/create")
    public ModelAndView createProduct(){
        ModelAndView response = new ModelAndView();
        response.setViewName("product/createProduct");

        User loggedInUser = authenticatedUserService.loadCurrentUser();
        log.debug("!!!!!!!!!!" + loggedInUser.toString());
        return response;
    }


    // ----------------    Create Product Submit    -----------------

    @PreAuthorize("hasAnyAuthority('ADMIN','ARTISAN')")
    @PostMapping("/product/create-product")
    public ModelAndView createProductSubmit(@Valid CreateProductFormBean form, BindingResult bindingResult)throws Exception{
        ModelAndView response = new ModelAndView();
        response.setViewName("product/createProduct");

        // manually do some validations here in the controller
        if (StringUtils.isEmpty(form.getUpload().getOriginalFilename())){
            bindingResult.rejectValue("upload", "does not matter", "No file upload");
        } else if (bindingResult.hasErrors()){
            for (ObjectError error : bindingResult.getAllErrors()){
                log.debug(error.toString());
            }
            response.setViewName("product/createProduct");
            response.addObject("bindingResult", bindingResult);
            response.addObject("form", form);

        }else {
            Product product;
            product = productDAO.findProductById(form.getId());
            if (product == null){
                product = new Product();
            }
            product.setName(form.getName());
            product.setDescription(form.getDescription());
            product.setPrice(form.getPrice());
            product.setStockQuantity(form.getStockQuantity());
            product.setCategory(form.getCategory());

            User loggedInUser = authenticatedUserService.loadCurrentUser();
            log.debug("!!!!!!!!!!" + loggedInUser.toString());
            product.setUserId(loggedInUser.getId());
            product.setUser(loggedInUser);

//            List<UserRole> artisan = userRoleDAO.findAllByRoleName("ARTISAN");
//            List<User> artisans = userDAO.findAllByUserRoles(artisan);
//            response.addObject("artisanFound", artisans);

            //priming this for user dropdown for after going to error
            // User user = userDAO.findUserById(form.getUserId());
            // product.setUser(user);

            //image file upload
            log.debug("uploaded filename = " + form.getUpload().getOriginalFilename()+ " size = " + form.getUpload().getSize());
            String pathToSave = "./src/main/webapp/pub/images/" + form.getUpload().getOriginalFilename();
            Files.copy(form.getUpload().getInputStream(),  Paths.get(pathToSave), StandardCopyOption.REPLACE_EXISTING);
            String url = "/pub/images/" + form.getUpload().getOriginalFilename();
            product.setImageUrl(url);

            //save product
            productDAO.save(product);

            log.debug("======== SAVING PRODUCT "+ product.getId());

            //in either case .... create or edit ... I now want to redirect to the edit url
            response.setViewName("redirect:/product/edit/" + product.getId() + "?success=true");
        }
        return response;
    }


    // ----------------    Edit Product    -----------------
    @PreAuthorize("hasAnyAuthority('ADMIN','ARTISAN')")
    @GetMapping("/product/edit/{productId}")
    public  ModelAndView editProduct(@PathVariable Integer productId) {
        ModelAndView response = new ModelAndView();
        //this is the page primer for edit
        response.setViewName("product/createProduct");

        log.debug("======== EDITING Product "+ productId);

        Product product = productDAO.findProductById(productId);

        CreateProductFormBean form = new CreateProductFormBean();

        form.setId(product.getId());
        form.setName(product.getName());
        form.setCategory(product.getCategory());
        form.setDescription(product.getDescription());
        form.setPrice(product.getPrice());
        form.setStockQuantity(product.getStockQuantity());
        form.setImageUrl(product.getImageUrl());
        //alternate way
        response.addObject("form", form);
        return response;
    }

}
