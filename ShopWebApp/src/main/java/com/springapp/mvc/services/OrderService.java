package com.springapp.mvc.services;

import com.springapp.mvc.dao.IOrderDao;
import com.springapp.mvc.models.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Component
public class OrderService implements IOrderService {

    @Autowired
    private IOrderDao orderDao;

    @Override
    @Transactional
    public void addOrder(Order order) {
        orderDao.add(order);
    }

    @Override
    @Transactional
    public void updateOrder(Order order) {
        orderDao.update(order);
    }

    @Override
    @Transactional
    public void removeOrder(int id) {
        orderDao.remove(id);
    }

    @Override
    @Transactional
    public Order getOrderById(int id) {
        return orderDao.getById(id);
    }

    @Override
    @Transactional
    public List<Order> getOrdersList() {
        return orderDao.getAll();
    }
}