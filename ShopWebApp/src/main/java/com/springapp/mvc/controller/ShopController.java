package com.springapp.mvc.controller;

import com.springapp.mvc.model.Order;
import com.springapp.mvc.model.Product;
import com.springapp.mvc.model.User;
import com.springapp.mvc.service.IOrderService;
import com.springapp.mvc.service.IProductService;
import com.springapp.mvc.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class ShopController {

    private IProductService productService;
    private IOrderService orderService;
    private IUserService userService;

    @Autowired(required = true)
    @Qualifier(value = "productService")
    public void setProductService(IProductService productService){
        this.productService = productService;
    }

    @Autowired(required = true)
    @Qualifier(value = "orderService")
    public void setOrderService(IOrderService orderService){
        this.orderService = orderService;
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
        return "redirect:/login";
    }

}