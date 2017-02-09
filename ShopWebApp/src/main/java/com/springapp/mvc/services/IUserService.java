package com.springapp.mvc.services;

import com.springapp.mvc.models.User;

import java.util.List;

public interface IUserService {
    public void addUser(User user);
    public void updateUser(User user);
    public void removeUser(String username);
    public User getUserByUsername(String username);
    public List<User> getUsersList();
}