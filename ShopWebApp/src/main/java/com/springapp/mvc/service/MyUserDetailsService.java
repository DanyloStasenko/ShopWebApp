package com.springapp.mvc.service;

import java.util.List;

import com.springapp.mvc.dao.UserDao;

import com.springapp.mvc.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service(value="userDetailsService")
public class MyUserDetailsService implements UserDetailsService {

    @Autowired()
    @Qualifier(value="userDatabaseDao")
    private UserDao userDao;

    public MyUserDetailsService() {
    }

    @Transactional
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

        User user = userDao.getUserByUsername(username);
        if (user == null) {
            throw new UsernameNotFoundException("User with Username: " + username + " not found!");
        }
        return user;
    }

    @Transactional
    public List<User> getAll(){
        return userDao.getUsersList();
    }

}
