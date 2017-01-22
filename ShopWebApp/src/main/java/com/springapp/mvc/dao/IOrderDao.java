package com.springapp.mvc.dao;

import com.springapp.mvc.model.Order;

import java.util.List;

public interface IOrderDao {
    public void addOrder(Order order);
    public void updateOrder(Order order);
    public void removeOrder(int id);
    public Order getOrderById(int id);
    public List<Order> getOrdersList();
}
