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
		
	});
	
	function deleteReview(rid) {
		
		$.post('mypage_deleteReview.do', 'rid=' + rid, function(result) {
			if(result > 0) {
				alert("리뷰를 삭제하였습니다.");
			} else(result <= 0) {
				alert("다시 시도해주세요.");
			}
		});
	}
</script>
</head>
<body>
	<c:if test="${not empty myReview }">
		<c:if test="${myReview.rvaluation == 'g' }">
			<img alt="good" src="${path }/images/good.png" width="25px"> 좋아요~
		</c:if>
		<c:if test="${myReview.rvaluation == 'b' }">
			<img alt="bad" src="${path }/images/bad.png" width="25px"> 별로에요~
		</c:if>
	<button onclick="deleteReivew(${myReview.rid})" class="btn btn-default btn-sm" style="margin-left: 10px; float: right;">리뷰삭제하기</button>
	<button id="${myReview.rid }" class="btn btn-info btn-sm mr" style="border-color: #cd1726; background-color: #cd1726; float: right;">리뷰수정하기</button>
	</c:if>
	
	<c:if test="${empty myReview}">
		<button onclick="writeReivew()"  class="btn btn-info btn-sm" style="border-color: #cd1726; background-color: #cd1726; float: right;">리뷰작성하기</button>
	</c:if>
	
	<div class="movieReview"></div>

</body>
</html>