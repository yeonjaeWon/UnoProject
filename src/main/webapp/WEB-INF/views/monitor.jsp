<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="initial-scale=1, width=device-width" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<link rel="stylesheet"
	href="<%=request.getContextPath() %>/resources/CSS/monitor.css" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Newsreader:wght@400;500;600&display=swap" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" />
</head>
<body>

	<div class="div">
		<br />
		<main class="inner">
			<section class="group">
				<div class="div10">
					<div class="monitorvideo">
						<div class="videoda">
						<iframe class="children" src="http://127.0.0.1:5000/controlapi/stream">
						</iframe>
						</div>
					</div>
					<div class="parent1">
						<h3 class="h3">관제 영상</h3>
						<div class="xxx">UNO 농장 관제 실시간 영상</div>
					</div>
				</div>
				<div class="frame-parent">
					<div class="list-chip-parent">
						<button class="list-chip">
							<div class="div11">현재시각</div>
						</button>
						<div class="list-chip1">
							
							<div class="div12" id="clock">
								23:22:35
							</div>
						</div>
					</div>
					<div class="navbar-parent">
						<div class="navbar">
							<div class="wrapper5">
								<h3 class="h31">관제 로그</h3>
							</div>
							<div class="wrapper-list-chip-parent">
								<button class="list-chip2" onclick="savelist()">
									<img class="list-chip-icon" alt=""
										src="<%=request.getContextPath() %>/resources/statics/foldericon.svg"/>
								</button>
								<button class="list-chip2" onclick="openWindow()">
									<img class="trash-icon" alt=""
										src="<%=request.getContextPath() %>/resources/statics/settings.svg"/>
								</button>
								<button class="list-chip2" onclick="reloadPage()">
									<img class="trash-icon" alt=""
										src="<%=request.getContextPath() %>/resources/statics/autorenew.svg"/>
								</button>
								<button class="list-chip2" onclick="removePage()">
									<img class="trash-icon" alt="" 
										src="<%=request.getContextPath() %>/resources/statics/trash.svg"/>
								</button>
							</div>
						</div>
						<div class="rectangle-parent">
							<iframe id="controlLogFrame" src="<%=request.getContextPath() %>/controllog" width="535" height="630" frameborder="0"></iframe>
						</div>
					</div>
				</div>
			</section>
		</main>
	</div>
	<script>
		function removePage() {
		  if (confirm("로그 데이터를 모두 삭제하시겠습니까?")) {
		    // Ajax 요청을 통해 서버에 삭제 요청 전송
		    $.ajax({
		      url: "<%=request.getContextPath() %>/deleteControl",
		      type: "POST",
		      success: function(response) {
		        // 삭제 성공 시 처리할 로직 작성
		        alert("로그 데이터가 삭제되었습니다.");
		        // 페이지 새로고침
		        location.reload();
		      },
		      error: function(xhr, status, error) {
		        // 삭제 실패 시 처리할 로직 작성
		        alert("로그 데이터 삭제에 실패했습니다.");
		      }
		    });
		  }
		}
	</script>
	
	
	<script>
    // iframe을 1초마다 리로딩하는 함수
    function reloadControlLog() {
        var iframe = document.getElementById('controlLogFrame');
        iframe.src = iframe.src;
    }

    // 1초마다 reloadControlLog 함수 호출
    setInterval(reloadControlLog, 3000);
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

	<script>
		function openWindow() {
			var currentUrl = new URL(window.location.href);
			var parentPath = currentUrl.pathname.split('/').slice(0, -1).join('/');
			var moveurl = currentUrl.origin + parentPath +'/setting';
			var width = 580; // 새 창의 너비
		    var height = 685; // 새 창의 높이
		    var left = (window.innerWidth - width) / 2; 
		    var top = (window.innerHeight - height) / 2; 

		    // 새 창 열기
		    window.open(moveurl, '감지객체 활성화 설정', 'width=' + width + ', height=' + height + ', left=' + left + ', top=' + top);
			
		}
	</script>

	<script>
	const clock = document.getElementById("clock");
		
	function getClock() {
		// 현재 날짜와 시간을 가져오기
		const now = new Date();
		
		const year = now.getFullYear();
		const month = ('0' + (now.getMonth() + 1)).slice(-2);
		const day = ('0' + now.getDate()).slice(-2);

		const hour = now.getHours();
		const minutes = now.getMinutes();
		const seconds = now.getSeconds();
		var formattedDate = year+`-`+month+`-`+day+`  `+`  `+hour+`:`+minutes+`:`+seconds;
		
		clock.innerText = formattedDate;
	}
	
	getClock()
	setInterval(getClock, 1000);
	</script>

	<script>
		function reloadPage() {
			// 현재 창을 새로 고침합니다.
			location.reload();
		}
	</script>
</body>
	</html>