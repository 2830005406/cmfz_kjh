package com.baizhi.service;

import com.baizhi.entity.Course;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CourseService {
    List<Course> findAll();
    List<Course> findByPage(int start,int rows);
    Long findTotal();
    void addCourse(Course course);
    void removeCourse(@Param("id") int[] id);
    Course findOneById(int id);
    void modifyCourse(Course course);
}
