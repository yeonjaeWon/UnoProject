package com.spring.service;

import java.sql.SQLException;
import java.util.List;

import com.spring.dto.ControlVO;

public interface ControlService {

    List<ControlVO> getControlList() throws SQLException;
    
    void removeAllControl() throws SQLException;

}
