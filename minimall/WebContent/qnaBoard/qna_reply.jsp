<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="com.minimall.dao.QnaDao" %>
<%@ page import="com.minimall.dto.QnaDto" %>
<%
	QnaDto qnadto =(QnaDto)request.getAttribute("qnadto");
%>

<html>
<head>
	<title>미니몰</title>
	<script language="javascript">
	function replyboard(){
		boardform.submit();
	}
	</script>
</head>
<body>
<!-- 게시판 답변 -->
<form action="${pageContext.request.contextPath}/Qna/QnaReplyAction.qn" method="post" name="boardform">
<input type="hidden" name="qna_category" value="<%=qnadto.getQna_category() %>">
<input type="hidden" name="qna_secret" value="<%=qnadto.getQna_secret() %>">

<table cellpadding="0" cellspacing="0">
	<tr align="center" valign="middle">
		<td colspan="5">Q&A 답변하기</td>
	</tr>
	<tr>
		<td style="font-family:돋음; font-size:12" height="16">
			<div align="center">제 목</div>
		</td>
		<td>
			<input name="qna_subject" type="text" size="50" 
				maxlength="100" value="Re: <%=qnadto.getQna_subject() %>"/>
		</td>
	</tr>
	<tr>
		<td style="font-family:돋음; font-size:12">
			<div align="center">내 용</div>
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
		<a href="javascript:replyboard()">[등록]</a>&nbsp;&nbsp;
		<a href="javascript:history.go(-1)">[뒤로]</a>
		</td>
	</tr>
</table>
</form>
<!-- 게시판 답변 -->
</body>
</html>