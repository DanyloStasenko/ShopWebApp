package com.springapp.mvc.dao.impl;

import com.springapp.mvc.dao.OrderDao;
import com.springapp.mvc.models.Order;

import org.springframework.stereotype.Component;

@Component
public class OrderDaoImpl extends GenericDaoImpl<Order> implements OrderDao {

}
