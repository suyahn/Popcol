<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../popcol/header.jsp"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
td {
	width: 15px;
	height: 15px;
	border: 1px solid white;
}
</style>
<script type="text/javascript">
	$(function() {
		$('.kk').click(function() {
			var idd = $(this).attr('id');
			$('#' + idd).css("background-color", "black");
			alert(idd);
		});
	});
</script>
</head>
<body>
	<h2 style="color: #cd1726" align="center">빠른 영화 예매</h2>
	<div class="container" style="margin-top: 5%; margin-left: 5%; border: 1px solid black; border-spacing: 5px;">
	<table style="display:inline; margine : 5px;border-spacing: 5px;">
			<tr><td>a</td></tr>
			<tr><td>b</td></tr>
			<tr><td>c</td></tr>
			<tr><td>d</td></tr>
			<tr><td>e</td></tr>
			<tr><td>f</td></tr>
	</table>
		<c:set var="al" value="A,B,C,D,E,F"/>
			<table style="display: inline; ">
				<c:forTokens items="${al}" delims="," var="nn">
				<tr>	
					<c:forEach var="j" begin="1" end="4">
						<td bgcolor="red" id="${nn}${j}" class="kk" style="width: 40px; height: 20px"></td>
				</c:forEach>
				<td bgcolor="white"></td>
				</tr>
			</c:forTokens>
		</table>
		<table style="display: inline;">
			<c:forTokens items="${al}" delims="," var="nn">
				<tr>
					<c:forEach var="j" begin="5" end="12">
						<td bgcolor="red" id="${ nn }${j }" class="kk"
							style="width: 40px; height: 20px"></td>
					</c:forEach>
					<td bgcolor="white"></td>
				</tr>
			</c:forTokens>
		</table>
		<table style="display: inline;">
			<c:forTokens items="${al}" delims="," var="nn">
				<tr>
					<c:forEach var="j" begin="13" end="16">
						<td bgcolor="red" id="${ nn }${j }" class="kk"
							style="width: 40px; height: 20px"></td>
					</c:forEach>
					<td bgcolor="white"></td>
				</tr>
			</c:forTokens>
		</table>
	</div>
</body>
</html>