package com.springapp.mvc.dao;

import com.springapp.mvc.models.Order;

import java.util.List;

public interface IOrderDao {
    public void add(Order order);
    public void update(Order order);
    public void remove(int id);
    public Order getById(int id);
    public List<Order> getAll();
}
