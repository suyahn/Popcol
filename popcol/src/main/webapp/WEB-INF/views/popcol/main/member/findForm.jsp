<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container" align="center">
     <ul id="myTab" class="nav nav-tabs" role="tablist">
       <li role="presentation" class="active"><a href="#id" id="id-tab" role="tab" data-toggle="tab" aria-controls="id" aria-expanded="true">아아디 찾기</a></li>
       <li role="presentation"><a href="#password" id="password-tab" role="tab" data-toggle="tab" aria-controls="password" aria-expanded="false">비밀번호 찾기</a></li>
     </ul>
     <div id="myTabContent" class="tab-content">
       <div role="tabpanel" class="tab-pane fade active in" id="id" aria-labelledby="id-tab">
       	<br><br>
        <form action="${ path }/member/findId.do" method="post">
			<table>
				<tr>
					<td>
						<input type="email" name="email" required="required" placeholder="Email" autofocus="autofocus" class="form-control">
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<br>
						<button type="submit" class="btn btn-info">Confirm</button>
						<button type="button" class="btn btn-default" onclick="location.href='loginForm.jsp'">Login</button>
					</td>
				</tr>
			</table>
		</form>
       </div>
       <div role="tabpanel" class="tab-pane fade" id="password" aria-labelledby="password-tab">
      	<br><br>
         <form action="${ path }/member/findPassword.do" method="post">
			<table>
				<tr>
					<td>
						<input type="text" name="id" required="required" placeholder="ID" class="form-control">
					</td>
				</tr>
				<tr>
					<td>
						<br>
						<input type="email" name="email" required="required" placeholder="Email" class="form-control">
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<br>
						<button type="submit" class="btn btn-info">Send</button>
						<button type="button" class="btn btn-default" onclick="location.href='loginForm.jsp'">Login</button>
					</td>
				</tr>
			</table>
		</form>
       </div>
     </div>
   </div>
</body>
</html>