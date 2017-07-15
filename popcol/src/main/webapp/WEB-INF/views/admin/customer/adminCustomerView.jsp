<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../popcol/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Admin View</title>
<script type="text/javascript">
	function deleteChk(cid, pageNum) {
		swal({
			  title: "이 회원을 탈퇴시겠습니까?",
			  type: "question",
			  showCancelButton: true,
			  confirmButtonColor: "#CD1726",
			  confirmButtonText: "네!",
			  cancelButtonText: "아니요.",
			  closeOnConfirm: true,
			  closeOnCancel: true
		}).then(function() {
			  location.href="adminCustomerDelete.do?cid=" + cid + "&pageNum=" + pageNum;
		});
	}
</script>
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
				<td>${customer.cbirthday}</td>
			</tr>
		</table>
		<a href="adminCustomerList.do?" class="btn btn-default" style="display: inline;">목록</a>
		<c:if test="${customer.cdel eq 'n' }">
		<a
			href="adminCustomerUpdateForm.do?cid=${customer.cid}&pageNum=${pageNum}"
			class="btn btn-info"
			style="display: inline; border-color: #cd1726; background-color: #cd1726;">회원이름변경</a>
		<a onclick="deleteChk('${ customer.cid }', ${ pageNum })" class="btn btn-info"
			style="display: inline; border-color: #cd1726; background-color: #cd1726;">회원강제탈퇴</a>
			</c:if>
		
		<hr>
	</div>
</body>
</html>