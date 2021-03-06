<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ include file="../../header.jsp" %>
<%@ include file="verticaltab.jsp" %>
<%@ include file="mypage.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function() {
		$('#pointPage').load("pointPage.do");
	});
	
	/* function ChkPassword() {
		if (frm.chkPassword.value != frm.password.value) {
			swal({
				title: "비밀번호가 틀렸습니다.", 
				type: "error"
			});
			
			return false;
		}
	} */
	
	function byeChk() {
		swal({
			  title: "정말로 탈퇴하시겠습니까?",
			  type: "question",
			  showCancelButton: true,
			  confirmButtonColor: "#CD1726",
			  confirmButtonText: "네!",
			  cancelButtonText: "아니요.",
			  closeOnConfirm: true,
			  closeOnCancel: true
		}).then(function() {
			$('#byePopcolForm').submit();
		});
	}
</script>
</head>
<body>
	<div id="pointPage" style="width: 944px; margin-right: 50px; margin-left: 50px; margin-bottom: 30px !important; 
											margin: auto; background-image: URL(${path}/images/ticket.png); ">
	</div>

	 <div class="container-fluid " align="center" style="width: 80%; margin-bottom: 50px !important; margin: auto;">
			
			<div class="col-sm-9 col-sm-push-3 contentAreaStyle">
			<div class="container" align="center" style="width: 800px;">
				<h2 class="text-primary" align="left" style="color: #cd1726;">회원 탈퇴</h2>
				
				<hr>
				
				<h4 class="text-primary" style="color: #cd1726;">비밀번호 확인</h4>
				<h6 class="text-primary" style="color: #cd1726;">회원님의 개인정보 보호를 위한 절차이오니, Popcorn&amp;Cola 로그인 시 사용하는 비밀번호를 입력해 주세요. </h6>
				
				<br>
				<br>
				
				<form action="mypage_byePopcolPasswordChk.do" name="frm" method="post" id="byePopcolForm">
				<%-- <input type="hidden" value="${customer.cpassword }" id="chkPassword"> --%>
					<table>
						<tr>
							<td>						
								<div class="form-group">
									<br><font size="5px">${customer.cname }</font>님(${customer.cid })
								</div>
							</td>
						</tr>
						
						<tr>
							<td>						
								<div class="form-group">
									<input type="password" class="form-control" name="cpassword" id="password" required="required" placeholder="비밀번호" size="40">
								</div>
							</td>
						</tr>
						
						<tr>
							<td>						
								<div class="form-group" id="passwordCheck"></div>
							</td>
						</tr>
						<tr>
							<td align="center">
								<c:if test="${ not empty result }">
									<span style="font-size: 15px; font-weight: bold; color:#cd1726;">
										비밀번호를 확인해주세요.<br>
									</span>
								</c:if>
							</td>
						</tr>
						<tr>
							<th>		
								<br>	
								<div align="center">			 
								<div class="form-group" style="display: inline;">
									<input type="button" onclick="byeChk()" class="btn btn-info btn-sm" value="확인" style="border-color: #cd1726; background-color: #cd1726;">
									<input type="button" onclick="location.href='home.do'" class="btn btn-default btn-sm" value="메인" >
								</div>
								</div>
							</th>
						</tr>
					</table>
				</form>
			</div>
			</div>
			
			<!-- sidebar area start -->
			<div class="col-sm-3 col-sm-pull-9">
				<div class="text-xs-center text-sm-left">			
					<ul class="nav nav-stacked menu">
						<li class="" id=""><a href="mypage_Main.do" class="" id="">My PopCol Home</a></li>
						<li class="" id=""><a href="mypage_reservation.do" class="" id="">나의 예매내역</a></li>
						<li class="" id=""><a href="mypage_seeMovie.do" class="" id="">내가 본 영화</a></li>
						<li class="" id=""><a href="mypage_myPoint.do" class="" id="">나의 포인트 내역</a></li>
						<li class="" id=""><a href="mypage_myInfoModifyintro.do" class="" id="">회원 정보 수정</a></li>
						<li class="active" id=""><a href="mypage_byePopcolForm.do" class="" id="">회원 탈퇴</a></li>
						<li class="" id=""><a href="mypage_myQna.do" class="" id="">나의 문의 내역</a></li>
					</ul>
				</div>
			</div>
			<!-- sidebar area end -->
    </div>
</body>
</html>