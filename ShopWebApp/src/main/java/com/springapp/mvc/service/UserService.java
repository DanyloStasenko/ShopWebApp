package com.springapp.mvc.service;

import com.springapp.mvc.model.User;

import java.util.List;

public interface UserService {
    public void addUser(User user);
    public void updateUser(User user);
    public void removeUser(String username);
    public User getUserByUsername(String username);
    public List<User> getUsersList();
}
