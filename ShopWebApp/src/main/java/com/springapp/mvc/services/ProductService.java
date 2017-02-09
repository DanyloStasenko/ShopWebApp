package com.springapp.mvc.services;

import com.springapp.mvc.dao.IProductDao;
import com.springapp.mvc.models.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Component
public class ProductService implements IProductService {

    @Autowired
    private IProductDao productDao;

    @Override
    @Transactional
    public void addProduct(Product product) {
        this.productDao.add(product);
    }

    @Override
    @Transactional
    public void updateProduct(Product product) {
        this.productDao.update(product);

    }

    @Override
    @Transactional
    public void removeProduct(int id) {
        this.productDao.remove(id);
    }

    @Override
    @Transactional
    public Product getProductById(int id) {
        return  this.productDao.getById(id);
    }

    @Override
    @Transactional
    public List<Product> getProductsList() {
        return  this.productDao.getAll();
    }
}