package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.spring.command.PageMaker;
import com.spring.dto.VideoVO;

public class VideoDAOImpl implements VideoDAO {

    private SqlSession sqlSession;

    public void setSqlSession(SqlSession session) {
        this.sqlSession = session;
    }

    @Override
    public List<VideoVO> selectVideoList(PageMaker pageMaker) throws SQLException {
        int offset = (pageMaker.getPage() - 1) * pageMaker.getPerPageNum();
        RowBounds rows = new RowBounds(offset, pageMaker.getPerPageNum());

        return sqlSession.selectList("Video-Mapper.selectVideoList", null, rows);
    }

    @Override
    public List<VideoVO> selectSearchVideoList(PageMaker pageMaker) throws SQLException {
        int offset = (pageMaker.getPage() - 1) * pageMaker.getPerPageNum();
        RowBounds rows = new RowBounds(offset, pageMaker.getPerPageNum());

        return sqlSession.selectList("Video-Mapper.selectSearchVideoList", pageMaker, rows);
    }

    @Override
    public int selectSearchVideoListCount(PageMaker pageMaker) throws SQLException {
        return sqlSession.selectOne("Video-Mapper.selectSearchVideoListCount", pageMaker);
    }

    @Override
    public VideoVO selectVideoByVno(int vno) throws SQLException {
        return sqlSession.selectOne("Video-Mapper.selectVideoByVno", vno);
    }

    @Override
    public void deleteVideo(int vno) throws SQLException {
        sqlSession.delete("Video-Mapper.deleteVideo", vno);
    }

}
