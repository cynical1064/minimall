<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%
	int num=Integer.parseInt(request.getParameter("num"));
%>
<html>
<head>

	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

<title>���� �Խ���</title>

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
		<font size=2>�� ��й�ȣ : </font>
	</td>
	<td>
		<input name="BOARD_PASS" type="password">
	</td>
</tr>
<tr>
	<td colspan=2 align=center>
		<a href="javascript:deleteForm.submit()">����</a>
		&nbsp;&nbsp;
		<a href="javascript:history.go(-1)">���ư���</a>
	</td>
</tr>
</table>
</form>

	</div>
</div>
<%@ include file = "/module/footer.jsp" %>

</body>
</html>