package com.springapp.mvc.dao;

import com.springapp.mvc.model.Order;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.List;

public class OrderDao implements IOrderDao{

    private static final Logger logger = LoggerFactory.getLogger(ProductDao.class);

    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public void addOrder(Order order) {
        Session session = this.sessionFactory.getCurrentSession();
        session.persist(order);
        logger.info("Order saved " + order);
    }

    @Override
    public void updateOrder(Order order) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(order);
        logger.info("Order updated " + order);
    }

    @Override
    public void removeOrder(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        Order order = (Order) session.load(Order.class, new Integer(id));
        if (order != null)
        {
            session.delete(order);
        }
        logger.info("Order deleted " + order);
    }

    @Override
    public Order getOrderById(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        Order order = (Order) session.load(Order.class, new Integer(id));
        logger.info("Order loaded" + order);
        return order;
    }

    @Override
    public List<Order> getOrdersList() {
        Session session = this.sessionFactory.getCurrentSession();
        List<Order> orders = session.createQuery("from Order").list();

        for(Order order : orders)
        {
            logger.info("Orders list: " + order);
        }
        return orders;
    }
}
