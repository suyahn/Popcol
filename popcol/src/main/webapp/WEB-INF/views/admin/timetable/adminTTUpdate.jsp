<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../popcol/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${result > 0 }">
		<script type="text/javascript">
			swal({
				title: "상영시간표가 수정되었습니다.", 
				type: "success"
			}).then(function() {
				<fmt:formatDate type="date" value="${date}" pattern="yyyy-MM-dd" var="date"/>
				location.href = "adminTTList.do?lid=${ lid }&dateStr=${ date }";
			});
		</script>
	</c:if>
	<c:if test="${result <= 0 }">
		<script type="text/javascript">
			swal({
				title: "다시 시도해주세요.", 
				type: "error"
			}).then(function() {
				history.go(-1);
			});
		</script>
	</c:if>
</body>
</html>