<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../popcol/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<script type="text/javascript">
	function updateChk() {
		swal({
			  title: "글을 수정하시겠습니까?",
			  type: "question",
			  showCancelButton: true,
			  confirmButtonColor: "#CD1726",
			  confirmButtonText: "네, 수정합니다!",
			  cancelButtonText: "아니요.",
			  closeOnConfirm: true,
			  closeOnCancel: true
		}).then(function() {
			$('#faqUpdateForm').submit();
		});
	}
</script>
</head>
<body>
	<div class="container" align="center">
		<h1>자주하는 질문 수정</h1>
		
		<form action="adminFaqUpdate.do" method="post" id="faqUpdateForm">
			<input type="hidden" name="pageNum" value="${ pageNum }">
			<input type="hidden" name="fid" value="${ faq.fid }">
			
			<table class="table"  style="width: 60%">
				<tr>
					<th>제목</th>
					<td>
						<textarea rows="3" cols="70" name="fquestion" required="required" autofocus="autofocus" maxlength="33" style="resize:none;">${ faq.fquestion }</textarea>
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
						<textarea rows="10" cols="70" name="fanswer" required="required" maxlength="165" style="resize:none;">${ faq.fanswer }</textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="button" onclick="updateChk()" class="btn btn-primary" value="완료" style="border-color: #CD1726; background-color: #CD1726;">
						<button type="button" class="btn btn-default" onclick="location.href='adminFaqView.do?fid=${ faq.fid }&pageNum=${ pageNum }'">이전</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>