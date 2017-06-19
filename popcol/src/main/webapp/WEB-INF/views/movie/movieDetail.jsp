<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../popcol/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
	<div class="container" style="width: 80%;">
		<h1 style="font-weight: bold;">영화상세</h1>
		<hr>
		<div class="row">
			<div class="col-md-offset-1 col-md-3">
				<img src="poster/${ movie.murlPoster }.jpg" alt="${ movie.mtitle }" width="197">
			</div>
			<div class="col-md-8">
				<p>
					<img alt="${ movie.mgrade }" src="icon/${ movie.mgrade }.png" width="20" height="20">
					<font size="5" style="font-weight: bold;">${ movie.mtitle }</font>
				</p>
				<p>
					<font style="font-style: italic;">${ movie.moriginaltitle }</font>
				<p>
				<p>예매율 <font style="font-weight: bold;">${ movie.bookingRate }%</font></p>
				<p>
					<font style="font-weight: bold;">좋아요</font> ~ 개 <font style="font-weight: bold;">싫어요</font> ~ 개</p>
				<p>${ movie.mreleaseDate }개봉</p>
				<p>
					<button type="button" onclick="location.href='reservation.do'" class="btn btn-primary"
						style="border-color: #CD1726; background-color: #CD1726;">예매하기</button>
				</p>
			</div>
		</div>
		<div class="row">
			<div class="col-md-10 col-md-offset-1">
				<div class="embed-responsive embed-responsive-16by9">
					<iframe class="embed-responsive-item" src="${ movie.murlPreview }" allowfullscreen></iframe>
				</div>
			</div>
		</div>
	</div>
</body>
</html>