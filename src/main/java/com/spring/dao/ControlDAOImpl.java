package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.spring.dto.ControlVO;

public class ControlDAOImpl implements ControlDAO{
	
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession session) {
        this.sqlSession = session;
    }

	@Override
	public List<ControlVO> selectControlList() throws SQLException {
		// TODO Auto-generated method stub
		return sqlSession.selectList("Control-Mapper.selectControlList");
	}

	@Override
	public ControlVO selectControlByDno(int dno) throws SQLException {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("Control-Mapper.selectControlByDno", dno);
	}

	@Override
	public void deleteControl(int dno) throws SQLException {
		sqlSession.delete("Control-Mapper.deleteControl", dno);
		
	}
	
	@Override
	public void deleteAllControl() throws SQLException {
	    sqlSession.delete("Control-Mapper.deleteAllControl");
	}
		
	

}
