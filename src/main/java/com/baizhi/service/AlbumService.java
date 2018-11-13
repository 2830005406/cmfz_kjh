package com.baizhi.service;

import com.baizhi.entity.Album;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AlbumService {
    List<Album> findByPage(int start, int rows);
    Long findTotal();
    List<Album> findAll();
    void addAlbum(Album album);
    void modifyAlbum(Album album);
    Album findOneById(int id);
    void removeAlbum(int[] id);
}
