package com.springapp.mvc.service;


import com.springapp.mvc.model.Order;
import com.springapp.mvc.model.Product;

import java.util.List;

public interface IOrderService {
    public void addOrder(Order order);
    public void updateOrder(Order order);
    public void removeOrder(int id);
    public Order getOrderById(int id);
    public List<Order> getOrdersList();
}
