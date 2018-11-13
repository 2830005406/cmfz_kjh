package com.baizhi.controller;

import com.baizhi.entity.Chapter;
import com.baizhi.service.ChapterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileInputStream;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.*;

@Controller
@RequestMapping("/chapter")
public class ChapterController {
    @Autowired
    private ChapterService chapterService;

    @RequestMapping("/findAll")
    public @ResponseBody List<Chapter> findAll(){
        return  chapterService.findAll();
    }

    @RequestMapping("/addChapter")
    public @ResponseBody String addChapter(Chapter chapter, MultipartFile music,HttpServletRequest request) throws Exception{
        String filename = music.getOriginalFilename();
        String realPath = request.getSession().getServletContext().getRealPath("/back/audio");
        System.out.println(filename);
        System.out.println(realPath);
        music.transferTo(new File(realPath,filename));

        chapter.setDownPath(filename);
        chapter.setUploadTime(new Date());
        chapterService.addChapter(chapter);
        return  null;
    }

    @RequestMapping("/findByPage")
    public @ResponseBody Map<String, Object> findByPage(int page, int rows, HttpServletRequest request){
        Map<String, Object> map = new HashMap<>();
        Long total = chapterService.findTotal();
        List<Chapter> banners = chapterService.findByPage(page, rows);
        map.put("total",total);
        map.put("rows",banners);
        HttpSession session = request.getSession();
        session.setAttribute("findByPage",chapterService.findAll());
        return map;
    }

    @RequestMapping("/removeChapter")
    public @ResponseBody String removeChapter(int[] id){
        chapterService.removeChapter(id);
        return null;
    }

    @RequestMapping("/downloadChapter")
    public @ResponseBody String downloadChapter(String fileName, HttpServletRequest request, HttpServletResponse response) throws Exception{
        String realPath = request.getSession().getServletContext().getRealPath("/back/audio");
        FileInputStream is = new FileInputStream(new File(realPath, fileName));
        response.setHeader("content-disposition","attachment;fileName="+URLEncoder.encode(fileName,"UTF-8"));
        ServletOutputStream os = response.getOutputStream();
        int len=0;
        byte[] b = new byte[2018];
        while (true){
            len = is.read(b);
            if(len==-1)break;
            os.write(b,0,len);

        }
        is.close();
        os.close();
        return null;
    }

}
