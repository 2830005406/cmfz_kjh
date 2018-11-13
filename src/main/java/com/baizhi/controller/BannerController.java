package com.baizhi.controller;

import com.baizhi.entity.Banner;
import com.baizhi.service.BannerService;
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
@RequestMapping("/banner")
public class BannerController {
    @Autowired
    private BannerService bannerService;

    @RequestMapping("/findAll")
    public @ResponseBody List<Banner> findAll(){
        return bannerService.findAll();
    }

    @RequestMapping("/findByPage")
    public @ResponseBody Map<String, Object> findByPage(int page,int rows){
        Map<String, Object> map = new HashMap<>();
        Long total = bannerService.findTotal();
        List<Banner> banners = bannerService.findByPage(page, rows);
        map.put("total",total);
        map.put("rows",banners);
        return map;
    }

    @RequestMapping("/addBannerImg")
    public @ResponseBody String addBannerImg(MultipartFile img, HttpServletRequest request,Banner banner) throws Exception{
        String filename = img.getOriginalFilename();
        String realPath = request.getSession().getServletContext().getRealPath("/back/img/banner");
        System.out.println(filename);
        System.out.println(realPath);
        img.transferTo(new File(realPath,filename));

        banner.setDeployDate(new Date());
        banner.setImgPath("/back/img/banner/"+filename);
        banner.setStatus("Y");
        bannerService.addBanner(banner);
        return null;
    }

    @RequestMapping("/removeBanner")
    public @ResponseBody String removeBanner(int[] id){
        bannerService.removeBanner(id);
        return null;
    }

    @RequestMapping("/findOneById")
    public @ResponseBody Banner findOneById(int id){
       return bannerService.findOneById(id);
    }

    @RequestMapping("/modifyBanner")
    public @ResponseBody String modifyBanner(Banner banner,MultipartFile img,HttpServletRequest request) throws Exception{
        String filename = img.getOriginalFilename();
        String realPath = request.getSession().getServletContext().getRealPath("/back/img/banner");
        System.out.println(filename);
        System.out.println(realPath);
        img.transferTo(new File(realPath,filename));

        banner.setStatus("Y");
        banner.setDeployDate(new Date());
        banner.setImgPath("/back/img/banner/"+filename);
        bannerService.modifyBanner(banner);
        return null;
    }
}
