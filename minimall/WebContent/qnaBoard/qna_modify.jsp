<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ page import="com.minimall.dao.QnaDao" %>
<%@ page import="com.minimall.dto.QnaDto" %>
<%
	QnaDto qnadto = (QnaDto)request.getAttribute("qnadto");
%>

<html>
<head>
	<title>�����ϱ�</title>
	<script type="text/javascript">
	function modifyboard(){
		modifyform.submit();
	}
	</script>
</head>

<body>
qna_board_modify.jsp
<!-- �Խ��� ���� -->
<form action="${pageContext.request.contextPath}/Qna/QnaModifyAction.qn" method="post" name="modifyform">
<input type="hidden" name="qna_no" value=<%=qnadto.getQna_no() %>>
<table cellpadding="0" cellspacing="0">
	<tr align="center" valign="middle">
		<td colspan="5">�����ϱ�</td>
	</tr>
	<tr>
		<td height="16" style="font-family:����; font-size:12">
			<div align="center">�� ��</div>
		</td>
		<td>
			<input name="qna_subject" size="50" maxlength="100" 
				value="<%=qnadto.getQna_subject()%>">
		</td>
	</tr>
	<tr>
		<td style="font-family:����; font-size:12">
			<div align="center">�� ��</div>
		</td>
		<td>
			<textarea name="qna_content" cols="67" rows="15"><%=qnadto.getQna_content() %></textarea>
		</td>
	</tr>
	<tr>
		<td height="16" style="font-family:����; font-size:12">
			<div align="center">��й�ȣ</div>
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
			<a href="javascript:modifyboard()">[����]</a>&nbsp;&nbsp;
			<a href="javascript:history.go(-1)">[�ڷ�]</a>&nbsp;&nbsp;
			</font>
		</td>
	</tr>
</table>
</form>
<!-- �Խ��� ���� -->
</body>
</html>