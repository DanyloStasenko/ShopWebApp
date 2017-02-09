package com.springapp.mvc.dao;

import com.springapp.mvc.models.Product;

import java.util.List;

public interface IProductDao {
    public void add(Product product);
    public void update(Product product);
    public void remove(int id);
    public Product getById(int id);
    public List<Product> getAll();
}
