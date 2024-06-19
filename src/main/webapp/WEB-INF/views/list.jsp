<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="initial-scale=1, width=device-width" />


<link rel="stylesheet"
	href="<%=request.getContextPath() %>/resources/CSS/list.css" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Newsreader:wght@400;500;600&display=swap" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!-- Font Awesome Icons -->
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/resources/bootstrap/plugins/fontawesome-free/css/all.min.css">
<!-- Theme style -->
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/resources/bootstrap/dist/css/adminlte.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/resources/bootstrap/plugins/summernote/summernote-bs4.min.css">

<style>
@font-face {
	font-family: "Pretendard";
	src: url("${pageContext.request.contextPath}/resources/statics/fonts/Pretendard-Medium.otf");
	font-weight: 500;
}
</style>
</head>
<body>
	<div class="diva">
		<br>
		<footer class="inner">
			<section class="frame-parent">
				<div class="frame-wrapper">
					<div class="frame-group">
						<div class="wrapper5">
							<h1 class="h1">영상기록</h1>
						</div>
						<div class="rectangle-parent">
							<img class="search-md-icon" alt=""
								src="<%=request.getContextPath() %>/resources/statics/searchlense.svg" />
							
							<input class="frame-item" placeholder="감지 물체 검색" type="text" name="keyword" value="${pageMaker.keyword}" />
						</div>
						<button class="buttoni" type="button" id="searchBtn" onclick="search_list(1);">
      					<div class="div10">검색</div>
    					</button>
    					<button class="buttoni" onclick="realtime_monitor()">
      					<div class="div10">관제</div>
    					</button>
					</div>
				</div>
				<div class="frame-container">
					<div class="contract-info-wrapper">
						<div class="contract-info">
							<div class="div11">영상 번호</div>
							<div class="div12">영상 제목</div>
							<div class="privacy-policy">
								<div class="div13">감지 물체</div>
							</div>
							<div class="user-info">
								<div class="div14">생성일자</div>
								<div class="div15">감지 번호</div>
							</div>
						</div>
					</div>
					<div class="divider"></div>
					<div class="frame-wrapper1">
						<div class="frame-parent1">
							<c:forEach items="${videoList}" var="video">
								<div class="group-div">
									<div class="frame-parent2">
										<div class="notice-list-parent">
											<div class="notice-list">
												<div class="div16">${video.vno}</div>
												<div class="group">
													<div class="div17">
														<a href="detail?vno=${video.vno}">${video.v_title}</a>
													</div>
													
												</div>
											</div>
											<div class="bird-wrapper">
												<div class="bird">${video.d_label == null ? '' : video.d_label}</div>
											</div>
										</div>
										<div class="wrapper6">
											<div class="div19">${video.dno}</div>
										</div>
									</div>
									<div class="wrapper7">
										<div class="div20">
											<fmt:formatDate value="${video.regDate}" pattern="yyyy.MM.dd HH:mm:ss" />
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
					<div class="frame-frame">
						<div class="frame1">
							<%@ include file="/WEB-INF/views/module/pagination.jsp"%>
						</div>
					</div>
				</div>
			</section>
		</footer>

	</div>
	
	
	 <script>
    // savelist 함수 정의
    function realtime_monitor() {
    	var currentUrl = new URL(window.location.href); 
    	
    	// pathname 속성을 사용하여 상위 경로로 이동 
    	var parentPath = currentUrl.pathname.split('/').slice(0, -1).join('/'); 
    	
    	// 새로운 URL로 이동 
    	window.location.href = currentUrl.origin + parentPath +'/monitor';
    	
    }
	</script>
	
	<%@ include file="/WEB-INF/views/module/common_js.jsp"%>
</body>

</html>




