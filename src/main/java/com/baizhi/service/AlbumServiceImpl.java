package com.baizhi.service;

import com.baizhi.dao.AlbumDAO;
import com.baizhi.entity.Album;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class AlbumServiceImpl implements AlbumService{
    @Autowired
    private AlbumDAO albumDAO;

    @Transactional(propagation = Propagation.SUPPORTS)
    @Override
    public List<Album> findByPage(int start, int rows) {
        int start2=(start-1)*rows;
        return albumDAO.queryByPage(start2,rows);
    }

    @Override
    public Long findTotal() {
        return albumDAO.queryTotal();
    }

    @Override
    public List<Album> findAll() {
        return albumDAO.queryAll();
    }

    @Override
    public void addAlbum(Album album) {
        albumDAO.insertAlbum(album);
    }

    @Override
    public void modifyAlbum(Album album) {
        albumDAO.updateAlbum(album);
    }

    @Override
    public Album findOneById(int id) {
        return albumDAO.queryOneById(id);
    }

    @Override
    public void removeAlbum(int[] id) {
        albumDAO.deleteAlbum(id);
    }
}
