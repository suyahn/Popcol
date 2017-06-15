<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../popcol/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<script type="text/javascript">
	function insertChk() {
		if(confirm("글을 등록하시겠습니까?") == false) {
			return false;
		}
	}
</script>
</head>
<body>
	<div class="container" align="center">
		<h1>자주하는 질문 작성</h1>
		
		<form action="faqInsert.do" method="post" onsubmit="return insertChk()">
			<input type="hidden" name="pageNum" value="${ pageNum }">
			
			<table class="table"  style="width: 60%">
				<tr>
					<th>질문</th>
					<td>
						<textarea rows="3" cols="70" name="fquestion" required="required" autofocus="autofocus" maxlength="33" style="resize:none;"></textarea>
					</td>
				</tr>
				<tr>
					<th>답변</th>
					<td>
						<textarea rows="10" cols="70" name="fanswer" required="required" maxlength="165" style="resize:none;"></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" class="btn btn-primary" value="완료">
						<button type="button" class="btn btn-default" onclick="location.href='faqList.do?pageNum=${ pageNum }'">이전</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>