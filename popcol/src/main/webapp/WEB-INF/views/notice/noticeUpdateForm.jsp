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
		if(confirm("글을 수정하시겠습니까?") == false) {
			return false;
		}
	}
</script>
</head>
<body>
	<div class="container" align="center">
		<h1>공지사항 수정</h1>
		
		<form action="noticeUpdate.do" method="post" onsubmit="return updateChk()">
			<input type="hidden" name="pageNum" value="${ pageNum }">
			<input type="hidden" name="nid" value="${ notice.nid }">
			
			<table class="table"  style="width: 60%">
				<tr>
					<th>제목</th>
					<td>
						<textarea rows="3" cols="70" name="nsubject" required="required" autofocus="autofocus" maxlength="33" style="resize:none;">${ notice.nsubject }</textarea>
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
						<textarea rows="10" cols="70" name="ncontent" required="required" maxlength="165" style="resize:none;">${ notice.ncontent }</textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" class="btn btn-primary" value="완료">
						<button type="button" class="btn btn-default" onclick="location.href='noticeView.do?nid=${ notice.nid }&pageNum=${ pageNum }'">이전</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>