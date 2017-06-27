<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../popcol/header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
	<div class="container" style="width: 80%;">
		<h1 style="font-weight: bold;">개봉 예정작</h1>
		<hr>
		<c:if test="${ empty movieList }">
			<h2>개봉 예정 영화가 없습니다.</h2>
		</c:if>
		<c:if test="${ not empty movieList }">
			<c:set var="date" value=""/>
			<c:forEach var="movie" items="${ movieList }">
				<fmt:parseDate value="${ movie.mreleaseDate }" var="mreleaseDate" pattern="yyyy-MM-dd"/>
				<c:if test="${ date != mreleaseDate }">
					<h2><fmt:formatDate value="${ mreleaseDate }" pattern="yyyy년 MM월 dd일"/></h2>
				</c:if>
				<div class="row">
			  		<div class="col-md-3 col-md-3">
			   			<div class="thumbnail" align="center" style="height: 430px;">
			   				<a href="movieDetail.do?mid=${ movie.mid }">
			      				<img src="poster/${ movie.murlPoster }.jpg" alt="${ movie.mtitle }" style="border: 2px solid black; width: 197px; height: 272px;">
			      			</a>
			      			<div class="caption">
			        			<p>
			        				<a href="movieDetail.do?mid=${ movie.mid }" class="red-active"><font size="3" style="font-weight: bold;">${ movie.mtitle }</font></a>
			        				<img alt="${ movie.mgrade }" src="icon/${ movie.mgrade }.png" width="20" height="20">
			        			</p>
			        			<p><font style="font-style: italic;">${ movie.moriginaltitle }</font><p>
			        			<p><fmt:formatDate value="${ mreleaseDate }" pattern="yyyy.MM.dd"/> 개봉 예정</p>
			        			<p>
			        				<c:forEach var="rt" items="${ rtList }">
			        					<c:if test="${ rt.mid == movie.mid }">
			        						<button type="button" onclick="location.href='reservation.do'" class="btn btn-primary"
			        							style="border-color: #CD1726; background-color: #CD1726;">예매하기</button>	
			        					</c:if>
			        				</c:forEach>
			        			</p>
			      			</div>
			    		</div>
			  		</div>
		  		</div>
		  		<hr>
		  		<c:set var="date" value="mreleaseDate"/>
	  		</c:forEach>
  		</c:if>
	</div>
</body>
</html>