<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../popcol/header.jsp"%>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=E_U6Q5fuO9GhdWs01Siv"></script>
<title>Insert title here</title>
<style type="text/css">
	.td_location_date {
		padding-right: 120px;
	}
	
	.borderStyle {
		border: 0.5px solid lightgray;
	}
	
	.fontBold {
		font-weight: bold;
	}
	
	#showTimesTd:hover {
		background-color: lightgray;
		color: black;
		cursor: pointer;
	}
</style>
<fmt:formatDate type="date" value="${date}" pattern="yyyy-MM-dd" var="date"/>
<script type="text/javascript">
	$(function() {
		document.getElementById('dateStr').value = "${date}";
	});
</script>
</head>
<body>
	<div class="container">
		<div style="display: inline; float: left;">
			<h4 class="fontBold">영화관</h4>
			<div>
				<table>
					<tr>
						<c:forEach var="location" items="${locationList}">
							<td class="td_location_date">
								<button onclick="location.href='adminTTList.do?lid=${ location.lid }&dateStr=${date}'"
									class="btn btn-default fontBold" <c:if test="${location.lid==lid}">style="color: #cd1726;"</c:if>
									style="border-color: white;">
									${location.lname}
								</button>
							</td>
						</c:forEach>
					</tr>
				</table>
			</div>
		</div>
		<div style="display: inline; float: right; margin-right: 250px;">
		<br>
			<font class="fontBold" size="4" style="display: inline; float: left;">날짜</font>
			<form action="adminTTList.do" style="display: inline; float: right; margin-left: 20px;">
				<input type="hidden" name="lid" value="${ lid }">
				<input type="date" name="dateStr" id="dateStr" style="height: 30px;">
				<button type="submit" class="btn btn-default">
	 					<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
				</button>
			</form>
		</div>
		
		<div style="clear: both;">
			<br>
			<hr>
			<h4 class="fontBold" style="margin-top: 50px;">영화</h4>
			<c:set var="sizeSt" value="0"></c:set>
			<c:forEach var="st" items="${ showtimesList }">
				<c:set var="sizeSt" value="${ sizeSt + 1 }"></c:set>
			</c:forEach>
		
			<table>
				<c:if test="${not empty  movieList}" >
					<c:forEach var="movie" items="${movieList}">
						<tr>
							<td colspan="${ sizeSt }">
								<img alt="${ movie.mgrade }" src="icon/${ movie.mgrade }.png" width="20" height="20">
								<font class="fontBold" size="5">${movie.mtitle}</font> <font size="2">${movie.mrunningTime}분</font>
								<h5></h5>
							</td>
						</tr>
						<tr>
							<c:forEach var="st" items="${showtimesList}">			
									<c:if test="${movie.mid==st.mid}">
									<td width="100" onclick="location.href='adminTTView.do?rtid=${st.rtid}'" id="showTimesTd">
										<font size="2">${st.tname}</font><br>
										<font size="4" class="fontBold">${st.rttime}</font>
										<c:if test="${ st.timezone == 'weekday_morning' || st.timezone == 'weekend_morning' }">
						 				<img alt="morning" src="icon/morning.png" width="15px" height="15px" title="조조">
						 				</c:if>
						 				<c:if test="${ st.timezone == 'weekday_night' || st.timezone == 'weekend_night' }">
						 				<img alt="night" src="icon/night.png" width="15px" height="15px" title="심야">
						 				</c:if>
										<br>
										<c:set var="count" value="0"></c:set>
										<c:forEach var="seatsCount" items="${ bookedSeatCountList }">
											<c:if test="${ seatsCount.rtid == st.rtid }">
												<font size="2">${ 200 - seatsCount.seats }석 / 200석</font>
												<c:set var="count" value="${ count + 1 }"></c:set>
											</c:if>
										</c:forEach>
										<c:if test="${ count == 0 }">
											<font size="2">200석 / 200석</font>
										</c:if>
									</td>
								</c:if>
							</c:forEach>
						</tr>
						<tr>
							<td colspan="${ sizeSt }">
								<hr>
							</td>
						</tr>
					</c:forEach>
				</c:if>
				<c:if test="${empty movieList}">
					<tr align="center">
						<td>
							<h4 class="fontBold" style="margin-left: 500px; margin-bottom: 10px;">상영 정보가 없습니다.</h4>
							<br>
						</td>
					</tr>	
				</c:if>
			</table>
		</div>
		<hr>
	</div>
</body>
</html>