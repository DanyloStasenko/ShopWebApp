package com.springapp.mvc.services;

import com.springapp.mvc.models.Order;

import java.util.List;

public interface IOrderService {
    public void addOrder(Order order);
    public void updateOrder(Order order);
    public void removeOrder(int id);
    public Order getOrderById(int id);
    public List<Order> getOrdersList();
}
