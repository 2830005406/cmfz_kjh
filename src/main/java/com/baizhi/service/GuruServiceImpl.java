package com.baizhi.service;

import com.baizhi.dao.GuruDAO;
import com.baizhi.entity.Banner;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.baizhi.entity.Guru;

import java.util.List;

@Service
@Transactional
public class GuruServiceImpl implements GuruService{
    @Autowired
    private GuruDAO guruDAO;

    @Override
    public List<Guru> findAll() {
        return guruDAO.queryAll();
    }

    @Override
    public List<Guru> findByPage(int start, int rows) {
        int start2=(start-1)*rows;
        return guruDAO.queryByPage(start2,rows);
    }

    @Override
    public Long findTotal() {
        return guruDAO.queryTotal();
    }

    @Override
    public void addGuru(Guru guru) {
        guruDAO.insertGuru(guru);
    }

    @Override
    public void removeGuru(int[] id) {
        guruDAO.deleteGuru(id);
    }

    @Override
    public void modifyGuru(Guru guru) {
        guruDAO.updateGuru(guru);
    }
}
