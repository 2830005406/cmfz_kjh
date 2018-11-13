package com.baizhi.service;

import com.baizhi.entity.Banner;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BannerService {
    List<Banner> findAll();
    List<Banner> findByPage(@Param("start") int start, @Param("rows") int rows);
    Long findTotal();
    void addBanner(Banner banner);
    void removeBanner(int[] id);
    Banner findOneById(int id);
    void modifyBanner(Banner banner);
}
