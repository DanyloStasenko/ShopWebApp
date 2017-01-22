package com.springapp.mvc.controller;

import com.springapp.mvc.service.IProductService;
import com.springapp.mvc.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class ShopController {

    private IProductService productService;
    private IUserService userService;

    @Autowired(required = true)
    @Qualifier(value = "productService")
    public void setProductService(IProductService productService){
        this.productService = productService;
    }

    @Autowired(required = true)
    @Qualifier(value = "userService")
    public void setProductService(IUserService userService){
        this.userService = userService;
    }

    @RequestMapping(value = "products", method = RequestMethod.GET)
    public String listProducts(Model model){
        model.addAttribute("products", this.productService.getProductsList());
        return "products";
    }

    @RequestMapping("productdata/{id}")
    public String domainData(@PathVariable("id") int id, Model model){
        model.addAttribute("product", this.productService.getProductById(id));
        return "productdata";
    }

    @RequestMapping("/guide")
    public String index(Model model){
        model.addAttribute("users", this.userService.getUsersList());
        return "guide";
    }
}