<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="../header.jsp"%>
<html><head>
</head>
	<div class="container" style="width: 800px; margin-bottom: 30px;">
		<div align="center">
		<img alt="" src="${path }/images/popcol logo.png" width="600px">
		</div>
		
		<div style="width: 700px; height: 30px; margin-bottom: 30px;">
		<font size="5px" style="text-align: center; font-weight: bold;">현재 상영중인 영화 : ${movie.mtitle }&nbsp;</font>
		<a href="nowMovies.do" style="font-size: 2px; color: #cd1726;">더보기</a>
		</div>
	
		<div align="center">
		<c:if test="${empty movie }">
			현재 상영중인 영화가 없습니다.
		</c:if>
		
		<c:if test="${not empty movie }">
		<table>
			<tr>
				<td>
					<a href="movieDetail.do?mid=${movie.mid }"><img alt="" src="${path }/poster/${movie.murlPoster }.jpg" width="180px"></a>
				</td>
				<td>
					<div class="container" style="width: 600px;">
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
		
		<div style="width: 700px; height: 30px; margin-top: 30px; margin-bottom: 30px;">
		<font size="5px" style="text-align: center; font-weight: bold;">현재 진행중인 이벤트&nbsp;</font>
		<a href="eventList.do" style="font-size: 2px; color: #cd1726;">더보기</a>
		</div>
		
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
						<img src="${path }/images/event_default.jpg" alt="${event.esubject }" width="220px" style="margin-right: 20px;">
					</c:if>
					<c:if test="${ not empty event.epicture }">
						<img src="${path }/images/${ event.epicture }" alt="${event.esubject }" width="220px" style="margin-right: 20px;">
					</c:if>
				</a>
				<c:set var="count" value="${count + 1 }"/>
			</c:forEach>
			</c:if>
		</div>
	</div>
</body>
</html>
