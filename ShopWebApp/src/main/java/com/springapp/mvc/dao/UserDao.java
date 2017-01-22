package com.springapp.mvc.dao;

import com.springapp.mvc.model.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.List;

public class UserDao implements IUserDao {

    private static final Logger logger = LoggerFactory.getLogger(ProductDao.class);

    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public void addUser(User user) {
        Session session = this.sessionFactory.getCurrentSession();
        session.persist(user);
        logger.info("User saved " + user);
    }

    @Override
    public void updateUser(User user) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(user);
        logger.info("User updated " + user);
    }

    @Override
    public void removeUser(String username) {
        Session session = this.sessionFactory.getCurrentSession();
        User user = (User) session.load(User.class, new String(username));
        if (user != null)
        {
            session.delete(user);
        }
        logger.info("User deleted " + user);
    }

    @Override
    public User getUserByUsername(String username) {
        Session session = this.sessionFactory.getCurrentSession();
        User user = (User) session.load(User.class, new String(username));
        logger.info("User loaded" + user);
        return user;
    }

    @Override
    public List<User> getUsersList() {
        Session session = this.sessionFactory.getCurrentSession();
        List<User> users = session.createQuery("from User").list();

        for(User user : users)
        {
            logger.info("Users list: " + user);
        }
        return users;
    }
}
