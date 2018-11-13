package com.baizhi.service;

import com.baizhi.entity.Admin;

public interface AdminService {
    Admin findAdminByNameAndPassword(String name, String password);
    void modifyAdminPwd(Admin admin);
    Admin findOneByAdminId(int id);
}
