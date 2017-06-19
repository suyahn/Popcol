<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../popcol/header.jsp"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
</style>
<script type="text/javascript">
	function movieSelect(mid) {
		var sendData = 'mid='+ mid;
		$.post("movielocation.do", sendData, function(data) {
			$('#location').html(data);
		});
	}
	function locationSelect(mid,lid){
		var sendData ='mid='+mid + '&lid='+lid;
		$.post("moviedate.do",sendData,function(data){
			$('#date').html(data);
		});
	}
	function dateSelect(mid,lid,rtid){
		var sendData ='mid='+mid + '&lid='+lid +'&rtid='+rtid;
		$.post("movietime.do",sendData,function(data){
			$('#time').html(data);
		});
	}
	$(function () {
		$('.moviemid').click(function(){
			$('.moviemid').css("background-color","white");
			$('.moviemid').css("color","black");
			var idd = $(this).attr('id');
			$('#'+idd).css("background-color","black");
			$('#'+idd).css("color","white");
		})	;
	});
</script>
</head>
<body>
	<div class="container">
		<h2 style="color: #cd1726" align="center">빠른 영화 예매</h2>
		<table class="table table-bordered" style="width: 100%;">
			<tr>
				<th>영화</th>
				<th>지역</th>
				<th>날짜</th>
				<th>시간</th>
			</tr>
			<tr>
				<td style="width: 30%;">
					<table class="table table-hover">
						<c:forEach var="movie" items="${movieList}">
							<tr>
								<td onclick="movieSelect(${movie.mid})" style="cursor: pointer;"
									id="movie_${movie.mid}" class="moviemid">${movie.mtitle}</td>
							</tr>
						</c:forEach>
					</table>
				</td>
				<td id="location" style="width: 30%;"></td>
				<td id="date" style="width: 10%;"></td>
				<td id="time" style="width: 30%;"></td>
			</tr>
			<tr>
				<th id="seat" colspan="4" align="right">
					<button onclick='location.href="seatSelect.do?rtid=${rtid}"' class="btn btn-info btn-sm" style="float: right; border-color:
					#cd1726; background-color: #cd1726;">확인</button>
				</th>
			</tr>
		</table>
	</div>

</body>
</html>