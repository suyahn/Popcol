<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ include file="../../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><tiles:insertAttribute name="title" /></title>
</head>
<body>
		<table>
			<tr>
				<td><tiles:insertAttribute name="header" /></td>
			</tr>

			<tr>
				<td>
					<tiles:insertAttribute name="menu" /> 
					<tiles:insertAttribute name="body" />
				</td>
			</tr>

			<tr>
				<td><tiles:insertAttribute name="footer" /></td>
			</tr>
		</table>
</body>
</html>