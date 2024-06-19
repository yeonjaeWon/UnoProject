package com.spring.service;

import java.sql.SQLException;
import java.util.List;

import com.spring.dao.ControlDAO;
import com.spring.dto.ControlVO;


public class ControlServiceImpl implements ControlService {

    private ControlDAO controlDAO;

    public void setControlDAO(ControlDAO controlDAO) {
        this.controlDAO = controlDAO;
    }

    @Override
    public List<ControlVO> getControlList() throws SQLException {
        return controlDAO.selectControlList();
    }
    
    @Override
    public void removeAllControl() throws SQLException {
        controlDAO.deleteAllControl();
    }

}
