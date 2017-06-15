<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
hr {
    color: #dfdfdf;    /* IE */
    border-color: #dfdfdf;  /* 사파리 */
    background-color: #dfdfdf;   /* 크롬, 모질라 등, 기타 브라우저 */
}
</style>
</head>
<body>
	<div class="container" style="width: 800px;">
		<div style="margin-bottom: 50px;">
			<h4 align="left"><a href="mypage_reservation.do">나의 예매 내역</a></h4>
			
			<table class="table ">
				<tr>
					<td>예매번호</td>
					<td>포스터</td>
					<td>영화제목<br>관람극장 극장명<br>관람일시 날짜, 시간</td>
					<td>좌석, 인원수, 가격</td>
				</tr>
			</table>
		</div>
		
		<hr>
		
		<div style="margin-bottom: 50px;">
			<h4 align="left"><a href="mypage_myPoint.do">나의 포인트 내역</a></h4>
			
			<table class="table ">
				<tr>
					<td>날짜</td>
					<td>포인트 사용내역</td>
					<td>포인트 내역 (+7000, -2000 이렇게)</td>
				</tr>
			</table>
		</div>
		
		<hr>
		
		<div style="margin-bottom: 50px;">
			<h4 align="left"><a href="mypage_myQna.do">나의 문의 내역</a></h4>
			
			<table class="table ">
				<tr>
					<td>작성날짜</td>
					<td>[답변상태]</td>
					<td>질문제목(하이퍼링크는 고민해보고)</td>
				</tr>
			</table>
		</div>
	
	</div>
</body>
</html>