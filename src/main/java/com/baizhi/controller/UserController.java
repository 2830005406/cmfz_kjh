package com.baizhi.controller;

import com.baizhi.entity.Chapter;
import com.baizhi.entity.User;
import com.baizhi.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;

    @RequestMapping("/findAll")
    public @ResponseBody List<User> findAll(){
        return userService.findAll();
    }

    @RequestMapping("/findByPage")
    public @ResponseBody Map<String, Object> findByPage(int page, int rows){
        Map<String, Object> map = new HashMap<>();
        Long total = userService.findTotal();
        List<User> banners = userService.findByPage(page, rows);
        map.put("total",total);
        map.put("rows",banners);
        return map;
    }

    @RequestMapping("/removeUser")
    public @ResponseBody String removeBanner(int[] id){
        userService.removeUser(id);
        return null;
    }

    @RequestMapping("/addUser")
    public @ResponseBody String addUser(User user){
        userService.addUser(user);
        return null;
    }

    @RequestMapping("/findOneById")
    public @ResponseBody User findOneById(int id){
        return userService.findOneById(id);
    }

    @RequestMapping("/modifyUser")
    public @ResponseBody String modifyUser(User user){
        userService.modifyUser(user);
        return null;
    }
}
