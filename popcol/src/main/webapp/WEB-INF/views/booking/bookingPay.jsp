<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../popcol/header.jsp"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.dd {
	text-align: center;
}
</style>
</head>
<body>
	<div class="container" >
		<h2 style="color: #cd1726;" align="center">결제 선택</h2>
		<form action="main.do" method="post">
		<input type="hidden" value="${rt.rtid}" name="rtid"> 
		<input type="hidden" value="${price}" name="price"> 
		<input type="hidden" value="${seat}" name="seat"> 
		<input type="hidden" value="${adult}" name="adult"> 
		<input type="hidden" value="${youth}" name="youth"> 
		<input type="hidden" value="${special}" name="special"> 
		
</form>
</div>
</body>
</html>