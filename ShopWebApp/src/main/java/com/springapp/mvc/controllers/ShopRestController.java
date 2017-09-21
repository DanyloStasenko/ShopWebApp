package com.springapp.mvc.controllers;

import com.springapp.mvc.models.Product;
import com.springapp.mvc.services.IProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import java.util.List;

@EnableWebMvc
@RestController
public class ShopRestController {

    private final IProductService productService;

    @Autowired
    public ShopRestController(@Qualifier(value = "productService") IProductService productService) {
        this.productService = productService;
    }

    @RequestMapping(value = "allproducts")
    public List<Product> allProducts(){
        return this.productService.getProductsList();
    }
}
