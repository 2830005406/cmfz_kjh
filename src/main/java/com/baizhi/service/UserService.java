package com.baizhi.service;

import com.baizhi.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserService {
    List<User> findAll();
    List<User> findByPage(int start,int rows);
    long findTotal();
    void removeUser(@Param("id") int[] id);
    void addUser(User user);
    User findOneById(int id);
    void modifyUser(User user);
}
