package com.springapp.mvc.service;

import com.springapp.mvc.dao.ProductDao;
import com.springapp.mvc.model.Product;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public class ProductServiceImpl implements ProductService {

    private ProductDao productDao;

    public void setProductDao(ProductDao productDao) {
        this.productDao = productDao;
    }

    @Override
    @Transactional
    public void addProduct(Product product) {
        this.productDao.addProduct(product);
    }

    @Override
    @Transactional
    public void updateProduct(Product product) {
        this.productDao.updateProduct(product);

    }

    @Override
    @Transactional
    public void removeProduct(int id) {
        this.productDao.removeProduct(id);
    }

    @Override
    @Transactional
    public Product getProductById(int id) {
        return  this.productDao.getProductById(id);
    }

    @Override
    @Transactional
    public List<Product> getProductsList() {
        return  this.productDao.getProductsList();
    }
}