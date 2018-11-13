package com.baizhi.service;

import com.baizhi.dao.CourseDAO;
import com.baizhi.entity.Course;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class CourseServiceImpl implements CourseService{
    @Autowired
    private CourseDAO courseDAO;

    @Override
    public List<Course> findAll() {
        return courseDAO.queryAll();
    }

    @Override
    public List<Course> findByPage(int start, int rows) {
        int start2=(start-1)*rows;
        return courseDAO.queryByPage(start2,rows);
    }

    @Override
    public Long findTotal() {
        return courseDAO.queryTotal();
    }

    @Override
    public void addCourse(Course course) {
        courseDAO.insertCourse(course);
    }

    @Override
    public void removeCourse(int[] id) {
        courseDAO.deleteCourse(id);
    }

    @Override
    public Course findOneById(int id) {
        return courseDAO.queryOneById(id);
    }

    @Override
    public void modifyCourse(Course course) {
        courseDAO.updateCourse(course);
    }
}
