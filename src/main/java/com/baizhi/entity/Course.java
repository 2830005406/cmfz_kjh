package com.baizhi.entity;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;
import java.util.List;

public class Course {
    private int id;
    private String title;
    private String marking;
    private Date createTime;
    private int userId;
    private List<User> user;

    public Course() {
    }

    public Course(int id, String title, String marking, Date createTime, int userId, List<User> user) {
        this.id = id;
        this.title = title;
        this.marking = marking;
        this.createTime = createTime;
        this.userId = userId;
        this.user = user;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getMarking() {
        return marking;
    }

    public void setMarking(String marking) {
        this.marking = marking;
    }
    @JsonFormat(pattern = "yyyy-MM-dd",timezone = "GMT+8")
    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public List<User> getUser() {
        return user;
    }

    public void setUser(List<User> user) {
        this.user = user;
    }

    @Override
    public String toString() {
        return "Course{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", marking='" + marking + '\'' +
                ", createTime=" + createTime +
                ", userId=" + userId +
                ", user=" + user +
                '}';
    }
}
