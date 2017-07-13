<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../popcol/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Admin View</title>
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
<fmt:formatDate type="date" value="${date}" pattern="yyyy-MM-dd" var="date"/>
<script type="text/javascript">
	function deleteChk(rtid, lid, date) {
		if(confirm("정말로 삭제하시겠습니까?") == false) {
			return false;
		}
		location.href="adminTTDelete.do?rtid=" + rtid + "&lid=" + lid + "&dateStr=" + date;
	}
</script>
</head>
<body>
	<div class="container" align="center">
		<h1 align="left" style="font-weight: bold;">
			<img src="location/logo.png" width="250" height="70"> <a
				href='adminTTList.do?lid=${ showtimesList2.lid }&dateStr=${ date }' class="red-active">상영시간표</a>
		</h1>
		<table class="table">
			<tr>
				<td width="200" height="70"
					style="font-weight: bold; padding-top: 25px;">영화관</td>
				<td style="padding-top: 25px" width="400">
					${showtimesList2.lname } (${showtimesList2.tname})</td>
				<td width="200" height="70"
					style="font-weight: bold; padding-top: 25px;">영화</td>
				<td style="padding-top: 25px">${showtimesList2.mtitle }</td>
			</tr>
			<tr>
				<td width="200" style="font-weight: bold; padding-top: 25px;">상영시작시간</td>
				<td style="padding-top: 15px">${showtimesList2.rtdate } (${showtimesList2.rttime })</td>

				<td width="200" height="70"
					style="font-weight: bold; padding-top: 25px;">시간대 분류</td>
				<td style="padding-top: 25px">${showtimesList2.timezone }</td>
			</tr>
			<!-- <tr>
				<td colspan="4" align="right" style="padding-top: 25px"><input
					type="submit" value="확인"></td>
			</tr> -->
		</table>
		<a href="adminTTList.do?lid=${showtimesList2.lid}&dateStr=${date}" class="btn btn-info"
			style="display: inline; border-color: #CD1726; background-color: #CD1726;">목록</a>
		<a href="adminTTUpdateForm.do?rtid=${showtimesList2.rtid}&dateStr=${date}"
			class="btn btn-info"
			style="display: inline; border-color: #CD1726; background-color: #CD1726;">수정</a>
		<a onclick="deleteChk(${showtimesList2.rtid}, ${showtimesList2.lid}, '${date}')"
			class="btn btn-info"
			style="display: inline; border-color: #CD1726; background-color: #CD1726;">삭제</a>
		<br> <br>
		<!-- <div id="list"></div> -->
	</div>
</body>
</html>