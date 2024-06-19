package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import com.spring.command.PageMaker;
import com.spring.dto.VideoVO;

public interface VideoDAO {

    // 영상 리스트 조회
    List<VideoVO> selectVideoList(PageMaker pageMaker) throws SQLException;
    
    // 검색된 영상 리스트 조회
    List<VideoVO> selectSearchVideoList(PageMaker pageMaker) throws SQLException;
    
    // 검색된 영상 개수 조회
    int selectSearchVideoListCount(PageMaker pageMaker) throws SQLException;
    
    // vno로 특정 영상 조회
    VideoVO selectVideoByVno(int vno) throws SQLException;
    
    // 영상 삭제
    void deleteVideo(int vno) throws SQLException;

}
