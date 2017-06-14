<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../popcol/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table class="table table-hover">
		<c:forEach var="time" items="${timeList}">
		<!-- items의 locationList는 컨트롤의 리퀘스트 맵핑의 locationList와 연결 -->
			<tr>
				<td id="time_${time.rtid}" class="timertid" style="cursor: pointer;">${time.rttime }</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>