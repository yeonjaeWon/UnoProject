<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="initial-scale=1, width=device-width" />

   <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/CSS/detail.css"/>

    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css2?family=Newsreader:wght@400;500;600&display=swap"
    />
    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap"
    />
    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css2?family=Roboto:wght@700&display=swap"
    />
  </head>
  <body>
  <br/>
  <br/>
  <br/>
    <div class="div">
      
      <main class="frame-main">
        <section class="section">
          <div class="frame-parent">
            <div class="frame-group">
              <div class="videobox">
                <video class="video" width="100%" controls>
				    <source src="<%=request.getContextPath() %>/getVideo.do?vno=${video.vno}" type="video/mp4">
				</video>
              </div>

              
            </div>
            <div class="line-div"></div>
            <div class="frame-wrapper">
              <div class="video-item-parent">
                <div class="video-item">
                  <div class="video-list-control">
                    <div class="wrapper5">
                      <div class="div10">영상 번호</div>
                    </div>
                    <div class="bird-person-wrapper">
                      <div class="bird-person"><%= request.getParameter("vno") %></div>
                    </div>
                  </div>
                  <div class="video-list-control">
                    <div class="wrapper5">
                      <div class="div10">감지 물체</div>
                    </div>
                    <div class="bird-person-wrapper">
                      <div class="bird-person">${video.d_label == null ? '' : video.d_label}</div>
                    </div>
                  </div>
                  <div class="video-list-control">
                    <div class="wrapper5">
                      <div class="div10">생성일자</div>
                    </div>
                    <div class="bird-person-wrapper">
                      <div class="bird-person"><fmt:formatDate value="${video.regDate}" pattern="yyyy.MM.dd HH:mm:ss" /></div>
                    </div>
                  </div>
                  <div class="video-list-control">
                    <div class="wrapper5">
                      <div class="div10">감지 번호</div>
                    </div>
                    <div class="bird-person-wrapper">
                      <div class="bird-person">${video.dno}</div>
                    </div>
                  </div>
                </div>
                <div class="button-parent">
                  <button class="button">
                    <div class="div16" onclick="savelist()">목록</div>
                  </button>
                  <button class="button1" onclick="removeVideo(${video.vno})">
                    <div class="div17">삭제</div>
                  </button>
                </div>
              </div>
            </div>
          </div>
          <div class="inner">
        
          </div>
          <div class="video-20240401141326-parent">
            <div class="video-20240401141326">${video.v_title}</div>
            <div class="uno-wrapper">
              <div class="uno">UNO 농장 관제</div>
            </div>
          </div>
        </section>
      </main>
    </div>
    
    <script>
		function removeVideo(vno) {
		  if (confirm("정말로 삭제하시겠습니까?")) {
		    location.href = "<%=request.getContextPath()%>/remove?vno=" + vno;
		  }
		}
	</script>
    
    
    <script>
    // savelist 함수 정의
    function savelist() {
    	var currentUrl = new URL(window.location.href); 
    	
    	// pathname 속성을 사용하여 상위 경로로 이동 
    	var parentPath = currentUrl.pathname.split('/').slice(0, -1).join('/'); 
    	
    	// 새로운 URL로 이동 
    	window.location.href = currentUrl.origin + parentPath +'/list';
    	
    }
	</script>
    
  </body>
</html>