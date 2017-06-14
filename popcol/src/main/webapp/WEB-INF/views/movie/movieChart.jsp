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
			<c:forEach var="movie" items="${ movieList }">
		  		<div class="col-md-3 col-md-3">
		   			<div class="thumbnail">
		   				<a href="movieDetail.do?mid=${ movie.mid }">
		      				<img src="poster/${ movie.murlPoster }.jpg" alt="${ movie.mtitle }" style="border: 3px solid black; width: 197px; height: 272px;">
		      			</a>
		      			<div class="caption">
		        			<p>
		        				<font size="4">${ movie.mtitle }</font>
		        				<img alt="${ movie.mgrade }" src="icon/${ movie.mgrade }.png" width="20" height="20">
		        			</p>
		        			<p>${ movie.moriginaltitle }<p>
		        			<p>예매율 ${ movie.bookingRate }%</p>
		        			<p>${ movie.mreleaseDate } 개봉</p>
		        			<p>
		        				<a href="#" class="btn btn-danger" role="button">예매하기</a>
		        			</p>
		      			</div>
		    		</div>
		  		</div>
	  		</c:forEach>
		</div>
	</div>
</body>
</html>