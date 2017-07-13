<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../popcol/header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<fmt:formatDate type="date" value="${date}" pattern="yyyy-MM-dd" var="date"/>
	<c:if test="${result > 0 }">
		<script type="text/javascript">
			alert("상영시간표가 입력되었습니다");
			location.href = "adminTTView.do?rtid=${rtid}&dateStr=${date}"
		</script>
	</c:if>
	
	<c:if test="${result <= 0 }">
		<script type="text/javascript">
			alert("다시 입력해주세요");
			history.go(-1);
		</script>
	</c:if>
</body>
</html>