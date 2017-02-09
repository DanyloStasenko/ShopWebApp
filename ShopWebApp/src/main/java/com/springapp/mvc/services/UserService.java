package com.springapp.mvc.services;

import com.springapp.mvc.dao.IUserDao;
import com.springapp.mvc.models.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Component
public class UserService implements IUserService {

    @Autowired
    private IUserDao userDao;

    @Override
    @Transactional
    public void addUser(User user) {
        this.userDao.add(user);
    }

    @Override
    @Transactional
    public void updateUser(User user) {
        this.userDao.update(user);
    }

    @Override
    @Transactional
    public void removeUser(String username) {
        this.userDao.removeByUsername(username);
    }

    @Override
    @Transactional
    public User getUserByUsername(String username) {
        return this.userDao.getUserByUsername(username);
    }

    @Override
    @Transactional
    public List<User> getUsersList() {
        return this.userDao.getAll();
    }
}