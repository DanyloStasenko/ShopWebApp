package com.springapp.mvc.services;

import com.springapp.mvc.dao.OrderDao;
import com.springapp.mvc.models.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Component
@Transactional
public class OrderService implements IOrderService {

    @Autowired
    private OrderDao orderDao;

    @Override
    public void addOrder(Order order) {
        orderDao.add(order);
    }

    @Override
    public void updateOrder(Order order) {
        orderDao.update(order);
    }

    @Override
    public void removeOrder(int id) {
        orderDao.remove(id);
    }

    @Override
    public Order getOrderById(int id) {
        return orderDao.getById(id);
    }

    @Override
    public List<Order> getOrdersList() {
        return orderDao.getAll();
    }
}
