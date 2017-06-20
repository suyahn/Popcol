<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../popcol/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function(){
		$('.timertid').click(function(){
			$('.timertid').css("background-color","white");
			$('.timertid').css("color","black");
			var idd = $(this).attr('id');
			$('#'+idd).css("background-color","black");
			$('#'+idd).css("color","white");
		})	;
	});
	
	function btnClick() {
		$('.timertid').each(function(i, obj) {
			var color = $(obj).css("background-color");
			if(color == 'rgb(0, 0, 0)' || color == 'black') {
				var time = $(obj).attr('id');
				location.href="seatSelect.do?rtid="+time;
			} else {
				alert("시간을 선택하세요");
				return false;
			}
		});
	}	

</script>
</head>
<body>
<table class="table table-hover">
		<c:forEach var="time" items="${timeList}">
		<!-- items의 locationList는 컨트롤의 리퀘스트 맵핑의 locationList와 연결 -->
			<tr>
				<td id="${time.rtid}" class="timertid" onclick="timeSelect(${time.mid},${time.lid},${time.rtdate },${time.rtid} )" style="cursor: pointer;">${time.rttime }</td>
			</tr>
		</c:forEach>
		<tr>
				<th id="seat" colspan="4" align="right">
				<button onclick='btnClick()' class="btn btn-info btn-sm" style="float: right; border-color:
					#cd1726; background-color: #cd1726;">확인</button>
				</th>
			</tr>
	</table>
</body>
</html>