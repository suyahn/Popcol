<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../popcol/header.jsp"%>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=E_U6Q5fuO9GhdWs01Siv"></script>
<title>Insert title here</title>
<style type="text/css">
	.td_location_date {
		padding-left: 240px;
	}
	
	.borderStyle {
		border: 0.5px solid lightgray;
	}
	
	.fontBold {
		font-weight: bold;
	}
	
	#locationPic {
		width:40%; 
		height:400px; 
		display: inline; 
		float: left; 
		background-image: url('location/location${ loc.lid }.jpg');
		background-size: 100% 100%;
	}
	
	#locationInfo {
		background-color: black; 
		width:100%; 
		height: 25%; 
		opacity: 0.7; 
		margin-top: 300px;
		color: white;
		font-weight: bold;
		padding-left: 20px;
		padding-top: 10px;
	}
	
	#map {
		width:60%; 
		height:400px;
		display: inline;
		float: right;
	}
</style>
</head>
<body>
	<fmt:formatDate type="date" value="${date}" pattern="yyyy/MM/dd" var="date"/>
	
	<c:set var="today" value="<%=new Date()%>" /><!-- date는 오늘 날짜를 받는 것을 의미 -->
	<fmt:formatDate type="date" value="${today}" pattern="yyyy/MM/dd" var="date_today"/>
	<c:set var="tomorrow" value="<%=new Date(new Date().getTime() + 60 * 60 * 24 * 1000)%>" />
	<fmt:formatDate type="date" value="${tomorrow}" pattern="yyyy/MM/dd" var="date_tomorrow"/>
	<c:set var="thedayaftertomorrow" value="<%=new Date(new Date().getTime() + 60 * 60 * 48 * 1000)%>" />
	<fmt:formatDate type="date" value="${thedayaftertomorrow}" pattern="yyyy/MM/dd" var="date_thedayaftertomorrow"/>
	
	<div class="container">
		<h4 class="fontBold">영화관</h4>
		<div class="borderStyle">
			<table>
				<tr>
					<c:forEach var="location" items="${locationList}">
						<td class="td_location_date">
							<button onclick="location.href='show-times.do?lid=${ location.lid }&date=${date_today}'"
								class="btn btn-default fontBold" <c:if test="${location.lid==loc.lid}">style="color: #cd1726;"</c:if>
								style="border-color: white;">
								${location.lname}
							</button>
						</td>
					</c:forEach>
			</table>
			
			<div id="locationPic" class="borderStyle">
				<div id="locationInfo">
					${ loc.lname }<br>
					${ loc.laddress }<br>
					${ loc.lphone }
				</div>
			</div>
			
			<div id="map" class="borderStyle"></div>
			<script>
				var mapOptions = {
					center : new naver.maps.LatLng(${loc.lat}, ${loc.lon}),
					zoom : 12,
					minZoom: 9
				};

				var map = new naver.maps.Map('map', mapOptions);
				
				var lname = "Popcorn&Cola ${loc.lname}";

				var marker = new naver.maps.Marker({
				    position: new naver.maps.LatLng(${loc.lat}, ${loc.lon}),
				    map: map,
				    title: lname
				});
			</script>
		</div>
		
		
		<h6>&nbsp;</h6>
		<hr>
		<h4 class="fontBold" style="margin-top: 50px;">날짜</h4>
		<div class="borderStyle">
			<table>
				<tr>
					<td class="td_location_date">
						<button onclick="location.href='show-times.do?lid=${ loc.lid }&date=${date_today}'" class="btn btn-default fontBold"
							<c:if test="${date==date_today}">style="color: #cd1726;"</c:if>
							style="border-color: white;">
							<fmt:formatDate type="date" value="${today}" pattern="MM/dd" />
						</button>
					</td>
					<td class="td_location_date">
						<button onclick="location.href='show-times.do?lid=${ loc.lid }&date=${date_tomorrow}'" class="btn btn-default fontBold"
							<c:if test="${date_tomorrow==date}">style="color: #cd1726;"</c:if>
							style="border-color: white;">
							<fmt:formatDate type="date" value="${tomorrow}" pattern="MM/dd" />
						</button>
					</td>
					<td class="td_location_date">
						<button onclick="location.href='show-times.do?lid=${ loc.lid }&date=${date_thedayaftertomorrow}'" class="btn btn-default fontBold"
							<c:if test="${date_thedayaftertomorrow==date}">style="color: #cd1726;"</c:if>
							style="border-color: white;">
							<fmt:formatDate type="date" value="${thedayaftertomorrow}" pattern="MM/dd" />
						</button>
					</td>
				</tr>
			</table>
		</div>
		
		<br>
		
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
							
						</td>
					</tr>
					<tr>
						<c:forEach var="st" items="${showtimesList}">			
								<c:if test="${movie.mid==st.mid}">
								<td>
									<br>
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
		<hr>
	</div>
</body>
</html>