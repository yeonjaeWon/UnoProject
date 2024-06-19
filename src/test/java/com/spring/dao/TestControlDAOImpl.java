package com.spring.dao;

import java.util.List;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.spring.dto.ControlVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:com/spring/context/root-context.xml")
@Transactional
public class TestControlDAOImpl {

    @Autowired
    private ControlDAO controlDAO;

    @Test
    @Rollback
    public void testSelectControlList() throws Exception {
        List<ControlVO> controlList = controlDAO.selectControlList();
        System.out.println("리스트 개수는: " + controlList.size());
        Assert.assertEquals(57, controlList.size());
    }

    @Test
    @Rollback
    public void testSelectControlByDno() throws Exception {
        ControlVO control = controlDAO.selectControlByDno(80);
        Assert.assertNotNull(control);
    }

    @Test
    @Rollback
    public void testDeleteControl() throws Exception {
        controlDAO.deleteControl(80);
        ControlVO control = controlDAO.selectControlByDno(80);
        Assert.assertNull(control);
    }
}
