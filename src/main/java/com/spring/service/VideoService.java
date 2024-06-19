package com.spring.service;

import java.sql.SQLException;
import java.util.List;

import com.spring.command.PageMaker;
import com.spring.dto.VideoVO;

public interface VideoService {

    List<VideoVO> getVideoList(PageMaker pageMaker) throws SQLException;

    VideoVO getVideo(int vno) throws SQLException;

    void removeVideo(int vno) throws SQLException;

}