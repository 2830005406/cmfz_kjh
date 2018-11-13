package com.baizhi.dao;

import com.baizhi.entity.Banner;
import com.baizhi.entity.Guru;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface GuruDAO {
    List<Guru> queryAll();
    List<Guru> queryByPage(@Param("start") int start, @Param("rows") int rows);
    Long queryTotal();
    void insertGuru(Guru guru);
    void deleteGuru(@Param("id") int[] id);
    void updateGuru(Guru guru);
}
