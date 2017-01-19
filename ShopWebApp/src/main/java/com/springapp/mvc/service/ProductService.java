package com.springapp.mvc.service;

import com.springapp.mvc.dao.IProductDao;
import com.springapp.mvc.model.Product;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public class ProductService implements IProductService {

    private IProductDao productDao;

    public void setProductDao(IProductDao productDao) {
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