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
			if(!replyForm.qreplycontent.value) {
				swal({
					title: "답변을 입력하세요.", 
					type: "error"
				});
				replyForm.qreplycontent.focus();
				return false;
			}
			
			swal({
				  title: "답변을 등록하시겠습니까?",
				  type: "question",
				  showCancelButton: true,
				  confirmButtonColor: "#CD1726",
				  confirmButtonText: "네!",
				  cancelButtonText: "아니요.",
				  closeOnConfirm: true,
				  closeOnCancel: true
			}).then(function() {
				var FormData = $('#replyForm').serialize();
				$.post('adminQnaReplyInsert.do', FormData, function(data) {
					$('#replyDiv').html(data);
					replyForm.qreplycontent.value = "";
				});
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
		$('#replyDiv').load('adminQnaReply.do?qid=${qnaReply.qid}');
	}
	
	function up(id) {
		swal({
			title: "답변을 수정하시겠습니까?",
			type: "question",
			showCancelButton: true,
			confirmButtonColor: "#CD1726",
			confirmButtonText: "네!",
			cancelButtonText: "아니요.",
			closeOnConfirm: true,
			closeOnCancel: true
		}).then(function() {
			var qreplycontent = $('#updateText_' + id).val();
			var FormData = "qid=" + id + "&qreplycontent=" + qreplycontent;
			
			$.post("adminQnaReplyInsert.do", FormData, function(data) {
				$('#replyDiv').html(data);
			});
		});
	}
	
	function del(qid) {
		swal({
			title: " 답변을 삭제하시겠습니까?",
			type: "question",
			showCancelButton: true,
			confirmButtonColor: "#CD1726",
			confirmButtonText: "네!",
			cancelButtonText: "아니요.",
			closeOnConfirm: true,
			closeOnCancel: true
		}).then(function() {
			var FormData = "qid=" + qid;
			$.post("adminQnaReplyDelete.do", FormData, function(data) {
				$('#replyDiv').html(data);
			});
		});
	}
</script>
</head>
<body>
	<c:if test="${ empty qnaReply.qreplycontent }">
		<hr>
		<div align="center" style="width: 70%;">
			<h4 style="font-weight: bold;" align="left">답변</h4>
			<form name="replyForm" id="replyForm">
				<input type="hidden" name="qid" value="${qnaReply.qid}">
				<table style="border-spacing: 5px; border-collapse: separate;">
					<tr>
						<td>
							<textarea rows="10" cols="70" name="qreplycontent" required="required" style="resize:none;" maxlength="165"></textarea>
						</td>
						<td>
							<input type="button" value="확인" id="replyInsert" class="btn btn-primary" style="border-color: #CD1726; background-color: #CD1726;">
						</td>
					</tr>
				</table> 
			</form>
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
						<input type="button" value="수정" class="btn btn-link edit1 red-active" id="${ qnaReply.qid }">
						<input type="button" value="삭제" onclick="del(${ qnaReply.qid })" class="btn btn-link red-active">
					</td>
				</tr>
			</table>
		</div>
	</c:if>
</body>
</html>