package com.spring.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.command.PageMaker;
import com.spring.dto.ControlVO;
import com.spring.dto.VideoVO;
import com.spring.service.ControlService;
import com.spring.service.VideoService;

@Controller
public class Controlcontroller {
	
	@Autowired
    private VideoService videoService;

    @Autowired
    private ControlService controlService;
	
	@GetMapping("/monitor")
	public ModelAndView monitor(ModelAndView mnv) {
		String url = "/monitor";
		
		mnv.setViewName(url);
		return mnv;
	}
	
	@PostMapping("/deleteControl")
	@ResponseBody
	public String deleteControl() throws Exception {
	    controlService.removeAllControl();
	    return "success";
	}
	
	 @GetMapping("/control")
	    public ModelAndView control(ModelAndView mnv) throws Exception {
	        String url = "/control";

	        List<ControlVO> controlList = controlService.getControlList();
	        mnv.addObject("controlList", controlList);

	        mnv.setViewName(url);
	        return mnv;
	}
	 
	 @GetMapping("/controllog")
	 public ModelAndView controlLog(ModelAndView mnv) throws Exception {
	     String url = "/controllog";
	     List<ControlVO> controlList = controlService.getControlList();
	     mnv.addObject("controlList", controlList);
	     mnv.setViewName(url);
	     return mnv;
	 }
	
	
	@GetMapping("/list")
	public ModelAndView list(@ModelAttribute PageMaker pageMaker, ModelAndView mnv) throws Exception {
        String url = "/list";
        
        List<VideoVO> videoList = videoService.getVideoList(pageMaker);
        mnv.addObject("videoList", videoList);
		
		mnv.setViewName(url);
		return mnv;
	}
	
	@GetMapping("/setting")
	public ModelAndView setting(ModelAndView mnv) {
		String url = "/setting";
		
		mnv.setViewName(url);
		return mnv;
	}
	
	@GetMapping("/detail")
	public ModelAndView detail(int vno, ModelAndView mnv) throws Exception {
	    String url = "/detail";

	    VideoVO video = videoService.getVideo(vno);
	    mnv.addObject("video", video);

	    mnv.setViewName(url);
	    return mnv;
	}
	
	@RequestMapping("/getVideo.do")
	public void getVideo(@RequestParam("vno") int vno, HttpServletResponse response) throws IOException, SQLException {
	    // vno를 사용하여 해당 영상의 정보를 가져옴 (예: VideoService를 통해 Video 객체 가져오기)
	    VideoVO video = videoService.getVideo(vno);

	    // Video 객체에서 필요한 정보 추출
	    String pathUpload = video.getPathupload();  // 예: "c:/control/attach"
	    String vTitle = video.getV_title();  // 예: "daehanlab"
	    String fileType = video.getFiletype();  // 예: ".mp4"

	    // 영상 파일의 전체 경로 생성
	    String videoFilePath = pathUpload + "/" + vTitle + fileType;

	    // 영상 파일을 읽어와서 응답으로 전송
	    FileInputStream fis = new FileInputStream(videoFilePath);
	    ServletOutputStream sos = response.getOutputStream();
	    byte[] buffer = new byte[1024];
	    int bytesRead = -1;
	    while ((bytesRead = fis.read(buffer)) != -1) {
	        sos.write(buffer, 0, bytesRead);
	    }
	    fis.close();
	    sos.close();
	}
	
	@GetMapping("/remove")
	public String remove(int vno) throws Exception {
	    // 삭제할 영상 정보 조회
	    VideoVO video = videoService.getVideo(vno);

	    // 첨부파일 삭제
	    String filePath = video.getPathupload() + "/" + video.getV_title() + video.getFiletype();
	    System.out.println(filePath);
	    File file = new File(filePath);
	    if (file.exists()) {
	        file.delete();
	    }

	    // 영상 정보 삭제
	    videoService.removeVideo(vno);

	    return "redirect:/list";
	}
	

}
