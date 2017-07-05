<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../popcol/header.jsp"%>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:set var="today" value="<%=new Date()%>" /><!-- date는 오늘 날짜를 받는 것을 의미 -->
	<fmt:formatDate type="date" value="${today}" pattern="yyyy/MM/dd" var="date_today"/>
	<c:set var="tomorrow" value="<%=new Date(new Date().getTime() + 60 * 60 * 24 * 1000)%>" />
	<fmt:formatDate type="date" value="${tomorrow}" pattern="yyyy/MM/dd" var="date_tomorrow"/>
	<c:set var="thedayaftertomorrow" value="<%=new Date(new Date().getTime() + 60 * 60 * 48 * 1000)%>" />
	<fmt:formatDate type="date" value="${thedayaftertomorrow}" pattern="yyyy/MM/dd" var="date_thedayaftertomorrow"/>
	
	<div class="container">
		<table>
			<tr>
				<c:forEach var="location" items="${locationList}">
					<td>
						<button
							onclick="location.href='show-times.do?lid=${ location.lid }&date=${date_today}'"
							class="btn btn-default"
							<c:if test="${location.lid==lid}">style="font-weight: bold; color: #cd1726;"</c:if>>
							${location.lname}</button>
					</td>
				</c:forEach>
		</table>
		
		<fmt:formatDate type="date" value="${date}" pattern="yyyy/MM/dd" var="date"/>
		
		<table>
			<tr>
				<td><button onclick="location.href='show-times.do?lid=${ lid }&date=${date_today}'" class="btn btn-default"
						<c:if test="${date==date_today}">style="font-weight: bold; color: #cd1726;"</c:if>>
						<fmt:formatDate type="date" value="${today}" pattern="MM/dd" /></button></td>
				<td><button onclick="location.href='show-times.do?lid=${ lid }&date=${date_tomorrow}'" class="btn btn-default"
						<c:if test="${date_tomorrow==date}">style="font-weight: bold; color: #cd1726;"</c:if>>
						<fmt:formatDate type="date" value="${tomorrow}" pattern="MM/dd" /></button>
				</td>
				<td><button onclick="location.href='show-times.do?lid=${ lid }&date=${date_thedayaftertomorrow}'" class="btn btn-default"
						<c:if test="${date_thedayaftertomorrow==date}">style="font-weight: bold; color: #cd1726;"</c:if>>
						<fmt:formatDate type="date" value="${thedayaftertomorrow}" pattern="MM/dd" /></button></td>
			</tr>
		</table>
		<table>
			<c:forEach var="movie" items="${showtimesList}">
				<tr>
					<td>
						<img alt="${ movie.mgrade }" src="icon/${ movie.mgrade }.png" width="20" height="20">
						${movie.mtitle}${movie.mrunningtime}</td>
				</tr>
				<tr>
					<c:forEach var="st" items="${showtimesList}">
						<c:if test="${movie.mtitle==st.mtitle}">
							<td>${st.tname}<br>
							${st.rttime }<br>
							좌석</td>
						</c:if>
					</c:forEach>
			</c:forEach>
			
		</table>
	</div>
</body>
</html>