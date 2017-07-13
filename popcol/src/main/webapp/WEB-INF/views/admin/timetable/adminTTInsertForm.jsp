<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../popcol/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert Movie</title>
<style type="text/css">
.red-active {
	color: black;
	text-decoration: none;
}

.red-active:hover {
	color: #CD1726;
	text-decoration: underline;
	font-weight: bold;
}

.pagination>li>a {
	color: #cd1726 !important;
}

.pagination>li>a:hover {
	color: #fcba2e !important;
}

.pagination>li.active>a {
	background: #cd1726;
	border-color: #cd1726;
	color: white !important;
}

.pagination>li.active>a:hover {
	background: #fcba2e;
	border-color: #fcba2e;
	color: white !important;
}
</style>
<!-- <script type="text/javascript">
	function chk() {
		var lid = frm.lid.value;
		alert(lid);
		var tid = frm.tid.value;
		alert(tid);
		var mid = frm.mid.value;
		alert(mid);
		var rtdate = frm.rtdate.value;
		alert(rtdate);
		var timezone = frm.timezone.value;
		alert(timezone);
		var pageNum = frm.pageNum.value;
		alert(pageNum);
		
		return true;
	}
</script> -->
</head>
<body>
	<div class="container" align="center">
		<h1 align="left" style="font-weight: bold;">
			<img src="location/logo.png" width="250" height="70"> <a
				href='adminTTList.do' class="red-active">상영시간표</a>
		</h1>
		<form action="adminTTInsert.do" method="post" name="frm"
			onsubmit="return chk()">
			<table class="table table-striped">
				<tr>
					<td width="200" height="70"
						style="font-weight: bold; padding-top: 25px;">영화관</td>
					<td style="padding-top: 25px" width="400"><select name=ltid
						size="1">
							<c:forEach var="theaterLocation" items="${theaterLocation }">
								<option value="${theaterLocation.lid }:${theaterLocation.tid}">${theaterLocation.lname }
									(${theaterLocation.tname})</option>
							</c:forEach>
					</select> <%-- <select name=tid size="1">
							<c:forEach var="theaterLocation" items="${theaterLocation }">
								<option value="${theaterLocation.tid }">${theaterLocation.tname }(${theaterLocation.lname})</option>
							</c:forEach>
					</select> --%></td>
					<td width="200" height="70"
						style="font-weight: bold; padding-top: 25px;">영화</td>
					<td style="padding-top: 25px"><select name=mid size="1"
						required="required">
							<c:forEach var="movie" items="${movieList }">
								<option value="${movie.mid }">${movie.mtitle }</option>
							</c:forEach>
					</select></td>
				</tr>
				<tr>
					<td width="200" style="font-weight: bold; padding-top: 25px;">상영시작시간</td>
					<td style="padding-top: 15px"><input type="datetime-local"
						name="rtdateString" required="required"></td>

					<td width="200" height="70"
						style="font-weight: bold; padding-top: 25px;">시간대 분류</td>
					<td style="padding-top: 25px"><select name=timezone size="1"
						required="required">
							<option value="weekday_morning">평일 (조조)</option>
							<option value="weekday_day">평일</option>
							<option value="weekday_night">평일 (심야)</option>
							<option value="weekend_morning">주말 (조조)</option>
							<option value="weekend_day">주말</option>
							<option value="weekend_night">주말 (심야)</option>
					</select></td>
				</tr>
				<tr>
					<td colspan="4" align="right" style="padding-top: 25px"><input
						type="submit" value="확인" class="btn btn-info btn-sm"
						style="background-color: #cd1726; border-color: #cd1726;">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>