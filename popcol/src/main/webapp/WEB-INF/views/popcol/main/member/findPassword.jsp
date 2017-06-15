<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp" %>
<%@ include file="memberCheck.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function() {
		$('#password1').blur(function() {
			var password1 = $('#password1').val();
			var password2 = $('#password2').val();
			
			var reg_pw = /^.*(?=.{4,20})(?=.*[0-9])(?=.*[a-zA-Z])(?=.*[@!#$*()_&]).*$/;
			if(!reg_pw.test(password1)) { 
				$('#passwordCheck').html('<span class="err">4~12자 영문 대 소문자, 숫자, 특수문자를 사용하세요.</span>');
				$('#password1').focus();
				
				return false;
			}
			
			$('#passwordCheck').html('');
			
			if (password2 != "" && password1 != password2) {
				$('#passwordCheck').html('<span class="err">비밀번호가 일치하지 않습니다.</span>');

				$('#password2').val("");
				$('#password2').focus();
				
			} else if (password2 != "" && password1 != password2) {
				$('#passwordCheck').html('<span class="suc">비밀번호가 일치합니다.</span>');

				$('#name').focus();
				
			}
		});
		
		$('#password2').blur(function() {
			var password1 = $('#password1').val();
			var password2 = $('#password2').val();
			
			if (password1 == "") {
				$('#passwordCheck').html('<span class="err">비밀번호를 입력해주세요.</span>');
				
			} else if (password2 == "") {
				$('#passwordCheck').html('<span class="err">비밀번호를 한번 더 입력해주세요.</span>');
			
			} else if (password1 != password2) {
				$('#passwordCheck').html('<span class="err">비밀번호가 일치하지 않습니다.</span>');
				
				$('#password2').val("");
				$('#password2').focus();
				
			} else if (password1== password2) {
				$('#passwordCheck').html('<span class="suc">비밀번호가 일치합니다.</span>');

				$('#name').focus();
			}
		});
	});
</script>
</head>
<body>
<div class="container" align="center">
     <ul id="myTab" class="nav nav-tabs" role="tablist">
       <li role="presentation"><a href="#id" id="id-tab" role="tab" data-toggle="tab" aria-controls="id" aria-expanded="true">아이디 찾기</a></li>
       <li role="presentation" class="active"><a href="#password" id="password-tab" role="tab" data-toggle="tab" aria-controls="password" aria-expanded="false">비밀번호 찾기</a></li>
     </ul>
     <div id="myTabContent" class="tab-content">
       <div role="tabpanel" class="tab-pane fade" id="id" aria-labelledby="id-tab">
       
	       	<br>
	       	<br>
	       	
	       	<h4 class="text-primary">아이디 찾기</h4>
			<h6 class="text-primary">아이디가 기억나지 않으세요? 가입 시 사용하신 개인정보로 아이디를 찾으실 수 있습니다.</h6>
			
			<br>
			<br>
			
	        <form action="findId.do" method="post">
				<table>
						<tr>
							<td>
								<div class="form-group">
									<input type="text" class="form-control" placeholder="이름" required="required" name="cname" size="30">
								</div>
							</td>
						</tr>
						
						<tr>
							<td>
								<div class="form-group">
									<input type="date" class="form-control" placeholder="" required="required" name="cbirthdaystring" maxlength="8">
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
							<td colspan="2" align="center">
								<br>
								<button type="submit" class="btn btn-info btn-sm" style="border-color: navy; background-color: navy;">확인</button>
								<button type="button" class="btn btn-default btn-sm" onclick="location.href='loginForm.do'">로그인</button>
							</td>
					</tr>
				</table>
			</form>
       </div>
       <div role="tabpanel" class="tab-pane fade active in" id="password" aria-labelledby="password-tab">
       
	       	<br>
	       	<br>
	       	
	       	<c:if test="${result > 0 }">
		       	<h4 class="text-primary">비밀번호 재설정 </h4>
				<h6 class="text-primary">${customer.cname }님의 비밀번호를 변경합니다.</h6>
				
				<br>
				
				<form action="findPassword_changePassword.do" method="post">
					<input type="hidden" name="cid" value="${customer.cid }">
					<table>
						<tr>
							<td>
								<h6 class="text-primary" style="color: red;">비밀번호는 4 ~ 20자리의 영문 대 소문자, 숫자, 특수문자를 사용해주세요.</h6>
							</td>
						</tr>
					
						<tr>
							<td>						
								<div class="form-group">
									<br><input type="password" class="form-control" name="cpassword" id="password1" required="required" placeholder="새 비밀번호">
								</div>
							</td>
						</tr>	
						
						<tr>
							<td>						
								<div class="form-group">
									<input type="password" class="form-control" name="cpassword2" id="password2" required="required" placeholder="새 비밀번호확인">
								</div>
							</td>
						</tr>
						
						<tr>
							<td>						
								<div class="form-group" id="passwordCheck"></div>
							</td>
						</tr>
						
						<tr>
							<td>
								<br>
								<button type="submit" class="btn btn-info btn-sm" style="border-color: navy; background-color: navy;">비밀번호 변경</button>
								<button type="button" class="btn btn-default btn-sm" onclick="location.href='loginForm.do'">로그인</button>
							</td>
						</tr>
					</table>
				</form>
	       	</c:if>
	       	
	       	<c:if test="${result <= 0 }">
		       	<h4 class="text-primary">비밀번호 찾기</h4>
				<h6 class="text-primary">비밀번호가 기억나지 않으세요? 간단한 인증을 통해 비밀번호를 재설정하실 수 있습니다. </h6>
				
				<br>
				<br>
				
		         <h2 class="text-primary">죄송합니다. 입력하신 정보와 일치하는 고객정보가 없습니다.</h2>
				
				<br>
				<br>
				
				<button onclick="location.href='findPasswordForm.do'" class="btn btn-info btn-sm" style="border-color: navy; background-color: navy;">돌아가기</button>
				<button type="button" class="btn btn-default btn-sm" onclick="location.href='loginForm.do'">로그인</button>
			</c:if>
       </div>
     </div>
   </div>
</body>
</html>