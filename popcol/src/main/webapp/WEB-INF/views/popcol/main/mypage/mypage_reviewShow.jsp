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
		$('#out').click(function() {
			window.close();
		});
	});
</script>
</head>
<body>
	<div class="container">
		<table>
			<tr>
				<td colspan="2" style="text-align: right;"><font size="5px" id="out">X</font></td>
			</tr>
			
			<tr>
				<td width="25%"><img alt="${movie.mtitle }" src="${path }/poster/${url }.jpg" width="150px"></td>
				
				<td>
					<div style="margin-left: 30px;">
					<font size="5px" style="font-weight: bold;">${movie.mtitle }</font><br>
					<font size="2px">
						${movie.moriginaltitle }<br><br><br><br>
						<c:if test="${review.rvaluation == 'g' }">
							<img alt="good" src="${path }/images/good.png" width="100px" class="img"><br><br>
						</c:if>
						<c:if test="${review.rvaluation == 'b' }">
							<img alt="bad" src="${path }/images/bad.png" width="100px" class="img"><br><br>
						</c:if>
						${review.rcontent }
					</font>
					</div>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>