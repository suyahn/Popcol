<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${result > 0 }">
		<div class="container" align="center">
			<h2 style="font-weight: bold;">회원가입되셨습니다.</h2>
			<h6 style="font-weight: bold;">저희 popcol의 회원이 되신 것을 진심으로 축하합니다.</h6>
			
			<br>
			<br>
			
			<button onclick="location.href='loginForm.do'" class="btn btn-info btn-sm" style="border-color: #cd1726; background-color: #cd1726;">로그인</button>
			<button onclick="location.href='home.do'" class="btn btn-info btn-sm" style="border-color: #cd1726; background-color: #cd1726;">메인페이지</button>
		</div>
	</c:if>
	
	<c:if test="${result <= 0 }">
		<script type="text/javascript">
			alert("회원가입 실패! 다시 시도해주세요.");
			history.go(-1);
		</script>
	</c:if>
</body>
</html>