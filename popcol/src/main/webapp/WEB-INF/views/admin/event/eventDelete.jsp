<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../popcol/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
	<c:if test="${ result > 0 }">
		<script type="text/javascript">
			swal({
				title: "삭제 성공!", 
				type: "success"
			}).then(function() {
				location.href = "adminEventList.do?pageNum=${ pageNum }";
			});
		</script>
	</c:if>
	<c:if test="${ result <= 0 }">
		<script type="text/javascript">
			swal({
				title: "삭제 실패!", 
				type: "error"
			}).then(function() {
				history.go(-1);
			});
		</script>
	</c:if>
</body>
</html>