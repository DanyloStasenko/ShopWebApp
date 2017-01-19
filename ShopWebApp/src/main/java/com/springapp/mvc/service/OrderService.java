package com.springapp.mvc.service;

import com.springapp.mvc.dao.IOrderDao;
import com.springapp.mvc.model.Order;
import org.springframework.transaction.annotation.Transactional;


import java.util.List;

public class OrderService implements IOrderService {

    private IOrderDao orderDao;

    public void setOrderDao(IOrderDao orderDao) {
        this.orderDao = orderDao;
    }

    @Override
    @Transactional
    public void addOrder(Order order) {
        orderDao.addOrder(order);
    }

    @Override
    @Transactional
    public void updateOrder(Order order) {
        orderDao.updateOrder(order);
    }

    @Override
    @Transactional
    public void removeOrder(int id) {
        orderDao.removeOrder(id);
    }

    @Override
    @Transactional
    public Order getOrderById(int id) {
        return null;
    }

    @Override
    @Transactional
    public List<Order> getOrdersList() {
        return orderDao.getOrdersList();
    }

}

