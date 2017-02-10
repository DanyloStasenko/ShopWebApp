package com.springapp.mvc.controllers;

import com.springapp.mvc.models.Product;
import com.springapp.mvc.models.User;
import com.springapp.mvc.services.IOrderService;
import com.springapp.mvc.services.IProductService;
import com.springapp.mvc.services.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AdminController {

    @Autowired(required = true)
    @Qualifier(value = "productService")
    private IProductService productService;

    @Autowired(required = true)
    @Qualifier(value = "userService")
    private IUserService userService;

    @Autowired(required = true)
    @Qualifier(value = "orderService")
    private IOrderService orderService;


    @RequestMapping(value = "/admin", method = RequestMethod.GET)
    public String admin(Model model){
        model.addAttribute("product", new Product());
        model.addAttribute("user", new User());
        model.addAttribute("products", this.productService.getProductsList());
        model.addAttribute("users", this.userService.getUsersList());
        model.addAttribute("orders", this.orderService.getOrdersList());
        return "admin";
    }

    @RequestMapping(value = "/admin/add", method = RequestMethod.POST)
    public String addProduct(@ModelAttribute("product") Product product){
        if(product.getTitle().isEmpty()){
            product.setTitle("default");
        }
        if(product.getId() == 0)
        {
            this.productService.addProduct(product);
        }
        else
        {
            this.productService.updateProduct(product);
        }
        return "redirect:/admin";
    }

    @RequestMapping("/admin/remove/{id}")
    public String removeProduct(@PathVariable("id") int id){
        this.productService.removeProduct(id);
        return "redirect:/admin";
    }

    @RequestMapping("/admin/editproduct{id}")
    public String editProduct(@PathVariable("id") int id, Model model){
        model.addAttribute("product", this.productService.getProductById(id));
        System.out.println(this.productService.getProductById(id));
        return "editproduct";
    }

    @RequestMapping(value = "/admin/adduser", method = RequestMethod.POST)
    public String addUser(@ModelAttribute("user") User user){
        if(user.getUsername().isEmpty()){
            user.setUsername("default");
        }
        if (!user.getRole().isEmpty()){
            user.setRole(user.getRole().toUpperCase());
        }
        if (!user.getRole().equalsIgnoreCase("USER") && !user.getRole().equalsIgnoreCase("ADMIN")){
            user.setRole("USER");
        }
        this.userService.addUser(user);
        return "redirect:/admin";
    }

    @RequestMapping(value = "/admin/removeuser/{username}", method = RequestMethod.GET)
    public String removeUser(@PathVariable("username") String username){
        User user = userService.getUserByUsername(username);
        if (!user.getUsername().equals("admin")){
            userService.removeUser(username);
        }
        return "redirect:/admin";
    }

    @RequestMapping(value = "/admin/removeorder/{id}", method = RequestMethod.GET)
    public String removeOrder(@PathVariable("id") int id){
        orderService.removeOrder(id);
        return "redirect:/admin";
    }
}