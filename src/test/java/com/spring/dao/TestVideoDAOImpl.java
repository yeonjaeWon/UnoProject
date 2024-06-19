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

import com.spring.command.PageMaker;
import com.spring.dto.VideoVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:com/spring/context/root-context.xml")
@Transactional
public class TestVideoDAOImpl {

    @Autowired
    private VideoDAO videoDAO;

    @Test
    @Rollback
    public void testSelectVideoList() throws Exception {
        PageMaker pageMaker = new PageMaker();
        List<VideoVO> videoList = videoDAO.selectVideoList(pageMaker);
        System.out.println("리스트 개수는: " + videoList.size());
        Assert.assertEquals(10, videoList.size());
    }

    @Test
    @Rollback
    public void testSelectSearchVideoList() throws Exception {
        PageMaker pageMaker = new PageMaker();
        pageMaker.setSearchType("title");
        pageMaker.setKeyword("hen");
        List<VideoVO> videoList = videoDAO.selectSearchVideoList(pageMaker);
        //Assert 클래스는 Junit 프레임워크에서 제공하는 테스트 결과를 평가하고 검증하는데 사용됨.
        //Assert.assertEquals(expected, actual) 메서드는 예상한 값(expected)과 실제 값(actual)이 같은지를 비교.
        Assert.assertEquals(1, videoList.size());
    }

    @Test
    @Rollback
    public void testSelectSearchVideoListCount() throws Exception {
        PageMaker pageMaker = new PageMaker();
        pageMaker.setSearchType("title");
        pageMaker.setKeyword("hen");
        int count = videoDAO.selectSearchVideoListCount(pageMaker);
        Assert.assertEquals(1, count);
    }

    @Test
    @Rollback
    public void testSelectVideoByVno() throws Exception {
        VideoVO video = videoDAO.selectVideoByVno(40);
        //해당 객체에 저장된 값이 null 이 아닌지를 판단
        Assert.assertNotNull(video);
    }

    @Test
    @Rollback
    public void testDeleteVideo() throws Exception {
        videoDAO.deleteVideo(40);
        VideoVO video = videoDAO.selectVideoByVno(40);
        Assert.assertNull(video);
    }
}