<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function() {
		
	});

	function deleteReivew(rid) {
		
		$.post('mypage_reviewDelete.do', 'rid=' + rid, function(result) {
			if(result > 0) {
				swal({
					title: "리뷰를 삭제하였습니다.", 
					type: "success"
				}).then(function() {
					location.href="mypage_seeMovie.do";
				});
			} else if(result <= 0) {
				swal({
					title: "다시 시도해주세요.", 
					type: "error"
				});
			}
		}); 
	} 
	
	// 동적으로 form을 생성 1
	function create_form(nm,mt,ac,tg) {
	    var fm = document.createElement("form");
	    fm.name = nm;
	    fm.method = mt;
	    fm.action = ac;
	    fm.target = tg;
	      
	    return fm;
	}
	
	// 동적으로 form을 생성 2
	function add_input(fm,nm,vu){
	    var input = document.createElement("input");
	    input.type = "hidden";
	    input.name = nm;
	    input.value =  vu;
	    fm.insertBefore(input,null);
	    return fm;
	}
	
	function modifyReview(rid){
	    var frm = create_form('dummy', 'POST', 'mypage_reviewModifyForm.do', '리뷰수정하기')
	    frm = add_input(frm,'rid',rid);
	   document.body.insertBefore(frm,null);
	    
	   var option = "toolbar=no,directories=no,scrollbars=no,resizable=no,status=no,menubar=no,width=600, height=500, top=0,left=20";
	   //  post 방식으로 popup을 open하기 위하여 url을 공백으로 넘긴다.
	   window.open('','리뷰수정하기',option); 
	 
	   frm.submit();
	}
	
	function showReview(rid, mid) {
		  var frm = create_form('dummy', 'POST', 'mypage_reviewShow.do', '리뷰보기')
		   frm = add_input(frm,'rid',rid);
		  frm = add_input(frm,'mid',mid);
		   document.body.insertBefore(frm,null);
		    
		   var option = "toolbar=no,directories=no,scrollbars=no,resizable=no,status=no,menubar=no,width=600, height=500, top=0,left=20";
		   //  post 방식으로 popup을 open하기 위하여 url을 공백으로 넘긴다.
		   window.open('','리뷰보기',option); 
		 
		   frm.submit();
	}
	
	function writeReview(mid) {
		var frm = create_form('dummy', 'POST', 'mypage_reviewWriteForm.do', '리뷰작성하기')
		  frm = add_input(frm,'mid',mid);
		   document.body.insertBefore(frm,null);
		    
		   var option = "toolbar=no,directories=no,scrollbars=no,resizable=no,status=no,menubar=no,width=600, height=500, top=0,left=20";
		   //  post 방식으로 popup을 open하기 위하여 url을 공백으로 넘긴다.
		   window.open('','리뷰작성하기',option); 
		 
		   frm.submit();
	}
	
	  
</script>
</head>
<body>
	<c:if test="${not empty myReview }">
		<c:if test="${myReview.rvaluation == 'g' }">
			<img alt="good" src="${path }/images/good.png" width="100px" class="img" onclick="showReview(${myReview.rid }, ${myReview.mid })">
		</c:if>
		<c:if test="${myReview.rvaluation == 'b' }">
			<img alt="bad" src="${path }/images/bad.png" width="100px" class="img" onclick="showReview(${myReview.rid }, ${myReview.mid })">
		</c:if>
	<button onclick="deleteReivew(${myReview.rid })" class="btn btn-default btn-sm dr" style="margin-left: 10px; float: right;">리뷰삭제하기</button>
	<button onclick="modifyReview(${myReview.rid})" class="btn btn-info btn-sm" style="border-color: #cd1726; background-color: #cd1726; float: right;">리뷰수정하기</button>
	
	</c:if>
	
	<c:if test="${empty myReview}">
		<button onclick="writeReview(${mid})" class="btn btn-info btn-sm" style="border-color: #cd1726; background-color: #cd1726; float: right;">리뷰작성하기</button>
	</c:if>

</body>
</html>