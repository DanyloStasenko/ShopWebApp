package com.springapp.mvc.services;

import com.springapp.mvc.dao.IUserDao;
import com.springapp.mvc.models.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Component
@Transactional
public class UserService implements IUserService {

    @Autowired
    private IUserDao userDao;

    @Override
    public void addUser(User user) {
        this.userDao.add(user);
    }

    @Override
    public void updateUser(User user) {
        this.userDao.update(user);
    }

    @Override
    public void removeUser(String username) {
        this.userDao.removeByUsername(username);
    }

    @Override
    public User getUserByUsername(String username) {
        return this.userDao.getUserByUsername(username);
    }

    @Override
    public List<User> getUsersList() {
        return this.userDao.getAll();
    }
}