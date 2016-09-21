<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="com.minimall.dao.QnaDao" %>
<%@ page import="com.minimall.dto.QnaDto" %>
<%
	QnaDto qnadto = (QnaDto)request.getAttribute("qnadto");
%>

<html>
<head>
	<title>문의하기</title>
	<script type="text/javascript">
	function modifyboard(){
		modifyform.submit();
	}
	</script>
</head>

<body>
qna_board_modify.jsp
<!-- 게시판 수정 -->
<form action="${pageContext.request.contextPath}/Qna/QnaModifyAction.qn" method="post" name="modifyform">
<input type="hidden" name="qna_no" value=<%=qnadto.getQna_no() %>>
<table cellpadding="0" cellspacing="0">
	<tr align="center" valign="middle">
		<td colspan="5">문의하기</td>
	</tr>
	<tr>
		<td height="16" style="font-family:돋음; font-size:12">
			<div align="center">제 목</div>
		</td>
		<td>
			<input name="qna_subject" size="50" maxlength="100" 
				value="<%=qnadto.getQna_subject()%>">
		</td>
	</tr>
	<tr>
		<td style="font-family:돋음; font-size:12">
			<div align="center">내 용</div>
		</td>
		<td>
			<textarea name="qna_content" cols="67" rows="15"><%=qnadto.getQna_content() %></textarea>
		</td>
	</tr>
	<tr>
		<td height="16" style="font-family:돋음; font-size:12">
			<div align="center">비밀번호</div>
		</td>
		<td>
			<input name="qna_pass" type="password">
		</td>
	</tr>
	
	<tr bgcolor="cccccc">
		<td colspan="2" style="height:1px;">
		</td>
	</tr>
	<tr><td colspan="2">&nbsp;</td></tr>
	
	<tr align="center" valign="middle">
		<td colspan="5">
			<font size=2>
			<a href="javascript:modifyboard()">[수정]</a>&nbsp;&nbsp;
			<a href="javascript:history.go(-1)">[뒤로]</a>&nbsp;&nbsp;
			</font>
		</td>
	</tr>
</table>
</form>
<!-- 게시판 수정 -->
</body>
</html>