package com.springapp.mvc.services;

import com.springapp.mvc.models.Product;

import java.util.List;

public interface IProductService {
    public void addProduct(Product product);
    public void updateProduct(Product product);
    public void removeProduct(int id);
    public Product getProductById(int id);
    public List<Product> getProductsList();
}
