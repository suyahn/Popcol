<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../popcol/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<script type="text/javascript">
	$(function() {
		$('#movieDetailReviewList').load('movieDetailReviewList.do?mid=${ movie.mid }');
	});
</script>
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
					<font style="font-style: italic;">${ movie.moriginaltitle }</font>
				</p>
				<p>
					예매율 <font style="font-weight: bold;">${ movie.bookingRate }%</font> | 
					<c:forEach var="reviewCount" items="${ reviewCountList }">
     					<c:if test="${ reviewCount.mid == movie.mid }">
     						<img alt="good" src="images/good_face.png" width="20" height="20">
     						${ reviewCount.goodCount }개
     						<img alt="bad" src="images/bad_face.png" width="20" height="20">
     						${ reviewCount.badCount }개
     					</c:if>
     				</c:forEach>
				</p>
				<hr>
				<p>감독 : ${ movie.mdirector } / 배우 : ${ movie.mactor }</p>
				<p>기본 : <c:if test="${ movie.mgrade == 'all' }">전체</c:if>
							<c:if test="${ movie.mgrade != 'all' }">
								<c:if test="${ movie.mgrade == '19' }">청소년 관람불가</c:if>
								<c:if test="${ movie.mgrade != '19' }">${ movie.mgrade }세 이상</c:if>
							</c:if>
					 / ${ movie.mrunningTime }분 / ${ movie.mnation }
				<p>개봉 : ${ movie.mreleaseDate }</p>
				<br><br>
				<button type="button" onclick="location.href='reservation.do'" class="btn btn-primary"
					style="border-color: #CD1726; background-color: #CD1726;">예매하기</button>
			</div>
		</div>
		<hr>
		<div style="width: 80%; margin-left: 75px;">
				<pre style="white-space: pre-wrap; background-color: white; border-color: white;">${ movie.mcontent }</pre>
		</div>
		<hr>
		<div class="row">
			<div class="col-md-10 col-md-offset-1">
				<div class="embed-responsive embed-responsive-16by9">
					<iframe class="embed-responsive-item" src="${ movie.murlPreview }" allowfullscreen></iframe>
				</div>
			</div>
		</div>
		<hr>
		<div style="width: 80%; margin-left: 75px;">
			<h4 style="font-weight: bold; color: #FCBA2E;">후기</h4>
			<div style="border: 0.5px solid lightgray; border-radius: 10px;" id="movieDetailReviewList"></div>
		</div>
	</div>
</body>
</html>