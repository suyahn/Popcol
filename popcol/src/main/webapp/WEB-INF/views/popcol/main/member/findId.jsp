<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
li>a {
	color: #cd1726;
}

li>a:hover {
	color: #fcba2e;
}

li.active>a {
	color: black;
}
</style>
</head>
<body>
<div class="container" align="center">
     <ul id="myTab" class="nav nav-tabs" role="tablist">
       <li role="presentation" class="active"><a href="#id" id="id-tab" role="tab" data-toggle="tab" aria-controls="id" aria-expanded="true">아이디 찾기</a></li>
       <li role="presentation"><a href="#password" id="password-tab" role="tab" data-toggle="tab" aria-controls="password" aria-expanded="false">비밀번호 찾기</a></li>
     </ul>
     <div id="myTabContent" class="tab-content">
       <div role="tabpanel" class="tab-pane fade active in" id="id" aria-labelledby="id-tab">
       
	       <br>
	       <br>
	       
       		<h4 style="font-weight: bold;">아이디 찾기</h4>
		 	<h6 style="font-weight: bold;">아이디가 기억나지 않으세요? 가입 시 사용하신 개인정보로 아이디를 찾으실 수 있습니다.</h6>

			<br>
			<br>
		
			<c:if test="${result > 0 }">
				<h2 style="font-weight: bold;">고객님의 아이디는 ${customerId }입니다.</h2>
					
				<br>
				<br>
				
				<button type="button" class="btn btn-info btn-sm" style="border-color: #cd1726; background-color: #cd1726;" onclick="location.href='findPasswordForm.do'">비밀번호 찾기</button>
				<button type="button" class="btn btn-default btn-sm" onclick="location.href='loginForm.do'">로그인</button>
			</c:if>
			
			<c:if test="${result <= 0 }">
				<h2 style="font-weight: bold;">죄송합니다. 입력하신 정보와 일치하는 아이디가 없습니다.</h2>
				
				<br>
				<br>
				
				<button onclick="location.href='findForm.do'" class="btn btn-info btn-sm" style="border-color: #cd1726; background-color: #cd1726;">돌아가기</button>
				<button type="button" class="btn btn-default btn-sm" onclick="location.href='loginForm.do'">로그인</button>
			</c:if>
       </div>
       
       <div role="tabpanel" class="tab-pane fade" id="password" aria-labelledby="password-tab">
       
       	<br>
       	<br>
       	
	       	<h4 style="font-weight: bold;">비밀번호 찾기</h4>
			<h6 style="font-weight: bold;">비밀번호가 기억나지 않으세요? 간단한 인증을 통해 비밀번호를 재설정하실 수 있습니다. </h6>
		
		<br>
		<br>
		
	         <form action="findPassword.do" method="post">
				<table>
					<tr>
						<td>
							<div class="form-group">
								<input type="text" class="form-control" placeholder="아이디" required="required" name="cid" size="30">
							</div>
						</td>
					</tr>
					
					<tr>
						<td>
							<div class="form-group">
								<input type="text" class="form-control" placeholder="이름" required="required" name="cname" size="">
							</div>
						</td>
					</tr>
					
					<tr>
						<td>
							<div class="form-group">
								<input type="tel" class="form-control" name="cphone" required="required" placeholder="전화번호" pattern="(010)-\d{3,4}-\d{4}">
							</div>
						</td>
					</tr>
					
					<tr>
						<td>
							<div class="form-group">
								<input type="email" class="form-control" name="cemail" required="required" placeholder="이메일" pattern="(010)-\d{3,4}-\d{4}">
							</div>
						</td>
					</tr>
					
					<tr>
						<td colspan="2" align="center">
							<br>
							<button type="submit" class="btn btn-info btn-sm" style="border-color: #cd1726; background-color: #cd1726;">확인</button>
							<button type="button" class="btn btn-default btn-sm" onclick="location.href='loginForm.do'">로그인</button>
						</td>
					</tr>
				</table>
			</form>
       </div>
     </div>
   </div>
</body>
</html>