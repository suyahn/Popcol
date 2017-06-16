<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp" %>
<%@ include file="../member/memberCheck.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function() {		
		$('#password').blur(function() {
			var password1 = $('#password').val();
			var password2 = $('#password2').val();
			
			var reg_pw = /^.*(?=.{4,20})(?=.*[0-9])(?=.*[a-zA-Z])(?=.*[@!#$*()_&]).*$/;
			if(!reg_pw.test(password1)) { 
				$('#passwordCheck').html('<span class="err">4~12자 영문 대 소문자, 숫자, 특수문자를 사용하세요.</span>');
				$('#password').focus();
				
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
			var password1 = $('#password').val();
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
	<div class="container" align="center" style="width: 600px;">
		<h2 class="text-primary">회원 정보 수정</h2>
		
		<br>
		<br>
		
		<form action="mypage_myInfoModify.do">
			<table>
				<tr>
					<th width="20%">
						<label for="id">아이디</label>
					</th>
					<td>						
						<div class="form-group">
							${customer.cid }
						</div>
					</td>
				</tr>
				
				<tr>
					<th>
							<label for="password">비밀번호</label>
					</th>
					<td>						
						<div class="form-group">
							<br><input type="password" class="form-control" name="cpassword" id="password" required="required" placeholder="비밀번호 (4 ~ 20자리의 영문 대 소문자, 숫자, 특수문자)">
						</div>
					</td>
				</tr>	
				
				<tr>
					<th>
					</th>
					<td>						
						<div class="form-group">
							<input type="password" class="form-control" name="cpassword2" id="password2" required="required" placeholder="비밀번호확인">
						</div>
					</td>
				</tr>
				
				<tr>
					<th>
					</th>
					<td>						
						<div class="form-group" id="passwordCheck"></div>
					</td>
				</tr>
				
				<tr>
					<th>
							<label for="name">이름</label>
					</th>
					<td>							
						<div class="form-group">
							${customer.cname }
						</div>
					</td>
				</tr>
				
				<tr>
					<th>
						<br><label for="email">이메일</label>
					</th>
					<td>						
						<div class="form-group">
							<br><input type="email" class="form-control" name="cemail" id="email" required="required" value="${customer.cemail }" placeholder="이메일">
						</div>
					</td>
				</tr>	
				
				<tr>
					<th>
						<br><label for="phone">전화번호</label>
					</th>
					<td>						
						<div class="form-group">
							<br><input type="tel" class="form-control" name="cphone" id="phone" required="required" placeholder="전화번호" value="${customer.cphone }" pattern="(010)-\d{3,4}-\d{4}">
						</div>
					</td>
				</tr>	
				
				<tr>
					<th>
						<label for="birthday">생일</label>
					</th>
					<td>						
						<div class="form-group">
							${customer.cbirthday }
						</div>
					</td>
				</tr>
				
				<tr>
					<th colspan="2" align="center">		
						<br>				
						<div class="form-group" style="display: inline;">
							<input type="submit" class="btn btn-info btn-sm" value="회원 정보 수정" style="border-color: #cd1726; background-color: #cd1726;">
							<input type="button" onclick="location.href='home.do'" class="btn btn-default btn-sm" value="취소" >
						</div>
					</th>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>