package com.baizhi.dao;

import com.baizhi.entity.Article;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ArticleDAO {
    List<Article> queryAll();
    List<Article> queryByPage(@Param("start") int start, @Param("rows") int rows);
    Long queryTotal();
    void insertArticle(Article article);
    void deleteArticle(@Param("id") int[] id);
    Article queryOneById(int id);
    void updateArticle(Article article);
}
