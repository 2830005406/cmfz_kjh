package com.baizhi.service;

import com.baizhi.dao.ArticleDAO;
import com.baizhi.entity.Article;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class ArticleServiceImpl implements ArticleService{
    @Autowired
    private ArticleDAO articleDAO;

    @Override
    public List<Article> findAll() {
        return articleDAO.queryAll();
    }

    @Override
    public List<Article> findByPage(int start, int rows) {
        int start2=(start-1)*rows;
        return articleDAO.queryByPage(start2,rows);
    }

    @Override
    public Long findTotal() {
        return articleDAO.queryTotal();
    }

    @Override
    public void removeArticle(int[] id) {
        articleDAO.deleteArticle(id);
    }

    @Override
    public void addtArticle(Article article) {
        articleDAO.insertArticle(article);
    }

    @Override
    public Article findOneById(int id) {
        return articleDAO.queryOneById(id);
    }

    @Override
    public void modifyArticle(Article article) {
        articleDAO.updateArticle(article);
    }
}
