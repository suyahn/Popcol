<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../popcol/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
	<c:if test="${ result > 0 }">
		<script type="text/javascript">
			swal({
				title: "글을 등록했습니다.", 
				type: "success"
			}).then(function() {
				location.href = "qnaView.do?qid=${ qid }&pageNum=${ pageNum }";	
			});
		</script>
	</c:if>
	<c:if test="${ result <= 0 }">
		<script type="text/javascript">
			swal({
				title: "다시 시도해주세요.", 
				type: "error"
			}).then(function() {
				history.go(-1);
			});
		</script>
	</c:if>
</body>
</html>