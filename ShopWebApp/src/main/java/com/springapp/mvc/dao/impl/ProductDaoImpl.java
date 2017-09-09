package com.springapp.mvc.dao.impl;

import com.springapp.mvc.dao.ProductDao;
import com.springapp.mvc.models.Product;
import org.springframework.stereotype.Component;

@Component
public class ProductDaoImpl extends GenericDaoImpl<Product> implements ProductDao {

}
