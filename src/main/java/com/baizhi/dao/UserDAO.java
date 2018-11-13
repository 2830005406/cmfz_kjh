package com.baizhi.dao;

import com.baizhi.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserDAO {
    List<User> queryAll();
    List<User> queryByPage(@Param("start") int start,@Param("rows") int rows);
    long queryTotal();
    void deleteUser(@Param("id") int[] id);
    void insertUser(User user);
    User queryOneById(int id);
    void updateUser(User user);
}
