package com.spring.service;

import java.sql.SQLException;
import java.util.List;

import com.spring.command.PageMaker;
import com.spring.dao.VideoDAO;
import com.spring.dto.VideoVO;

public class VideoServiceImpl implements VideoService {

    private VideoDAO videoDAO;

    public void setVideoDAO(VideoDAO videoDAO) {
        this.videoDAO = videoDAO;
    }

    @Override
    public List<VideoVO> getVideoList(PageMaker pageMaker) throws SQLException {
        List<VideoVO> videoList = videoDAO.selectVideoList(pageMaker);
        int totalCount = videoDAO.selectSearchVideoListCount(pageMaker);
        pageMaker.setTotalCount(totalCount);
        return videoList;
    }

    @Override
    public VideoVO getVideo(int vno) throws SQLException {
        return videoDAO.selectVideoByVno(vno);
    }

    @Override
    public void removeVideo(int vno) throws SQLException {
        videoDAO.deleteVideo(vno);
    }

}
