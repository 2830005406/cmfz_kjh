package com.baizhi.service;

import com.baizhi.entity.Chapter;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ChapterService {
    List<Chapter> findAll();
    List<Chapter> findByPage(int start, int rows);
    Long findTotal();
    void addChapter(Chapter chapter);
    void removeChapter(int[] id);
}
