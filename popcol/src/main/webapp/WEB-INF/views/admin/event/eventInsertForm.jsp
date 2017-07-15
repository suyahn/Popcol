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
			  title: "이벤트를 등록하시겠습니까?",
			  type: "question",
			  showCancelButton: true,
			  confirmButtonColor: "#CD1726",
			  confirmButtonText: "네!",
			  cancelButtonText: "아니요.",
			  closeOnConfirm: true,
			  closeOnCancel: true
		}).then(function() {
			$('#eventInsertForm').submit();
		});
	}
</script>
</head>
<body>
	<div class="container" align="center">
		<h1>이벤트 작성</h1>
		
		<form action="adminEventInsert.do" method="post" enctype="multipart/form-data" id="eventInsertForm">
			<input type="hidden" name="pageNum" value="${ pageNum }">
			
			<table class="table"  style="width: 60%">
				<tr>
					<th>제목</th>
					<td>
						<textarea rows="3" cols="70" name="esubject" required="required" autofocus="autofocus" maxlength="66" style="resize:none;"></textarea>
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
						<textarea rows="10" cols="70" name="econtent" required="required" maxlength="165" style="resize:none;"></textarea>
					</td>
				</tr>
				<tr>
					<th>사진</th>
					<td>
						<input type="file" name="newEpicture">
					</td>
				</tr>
				<tr>
					<th>시작</th>
					<td>
						<input type="date" name="estartingdateString" required="required">
					</td>
				</tr>
				<tr>
					<th>~ 끝</th>
					<td>
						<input type="date"  name="eclosingdateString" required="required">
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="button" onclick="insertChk()" class="btn btn-primary" value="완료" style="border-color: #CD1726; background-color: #CD1726;" onclick="insertChk()">
						<button type="button" class="btn btn-default" onclick="location.href='adminEventList.do?pageNum=${ pageNum }'">이전</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>