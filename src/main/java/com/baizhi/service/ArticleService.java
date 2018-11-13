package com.baizhi.service;

import com.baizhi.entity.Article;

import java.util.List;

public interface ArticleService {
    List<Article> findAll();
    List<Article> findByPage(int start, int rows);
    Long findTotal();
    void removeArticle(int[] id);
    void addtArticle(Article article);
    Article findOneById(int id);
    void modifyArticle(Article article);
}
