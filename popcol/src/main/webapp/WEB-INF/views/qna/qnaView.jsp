<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../popcol/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<script type="text/javascript">
	function deleteChk(qid, pageNum) {
		if(confirm("정말로 삭제하시겠습니까?") == false) {
			return false;
		}
		location.href='qnaDelete.do?qid=' + qid + '&pageNum=' + pageNum;
	}
</script>
</head>
<body>
	<div class="container" align="center" style="width: 70%">
		<h1 align="left" style="font-weight: bold;">1:1 문의</h1>
		<hr>
		<table class="table table-bordered">
			<tr style="background-color: #F0F0F0; font-weight: bold;">
				<td>${ qna.qsubject }</td>
				<td>${ qna.cname }</td>
				<td width="30%">
					<fmt:parseDate value="${ qna.qdate }" var="qdate" pattern="yyyy-MM-dd"/>
					<fmt:formatDate value="${ qdate }" pattern="yyyy.MM.dd"/>
				</td>
			</tr>
			<tr>
				<td colspan="3"><pre style="white-space: pre-wrap; height: 300px;">${ qna.qcontent }</pre></td>
			</tr>
		</table>
		
		<button type="button" onclick="location.href='qnaUpdateForm.do?qid=${ qna.qid }&pageNum=${ pageNum }'" 
			class="btn btn-default">수정</button>
		<button type="button" onclick="deleteChk(${ qna.qid }, ${ pageNum })" 
			class="btn btn-default">삭제</button>
		<button type="button" onclick="location.href='qnaList.do?pageNum=${ pageNum }'" class="btn btn-primary"
			style="border-color: #CD1726; background-color: #CD1726;">목록</button>
			
		<!-- 마스터면 답변쓰기! -->
		<c:if test="${ id == 'master' }">
			<div align="center" width="300px">
				<form name="frm" id="frm">
					<input type="hidden" name="qid" value="${qna.qid}">
					<table style="border-spacing: 5px; border-collapse: separate;">
						<tr>
							<th>답변</th>
							<td>
								<textarea rows="3" cols="50" name="qreplycontent" required="required" style="resize:none;" maxlength="165"></textarea>
							</td>
						</tr>
					</table>
					<input type="button" value="확인" id="repInsert" class="btn btn-default"
						style="border-color: #ffdede; background-color: #ffdede;"> 
				</form>
			</div>
		</c:if>
		
	</div>
</body>
</html>