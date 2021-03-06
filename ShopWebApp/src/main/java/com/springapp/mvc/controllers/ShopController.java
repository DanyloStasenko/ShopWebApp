package com.springapp.mvc.controllers;

import com.springapp.mvc.models.User;
import com.springapp.mvc.services.IOrderService;
import com.springapp.mvc.services.IProductService;
import com.springapp.mvc.services.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class ShopController {
    private final IProductService productService;
    private final IUserService userService;
    private final IOrderService orderService;

    @Autowired(required = true)
    public ShopController(@Qualifier(value = "productService") IProductService productService,
                          @Qualifier(value = "userService") IUserService userService,
                          @Qualifier(value = "orderService") IOrderService orderService) {
        this.productService = productService;
        this.userService = userService;
        this.orderService = orderService;
    }

    @RequestMapping(value = "/target", method = RequestMethod.GET)
    public String target(Model model){
        model.addAttribute("products", this.productService.getProductsList());
        return "target";
    }

    @RequestMapping(value = "products", method = RequestMethod.GET)
    public String listProducts(Model model){
        model.addAttribute("products", this.productService.getProductsList());
        return "products";
    }

    @RequestMapping("productdata{id}")
    public String productData(@PathVariable("id") int id, Model model){
        model.addAttribute("product", this.productService.getProductById(id));
        return "productdata";
    }

    @RequestMapping("/home")
    public String index(Model model){
        model.addAttribute("users", this.userService.getUsersList());
        return "home";
    }

    @RequestMapping("/register")
    public String register(Model model){
        model.addAttribute("user", new User());
        model.addAttribute("users", this.userService.getUsersList());
        return "register";
    }

    @RequestMapping("/login")
    public String login(){
        return "redirect:/products";
    }

    @RequestMapping(value = "/basket", method = RequestMethod.GET)
    public String basket(Model model){
        model.addAttribute("products", this.productService.getProductsList());
        model.addAttribute("orders", this.orderService.getOrdersList());
        return "basket";
    }

    @RequestMapping(value = "/register/adduser", method = RequestMethod.POST)
    public String registerUser(@ModelAttribute("user") User user){
        if (!user.getUsername().isEmpty() && !user.getPassword().isEmpty()){
            user.setRole("USER");
            this.userService.addUser(user);
        }
        return "redirect:/register";
    }
}
