package com.springapp.mvc.dao;

import com.springapp.mvc.models.Order;

import org.springframework.stereotype.Component;

@Component
public class OrderDao extends GenericDao<Order> implements IOrderDao{

}
