package com.springapp.mvc.dao;

import java.util.List;

public interface GenericDao<T> {
    public void add(T model);
    public void update(T model);
    public void remove(int id);
    public T getById(int id);
    public List<T> getAll();
}
