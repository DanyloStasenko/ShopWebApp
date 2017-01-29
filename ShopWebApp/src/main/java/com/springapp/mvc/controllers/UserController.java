package com.springapp.mvc.controllers;

import com.springapp.mvc.models.Order;
import com.springapp.mvc.models.Product;
import com.springapp.mvc.services.IOrderService;
import com.springapp.mvc.services.IProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class UserController {

    private IProductService productService;
    private IOrderService orderService;

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

    @RequestMapping(value = "/buyproduct/{id}/{name}", method = RequestMethod.GET)
    public String buyProduct(@PathVariable("id") int id, @PathVariable("name") String name){
        Order order = new Order();
        Product product = productService.getProductById(id);
        order.setProductTitle(product.getTitle());
        order.setUsername(name);
        orderService.addOrder(order);
        return "redirect:/basket";
    }

    @RequestMapping(value = "/basket/cancelorder/{id}/{name}/{productTitle}", method = RequestMethod.GET)
    public String cancelOrder(@PathVariable("id") int id, @PathVariable("name") String name,
                              @PathVariable("productTitle") String productTitle){
        Order order = orderService.getOrderById(id);
        if (order.getUsername().equals(name) && order.getProductTitle().equals(productTitle)){
            orderService.removeOrder(id);
        }
        return "redirect:/basket";
    }
}