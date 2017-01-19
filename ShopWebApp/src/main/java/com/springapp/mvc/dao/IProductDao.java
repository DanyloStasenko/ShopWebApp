package com.springapp.mvc.dao;

import com.springapp.mvc.model.Product;

import java.util.List;

public interface IProductDao {

    public void addProduct(Product product);
    public void updateProduct(Product product);
    public void removeProduct(int id);
    public Product getProductById(int id);
    public List<Product> getProductsList();

}
