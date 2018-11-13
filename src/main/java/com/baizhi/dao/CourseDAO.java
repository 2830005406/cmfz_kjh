package com.baizhi.dao;

import com.baizhi.entity.Course;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CourseDAO {
    List<Course> queryAll();
    List<Course> queryByPage(@Param("start") int start, @Param("rows") int rows);
    Long queryTotal();
    void insertCourse(Course course);
    void deleteCourse(@Param("id") int[] id);
    Course queryOneById(int id);
    void updateCourse(Course course);
}
