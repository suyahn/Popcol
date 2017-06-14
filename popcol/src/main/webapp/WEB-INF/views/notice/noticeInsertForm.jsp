<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<script type="text/javascript">
	function chk() {
		if(confirm("글을 등록하시겠습니까?") == false) {
			return false;
		}
	}
</script>
</head>
<body>
	<div class="container" align="center">
		<h2><font color="#EBCDD5">공지사항 작성</font></h2>
		
		<form action="noticeInsert.do" method="post" onsubmit="return chk()">
			<input type="hidden" name="pageNum" value="${ pageNum }">
			
			<table class="table table-bordered">
				<tr>
					<th>제목</th>
					<td>
						<input type="text" name="nsubject" required="required" autofocus="autofocus">
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
						<textarea rows="5" cols="30" name="ncontent" required="required"></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" class="btn btn-primary" value="완료"
							style="border-color: #EBCDD5; background-color: #EBCDD5;">
						<button type="button" class="btn btn-default" onclick="location.href='noticeList.do?pageNum=${ pageNum }'">이전</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>