package com.baizhi.service;

import com.baizhi.dao.UserDAO;
import com.baizhi.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class UserServiceImpl implements UserService{
    @Autowired
    private UserDAO userDAO;

    @Override
    public List<User> findAll() {
        return userDAO.queryAll();
    }

    @Override
    public List<User> findByPage(int start, int rows) {
        int start2=(start-1)*rows;
        return userDAO.queryByPage(start2,rows);
    }

    @Override
    public long findTotal() {
        return userDAO.queryTotal();
    }

    @Override
    public void removeUser(int[] id) {
        userDAO.deleteUser(id);
    }

    @Override
    public void addUser(User user) {
        userDAO.insertUser(user);
    }

    @Override
    public User findOneById(int id) {
        return userDAO.queryOneById(id);
    }

    @Override
    public void modifyUser(User user) {
        userDAO.updateUser(user);
    }
}
