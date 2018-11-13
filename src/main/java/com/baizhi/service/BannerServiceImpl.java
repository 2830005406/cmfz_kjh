package com.baizhi.service;

import com.baizhi.dao.BannerDAO;
import com.baizhi.entity.Banner;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class BannerServiceImpl implements BannerService{
    @Autowired
    private BannerDAO bannerDAO;

    @Transactional(propagation = Propagation.SUPPORTS)
    @Override
    public List<Banner> findAll() {
        return bannerDAO.queryAll();
    }

    @Override
    public List<Banner> findByPage(int start, int rows) {
        int start2=(start-1)*rows;
        return bannerDAO.queryByPage(start2,rows);
    }

    @Override
    public Long findTotal() {
        return bannerDAO.queryTotal();
    }

    @Override
    public void addBanner(Banner banner) {
        bannerDAO.insertBanner(banner);
    }

    @Override
    public void removeBanner(int[] id) {
        bannerDAO.deleteBanner(id);
    }

    @Override
    public Banner findOneById(int id) {
        return bannerDAO.queryOneById(id);
    }

    @Override
    public void modifyBanner(Banner banner) {
        bannerDAO.updateBanner(banner);
    }
}
