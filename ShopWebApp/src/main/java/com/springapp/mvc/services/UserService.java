package com.springapp.mvc.services;

import com.springapp.mvc.dao.IUserDao;
import com.springapp.mvc.models.User;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


public class UserService implements IUserService {

    private IUserDao userDao;

    public void setUserDao(IUserDao userDao) {
        this.userDao = userDao;
    }

    @Override
    @Transactional
    public void addUser(User user) {
        this.userDao.addUser(user);
    }

    @Override
    @Transactional
    public void updateUser(User user) {
        this.userDao.updateUser(user);
    }

    @Override
    @Transactional
    public void removeUser(String username) {
        this.userDao.removeUser(username);
    }

    @Override
    @Transactional
    public User getUserByUsername(String username) {
        return this.userDao.getUserByUsername(username);
    }

    @Override
    @Transactional
    public List<User> getUsersList() {
        return this.userDao.getUsersList();
    }
}
