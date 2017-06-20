<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../popcol/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Admin View</title>
</head>
<body>
	<div class="container" align="center">
		<h2>
			<img src="location/logo.png" width="250" height="70"> 고객 정보
		</h2>
		<table class="table table-bordered">
			<tr>
				<td>아이디</td>
				<td>${ customer.cid }</td>
			</tr>
			<tr>
				<td>이름</td>
				<td>${customer.cname}</td>
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
				<td>${customer.cbirth_date}</td>
			</tr>
		</table>
		<a href="adminCustomerList.do?" class="btn btn-info"
			style="display: inline; border-color: navy; background-color: navy;">목록</a>
		<a href="adminCustomerUpdateForm.do?cid=${customer.cid}"
			class="btn btn-info"
			style="display: inline; border-color: navy; background-color: navy;">수정</a>
		<a href="adminCustomerDelete.do?cid=${customer.cid}" class="btn btn-info"
			style="display: inline; border-color: navy; background-color: navy;">삭제</a>
	</div>
</body>
</html>