<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ page import="com.minimall.dao.QnaDao" %>
<%@ page import="com.minimall.dto.QnaDto" %>
<%
	QnaDto qnadto =(QnaDto)request.getAttribute("qnadto");
%>

<html>
<head>
	<title>�̴ϸ�</title>
	<script language="javascript">
	function replyboard(){
		boardform.submit();
	}
	</script>
</head>
<body>
<!-- �Խ��� �亯 -->
<form action="${pageContext.request.contextPath}/Qna/QnaReplyAction.qn" method="post" name="boardform">
<input type="hidden" name="qna_category" value="<%=qnadto.getQna_category() %>">
<input type="hidden" name="qna_secret" value="<%=qnadto.getQna_secret() %>">

<table cellpadding="0" cellspacing="0">
	<tr align="center" valign="middle">
		<td colspan="5">Q&A �亯�ϱ�</td>
	</tr>
	<tr>
		<td style="font-family:����; font-size:12" height="16">
			<div align="center">�� ��</div>
		</td>
		<td>
			<input name="qna_subject" type="text" size="50" 
				maxlength="100" value="Re: <%=qnadto.getQna_subject() %>"/>
		</td>
	</tr>
	<tr>
		<td style="font-family:����; font-size:12">
			<div align="center">�� ��</div>
		</td>
		<td>
			<textarea name="qna_content" cols="67" rows="15"></textarea>
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
</body>
</html>