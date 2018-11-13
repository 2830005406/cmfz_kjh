package com.baizhi.dao;

import com.baizhi.entity.Album;

import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AlbumDAO {
    List<Album> queryByPage(@Param("start") int start, @Param("rows") int rows);
    Long queryTotal();
    List<Album> queryAll();
    void insertAlbum(Album album);
    void updateAlbum(Album album);
    Album queryOneById(int id);
    void deleteAlbum(@Param("id") int[] id);
}
