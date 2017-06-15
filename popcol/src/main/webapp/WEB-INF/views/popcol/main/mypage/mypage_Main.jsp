<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ include file="../../header.jsp" %>
<%@ include file="verticaltab.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
/* 	.nav>li.active>a,
	.nav>li.active:hover>a,
.nav>li:hover>a,
.nav>li:focus>a {
   background-color: navy;
} */
.nav>li.active>a {
background-color: navy;}
</style>
<script type="text/javascript">
	$(function() {
		$('#dd').click(function() {
			$('.chi').load('loginForm.do');
			var cname = $('.active').attr('id');
			$('.active').attr('class', cname);
			
			var cname2 = $(this).attr('class');
			$('.' + cname2).attr('class', 'active ' + cname2 );
			$('.nav>li.active>a').css('background-color', 'navy');
			/* $('.nav>li.active:hover>a').css('background-color', 'navy');
			$('.nav>li:hover>a').css('background-color', 'navy');
			$('.nav>li:focus>a').css('background-color', 'navy'); */
		});
	});
</script>
</head>
<body>
	<div style="float: center; width: 85%; margin-right: 50px; margin-left: 50px; margin-bottom: 30px !important; margin: auto;background-image: URL(http://2.bp.blogspot.com/--5yqttOEAsw/Urr9mw2ptsI/AAAAAAAADME/uR7L1d-5y50/s1600/howways-logo2-94x94.png); ">
		<div style="width: 100%; height: 150px; border: 1px solid;">
			<h2 class="text-primary" style="margin: 10px;">${customer.cname }님<font size="2px">(${customer.cid })</font></h2>
			<hr>
			<h4 class="text-primary" style="margin: 10px;">고객님께서 현재 보유하신 포인트는 ${customer.cpoint }점입니다.</h4>
		</div>
	</div>

	 <div class="container-fluid " align="center" >
			
			<div class="col-sm-9 col-sm-push-3 contentAreaStyle chi">
				CONTENT AREA
			</div>
			
			<!-- sidebar area start -->
			<div class="col-sm-3 col-sm-pull-9 sidebarStyle">
				<div class="text-xs-center text-sm-left ">			
					<ul class="nav nav-stacked">
						<li class="active one" id="one"><a href="#"><span class="glyphicon glyphicon-off"></span>  Overview</a></li>
						<li class="two"><a href="#" id="dd" class="two"><span class="glyphicon glyphicon-user"></span>  Profile</a></li>
						<li><a href="#"><span class="glyphicon glyphicon-lock"></span>  Access</a></li>
						<li><a href="#"><span class="glyphicon glyphicon-envelope"></span>  Message</a>
						<ul class="nav nav-pills nav-stacked dropdown" style="margin-left: 15px;">
						<li class="active one" id="one"><a href="#"><span class="glyphicon glyphicon-off"></span>  1</a></li>
						<li class="two"><a href="#" id="dd" class="two"><span class="glyphicon glyphicon-user"></span>  2</a></li>
						</ul>
						</li>
					</ul>
				</div>
			</div>
			<!-- sidebar area end -->
    </div>
</body>
</html>