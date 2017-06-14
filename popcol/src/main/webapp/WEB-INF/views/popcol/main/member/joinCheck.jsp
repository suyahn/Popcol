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
		<div class="container" align="center" style="width: 500px;">
			<h2 class="text-primary">가입된 정보가 있습니다.</h2>
			<h6 class="text-primary">${customer.cname }회원님께서는 이미 저희 페이지에 가입하셨습니다.</h6>
			
			<br>
			<br>
			
			<button onclick="location.href='findIdPasswordForm.do'" class="btn btn-info btn-sm"  style="border-color: navy; background-color: navy;">
				아이디/패스워드 찾기
			</button>
		</div>
	</c:if>
	
	<c:if test="${result <= 0 }">
		<script type="text/javascript">
			alert("가입된 정보가 없습니다. 회원가입 페이지로 이동합니다.");
			location.href="joinForm.do";
		</script>
	</c:if>
</body>
</html>