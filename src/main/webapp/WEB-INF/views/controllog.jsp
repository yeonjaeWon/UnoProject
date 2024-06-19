<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Control Log</title>
    
    <style>
	    .frame-child1 {
		  position: relative;
		  border-radius: 2px;
		  background-color: rgba(40, 202, 65, 0.15);
		  width: 90px;
		  height: 21px;
		  z-index: 1;
		}
		.safe {
	      flex: 1;
		  position: relative;
		  text-align: center;
		  font-weight: 500;
		  font-family: Inter;
		  font-size: 14px;
		  z-index: 1;
		  color: #139026;
		}
		.dangerous {
		  font-size: 14px;
		  position: relative;
		  flex: 1;
		  text-align: center;
		  position: relative;
		  font-weight: 500;
		  font-family: Inter;
		  z-index: 1;
		  color: #c92929;
		}
		.group-div {
	      position: relative;
		  border-radius: 2px;
		  width: 90px;
		  height: 21px;
		  background-color: rgba(244, 26, 12, 0.24);
		  z-index: 1;
		}
		.dada{
		  	display: flex;
		    justify-content: center; /* 수평 가운데 정렬 */
		    align-items: center; /* 수직 가운데 정렬 */
		}
		
        .log-container {
            width: 520px;
            height: 610px;
            overflow-y: auto;
        }
        .log-table {
            width: 100%;
            border-collapse: collapse;
            
        }
        .log-table th, .log-table td {
        	justify-content: center;
            padding: 8px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }
    </style>
</head>
<body>
    <div class="log-container">
        <table class="log-table">
            <thead>
                <tr>
                    <th>No</th>
                    <th>감지물체</th>
                    <th>측정시간</th>
                    <th>상태</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${controlList}" var="control" varStatus="status">
                    <tr>
                        <td>${control.dno}</td>
                        <td>${control.d_label}</td>
                        <td><fmt:formatDate value="${control.d_time}" pattern="yyyy.MM.dd:HH:mm:ss" /></td>
                        <td class="dada">
                            <c:choose>
                                <c:when test="${control.d_status == 'Safe'}">
                                    <div class="frame-child1"><div class="safe">Safe</div></div>
                                </c:when>
                                <c:otherwise>
                                    <div class="group-div"><div class="dangerous">Dangerous</div></div>
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>