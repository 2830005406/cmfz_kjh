package com.baizhi.controller;

import com.baizhi.entity.Guru;
import com.baizhi.service.GuruService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/guru")
public class GuruController {
    @Autowired
    private GuruService guruService;

    @RequestMapping("/findAll")
    public @ResponseBody List<Guru> findAll(){
        return guruService.findAll();
    }

    @RequestMapping("/findByPage")
    public @ResponseBody Map<String, Object> findByPage(int page, int rows){
        Map<String, Object> map = new HashMap<>();
        Long total = guruService.findTotal();
        List<Guru> banners = guruService.findByPage(page, rows);
        map.put("total",total);
        map.put("rows",banners);
        return map;
    }

    @RequestMapping("/removeGuru")
    public @ResponseBody String removeGuru(int[] id){
        guruService.removeGuru(id);
        return null;
    }

    @RequestMapping("/addGuru")
    public @ResponseBody String addGuru(Guru guru){
        guruService.addGuru(guru);
        return null;
    }

    @RequestMapping("/modifyGuru")
    public @ResponseBody String modifyGuru(String name,String headPic,String sex,int id){
        Guru guru = new Guru();
        guru.setName(name);
        guru.setHeadPic(headPic);
        guru.setSex(sex);
        guru.setId(id);
        guruService.modifyGuru(guru);
        return null;
    }

    @RequestMapping("/uploadGuruImg")
    public @ResponseBody String uploadGuruImg(MultipartFile img, HttpServletRequest request) throws Exception{
        String filename = img.getOriginalFilename();
        String realPath = request.getSession().getServletContext().getRealPath("/back/img/guru");
        img.transferTo(new File(realPath,filename));
        return null;
    }
}
