<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../popcol/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<script type="text/javascript">
	function insertChk() {
		swal({
			  title: "글을 등록하시겠습니까?",
			  type: "question",
			  showCancelButton: true,
			  confirmButtonColor: "#CD1726",
			  confirmButtonText: "네!",
			  cancelButtonText: "아니요.",
			  closeOnConfirm: true,
			  closeOnCancel: true
		}).then(function() {
			$('#noticeInsertForm').submit();
		});
	}
</script>
</head>
<body>
	<div class="container" align="center">
		<h1>공지사항 작성</h1>
		
		<form action="adminNoticeInsert.do" method="post" id="noticeInsertForm">
			<input type="hidden" name="pageNum" value="${ pageNum }">
			
			<table class="table"  style="width: 60%">
				<tr>
					<th>제목</th>
					<td>
						<textarea rows="3" cols="70" name="nsubject" required="required" autofocus="autofocus" maxlength="33" style="resize:none;"></textarea>
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
						<textarea rows="10" cols="70" name="ncontent" required="required" maxlength="165" style="resize:none;"></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="button" onclick="insertChk()" class="btn btn-primary" value="완료" style="border-color: #CD1726; background-color: #CD1726;">
						<button type="button" class="btn btn-default" onclick="location.href='adminNoticeList.do?pageNum=${ pageNum }'">이전</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>