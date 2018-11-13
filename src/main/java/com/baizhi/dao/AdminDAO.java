package com.baizhi.dao;

import com.baizhi.entity.Admin;
import org.apache.ibatis.annotations.Param;

public interface AdminDAO {
    Admin queryAdminByNameAndPassword(@Param("name") String name, @Param("password") String password);
    void updateAdminPwd(Admin admin);
    Admin queryOneByAdminId(int id);
}
