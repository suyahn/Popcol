<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../popcol/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<script type="text/javascript">
    function deleteChk(fid, pageNum) {
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
			location.href='adminFaqDelete.do?fid=' + fid + '&pageNum=' + pageNum;
		});
    }
</script>
</head>
<body>
    <div class="container" align="center" style="width: 70%">
        <h1 align="left" style="font-weight: bold;">자주하는 질문</h1>
        <hr>
        <table class="table table-bordered">
            <tr style="background-color: #F0F0F0; font-weight: bold;">
                <td>${ faq.fquestion }</td>
            </tr>
            <tr>
                <td colspan="2"><pre style="white-space: pre-wrap; height: 300px;">${ faq.fanswer }</pre></td>
            </tr>
        </table>
        <!-- 마스터면! 수정 삭제 버튼 보이게 -->
        <button type="button" onclick="location.href='adminFaqUpdateForm.do?fid=${ faq.fid }&pageNum=${ pageNum }'" 
            class="btn btn-default">수정</button>
        <button type="button" onclick="deleteChk(${ faq.fid }, ${ pageNum })"
            class="btn btn-default">삭제</button>
        <button type="button" onclick="location.href='adminFaqList.do?pageNum=${ pageNum }'" class="btn btn-primary"
        	style="border-color: #CD1726; background-color: #CD1726;">목록</button>
        <hr>
    </div>
</body>
</html>