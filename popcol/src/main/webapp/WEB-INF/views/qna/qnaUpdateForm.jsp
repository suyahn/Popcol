<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../popcol/header.jsp" %>
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
			  confirmButtonText: "네!",
			  cancelButtonText: "아니요.",
			  closeOnConfirm: true,
			  closeOnCancel: true
		}).then(function() {
			$('#qnaUpdateForm').submit();
		});
	}
</script>
</head>
<body>
	<div class="container" align="center">
		<h1>1:1 문의 수정</h1>
		
		<form action="qnaUpdate.do" method="post" id="qnaUpdateForm">
			<input type="hidden" name="pageNum" value="${ pageNum }">
			<input type="hidden" name="qid" value="${ qna.qid }">
			
			<table class="table"  style="width: 60%">
				<tr>
					<th>제목</th>
					<td>
						<input type="text" name="qsubject" required="required" maxlength="30" size="65%" value="${qna.qsubject }">
					</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>
						<input type="hidden" name="cid" value="${ qna.cid }">
						${ qna.cname }
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
						<textarea rows="10" cols="70" name="qcontent" required="required" maxlength="165" style="resize:none;">${ qna.qcontent }</textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="button" onclick="updateChk()" class="btn btn-primary" value="완료" style="border-color: #CD1726; background-color: #CD1726;">
						<button type="button" class="btn btn-default" onclick="location.href='qnaView.do?qid=${ qna.qid }&pageNum=${ pageNum }'">이전</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>