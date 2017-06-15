<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../popcol/header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
	<div class="container">
		<h1>무비 차트</h1>
		<div class="row">
			<c:set var="rank" value="1" />
			<c:forEach var="movie" items="${ movieList }">
		  		<div class="col-md-3 col-md-3">
		   			<div class="thumbnail" align="center">
		   				<h3 align="center" style="border: 2px solid black; width: 197px; background-color: ">No.${ rank }</h3>
		   				<a href="movieDetail.do?mid=${ movie.mid }">
		      				<img src="poster/${ movie.murlPoster }.jpg" alt="${ movie.mtitle }" style="border: 2px solid black; width: 197px; height: 272px;">
		      			</a>
		      			<div class="caption">
		        			<p>
		        				<font size="5" style="font-weight: bold;">${ movie.mtitle }</font>
		        				<img alt="${ movie.mgrade }" src="icon/${ movie.mgrade }.png" width="20" height="20">
		        			</p>
		        			<p><font style="font-style: italic;">${ movie.moriginaltitle }</font><p>
		        			<p>예매율 ${ movie.bookingRate }%</p>
		        			<p><font style="font-weight: bold;">좋아요</font> ~ 개 <font style="font-weight: bold;">싫어요</font> ~ 개
		        			<p>${ movie.mreleaseDate } 개봉</p>
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