package com.springapp.mvc.controller;

import com.springapp.mvc.model.Product;
import com.springapp.mvc.service.ProductService;
import com.springapp.mvc.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

//@RequestMapping("/")
@Controller
public class ProductController {

    private ProductService productService;
    private UserService userService;

    @Autowired(required = true)
    @Qualifier(value = "productService")
    public void setProductService(ProductService productService){
        this.productService = productService;
    }

    @Autowired(required = true)
    @Qualifier(value = "userService")
    public void setUserService(UserService userService){
        this.userService = userService;
    }

    @RequestMapping(value = "products", method = RequestMethod.GET)
    public String listProducts(Model model){
        //model.addAttribute("product", new Product());
        model.addAttribute("products", this.productService.getProductsList());

        return "products";
    }

    @RequestMapping(value = "/admin/add", method = RequestMethod.POST)
    public String addProduct(@ModelAttribute("product") Product product)
    {
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

    @RequestMapping("/remove/{id}")
    public String removeProduct(@PathVariable("id") int id)
    {
        this.productService.removeProduct(id);

        return "redirect:/admin";
    }

    @RequestMapping("editproduct/{id}")
    public String editProduct(@PathVariable("id") int id, Model model)
    {
        model.addAttribute("product", this.productService.getProductById(id));
        model.addAttribute("listProducts", this.productService.getProductsList());

        return "editproduct";
    }

    @RequestMapping("productdata/{id}")
    public String domainData(@PathVariable("id") int id, Model model)
    {
        model.addAttribute("product", this.productService.getProductById(id));

        return "productdata";
    }

    @RequestMapping(value = "admin", method = RequestMethod.GET)
    public String admin(Model model)
    {
        model.addAttribute("product", new Product());
        model.addAttribute("products", this.productService.getProductsList());
        model.addAttribute("users", this.userService.getUsersList());

        return "admin";
    }

    @RequestMapping(value = "user", method = RequestMethod.GET)
    public String user(Model model)
    {
        model.addAttribute("products", this.productService.getProductsList());

        return "user";
    }

    @RequestMapping("/buyproduct/{id}")
    public String buyProduct(@PathVariable("id") int id)
    {
        Product product = this.productService.getProductById(id);

        return "redirect:/user";
    }

}