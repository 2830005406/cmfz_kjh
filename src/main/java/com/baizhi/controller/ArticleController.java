package com.baizhi.controller;

import com.baizhi.entity.Article;
import com.baizhi.entity.Banner;
import com.baizhi.entity.Guru;
import com.baizhi.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/article")
public class ArticleController {
    @Autowired
    private ArticleService articleService;

    @RequestMapping("/findAll")
    public @ResponseBody List<Article> findAll(){
        return articleService.findAll();
    }

    @RequestMapping("/findByPage")
    public @ResponseBody Map<String, Object> findByPage(int page, int rows){
        Map<String, Object> map = new HashMap<>();
        Long total = articleService.findTotal();
        List<Article> banners = articleService.findByPage(page, rows);
        map.put("total",total);
        map.put("rows",banners);
        return map;
    }

    @RequestMapping("/removeArticle")
    public @ResponseBody String removeBanner(int[] id){
        articleService.removeArticle(id);
        return null;
    }

    @RequestMapping("/addArticle")
    public @ResponseBody String addArticle(Article article, MultipartFile img, HttpServletRequest request,int guruId) throws Exception{
        String filename = img.getOriginalFilename();
        String realPath = request.getSession().getServletContext().getRealPath("/back/img/article");
        img.transferTo(new File(realPath,filename));
        article.setPublishDate(new Date());
        article.setImgPath("/back/img/article/"+filename);
        articleService.addtArticle(article);
        return null;
    }

    @RequestMapping("/findOneById")
    public @ResponseBody Article findOneById(int id){
        return articleService.findOneById(id);
    }

    @RequestMapping("/modifyArticle")
    public @ResponseBody String modifyBanner(Article article, MultipartFile img, HttpServletRequest request) throws Exception{
        String filename = img.getOriginalFilename();
        String realPath = request.getSession().getServletContext().getRealPath("/back/img/article");
        img.transferTo(new File(realPath,filename));

        article.setPublishDate(new Date());
        article.setImgPath("/back/img/article/"+filename);
        articleService.modifyArticle(article);
        return null;
    }

}
