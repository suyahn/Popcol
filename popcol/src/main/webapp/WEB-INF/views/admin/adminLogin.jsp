<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../popcol/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${ result > 0 && masterid == 'master'}">
		<script type="text/javascript">
			alert("관리자님 환영합니다");
			location.href = "adminList.do";
		</script>
	</c:if>

	<c:if test="${masterid != 'master'}">
		<script type="text/javascript">
			alert("관리자가 아닙니다");
			history.go(-1);
		</script>
	</c:if>
</body>
</html>