package com.springapp.mvc.controllers;

import com.springapp.mvc.models.Order;
import com.springapp.mvc.models.Product;
import com.springapp.mvc.services.IOrderService;
import com.springapp.mvc.services.IProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Transactional
@Controller
public class UserController {

    @Autowired(required = true)
    @Qualifier(value = "productService")
    private IProductService productService;

    @Autowired(required = true)
    @Qualifier(value = "orderService")
    private IOrderService orderService;

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