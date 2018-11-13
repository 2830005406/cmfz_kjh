package com.baizhi.controller;

import com.baizhi.entity.Banner;
import com.baizhi.entity.Course;
import com.baizhi.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/course")
public class CourseController {
    @Autowired
    private CourseService courseService;

    @RequestMapping("/findAll")
    public @ResponseBody List<Course> findAll(){
        return courseService.findAll();
    }
    @RequestMapping("/findByPage")
    public @ResponseBody Map<String, Object> findByPage(int page, int rows){
        Map<String, Object> map = new HashMap<>();
        Long total = courseService.findTotal();
        List<Course> banners = courseService.findByPage(page, rows);
        map.put("total",total);
        map.put("rows",banners);
        return map;
    }

    @RequestMapping("/removeCourse")
    public @ResponseBody String removeCourse(int[] id){
        courseService.removeCourse(id);
        return null;
    }

    @RequestMapping("/findOneById")
    public @ResponseBody Course findOneById(int id){
        return courseService.findOneById(id);
    }

    @RequestMapping("/modifyCourse")
    public @ResponseBody String modifyCourse(Course course){
        course.setCreateTime(new Date());
        course.setMarking("Yes");
        System.out.println(course);
        courseService.modifyCourse(course);
        return null;
    }

    @RequestMapping("/addCourse")
    public @ResponseBody String addCourse(Course course){
        course.setCreateTime(new Date());
        course.setMarking("Yes");
        System.out.println(course);
        courseService.addCourse(course);
        return null;
    }

}
