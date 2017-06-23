<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../popcol/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
	<c:if test="${ result > 0 }">
		<script type="text/javascript">
			location.href = "eventView.do?eid=${ eid }&pageNum=${ pageNum }";
		</script>
	</c:if>
	<c:if test="${ result <= 0 }">
		<script type="text/javascript">
			alert("수정 실패");
			history.go(-1);
		</script>
	</c:if>
</body>
</html>