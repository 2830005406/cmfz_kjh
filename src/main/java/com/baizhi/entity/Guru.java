package com.baizhi.entity;

import java.util.List;

public class Guru {
    private int id;
    private String name;
    private String headPic;
    private String sex;

    public Guru() {
    }

    public Guru(int id, String name, String headPic, String sex, List<Article> article) {
        this.id = id;
        this.name = name;
        this.headPic = headPic;
        this.sex = sex;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getHeadPic() {
        return headPic;
    }

    public void setHeadPic(String headPic) {
        this.headPic = headPic;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    @Override
    public String toString() {
        return "Guru{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", headPic='" + headPic + '\'' +
                ", sex='" + sex + '\'' +
                '}';
    }
}
