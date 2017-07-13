<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../popcol/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Admin View</title>
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=E_U6Q5fuO9GhdWs01Siv"></script>
<!-- <script type="text/javascript">
	$(function() {
		$('#list').load('adminLocationList.do?');
	});
</script> -->
</head>
<body>
	<div class="container" align="center" style="width: 800px;">
		<h2 style="font-weight: bold;">
			<img src="location/logo.png" width="250" height="70"> 영화관
		</h2>
		<table class="table table-bordered">
			<tr>
				<td>이름</td>
				<td>${location.lname}</td>
			</tr>
			<tr>
				<td>주소</td>
				<td>${location.laddress}</td>
			</tr>
			<tr>
				<td>연락처</td>
				<td>${location.lphone}</td>
			</tr>
		</table>

		<div style="width: 600px;" align="center">
			<div id="map" class="borderStyle"
				style="height: 400px; border: 1px solid lightgray;"></div>
			<script>
				var mapOptions = {
					center : new naver.maps.LatLng(${location.lat}, ${location.lon}),
					zoom : 12,
					minZoom: 9
				};

				var map = new naver.maps.Map('map', mapOptions);
				
				var lname = "Popcorn&Cola ${location.lname}";

				var marker = new naver.maps.Marker({
				    position: new naver.maps.LatLng(${location.lat}, ${location.lon}),
				    map: map,
				    title: lname
				});
			</script>
		</div>

		<br>
		<table>
			<tr>
			<td>
				<a href="adminLocationList.do?" class="btn btn-info"
					style="display: inline; border-color: #CD1726; background-color: #CD1726;">목록</a>
				<a href="adminLocationUpdateForm.do?lid=${location.lid}"
					class="btn btn-info"
					style="display: inline; border-color: #CD1726; background-color: #CD1726;">수정</a>
				<a href="adminLocationDelete.do?lid=${location.lid}"
					class="btn btn-info"
					style="display: inline; border-color: #CD1726; background-color: #CD1726;">삭제</a>
			<td>
			</tr>
		</table>
		<br>
		<!-- <div id="list"></div> -->
	</div>
</body>
</html>