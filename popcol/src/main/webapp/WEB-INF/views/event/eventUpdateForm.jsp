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
		if(confirm("이벤트를 수정하시겠습니까?") == false) {
			return false;
		}
	}
</script>
</head>
<body>
	<div class="container" align="center">
		<h1>이벤트 수정</h1>
		
		<form action="eventUpdate.do" method="post" enctype="multipart/form-data" onsubmit="return updateChk()">
			<input type="hidden" name="pageNum" value="${ pageNum }">
			<input type="hidden" name="eid" value="${ event.eid }">
			<input type="hidden" name="epicture" value="${ event.epicture }">
			
			<table class="table"  style="width: 60%">
				<tr>
					<th>제목</th>
					<td>
						<textarea rows="3" cols="70" name="esubject" required="required" autofocus="autofocus" maxlength="66" style="resize:none;">${ event.esubject }</textarea>
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
						<textarea rows="10" cols="70" name="econtent" required="required" maxlength="165" style="resize:none;">${ event.econtent }</textarea>
					</td>
				</tr>
				<tr>
					<th>사진 <span class="glyphicon glyphicon-info-sign" aria-hidden="true" style="color: #cd1726" title="사진 변경을 원하지 않으시면 파일 업로드 하지 마세요."></span></th>
					<td>
						<input type="file" name="newEpicture">
					</td>
				</tr>
				<tr>
					<th>시작</th>
					<td>
						<input type="date" name="estartingdateString" required="required" value="${ event.estartingdate }">
					</td>
				</tr>
				<tr>
					<th>~ 끝</th>
					<td>
						<input type="date"  name="eclosingdateString" required="required" value="${ event.eclosingdate }">
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" class="btn btn-primary" value="완료" style="border-color: #CD1726; background-color: #CD1726;">
						<button type="button" class="btn btn-default" onclick="location.href='eventView.do?eid=${ event.eid }&pageNum=${ pageNum }'">이전</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>