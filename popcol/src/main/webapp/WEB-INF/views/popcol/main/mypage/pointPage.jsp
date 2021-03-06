<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function() {
		// 생일축하 포인트 받기
		$('#receivePoint').click(function() {
			
			$.post('receivePoint.do', function(result) {
				if(result == 1) {
					swal({
						title: "생일축하 10000 포인트 지급 완료~ 즐거운 하루되세요.", 
						type: "success"
					}).then(function() {
						window.location.reload();
					});
				} else if(result == 0) {
					swal({
						title: "다시 시도해주세요.", 
						type: "error"
					});
				}
			}); 
		});
	});
</script>
</head>
<body>
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
</body>
</html>