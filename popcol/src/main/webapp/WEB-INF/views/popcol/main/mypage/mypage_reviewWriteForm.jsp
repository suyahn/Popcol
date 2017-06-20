<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function() {
		$('#goodimg').click(function() {
			$('#rvaluation').val('g');
			
			$(this).css('width', '150px');
			
			$('#badimg').css('width', '100px');
		});
		
		$('#badimg').click(function() {
			$('#rvaluation').val('b');
			
			$(this).css('width', '150px');
			
			$('#goodimg').css('width', '100px');
		});
	});
	
	function closeWindow2() {
		window.close();
	}
</script>
</head>
<body>
	<div class="container" align="center">
		<!-- <h2 class="text-primary" style="color: #cd1726;">리뷰작성</h2>
		
		<br><br> -->
		
		<form action="mypage_writeReview.do" name="frm">
			<input type="hidden" name="mid" value="${mid }">
			<table>
				<tr>
					<td>
						<div align="center">
							<img alt="good" src="${path }/images/good.png" width="150px"  id="goodimg">
							&nbsp;&nbsp;&nbsp;&nbsp;
							<img alt="bad" src="${path }/images/bad.png" width="100px" id="badimg">
						</div>
						<input type="hidden" name="rvaluation" id="rvaluation" value="g">
					</td>
				</tr>
				
				<tr>
					<td>
						<br><br>
						<pre><textarea rows="5" cols="50" name="rcontent" required="required" autofocus="autofocus" maxlength="33" style="resize:none;"></textarea></pre>
						<br><br>
					</td>
				</tr>
				
				<tr>
					<td>
						<div align="center">
						<input type="submit" value="리뷰작성" class="btn btn-info btn-sm" style="border-color: #cd1726; background-color: #cd1726;">
						<input type="button" value="취소" id="cancel"  class="btn btn-default btn-sm" onclick="closeWindow2()">
						</div>
					</td>
				</tr>
			</table> 
		</form>
	</div>
</body>
</html>