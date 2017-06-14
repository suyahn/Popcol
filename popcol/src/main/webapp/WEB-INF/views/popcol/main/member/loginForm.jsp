<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp" %>
<%@ include file="memberCheck.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container" align="center">
		<form action="login.do" method="post">
			<table>
				<tr>
					<th colspan="2"><br><input type="text" name="cid" required="required" autofocus="autofocus" placeholder="ID" class="form-control"></th>
				</tr>
				
				<tr>
					<th colspan="2"><br><input type="password" name="cpassword" required="required" placeholder="Password" class="form-control"></th>
				</tr>
				
				<tr>
					<td colspan="2" align="center">
						<br><button type="submit" class="btn btn-info btn-sm" style="border-color: navy; background-color: navy;">로그인</button>
					</td>
				</tr>
				
				<tr>
					<td align="center">
						<br><button type="button" class="btn btn-link" onclick="location.href='findIdPasswordForm.do'">Forgot?</button>
					</td>
					
					<td align="center">
						<br><button type="button" class="btn btn-link" onclick="location.href='joinmain.do'">Sign up</button>
					</td>
				</tr>
				
			</table>
			
			<c:if test="${ not empty result }">
				<span class="err">
					아이디나 비밀번호를 확인해주세요.<br>
				</span>
			</c:if>
		</form>
	</div>
</body>
</html>