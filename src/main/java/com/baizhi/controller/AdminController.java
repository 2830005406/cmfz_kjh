package com.baizhi.controller;

import com.baizhi.entity.Admin;
import com.baizhi.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    private AdminService adminService;

    @RequestMapping("/login")
    public @ResponseBody String login(String name,String password,HttpServletRequest request,String code){
        Admin admin = adminService.findAdminByNameAndPassword(name, password);
        HttpSession session = request.getSession();
        String code2 = (String)session.getAttribute("validationCode");
        if(code2.equals(code)){
            if(admin!=null){
                session.setAttribute("admin",admin);
                session.setAttribute("loginSuccess","loginSuccess");
                return "/back/main/main";
            }else{
                return "back/login";
            }
        }else{
            return "back/login";
        }


    }

    @RequestMapping("/logout")
    public String logout(HttpServletRequest request){
        HttpSession session = request.getSession();
        session.removeAttribute("admin");
        session.invalidate();
        return "redirect:/back/login.jsp";
    }

    @RequestMapping("/modifyAdminPwd")
    public @ResponseBody String modifyAdminPwd(Admin admin){
        adminService.modifyAdminPwd(admin);
        return null;
    }

    @RequestMapping("/findOneByAdminId")
    public @ResponseBody Admin findOneByAdminId(int id,HttpServletRequest request){
        HttpSession session = request.getSession();
        session.setAttribute("AdminInfo",adminService.findOneByAdminId(id));
        return adminService.findOneByAdminId(id);
    }
}
