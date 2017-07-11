<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../popcol/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Admin View</title>
<!-- <script type="text/javascript">
	$(function() {
		$('#list').load('adminList.do?pageNum=${pageNum}');
	});
</script> -->
</head>
<body>
	<div class="container" align="center" style="width: 800px;">
		<h2 style="font-weight: bold;" >영화 상세정보</h2>
		<table class="table table-bordered">
			<tr>
				<td>제목</td>
				<td>${movie.mtitle}</td>
			</tr>
			<tr>
				<td>원제</td>
				<td>${movie.moriginaltitle}</td>
			</tr>
			<tr>
				<td>감독</td>
				<td>${movie.mdirector}</td>
			</tr>
			<tr>
				<td>배우</td>
				<td>${movie.mactor}</td>
			</tr>
			<tr>
				<td>줄거리</td>
				<td><pre style="white-space: none; height: 200px;">${movie.mcontent}</pre></td>
			</tr>
			<tr>
				<td>개봉일</td>
				<td>${movie.mreleaseDate}</td>
			</tr>
			<tr>
				<td>러닝타임</td>
				<td>${movie.mrunningTime}</td>
			</tr>
			<tr>
				<td>예고편</td>
				<td>${movie.murlPreview}</td>
			</tr>
			<tr>
				<td>포스터</td>
				<td><img alt="${movie.mtitle }" src="${path }/poster/${movie.murlPoster }.jpg" width="100px;"></td>
			</tr>
			<tr>
				<td>상영등급</td>
				<td>
					<c:if test="${movie.mgrade == 'all' }">전체이용가</c:if>
					<c:if test="${movie.mgrade == '12' }">12세이용가</c:if>
					<c:if test="${movie.mgrade == '15' }">15세이용가</c:if>
					<c:if test="${movie.mgrade == '19' }">청소년관람불가</c:if>
				</td>
			</tr>
			<tr>
				<td>국가</td>
				<td>${movie.mnation}</td>
			</tr>
		</table>
			
		<a href="adminList.do?pageNum=${pageNum}" class="btn btn-default" style="display: inline;">목록</a>
		<a href="adminUpdateForm.do?mid=${movie.mid}&pageNum=${pageNum}"
			class="btn btn-info"style="display: inline; border-color: #CD1726; background-color: #CD1726;">수정</a> 
		<a href="adminDelete.do?mid=${movie.mid}&pageNum=${pageNum}"
			class="btn btn-info"style="display: inline; border-color: #CD1726; background-color: #CD1726;">영화내리기</a>
		<br><br>
		<!-- <div id="list"></div> -->
	</div>
</body>
</html>