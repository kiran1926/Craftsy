package com.craftsy.webapp.services;

import com.craftsy.webapp.database.dao.ProductDAO;
import com.craftsy.webapp.database.entity.Product;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.ObjectUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

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

    public List<Product> getProductsByCategory(String category) {
        if (category == null || category.isEmpty()) {
            throw new IllegalArgumentException("Category cannot be null or empty");
        }
        return productDAO.findByCategoryIgnoreCase(category);
    }


//    public Page<Product> findByCategory(Integer categoryId, int page) {
//        Pageable pageable = PageRequest.of(page - 1, 12); // 12 products per page
//        if (categoryId == null) {
//            return productDAO.findAll(pageable);
//        }
//        return productDAO.findByCategoryId(categoryId, pageable);
//    }
}
