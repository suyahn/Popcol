<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../popcol/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<style type="text/css">
	 .red-active { color: black; text-decoration: none;}
 	.red-active:hover { color: #CD1726; text-decoration: underline; font-weight: bold;}
</style>
</head>
<body>
	<c:if test="${ empty qnaReply.qreplycontent }">
		<hr>
		<div align="center" style="width: 70%;">
			<h4 style="font-weight: bold;" align="left">답변이 아직 작성되지 않았습니다.</h4>
			<br>
		</div>
	</c:if>

	<c:if test="${ not empty qnaReply.qreplycontent }">
		<hr>
		<div align="center" style="width: 70%;">
			<h4 style="font-weight: bold;" align="left">답변</h4>
			<table class="table">
				<tr>
					<td><pre style="white-space: pre-wrap; height: 100px;">${ qnaReply.qreplycontent }</pre></td>
				</tr>
			</table>
		</div>
	</c:if>
</body>
</html>