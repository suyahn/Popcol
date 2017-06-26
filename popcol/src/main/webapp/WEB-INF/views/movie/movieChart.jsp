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
		<h1 style="font-weight: bold;">무비 차트</h1>
		<hr>
		<div class="row">
			<c:set var="rank" value="1" />
			<c:forEach var="movie" items="${ movieList }">
		  		<div class="col-md-3 col-md-3">
		   			<div class="thumbnail" align="center" style="height: 600px;">
		   				<h3 align="center" style="border: 2px solid black; width: 197px; background-color: #CD1726; font-weight: bold;">No.${ rank }</h3>
		   				<a href="movieDetail.do?mid=${ movie.mid }">
		      				<img src="poster/${ movie.murlPoster }.jpg" alt="${ movie.mtitle }" style="border: 2px solid black; width: 197px; height: 272px;">
		      			</a>
		      			<div class="caption">
		        			<p>
		        				<a href="movieDetail.do?mid=${ movie.mid }" class="red-active"><font size="3" style="font-weight: bold;">${ movie.mtitle }</font></a>
		        				<img alt="${ movie.mgrade }" src="icon/${ movie.mgrade }.png" width="20" height="20">
		        			</p>
		        			<p><font style="font-style: italic;">${ movie.moriginaltitle }</font><p>
		        			<p>예매율 <font style="font-weight: bold;">${ movie.bookingRate }%</font></p>
		        			<p>
		        				<fmt:parseDate value="${ movie.mreleaseDate }" var="mreleaseDate" pattern="yyyy-MM-dd"/>
		        				<fmt:formatDate value="${ mreleaseDate }" pattern="yyyy.MM.dd"/> 개봉
		        			</p>
		        			<p>
		        				<c:forEach var="reviewCount" items="${ reviewCountList }">
		        					<c:if test="${ reviewCount.mid == movie.mid }">
		        						<img alt="good" src="images/good_face.png" width="20" height="20">
		        						${ reviewCount.goodCount }개
		        						<img alt="bad" src="images/bad_face.png" width="20" height="20">
		        						${ reviewCount.badCount }개
		        					</c:if>
		        				</c:forEach>
		        			</p>
		        			<p>
		        				<button type="button" onclick="location.href='reservation.do'" class="btn btn-primary"
		        					style="border-color: #CD1726; background-color: #CD1726;">예매하기</button>
		        			</p>
		      			</div>
		    		</div>
		  		</div>
		  		<c:set var="rank" value="${ rank + 1 }" />
	  		</c:forEach>
		</div>
	</div>
</body>
</html>