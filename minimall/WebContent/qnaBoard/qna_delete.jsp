<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	String id = request.getParameter("id");
%>
<html>
<head>
<title>문의하기</title>
</head>
<body>
<form name="deleteForm" action="${pageContext.request.contextPath}/Qna/QnaDeleteAction.qn?num=<%=num %>&id=<%=id %>" method="post">
<table border=1>
<tr>
	<td>
		<font size=2>글 비밀번호 : </font>
	</td>
	<td>
		<input name="qna_pass" type="password">
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
</body>
</html>