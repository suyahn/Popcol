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
		$('#idDupCheck').click(function() {
			var id = $('#id').val();
			var spanMsg;

			if (!id) {
				$('#idCheck').html('<span class="err">아이디를 먼저 입력 후 눌러주세요.</span>');
				$('#id').focus();

				return false;
			}
			
			/* if (id.length < 4 || id.length > 12) {
				$('#idCheck').html('<span class="err">아이디의 길이를 맞춰주세요.</span>');
				$('#id').focus();
				
				return false;
			} */
			
			var reg_id = /^.*(?=.{4,12})(?=.*[0-9])(?=.*[a-zA-Z]).*$/; 
			if(!reg_id.test(id)) { 
				$('#idCheck').html('<span class="err"> 4~12자 영문 대 소문자, 숫자를 사용하세요.</span>');
				$('#id').focus();
				
				return false;
			}

			$.post('idDupCheck.do', 'cid=' + id, function(result) {
				if(result == 1) {
					$('#idCheck').html('<span class="suc">사용가능한 아이디입니다.</span>');
					$('#check').val('Y');
					
				} else if(result == 0) {
					$('#idCheck').html('<span class="err">사용할 수 없는 아이디입니다.</span>');
				}
			}); 
		});
		
		/* $('#password2').focus(function() {
			if ($('#password').val() != $('#password2').val()) {
				$('#passwordCheck').html('<span class="err">비밀번호가 일치하지 않습니다.</span>');
				
			} else if ($('#password').val()== $('#password2').val()) {
				$('#passwordCheck').html('<span class="suc">비밀번호가 일치합니다.</span>');
			}
		}); */
		
		$('#password').blur(function() {
			var password1 = $('#password').val();
			var password2 = $('#password2').val();
			
			var reg_pw = /^.*(?=.{4,20})(?=.*[0-9])(?=.*[a-zA-Z])(?=.*[@!#$*()_&]).*$/;
			if(!reg_pw.test(password1)) { 
				$('#passwordCheck').html('<span class="err">4~12자 영문 대 소문자, 숫자, 특수문자(@!#$*()_&)를 사용하세요.</span>');
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
	
	function IdDupCheckCheck() {
		var check = document.getElementById('check').value;
		
		if(check == 'N') {
			alert("아이디 중복검사를 해주세요.");
			
			return false;
		}
	}
</script>
</head>
<body>
	<div class="container" align="center" style="width: 600px;">
		<h2 class="text-primary">회원가입</h2>
		
		<br>
		<br>
		
		<form action="join.do" onsubmit="return IdDupCheckCheck()">
			<table>
				<tr>
					<th width="20%">
						<label for="id">아이디</label>
					</th>
					<td>						
						<div class="form-group">
							<input type="text" class="form-control" name="cid" id="id" required="required" placeholder="아이디 (4 ~ 12자리의 영문 대 소문자, 숫자)" size="10">
						</div>
					</td>
				</tr>
				
				<tr>
					<th>
					</th>
					<td>
						<div class="form-group">
							<input type="button" id="idDupCheck" class="btn btn-default btn-sm" value="중복확인" style="float: left;">
							
							<div id="idCheck"></div>
							<input type="hidden" id="check" value="N">
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
						<br><label for="name">이름</label>
					</th>
					<td>						
						<div class="form-group">
							<br><input type="text" class="form-control" name="cname" id="name" required="required" placeholder="이름" size="100">
						</div>
					</td>
				</tr>
				
				<tr>
					<th>
						<br><label for="email">이메일</label>
					</th>
					<td>						
						<div class="form-group">
							<br><input type="email" class="form-control" name="cemail" id="email" required="required" placeholder="이메일(aaaa@aaa.com)">
						</div>
					</td>
				</tr>	
				
				<tr>
					<th>
						<br><label for="phone">전화번호</label>
					</th>
					<td>						
						<div class="form-group">
							<br><input type="tel" class="form-control" name="cphone" id="phone" required="required" placeholder="전화번호(010-000(0)-0000)" pattern="(010)-\d{3,4}-\d{4}">
						</div>
					</td>
				</tr>	
				
				<tr>
					<th>
						<label for="birthday">생일</label>
					</th>
					<td>						
						<div class="form-group">
							<br><input type="text" onfocus="(this.type='date')" onblur="(this.type='text')" id="date" class="form-control" placeholder="생년월일" required="required" name="cbirthdaystring" maxlength="8">
						</div>
					</td>
				</tr>
				
				<tr>
					<th colspan="2">		
						<br>				
						<div class="form-group" style="display: inline;">
							<input type="submit" class="btn btn-info btn-sm" value="회원가입" style="border-color: #cd1726; background-color: #cd1726;">
							<input type="button" onclick="location.href='home.do'" class="btn btn-default btn-sm" value="취소" >
						</div>
					</th>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>