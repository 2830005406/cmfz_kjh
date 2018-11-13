package com.baizhi.dao;

import com.baizhi.entity.Chapter;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ChapterDAO {
    List<Chapter> queryAll();
    List<Chapter> queryByPage(@Param("start") int start,@Param("rows") int rows);
    Long queryTotal();
    void insertChapter(Chapter chapter);
    void deleteChapter(@Param("id") int[] id);

}
