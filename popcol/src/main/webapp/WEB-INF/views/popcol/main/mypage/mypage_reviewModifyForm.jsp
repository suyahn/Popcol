<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp" %>
<%@ include file="counter.jsp" %>
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
		
		$('#rcontent').keyup(function() {
			var content = $(this).val();
			
			$(this).height(((content.split('\n').length + 1) * 1.5) + 'em');
			$('#counter').html(content.length + '/120');
		});
		
		$('#rcontent').keyup();
	});
	
	function closeWindow2() {
		window.close();
	}
</script>
</head>
<body>
	<div class="container" align="center">
		<!-- <h2 class="text-primary" style="color: #cd1726;">리뷰수정</h2>
		
		<br><br> -->
		
		<form action="mypage_reviewMoify.do" name="frm">
			<input type="hidden" name="rid" value="${review.rid }">
			<table>
				<tr>
					<td>
						<div align="center">
							<c:if test="${review.rvaluation == 'g' }">
								<img alt="good" src="${path }/images/good.png" width="150px"  id="goodimg">
								&nbsp;&nbsp;&nbsp;&nbsp;
								<img alt="bad" src="${path }/images/bad.png" width="100px" id="badimg">
							</c:if>
							<c:if test="${review.rvaluation == 'b' }">
								<img alt="good" src="${path }/images/good.png" width="100px"  id="goodimg">
								&nbsp;&nbsp;&nbsp;&nbsp;
								<img alt="bad" src="${path }/images/bad.png" width="150px" id="badimg">
							</c:if>
						</div>
						<input type="hidden" name="rvaluation" id="rvaluation" value="${review.rvaluation }">
					</td>
				</tr>
				
				<tr>
					<td>
						<div id="wrap">
						<br><br>
						<pre><textarea rows="5" cols="50" name="rcontent" id="rcontent" required="required" autofocus="autofocus" maxlength="120" style="resize:none;">${review.rcontent }</textarea></pre>
						<span id="counter"></span>
						<br><br>
						</div>
					</td>
				</tr>
				
				<tr>
					<td>
						<div align="center">
						<input type="submit" value="리뷰수정" class="btn btn-info btn-sm" style="border-color: #cd1726; background-color: #cd1726;">
						<input type="button" value="취소" id="cancel"  class="btn btn-default btn-sm" onclick="closeWindow2()">
						</div>
					</td>
				</tr>
			</table> 
		</form>
	</div>
</body>
</html>