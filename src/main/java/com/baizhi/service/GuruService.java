package com.baizhi.service;

import com.baizhi.entity.Guru;
import java.util.List;

public interface GuruService {
    List<Guru> findAll();
    List<Guru> findByPage(int start, int rows);
    Long findTotal();
    void addGuru(Guru guru);
    void removeGuru(int[] id);
    void modifyGuru(Guru guru);
}
