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
		swal({
			  title: "글을 삭제하시겠습니까?",
			  type: "question",
			  showCancelButton: true,
			  confirmButtonColor: "#CD1726",
			  confirmButtonText: "네!",
			  cancelButtonText: "아니요.",
			  closeOnConfirm: true,
			  closeOnCancel: true
		}).then(function() {
			location.href='qnaDelete.do?qid=' + qid + '&pageNum=' + pageNum;
		});
	}
	
	$(function() {
		$('#replyDiv').load('qnaReply.do?qid=${qna.qid}');
	});
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
			
		<div id="replyDiv"></div>
	</div>
</body>
</html>