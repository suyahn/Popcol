<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../popcol/header.jsp"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function(){
		$('.locationlid').click(function(){
			$('.locationlid').css("background-color","white");
			$('.locationlid').css("color","black");
			var idd = $(this).attr('id');
			$('#'+idd).css("background-color","black");
			$('#'+idd).css("color","white");
		})	;
	});

</script>
</head>
<body>
	<table class="table table-hover">
		<c:forEach var="location" items="${locationList}">
		<!-- items의 locationList는 컨트롤의 리퀘스트 맵핑의 locationList와 연결 -->
			<tr>
				<td id="location_${location.lid}" class="locationlid" onclick="locationSelect(${location.mid}, ${location.lid})" style="cursor: pointer;">${location.lname}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>