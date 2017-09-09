package com.springapp.mvc.dao.impl;

import com.springapp.mvc.dao.UserDao;
import com.springapp.mvc.models.User;
import org.hibernate.Session;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

@Repository("userDao")
public class UserDaoImpl extends GenericDaoImpl<User> implements UserDao {

    private static final Logger logger = LoggerFactory.getLogger(UserDaoImpl.class);

    @Override
    public void removeByUsername(String username) {
        Session session = this.sessionFactory.getCurrentSession();
        User user = (User) session.load(User.class, new String(username));
        if (user != null){
            session.delete(user);
        }
        logger.info("User deleted " + user);
    }

    @Override
    public User getUserByUsername(String username) {
        Session session = this.sessionFactory.openSession();
        User user = (User) session.load(User.class, new String(username));
        logger.info("User loaded" + user);
        session.close();
        return user;
    }
}
