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
		$('.datertid').click(function(){
			$('.datertid').css("background-color","white");
			$('.datertid').css("color","black");
			var idd = $(this).attr('id');
			$('#'+idd).css("background-color","black");
			$('#'+idd).css("color","white");
		})	;
		$('#okay').click(function() {
			$('.datertid').each(function(i, obj) {
				var color = $(obj).css("background-color");
				if(color == 'rgb(0, 0, 0)' || color == 'black') {
					var time = $(obj).attr('id');//td의 id date.rtid
					location.href="seatSelect.do?rtid=" + time;
				}
			});
		});
	});
</script>
</head>
<body>
<table class="table table-hover">
		<c:forEach var="date" items="${dateList}">
		<!-- items의 locationList는 컨트롤의 리퀘스트 맵핑의 locationList와 연결 -->
			<tr>
				<td id="${date.rtid}" class="datertid" style="cursor: pointer;">
					 <fmt:formatDate value="${date.rtdate}" pattern="MM월 dd일 E요일"/> ${ date.rttime } (${ date.tname })
					 <c:if test="${ date.timezone == 'weekday_morning' || date.timezone == 'weekend_morning' }">
					 	<img alt="morning" src="icon/morning.png" width="20px" height="20px" title="조조">
					 </c:if>
					 <c:if test="${ date.timezone == 'weekday_night' || date.timezone == 'weekend_night' }">
					 	<img alt="night" src="icon/night.png" width="20px" height="20px" title="심야">
					 </c:if>
				</td>
			</tr>
		</c:forEach>
		<tr>
				<th id="seat" colspan="4" align="right">
				<button  class="btn btn-info btn-sm" style="float: right; border-color:
					#cd1726; background-color: #cd1726; " id="okay">확인</button>
				</th>
			</tr>
	</table>
</body>
</html>