package com.craftsy.webapp.controller;

import com.craftsy.webapp.database.dao.ProductDAO;
import com.craftsy.webapp.database.dao.UserDAO;
import com.craftsy.webapp.database.dao.UserRoleDAO;
import com.craftsy.webapp.database.entity.Product;
import com.craftsy.webapp.database.entity.User;
import com.craftsy.webapp.database.entity.UserRole;
import com.craftsy.webapp.form.CreateProductFormBean;
import com.craftsy.webapp.security.AuthenticatedUserService;
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
    private UserDAO userDAO;

    @Autowired
    private UserRoleDAO userRoleDAO;

    @Autowired
    private AuthenticatedUserService authenticatedUserService;

    @GetMapping("/product/search")
    public ModelAndView searchProduct(@RequestParam(required = false) String name){
        ModelAndView response = new ModelAndView();
        response.setViewName("product/search");
        //add the search field to the model so we can use it on the jsp page
        response.addObject("search", name);

        if ( name != null){
            List<Product> products = productDAO.findProductByName(name);
            response.addObject("productsFound", products );
        }
        return response;
    }

    @PreAuthorize("hasAuthority('ARTISAN')")
    @GetMapping("/product/create")
    public ModelAndView createProduct(){
        ModelAndView response = new ModelAndView();
        response.setViewName("product/createProduct");

//        List<User> artisans = userDAO.findAllUsersByUserRoles();
//        response.addObject("artisanFound", artisans);

//        //this will get the entity
//        User loggedInUser = authenticatedUserService.loadCurrentUser();
//        log.debug("!!!!!!!!!!" + loggedInUser.toString());

        return response;
    }

    @PreAuthorize("hasAuthority('ARTISAN')")
    @PostMapping("/product/create-product")
    public ModelAndView createProductSubmit(@Valid CreateProductFormBean form, BindingResult bindingResult)throws Exception{
        ModelAndView response = new ModelAndView();
        response.setViewName("product/createProduct");

        // manually do some validations here in the controller
        if (StringUtils.isEmpty(form.getUpload().getOriginalFilename())){
            // we are not allowing countries that start with X anymore
            bindingResult.rejectValue("upload", "does not matter", "NO file upload");
        } else if (bindingResult.hasErrors()){
            for (ObjectError error : bindingResult.getAllErrors()){
                log.debug(error.toString());
            }
            response.setViewName("product/createProduct");
            response.addObject("bindingResult", bindingResult);
            response.addObject("form", form);

//            List<User> users = userDAO.findAllUsers();
//            response.addObject("usersFound", users);

//            List<UserRole> artisan = userRoleDAO.findAllByRoleName("ARTISAN");
//            List<User> artisans = userDAO.findAllByUserRoles(artisan);
//            response.addObject("artisanFound", artisans);

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

            //priming this for employee dropdown for after going to error
//            User user = userDAO.findUserById(form.getUserId());
//            product.setUser(user);

            //image file upload
            log.debug("uploaded filename = " + form.getUpload().getOriginalFilename()+ " size = " + form.getUpload().getSize());
            String pathToSave = "./src/main/webapp/pub/images/" + form.getUpload().getOriginalFilename();
            Files.copy(form.getUpload().getInputStream(),  Paths.get(pathToSave), StandardCopyOption.REPLACE_EXISTING);
            String url = "/pub/images/" + form.getUpload().getOriginalFilename();
            product.setImageUrl(url);

            //save product
            productDAO.save(product);

            log.debug("======== SAVING CUSTOMER "+ product.getId());

            //in either case .... create or edit ... I now want to redirect to the edit url
            response.setViewName("redirect:/product/edit/" + product.getId() + "?success=true");
        }
        return response;
    }

    @GetMapping("/product/edit/{productId}")
    public  ModelAndView editProduct(@PathVariable Integer productId) {
        ModelAndView response = new ModelAndView();
        //this is the page primer for edit
        response.setViewName("product/createProduct");

        log.debug("======== EDITING CUSTOMER "+ productId);

        Product product = productDAO.findProductById(productId);

        CreateProductFormBean form = new CreateProductFormBean();

        form.setId(product.getId());
        form.setName(product.getName());
        form.setCategory(product.getCategory());
        form.setDescription(product.getDescription());
        form.setPrice(product.getPrice());
        form.setStockQuantity(product.getStockQuantity());

         // added this to reflect in dropdown the existing employee for that customer
        //alternate way
        response.addObject("form", form);
        //priming this for employee dropdown on edit page

        return response;
    }


}
