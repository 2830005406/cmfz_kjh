package com.baizhi.service;

import com.baizhi.dao.ChapterDAO;
import com.baizhi.entity.Chapter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class ChapterServiceImpl implements ChapterService{
    @Autowired
    private ChapterDAO chapterDAO;

    @Override
    public List<Chapter> findAll() {
        return chapterDAO.queryAll();
    }

    @Override
    public List<Chapter> findByPage(int start, int rows) {
        int start2=(start-1)*rows;
        return chapterDAO.queryByPage(start2,rows);
    }

    @Override
    public Long findTotal() {
        return chapterDAO.queryTotal();
    }

    @Override
    public void addChapter(Chapter chapter) {
        chapterDAO.insertChapter(chapter);
    }

    @Override
    public void removeChapter(int[] id) {
        chapterDAO.deleteChapter(id);
    }
}
