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
		<div class="container" align="center" style="width: 600px;">
				<h2 align="left">회원 탈퇴</h2>
				
				<hr>
				
				<h4 class="text-primary" style="color: #cd1726;">회원 탈퇴 완료</h4>
				<h6 class="text-primary" style="color: #cd1726;">그동안 저희 Popcorn&amp;Cola를 이용해주셔서 감사합니다.</h6>
				
				<br>
				<br>
			
				<button onclick="location.href='home.do'" class="btn btn-default btn-sm">메인</button>
		</div>
	</c:if>
	<c:if test="${result <= 0 }">
		<script type="text/javascript">
			swal({
				title: "회원 탈퇴를 다시 시도해주세요.", 
				type: "error"
			}).then(function() {
				history.go(-1);
			});
		</script>
	</c:if> 
</body>
</html>