package com.craftsy.webapp.form;


import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import lombok.Getter;
import lombok.Setter;
import org.springframework.web.multipart.MultipartFile;

@Getter
@Setter
public class CreateProductFormBean {

    private Integer id;

    @NotEmpty(message = "Product Name is required.")
    private String name;

    @NotEmpty(message = "Product Category is required.")
    private String category;

    @NotEmpty(message = "Product Description is required.")
    private String description;

    @NotNull(message = "Product Price is required.")
    private Double price;

    @NotNull(message = "Product Quantity is required.")
    private Integer stockQuantity;

    @NotNull(message = "Product Image is required.")
    private MultipartFile upload;

    private Integer userId;
}
