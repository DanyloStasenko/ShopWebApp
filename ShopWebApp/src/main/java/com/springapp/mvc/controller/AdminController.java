package com.springapp.mvc.controller;

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
public class AdminController {

    private IProductService productService;
    private IUserService userService;
    private IOrderService orderService;

    @Autowired(required = true)
    @Qualifier(value = "productService")
    public void setProductService(IProductService productService){
        this.productService = productService;
    }

    @Autowired(required = true)
    @Qualifier(value = "userService")
    public void setUserService(IUserService userService){
        this.userService = userService;
    }

    @Autowired(required = true)
    @Qualifier(value = "orderService")
    public void setOrderService(IOrderService orderService){
        this.orderService = orderService;
    }


    @RequestMapping(value = "admin", method = RequestMethod.GET)
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

    @RequestMapping("/admin/editproduct/{id}")
    public String editProduct(@PathVariable("id") int id, Model model){
        model.addAttribute("product", this.productService.getProductById(id));
        return "editproduct";
    }

    @RequestMapping(value = "/admin/adduser", method = RequestMethod.POST)
    public String addUser(@ModelAttribute("user") User user){
        if(user.getUsername().isEmpty()){
            user.setUsername("default");
        }
        this.userService.addUser(user);
        return "redirect:/admin";
    }

    @RequestMapping(value = "/admin/removeuser/{username}", method = RequestMethod.GET)
    public String removeUser(@PathVariable("username") String username){
        userService.removeUser(username);
        return "redirect:/admin";
    }

    @RequestMapping(value = "/admin/removerder/{id}", method = RequestMethod.GET)
    public String removeOrder(@PathVariable("id") int id){
        orderService.removeOrder(id);
        return "redirect:/admin";
    }

}