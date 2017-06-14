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
		<h2 class="text-primary">회원가입여부확인</h2>
		<h6 class="text-primary">회원가입여부확인을 위해 다음의 정보를 입력해주세요.</h6>
		
		<br>
		<br>

		<form action="joinCheck.do">
			<table>
					<tr>
						<td>
							<div class="form-group">
								<input type="text" class="form-control" placeholder="이름을 입력해주세요" required="required" name="cname" size="30">
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
								<input type="tel" class="form-control" placeholder="010-0000-0000" required="required" name="cphone">
							</div>
						</td>
					</tr>
					
					<tr>
						<td><input type="submit" value="가입여부확인" class="btn btn-info btn-sm" style="border-color: navy; background-color: navy;"></td>
					</tr>
				</table>
		</form>
	</div>
</body>
</html>