<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ include file="../../header.jsp" %>
<%@ include file="verticaltab.jsp" %>
<%@ include file="mypage.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
</style>
<script type="text/javascript">
	$(function() {
		$('#pointPage').load("pointPage.do");
		
		$('#cb_all').click(function() {
			if($(this).is(":checked")) {
				$("input[class=cb]:checkbox").prop("checked", "checked");
				
			} else {
				$('input:checkbox[class="cb"]').each(function() {
				     if(this.checked){ //값 비교
				            this.checked = false; //checked 처리
				      }
				 });

				// $("input[class=cb]:checkbox").removeProp("checked"); 근데 왜 얘는 안먹힐까.
			}
		});
	});
	
	function deleteChk(qid, pageNum) {
		if(confirm("정말로 삭제하시겠습니까?") == false) {
			
			return false;
		}
		
		location.href='mypage_myQnaDelete.do?qid=' + qid + '&pageNum=' + pageNum;
	}
</script>
</head>
<body>
	<div id="pointPage" style="width: 70%; margin-right: 50px; margin-left: 50px; margin-bottom: 30px !important; 
											margin: auto; background-image: URL(${path}/images/ticket.png); ">
	</div>

	 <div class="container-fluid " align="center" style="width: 80%; margin-bottom: 50px !important; margin: auto;">
			
			<div class="col-sm-9 col-sm-push-3 contentAreaStyle">
			<div class="container" style="width: 800px;">
				<h4 align="left" style="color: #cd1726;">나의 문의 내역</h4>
				<h6 align="left" style="color: #cd1726;">1:1 문의</h6>
				
				<br>
				<br>
				
				<table class="table">
					<tr>
						<td style="text-align: center;">
							<font size="5px" style="font-weight: bold;">${qna.qsubject }</font>
						</td>
					</tr>
					
					<tr>
						<td style="text-align: right;">
							<font size="2px">
								<fmt:parseDate value="${qna.qdate }" var="qdate" pattern="yyyy-MM-dd"/>
								<fmt:formatDate value="${qdate }" pattern="yyyy.MM.dd"/>
							</font>
						</td>
					</tr>
					
					<tr>
						<td>
							<pre style="white-space: pre-wrap; height: 200px;">${qna.qcontent }</pre>
						</td>
					</tr>
				</table>
				
				<h4 align="left" style="color: #cd1726; font-weight: bold;">답변</h4>
				<c:if test="${empty qna.qreplycontent }">
					<pre style="white-space: pre-wrap; height: 200px; text-align: left;">답변을 기다리고 있는 중입니다.</pre>
				</c:if>
				
				<c:if test="${not empty qna.qreplycontent }">
					<pre style="white-space: pre-wrap; height: 200px; text-align: left">${qna.qreplycontent }</pre>
				</c:if>
				
				<button type="button" onclick="deleteChk(${ qna.qid }, ${ pageNum })" class="btn btn-default btn-sm" style="float: right; margin-left: 10px;">삭제</button>
				<button type="button" onclick="location.href='mypage_myQna.do?pageNum=${ pageNum }'" class="btn btn-primary btn-sm" style="border-color: #cd1726; background-color: #cd1726; float: right;">목록</button>
			</div>
			</div>
			
			<!-- sidebar area start -->
			<div class="col-sm-3 col-sm-pull-9">
				<div class="text-xs-center text-sm-left">			
					<ul class="nav nav-stacked menu">
						<li class="" id=""><a href="mypage_Main.do" class="" id="">My PopCol Home</a></li>
						<li class="" id=""><a href="mypage_reservation.do" class="" id="">나의 예매내역</a></li>
						<li class="" id=""><a href="mypage_seeMovie.do" class="" id="">내가 본 영화</a></li>
						<li class="" id=""><a href="mypage_myPoint.do" class="" id="">나의 포인트 내역</a></li>
						<li class="" id=""><a href="mypage_myInfoModifyintro.do" class="" id="">회원 정보 수정</a></li>
						<li class="" id=""><a href="mypage_byePopcolForm.do" class="" id="">회원 탈퇴</a></li>
						<li class="active" id=""><a href="mypage_myQna.do" class="" id="">나의 문의 내역</a></li>
					</ul>
				</div>
			</div>
			<!-- sidebar area end -->
    </div>
</body>
</html>