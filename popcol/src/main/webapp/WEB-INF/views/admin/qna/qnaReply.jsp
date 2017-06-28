<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../popcol/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<style type="text/css">
	 .red-active { color: black; text-decoration: none;}
 	.red-active:hover { color: #CD1726; text-decoration: underline; font-weight: bold;}
</style>
<script type="text/javascript">
	$(function() {
		$('#replyInsert').click(function() {
			if(!replyFrom.qreplycontent.value) {
				alert('답변 입력을 입력하세요.');
				replyFrom.qreplycontent.focus();
				return false;
			}
			
			if(confirm("답변을 등록하시겠습니까?") == false) {
				return false;
			}
			
			var fromData = $('#replyFrom').serialize();
			$.post('qnaReplyInsert.do', fromData, function(data) {
				$('#replyDiv').html(data);
				replyFrom.qreplycontent.value = "";
			});
		});
		
		$('.edit1').click(function() {
			var id  = $(this).attr('id');
			var txt = $('#td_' + id).text();
			$('#td_' + id).html(
					"<textarea rows='10' cols='70' id='updateText_" + id + "' style='resize: none;' maxlength='165' required='required'>" + txt + "</textarea>"
			);
			$('#btn_'+id).html(
			   "<input type='button' value='확인' onclick='up("+id+")' class='btn btn-link red-active'> "
			  + "<input type='button' value='취소' onclick='cancelEdit()' class='btn btn-link red-active'>");
		});
	});
	
	function cancelEdit() {
		$('#replyDiv').load('qnaReply.do?qid=${qnaReply.qid}');
	}
	
	function up(id) {
		if(confirm("정말로 답변을 수정하시겠습니까?") == false) {
			return false;
		}
		var qreplycontent = $('#updateText_' + id).val();
		var formData = "qid=" + id + "&qreplycontent=" + qreplycontent;
		
		$.post("qnaReplyInsert.do", formData, function(data) {
			$('#replyDiv').html(data);
		});
	}
	
	function del(qid) {
		if(confirm("정말로 답변을 삭제하시겠습니까?") == false) {
			return false;
		}
		
		var formData = "qid=" + qid;
		$.post("qnaReplyDelete.do", formData, function(data) {
			$('#replyDiv').html(data);
		});
	}
</script>
</head>
<body>
	<c:if test="${ empty qnaReply.qreplycontent }">
		<hr>
		<div align="center" style="width: 70%;">
			<c:if test="${ id != 'master' }">
				<h4 style="font-weight: bold;" align="left">답변이 아직 작성되지 않았습니다.</h4>
				<br>
			</c:if>
			<c:if test="${ id == 'master' }">
				<h4 style="font-weight: bold;" align="left">답변</h4>
				<form name="replyFrom" id="replyFrom">
					<input type="hidden" name="qid" value="${qnaReply.qid}">
					<table style="border-spacing: 5px; border-collapse: separate;">
						<tr>
							<td>
								<textarea rows="10" cols="70" name="qreplycontent" required="required" style="resize:none;" maxlength="165"></textarea>
							</td>
							<td>
								<input type="button" value="확인" id="replyInsert" class="btn btn-primary"
									style="border-color: #CD1726; background-color: #CD1726;">
							</td>
						</tr>
					</table> 
				</form>
			</c:if>
		</div>
	</c:if>

	<c:if test="${ not empty qnaReply.qreplycontent }">
		<hr>
		<div align="center" style="width: 70%;">
			<h4 style="font-weight: bold;" align="left">답변</h4>
			<table class="table">
				<tr>
					<td id="td_${qnaReply.qid}"><pre style="white-space: pre-wrap; height: 100px;">${ qnaReply.qreplycontent }</pre></td>
				</tr>
				<tr>
					<td id="btn_${qnaReply.qid}" align="right">
						<c:if test="${ id == 'master' }">
							<input type="button" value="수정" class="btn btn-link edit1 red-active" id="${ qnaReply.qid }">
							<input type="button" value="삭제" onclick="del(${ qnaReply.qid })" class="btn btn-link red-active">
						</c:if>
					</td>
				</tr>
			</table>
		</div>
	</c:if>
</body>
</html>