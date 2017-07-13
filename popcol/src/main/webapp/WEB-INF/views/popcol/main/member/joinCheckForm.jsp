<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container" align="center" style="width: 500px;">
		<h2 style="font-weight: bold;">회원가입여부확인</h2>
		<h6 style="font-weight: bold;">회원가입여부확인을 위해 다음의 정보를 입력해주세요.</h6>
		
		<br>
		<br>

		<form action="joinCheck.do">
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
							<input type="text" onfocus="(this.type='date')" onblur="(this.type='text')" id="date" class="form-control" placeholder="생년월일" required="required" name="cbirthdaystring" maxlength="8">
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
						<div class="form-group" align="center">
							<input type="submit" value="가입여부확인" class="btn btn-info btn-sm" style="border-color: #cd1726; background-color: #cd1726;">
							<input type="button" onclick="location.href='home.do'" class="btn btn-default btn-sm" value="취소" >
						</div>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>