package com.springapp.mvc.dao;

import com.springapp.mvc.model.Product;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import java.util.List;

public class ProductDao implements IProductDao {

    private static final Logger logger = LoggerFactory.getLogger(ProductDao.class);
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public void addProduct(Product product) {
        Session session = this.sessionFactory.getCurrentSession();
        session.persist(product);
        logger.info("Product saved " + product);
    }

    @Override
    public void updateProduct(Product product) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(product);
        logger.info("Product updated " + product);
    }

    @Override
    public void removeProduct(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        Product product = (Product) session.load(Product.class, new Integer(id));
        if (product != null)
        {
            session.delete(product);
        }
        logger.info("Product deleted " + product);
    }

    @Override
    public Product getProductById(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        Product product = (Product) session.load(Product.class, new Integer(id));
        logger.info("Product loaded" + product);

        return product;
    }

    @Override
    public List<Product> getProductsList() {
        Session session = this.sessionFactory.getCurrentSession();
        List<Product> products = session.createQuery("from Product").list();

        for(Product product : products)
        {
            logger.info("Product list: " + product);
        }

        return products;
    }
}
