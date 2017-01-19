package com.springapp.mvc.dao;

import com.springapp.mvc.model.User;

import java.util.List;

public interface IUserDao {

    public void addUser(User user);
    public void updateUser(User user);
    public void removeUser(String username);
    public User getUserByUsername(String username);
    public List<User> getUsersList();

}
