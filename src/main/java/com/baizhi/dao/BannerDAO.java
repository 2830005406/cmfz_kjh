package com.baizhi.dao;

import com.baizhi.entity.Banner;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BannerDAO {
    List<Banner> queryAll();
    List<Banner> queryByPage(@Param("start") int start,@Param("rows") int rows);
    Long queryTotal();
    void insertBanner(Banner banner);
    void deleteBanner(@Param("id") int[] id);
    Banner queryOneById(int id);
    void updateBanner(Banner banner);
}
