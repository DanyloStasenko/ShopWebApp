package com.springapp.mvc.controllers;

import com.springapp.mvc.helpers.AuthHelper;
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
    private final IProductService productService;
    private final IOrderService orderService;
    private final AuthHelper authHelper;

    @Autowired(required = true)
    public UserController(@Qualifier(value = "productService") IProductService productService,
                          @Qualifier(value = "orderService") IOrderService orderService,
                          @Qualifier(value = "authHelper") AuthHelper authHelper) {
        this.productService = productService;
        this.orderService = orderService;
        this.authHelper = authHelper;
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

    @RequestMapping(value = "/basket/cancelorder/{id}", method = RequestMethod.GET)
    public String cancelOrder(@PathVariable("id") int id){
        Order order = orderService.getOrderById(id);
        if (order.getUsername().equals(authHelper.getLoggedInUserName())){
            orderService.removeOrder(id);
        }
        return "redirect:/basket";
    }
}
