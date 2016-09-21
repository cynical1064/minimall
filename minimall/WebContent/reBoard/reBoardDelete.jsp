<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	int num=Integer.parseInt(request.getParameter("num"));
%>
<html>
<head>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>리뷰 게시판</title>

<link href="${pageContext.request.contextPath}/css/reset.css"  rel="stylesheet" >
	<link href="${pageContext.request.contextPath}/css/style.css"  rel="stylesheet" >
</head>
<body>

<%@ include file = "/module/headerSub.jsp" %>
<div id="container">
	<div class="content">
	<form name="deleteForm" action="${pageContext.request.contextPath}/board/BoardDeleteAction.reb?num=<%=num %>" 
	method="post">
<table border=1>
<tr>
	<td>
		<font size=2>글 비밀번호 : </font>
	</td>
	<td>
		<input name="BOARD_PASS" type="password">
	</td>
</tr>
<tr>
	<td colspan=2 align=center>
		<a href="javascript:deleteForm.submit()">삭제</a>
		&nbsp;&nbsp;
		<a href="javascript:history.go(-1)">돌아가기</a>
	</td>
</tr>
</table>
</form>

	</div>
</div>
<%@ include file = "/module/footer.jsp" %>

</body>
</html>