package com.craftsy.webapp.services;

import com.craftsy.webapp.database.dao.ProductDAO;
import com.craftsy.webapp.database.entity.Product;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.ObjectUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Slf4j
@Service
public class ProductService {

    @Autowired
    private ProductDAO productDAO;

    public Boolean deleteProduct(Integer productId){
        Product product = productDAO.findProductById(productId);
        if(product == null){
            throw new IllegalArgumentException("Product not found.");
        }
        if(!ObjectUtils.isEmpty(product)) {
            productDAO.delete(product);
            return true;
        }
        return false;
    }
}
