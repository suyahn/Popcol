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
td, th {
	text-align: center !important;
}

.red-active {
	color: black  !important;
	text-decoration: none;
}

.red-active:hover {
	color: #cd1726  !important;
	text-decoration: underline;
	font-weight: bold;
}

.pagination>li.active>a {
  background: #cd1726;
  border-color: #cd1726;
  color: white !important;
}

.pagination>li.active>a:hover {
  background: #fcba2e;
  border-color: #fcba2e;
  color: white !important;
}
</style>
<script type="text/javascript">
	$(function() {
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
		
		$('#pointPage').load("pointPage.do");
	});
	
	function deleteChk() {
		var chk = confirm("정말로 삭제하시겠습니까?");
		
		if (chk) {
			frm.action = "mypage_myQnaDelete.do";
			frm.submit();
		}
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
				
				<form name="frm" onsubmit=" return deleteChk()">
				<input type="submit" class="btn btn-default btn-sm" value="선택삭제" style="float: right;">
				
				<br>
				<br>
				
				<table class="table table-hover">
					<tr>
						<th><input type="checkbox" id="cb_all"></th>
						<th width="10%">번호</th>
						<th>상태</th>
						<th>제목</th>
						<th>등록일</th>
					</tr>
					
					<c:if test="${empty qnalist }">
						<tr>
							<th colspan="4" style="text-align: center;">고객님의 상담 내역이 존재하지 않습니다.</th>
						</tr>
					</c:if>
					
					<c:if test="${not empty qnalist }">
						<c:set var="no1" value="${no }" />
						
						<c:forEach var="qna" items="${qnalist }">
							<tr>
								<th><input type="checkbox" name="qid" value="${qna.qid }" class="cb"></th>
						
								<td>${no1 }</td>
								
								
								<td>
									<c:if test="${empty qna.qreplycontent }">
										<img alt="wait" src="${path }/images/waitanswer.png" width="70px">
									</c:if>
									
									<c:if test="${not empty qna.qreplycontent }">
										<img alt="complete" src="${path }/images/completeanswer.png" width="70px">
									</c:if>
								</td>
								
								<td style="text-align: left !important;">
									<a href="mypage_myQnaShow.do?qid=${qna.qid }&pageNum=${pageNum }" class="red-active">${qna.qsubject }</a>
								</td>
								
								<td width="20%">
									<fmt:parseDate value="${qna.qdate }" var="qdate" pattern="yyyy-MM-dd"/>
									<fmt:formatDate value="${qdate }" pattern="yyyy.MM.dd"/>
								</td>
							</tr>
							<c:set var="no1" value="${no1 - 1 }"></c:set>
						</c:forEach>
					</c:if>
				</table>
				</form>
				
				<div align="center">
					<nav aria-label="Page navigation">
						<ul class="pagination pagination-sm">
							<c:if test="${pp.startPage > pp.PAGE_PER_BLOCK }">
								<li>
									<a href="mypage_myQna.do?pageNum=${pp.startPage - 1 }" aria-label="Previous">
										<span aria-hidden="true">&laquo;</span>
									</a>
								</li>
							</c:if>
							
							<c:forEach var="i" begin="${pp.startPage }" end="${pp.endPage }">
								<li <c:if test="${pp.currentPage == i }">class="active"</c:if>><a href="mypage_myQna.do?pageNum=${ i }">${ i }</a>
							</c:forEach>
							
							<c:if test="${pp.endPage < pp.totPage }">
								<li>
									<a href="mypage_myQna.do?pageNum=${pp.startPage + pp.PAGE_PER_BLOCK }" aria-label="Next">
										<span aria-hidden="true">&raquo;</span>
									</a>
								</li>						
							</c:if>
						</ul>
					</nav>
				</div>
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