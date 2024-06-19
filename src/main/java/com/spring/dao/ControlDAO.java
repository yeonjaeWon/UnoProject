package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import com.spring.dto.ControlVO;

public interface ControlDAO {
	// 관제 로그 리스트 조회
	List<ControlVO> selectControlList() throws SQLException;
	
	// dno로 특정 관제 로그 조회
    ControlVO selectControlByDno(int dno) throws SQLException;
    
    //관제로그 삭제
    void deleteControl(int dno) throws SQLException;

    void deleteAllControl() throws SQLException;

    
}
