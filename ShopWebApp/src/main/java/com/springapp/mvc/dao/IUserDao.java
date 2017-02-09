package com.springapp.mvc.dao;

import com.springapp.mvc.models.User;

import java.util.List;

public interface IUserDao {
    public void add(User user);
    public void update(User user);
    public void removeByUsername(String username);
    public User getUserByUsername(String username);
    public List<User> getAll();
}
