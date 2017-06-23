<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="../header.jsp"%>
<html><head>
</head>
<div class="container" style="width: 800px; margin-bottom: 30px;">
	<div align="center">
	<img alt="" src="${path }/images/popcol logo.png" width="600px">
	</div>
	
	<pre width="700px"><font size="5px" style="text-align: center; font-weight: bold;">현재 상영중인 영화 : ${movie.mtitle }</font></pre>
	
		<div align="center">
		<table>
			<tr>
				<td>
					<img alt="" src="${path }/poster/${movie.murlPoster }.jpg" width="180px">
				</td>
				<td>
					<div class="container" style="width: 600px;">
					<div class="row">
						<div class="col-md-10 col-md-offset-1">
							<div class="embed-responsive embed-responsive-16by9">
								<iframe class="embed-responsive-item" src="${ movie.murlPreview }" allowfullscreen></iframe>
							</div>
						</div>
					</div>
					</div>
				</td>
			</tr>
		</table>
		</div>
	</div>
</body>
</html>
