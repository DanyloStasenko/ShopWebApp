package com.springapp.mvc.dao;

import com.springapp.mvc.models.Product;
import org.springframework.stereotype.Component;

@Component
public class ProductDao extends GenericDao<Product> implements IProductDao {

}