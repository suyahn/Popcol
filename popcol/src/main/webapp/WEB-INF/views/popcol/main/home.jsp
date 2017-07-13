<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="../header.jsp"%>
<html><head>
<title>PoncornCola</title>
<style type="text/css">
h2{
margin: 0;
color: white;
padding-top: 90px;
font-size: 52px;
font-family: "trebuchet ms", sans-serif;
}
.item{
background: white;
text-align: center;
height: 400px !important;
}
.carousel{
margin-top: 20px;
}
.bs-example{
margin: 20px;
}
</style>
</head>
<body>
	<div class="bs-example">
		<div id="myCarousel" class="carousel slide" data-interval="3000" data-ride="carousel" style="width: 800px; margin-bottom:50px; margin:auto;">
		<!-- this DIV use for carousel indicators for slider-->
			<ol class="carousel-indicators">
				<c:forEach var="i" begin="0" end="${eventSize }">
					<c:if test="${i == 0 }">
						<li data-target="#myCarousel" data-slide-to="i" class="active"></li>
					</c:if>
					<c:if test="${i != 0 }">
						<li data-target="#myCarousel" data-slide-to="i"></li>
					</c:if>
				</c:forEach>
			</ol>
			<!--Wrapper for carousel items which are show in output form-->
			<div class="carousel-inner">
			<!--this is first slider page-->
			<c:set var="slide" value="0" />
			<c:forEach var="event" items="${eventList }" end="${eventSize }">
				<c:if test="${slide == 0 }">
					<div class="active item">
					<div align="center">
						<a href="eventView.do?eid=${event.eid }">
							<%-- <img alt="${event.esubject }" src="${path }/images/${event.epicture }" width="220px" style="margin-right: 20px;"> --%>
							<c:if test="${ empty event.epicture }">
								<img src="${path }/images/event_default.jpg" alt="${event.esubject }" width="800px">
							</c:if>
							<c:if test="${ not empty event.epicture }">
								<img src="${path }/images/${ event.epicture }" alt="${event.esubject }" width="800px">
							</c:if>
						</a>
					</div>
					</div>
				</c:if>
				
				<c:if test="${slide != 0 }">
					<div class="item">
					<div align="center">
						<a href="eventView.do?eid=${event.eid }">
							<%-- <img alt="${event.esubject }" src="${path }/images/${event.epicture }" width="220px" style="margin-right: 20px;"> --%>
							<c:if test="${ empty event.epicture }">
								<img src="${path }/images/event_default.jpg" alt="${event.esubject }" width="800px">
							</c:if>
							<c:if test="${ not empty event.epicture }">
								<img src="${path }/images/${ event.epicture }" alt="${event.esubject }" width="800px">
							</c:if>
						</a>
					</div>
					</div>
				</c:if>
				<c:set var="slide" value="${slide + 1 }"/>
			</c:forEach>
			</div>
		<!-- this is carousel controls for used of next and previous pages slider-->
			<a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
			<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
			<span class="sr-only">Previous</span>
			</a>
			
			<a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
			<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
			</a>
		</div>
	</div>

	<div class="container" style="width: 800px; margin-bottom: 30px;">
			<img alt="movieselection" src="${path }/images/movieselection.png" width="800px" style="margin-bottom: 30px;">

	
		<div align="center">
		<c:if test="${empty movie }">
			현재 상영중인 영화가 없습니다.
		</c:if>
		
		<c:if test="${not empty movie }">
		<table>
			<tr>
				<td>
					<a href="movieDetail.do?mid=${movie.mid }" style="margin-right: -70px;"><img alt="" src="${path }/poster/${movie.murlPoster }.jpg" width="230px" height="315px"></a>
				</td>
				<td>
					<div class="container" style="width: 715px;">
					<div class="row">
						<div class="col-md-10 col-md-offset-1">
							<div class="embed-responsive embed-responsive-16by9">
								<iframe class="embed-responsive-item" src="${ movie.murlPreview }" allowfullscreen></iframe>
							</div>
						</div>
					</div>
					</div>
				</td>
			</tr>
		</table>
		</c:if>
		</div>
		
		<hr>
		<hr>
		
			<img alt="event" src="${path }/images/event.png" width="800px" style="margin-bottom: 30px;">
		
		<div>
			<c:if test="${empty eventList }">
				현재 진행중인 이벤트가 없습니다.
			</c:if>
			
			
			<c:if test="${not empty eventList }">
			<c:set var="count" value="0"/>
			<c:forEach var="event" items="${eventList }">
				<c:if test="${count > 3 }">
					<c:set var="count" value="0"/>
				</c:if>
				
				<a href="eventView.do?eid=${event.eid }">
					<%-- <img alt="${event.esubject }" src="${path }/images/${event.epicture }" width="220px" style="margin-right: 20px;"> --%>
					<c:if test="${ empty event.epicture }">
						<img src="${path }/images/event_default.jpg" alt="${event.esubject }" width="220px" style="margin: 15px;">
					</c:if>
					<c:if test="${ not empty event.epicture }">
						<img src="${path }/images/${ event.epicture }" alt="${event.esubject }" width="220px" style="margin: 15px;">
					</c:if>
				</a>
				<c:set var="count" value="${count + 1 }"/>
			</c:forEach>
			</c:if>
		</div>
	</div>
</body>
</html>
