<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../popcol/header.jsp"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.dd {
	text-align: center;
}
.Pay{
display: none;
}
</style>
<script type="text/javascript">
	$(function() {
		$('#usingpoint').blur(function() {//blur는 빈칸에 값이 입력되었을 때 입력된 값을 이용하도록 해줌
			var point = $(this).val();//this에 입력된 값을 var point에 넣어줌
			var price = $('#price').val();
			var dd = price - point;
			if (point > price) {
				alert("포인트가 예매 금액을 초과하였습니다.");
				$(this).val(price);//포인트 입력창에 price값이 입력되게끔 해줌
				dd = 0;
			}
			$('#resultPrice').html(
					'<font style="font-weight:normal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'
							+ dd + '원</font>');
		});
		$('input[type="radio"]').change(function() {
			var payWay = $(this).val();//선택된 다른 radio의 value를 받아옴
			$(".Pay").hide();//선택되지 않은 다른 radio div class는 숨기기 ex)phonePay 숨기기
	        $('#'+payWay+'Pay').show();//선택하여 받은 radio의 id를 찾아 뿌려줌 ex)#creditPay
		});
	});
</script>
</head>
<body>
	<div class="container" align="center">
		<h2 style="color: #cd1726;" align="center">결제 선택</h2>
		<form action="main.do" method="post">
			<input type="hidden" value="${rt.rtid}" name="rtid"> <input
				type="hidden" value="${price}" name="price" id="price"> <input
				type="hidden" value="${seat}" name="seat"> <input
				type="hidden" value="${adult}" name="adult"> <input
				type="hidden" value="${youth}" name="youth"> <input
				type="hidden" value="${special}" name="special">
			<div class="panel-group" id="accordion" role="tablist"
				aria-multiselectable="true" style="width: 80%;">
				<div class="panel panel-danger">
					<div class="panel-heading" role="tab" id="headingOne">
						<h4 class="panel-title" style="text-align: left;">
							<a role="button" data-toggle="collapse" data-parent="#accordion"
								href="#collapseOne" aria-expanded="true"
								aria-controls="collapseOne"> <span
								class="glyphicon glyphicon-minus">포인트 결제</span>
							</a>
						</h4>
					</div>
					<div id="collapseOne" class="panel-collapse collapse in"
						role="tabpanel" aria-labelledby="headingOne">
						<div class="panel-body">
							<table class="table table- bordered">
								<tr>
									<th style="text-align: center; vertical-align: center;">●팝콜 포인트</th>
									<th style="text-align: center; vertical-align: center; font-weight: normal;">
									현재 보유 포인트: ${point} point</th>
									<th style="text-align: center; vertical-align: center; font-weight: normal;">
									사용할 포인트: <input type="number" value="point" style="width: 30%;" id="usingpoint">
									</th>
								</tr>
								<tr></tr>
								<tr align="right">
									<th style="text-align: center; vertical-align: center;">●할인된 금액</th>
									<td id="resultPrice" colspan="2" style="text-align: left;">
										<font style="font-weight: normal">
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${price }원
										</font>
									</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
				<div class="panel panel-danger">
					<div class="panel-heading" role="tab" id="headingTwo">
						<h4 class="panel-title" style="text-align: left;">
							<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" 
							aria-expanded="false" aria-controls="collapseTwo"> 
							<span class="glyphicon glyphicon-plus"></span> 최종결제 수단
							</a>
						</h4>
					</div>
					<div id="collapseTwo" class="panel-collapse collapse"
						role="tabpanel" aria-labelledby="headingTwo">
						<div class="panel-body">
							<table class="table table- bordered">
								<tr>
									<th style="text-align: center; vertical-align: center;">
											<input type="radio" name="payway" value="credit" id="credit" >
											<label for="credit">신용카드</label>
											<input type="radio" name="payway" value="phone" id="phone">
											<label for="phone">휴대폰결제</label> 
											<input type="radio" name="payway" value="account" id="account">
											<label for="account">계좌 이체</label>
									</th>
								</tr>
								</table>
								<div class="Pay" id="creditPay">
								<table class="table table-bordered">
								<tr>
									<th style="text-align: center; vertical-align: center;" height="50px">
											<select name="credit" style="text-align: center; vertical-align: center; vertical-align: middle; height:30px;" >
											<option value="">카드를 선택하세요</option>
											<option value="bc">BC</option>
											<option value="visa">VISA</option>
											<option value="농협" >농협</option>
											<option value="신한" >신한</option>
											<option value="국민" >국민</option>
											<option value="하나" >하나</option>
									</select>
									</th>
									<tr>
										<th>카드번호
										<input  style="width: 60px;" required="required"  onKeypress="onlyNumber()" maxlength="4">
										-&nbsp;&nbsp;<input 	style="width: 60px;" onKeypress="onlyNumber()"  type="password"  maxlength="4" required="required" >
										-&nbsp;&nbsp;<input  style="width: 60px;" onKeypress="onlyNumber()"  type="password"  maxlength="4" required="required" >
										-&nbsp;&nbsp;<input  style="width: 60px;" onKeypress="onlyNumber()"  maxlength="4" required="required"  >
										</th>
									</tr>
									<tr>
										<th>비밀번호
										<input style="width:60px;" required="required" onkeydown="onlyNumber()" maxlength="2">**
										</th>
									</tr>
									<tr>
										<th>유효기간
										<input style="width: 60px;" onkeypress="onlyNumber()" maxlength="2" required="required" min="00" max="99">년
										<input style="width: 60px;" onKeypress="onlyNumber()" maxlength="2" required="required" min="01" max="12">월
										</th>
									</tr>
									<tr>
										<th>법정생년월일&nbsp;&nbsp;
										<input style="width: 100px;"onkeypress="onlyNumber()" maxlength="6" required="required"> -*******
										</th>
									</tr> 	
							</table>
							</div>
							<div class="Pay"  id="phonePay">
								<table class="table table-bordered"> 
									<tr><td>휴대폰 결제 순서</td></tr>
									<tr><td>1.우측 하단에 있는 "결제 하기" 버튼 클릭해주세요.</td></tr>
									<tr><td>2.예매 내역 확인 후 결제하기 버튼 클릭 시 결제 팝업창이 뜹니다.</td></tr>
									<tr><td>3.해당 팝업에서 통신사 선택 후 정보를 입력해주세요.</td></tr>
								</table>
							</div>
							<div class="Pay" id="accountPay">
								<table class="table table-bordered"> 
									<tr><td>계좌 이체 결제 순서</td></tr>
									<tr><td>1.우측 하단에 있는 "결제 하기" 버튼 클릭해주세요.</td></tr>
									<tr><td>2.예매 내역 확인 후 결제하기 버튼 클릭 시 결제 팝업창이 뜹니다.</td></tr>
									<tr><td>3.해당 팝업에서 원하는 은행을 선택 후 계좌이체 정보를 입력해주세요.</td></tr>
								</table>
							</div>
						</div>
						<input type="submit" value="결제 하기"  class="btn btn-info btn-sm" style="border-color:
						#cd1726; background-color: #cd1726; text-align: center; vertical-align: middle; margin-bottom: 25px;" 
						="">
					</div>
				</div>
			</div>
		</form>
	</div>
</body>
</html>