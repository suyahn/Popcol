<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${result > 0 }">
		<script type="text/javascript">
			alert("비밀번호 변경 성공! 로그인 페이지로 이동합니다.");
			location.href = "loginForm.do";
		</script>
	</c:if>
	
	<c:if test="${result <= 0 }">
		<script type="text/javascript">
			alert("다시 시도해주세요.");
			history.go(-1);
		</script>
	</c:if>
</body>
</html>