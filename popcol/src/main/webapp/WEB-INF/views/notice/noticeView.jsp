<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../popcol/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<script type="text/javascript">
	function deleteChk(nid, pageNum) {
		if(confirm("정말로 삭제하시겠습니까?") == false) {
			return false;
		}
		location.href='noticeDelete.do?nid=' + nid + '&pageNum=' + pageNum;
	}
</script>
</head>
<body>
	<div class="container" align="center" style="width: 70%">
		<h1 align="left" style="font-weight: bold;">공지사항</h1>
		<hr>
		<table class="table table-bordered">
			<tr style="background-color: #F0F0F0; font-weight: bold;">
				<td>${ notice.nsubject }</td>
				<td width="30%"><fmt:formatDate value="${ notice.ndate }" pattern="yyyy.MM.dd"/></td>
			</tr>
			<tr>
				<td colspan="2"><pre style="white-space: pre-wrap; height: 300px;">${ notice.ncontent }</pre></td>
			</tr>
		</table>
		<!-- 마스터면! 수정 삭제 버튼 보이게 -->
		<button type="button" onclick="location.href='noticeUpdateForm.do?nid=${ notice.nid }&pageNum=${ pageNum }'" 
			class="btn btn-default">수정</button>
		<button type="button" onclick="deleteChk(${ notice.nid }, ${ pageNum })" 
			class="btn btn-default">삭제</button>
		<button type="button" onclick="location.href='noticeList.do?pageNum=${ pageNum }'" class="btn btn-primary"
			style="border-color: #CD1726; background-color: #CD1726;">목록</button>
	</div>
</body>
</html>