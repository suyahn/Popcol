<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../popcol/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Admin UpdateForm</title>
</head>
<body>
	<div class="container" align="center" style="width: 800px;">
		<h2>
			<img src="location/logo.png" width="250" height="70">고객정보 수정
		</h2>
		<form action="adminCustomerUpdate.do" method="post">
			<input type="hidden" name="cid" value="${customer.cid}"> <input
				type="hidden" name="pageNum" value="${pageNum}">
			<table class="table table-bordered">
				<tr>
					<td>아이디</td>
					<td>${ customer.cid }</td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="cname" required="required" value="${customer.cname}"></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td>${customer.cemail}</td>
				</tr>
				<tr>
					<td>연락처</td>
					<td>${customer.cphone}</td>
				</tr>
				<tr>
					<td>포인트</td>
					<td>${customer.cpoint}</td>
				</tr>
				<tr>
					<td>회원가입일</td>
					<td>${customer.creg_date}</td>
				</tr>
				<tr>
					<td>생년월일</td>
					<td>${customer.cbirthday}</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="확인" class="btn btn-info btn-sm" style="display: inline; border-color: #cd1726; background-color: #cd1726;">
						<input type="button" value="이전" class="btn btn-default btn-sm" onclick="history.go(-1)">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>