package com.baizhi.controller;

import com.baizhi.entity.Album;
import com.baizhi.entity.Banner;
import com.baizhi.service.AlbumService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/album")
public class AlbumController {
    @Autowired
    private AlbumService albumService;

    @RequestMapping("/findByPage")
    public @ResponseBody Map<String, Object> findByPage(int page, int rows){
        Map<String, Object> map = new HashMap<>();
        Long total = albumService.findTotal();
        List<Album> banners = albumService.findByPage(page, rows);
        map.put("total",total);
        map.put("rows",banners);
        return map;
    }

    @RequestMapping("/findAll")
    public @ResponseBody List<Album> findAll(HttpServletRequest request){
        HttpSession session = request.getSession();
        session.setAttribute("albums",albumService.findAll());
        return albumService.findAll();
    }

    @RequestMapping("/addAlbum")
    public @ResponseBody String addAlbum(Album album, MultipartFile img, HttpServletRequest request) throws Exception{
        String filename = img.getOriginalFilename();
        String realPath = request.getSession().getServletContext().getRealPath("/back/img/album");
        img.transferTo(new File(realPath,filename));
        System.out.println(filename);
        System.out.println(realPath);
        album.setPublishDate(new Date());
        album.setCoverImg("/back/img/album/"+filename);
        albumService.addAlbum(album);
        return null;
    }

    @RequestMapping("/findOneById")
    public @ResponseBody Album findOneById(int id){
        return albumService.findOneById(id);
    }

    @RequestMapping("/modifyAlbum")
    public @ResponseBody String modifyAlbum(Album album, MultipartFile imgUrl, HttpServletRequest request) throws Exception{
        String filename = imgUrl.getOriginalFilename();
        String realPath = request.getSession().getServletContext().getRealPath("/back/img/album");
        imgUrl.transferTo(new File(realPath,filename));
        System.out.println(filename);
        System.out.println(realPath);
        album.setPublishDate(new Date());
        album.setCoverImg("/back/img/album/"+filename);
        albumService.modifyAlbum(album);
        return null;
    }
    @RequestMapping("/removeAlbum")
    public @ResponseBody String removeAlbum(int[] id){
        albumService.removeAlbum(id);
        return null;
    }
}
