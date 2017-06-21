<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../popcol/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<script type="text/javascript">
	function deleteChk(eid, pageNum) {
		if(confirm("정말로 삭제하시겠습니까?") == false) {
			return false;
		}
		location.href='eventDelete.do?eid=' + eid + '&pageNum=' + pageNum;
	}
</script>
</head>
<body>
	<div class="container" align="center" style="width: 70%">
		<h1 align="left" style="font-weight: bold;">이벤트</h1>
		<hr>
		<table class="table">
			<tr style="background-color: #F0F0F0;">
				<td style="font-weight: bold;">${ event.esubject }</td>
				<td width="30%" align="right">
					<font color="gray" size="2">기간 : <fmt:formatDate value="${ event.estartingdate }" pattern="yyyy.MM.dd"/> ~ <fmt:formatDate value="${ event.eclosingdate }" pattern="yyyy.MM.dd"/></font>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<img alt="${ event.epicture }" src="images/${ event.epicture }.jpg">
				</td>
			</tr>
			<tr>
				<td colspan="2"><pre style="white-space: pre-wrap; height: 300px;">${ event.econtent }</pre></td>
			</tr>
		</table>
		<!-- 마스터면! 수정 삭제 버튼 보이게 -->
		<button type="button" onclick="location.href='eventUpdateForm.do?eid=${ event.eid }&pageNum=${ pageNum }'" 
			class="btn btn-default">수정</button>
		<button type="button" onclick="deleteChk(${ event.eid }, ${ pageNum })" 
			class="btn btn-default">삭제</button>
		<button type="button" onclick="location.href='eventList.do?pageNum=${ pageNum }'" class="btn btn-primary"
			style="border-color: #CD1726; background-color: #CD1726;">목록</button>
	</div>
</body>
</html>