package com.baizhi.service;

import com.baizhi.dao.AdminDAO;
import com.baizhi.entity.Admin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class AdminServiceImpl implements AdminService{
    @Autowired
    private AdminDAO adminDAO;

    @Transactional(propagation = Propagation.SUPPORTS)
    @Override
    public Admin findAdminByNameAndPassword(String name, String password) {
        return adminDAO.queryAdminByNameAndPassword(name,password);
    }

    @Override
    public void modifyAdminPwd(Admin admin) {
        adminDAO.updateAdminPwd(admin);
    }

    @Transactional(propagation = Propagation.SUPPORTS)
    @Override
    public Admin findOneByAdminId(int id) {
        return adminDAO.queryOneByAdminId(id);
    }
}
