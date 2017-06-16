<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ include file="../../header.jsp" %>
<%@ include file="verticaltab.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.nav>li.active>a {
	background-color: #cd1726 !important;
	color: white !important;
}

a {
	color: #cd1726 !important;
}

.nav>li>a:hover {
	background-color: #fdeaeb !important;
	color : #fcba2e !important;
}

hr {
    color: #dfdfdf;    /* IE */
    border-color: #dfdfdf;  /* 사파리 */
    background-color: #dfdfdf;   /* 크롬, 모질라 등, 기타 브라우저 */
}
</style>
<script type="text/javascript">
	$(function() {
		// 생일축하 포인트 받기
		$('#receivePoint').click(function() {
			
			$.post('receivePoint.do', function(result) {
				if(result == 1) {
					alert("생일축하 10000 포인트 지급 완료~ 즐거운 하루되세요.");
					
				} else if(result == 0) {
					alert("다시 시도해주세요.");
				}
			}); 
		});
	});
	
	function ChkPassword() {
		if (frm.chkPassword.value != frm.password.value) {
			alert("비밀번호가 틀렸습니다.");
			
			return false;
		}
	}
</script>
</head>
<body>
	<div style="width: 70%; margin-right: 50px; margin-left: 50px; margin-bottom: 30px !important; margin: auto; background-image: URL(${path}/images/ticket.png); ">
		<div style="width: 100%; height: 303px;">
			<br>
			<br>
			<br>
			<h2 class="" style="margin: 10px;">
				&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
				${customer.cname }님
				<font size="2px">(${customer.cid })</font>
			</h2>
			<br>
			<h4 class="" style="margin: 10px;">
				&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
				고객님께서 현재 보유하신 포인트는 ${customer.cpoint }점입니다.
			</h4>
			
			<c:if test="${checkPoint == 'n' }">
				<br>
				<h4>
					&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
					생일축하 포인트가 지급되었습니다. 옆의 버튼을 눌러주세요.
					<button id="receivePoint" class="btn btn-info btn-sm" style="border-color: #cd1726; background-color: #cd1726;">생일축하 포인트 받기</button>
				</h4>
			</c:if>
		</div>
	</div>

	 <div class="container-fluid " align="center" style="width: 80%; margin-bottom: 50px !important; margin: auto;">
			
			<div class="col-sm-9 col-sm-push-3 contentAreaStyle">
			<div class="container" align="center" style="width: 600px;">
				<h2 class="text-primary" align="left">회원 정보 수정</h2>
				
				<hr>
				
				<h4 class="text-primary">회원정보를 수정하시려면 비밀번호를 입력하셔야 합니다.</h4>
				<h6 class="text-primary">회원님의 개인정보 보호를 위한 본인 확인 절차이오니, </h6>
				<h6 class="text-primary">Popcorn&amp;Cola 회원 로그인 시 사용하시는 비밀번호를 입력해주세요.</h6>
				
				<br>
				<br>
				
				<form action="mypage_myInfoModifyForm.do" onsubmit="return ChkPassword()" name="frm">
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
								<div align="center">		 
								<div class="form-group" style="display: inline;">
									<input type="submit" class="btn btn-info btn-sm" value="확인" style="border-color: #cd1726; background-color: #cd1726;">
									<input type="button" onclick="location.href='mypage_Main.do'" class="btn btn-default btn-sm" value="취소" >
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
						<li class="active" id=""><a href="mypage_Modifyintro.do" class="" id="">회원 정보 수정</a></li>
						<li class="" id=""><a href="mypage_byePopcolForm.do" class="" id="">회원 탈퇴</a></li>
						<li class="" id=""><a href="mypage_myQna.do" class="" id="">나의 문의 내역</a></li>
					</ul>
				</div>
			</div>
			<!-- sidebar area end -->
    </div>
</body>
</html>