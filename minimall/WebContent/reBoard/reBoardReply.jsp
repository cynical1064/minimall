<%@page import="com.minimall.dto.REBoardDto"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%
	REBoardDto board=(REBoardDto)request.getAttribute("boarddata");
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

	<title>MVC �Խ���</title>
	
<link href="${pageContext.request.contextPath}/css/reset.css"  rel="stylesheet" >
	<link href="${pageContext.request.contextPath}/css/style.css"  rel="stylesheet" >
	
	<script language="javascript">
	function replyboard(){
		boardform.submit();
	}
	</script>
</head>
<body>


<%@ include file = "/module/headerSub.jsp" %>
<div id="container">
	<div class="content">
	<!-- �Խ��� �亯 -->
<form action="${pageContext.request.contextPath}/board/BoardReplyAction.reb" method="post" name="boardform">
<input type="hidden" name="BOARD_NUM" value="<%=board.getBOARD_NUM() %>">
<input type="hidden" name="BOARD_RE_REF" value="<%=board.getBOARD_RE_REF() %>">
<input type="hidden" name="BOARD_RE_LEV" value="<%=board.getBOARD_RE_LEV() %>">
<input type="hidden" name="BOARD_RE_SEQ" value="<%=board.getBOARD_RE_SEQ() %>">

<table cellpadding="0" cellspacing="0">
	<tr align="center" valign="middle">
		<td colspan="5">MVC �Խ���</td>
	</tr>
	<tr>
		<td style="font-family:����; font-size:12" height="16">
			<div align="center">�۾���</div>
		</td>
		<td>
			<input name="BOARD_NAME" type="text"/>
		</td>
	</tr>
	<tr>
		<td style="font-family:����; font-size:12" height="16">
			<div align="center">�� ��</div>
		</td>
		<td>
			<input name="BOARD_SUBJECT" type="text" size="50" 
				maxlength="100" value="Re: <%=board.getBOARD_SUBJECT() %>"/>
		</td>
	</tr>
	<tr>
		<td style="font-family:����; font-size:12">
			<div align="center">�� ��</div>
		</td>
		<td>
			<textarea name="BOARD_CONTENT" cols="67" rows="15"></textarea>
		</td>
	</tr>
	<tr>
		<td style="font-family:����; font-size:12">
			<div align="center">��й�ȣ</div>
		</td>
		<td>
			<input name="BOARD_PASS" type="password">
		</td>
	</tr>
	
	<tr bgcolor="cccccc">
		<td colspan="2" style="height:1px;">
		</td>
	</tr>
	<tr><td colspan="2">&nbsp;</td></tr>
	
	<tr align="center" valign="middle">
		<td colspan="5">
		<a href="javascript:replyboard()">[���]</a>&nbsp;&nbsp;
		<a href="javascript:history.go(-1)">[�ڷ�]</a>
		</td>
	</tr>
</table>
</form>
<!-- �Խ��� �亯 -->

	</div>
</div>
<%@ include file = "/module/footer.jsp" %>

</body>
</html>