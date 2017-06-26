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
		if(confirm("글을 등록하시겠습니까?") == false) {
			return false;
		}
	}
</script>
</head>
<body>
	<div class="container" align="center">
		<h1>1:1 문의 작성</h1>
		
		<form action="adminQnaInsert.do" method="post" onsubmit="return insertChk()">
			<input type="hidden" name="pageNum" value="${ pageNum }">
			
			<table class="table"  style="width: 60%">
				<tr>
					<th>작성자</th>
					<td>
						<input type="hidden" name="cid" value="${ cid }">
						${ cname }
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
						<textarea rows="10" cols="70" name="qcontent" required="required" maxlength="165" style="resize:none;"></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" class="btn btn-primary" value="완료" style="border-color: #CD1726; background-color: #CD1726;">
						<button type="button" class="btn btn-default" onclick="location.href='adminQnaList.do?pageNum=${ pageNum }'">이전</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>