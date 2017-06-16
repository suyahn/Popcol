<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function ChkPassword() {}
	var chkPassword = document.getElemetById("chkPassword").value();
		var password = document.getElemetById("password").value();

		if (chkPassword != password) {
			alert("비밀번호가 틀렸습니다.");
			
			return false;
		}
	}
</script>
</head>
<body>
	<div class="container" align="center" style="width: 600px;">
		<h2 class="text-primary">회원 정보 수정</h2>
		
		<hr>
		
		<h4 class="text-primary">회원정보를 수정하시려면 비밀번호를 입력하셔야 합니다.</h4>
		<h6 class="text-primary">회원님의 개인정보 보호를 위한 본인 확인 절차이오니, </h6>
		<h6 class="text-primary">Popcorn&amp;Cola 회원 로그인 시 사용하시는 비밀번호를 입력해주세요.</h6>
		
		<br>
		<br>
		
		<form action="mypage_myInfoModifyForm.do" onsubmit="ChkPassword()">
		<input type="hidden" value="${customer.cpassword }" id="chkPassword">
			<table>
				
				<tr>
					<td>						
						<div class="form-group">
							<br><input type="password" class="form-control" name="cpassword" id="password" required="required" placeholder="비밀번호" size="40">
						</div>
					</td>
				</tr>
				
				<tr>
					<td>						
						<div class="form-group" id="passwordCheck"></div>
					</td>
				</tr>
				
				<tr>
					<th>		
						<br>				 
						<div class="form-group" style="display: inline;">
							<input type="submit" class="btn btn-info btn-sm" value="확인" style="border-color: #cd1726; background-color: #cd1726;">
							<input type="button" onclick="location.href='home.do'" class="btn btn-default btn-sm" value="취소" >
						</div>
					</th>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>