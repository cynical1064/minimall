<%@ page language="java" contentType="text/html; charset=EUC-KR"%>

<html>
<head>
	<title>�����ϱ�</title>
	<script language="javascript">
	function addboard(){
		boardform.submit();
	}
	</script>
</head>
<body>
<!-- �Խ��� ��� -->
<form action="${pageContext.request.contextPath}/Qna/QnaAddAction.qn" method="post" name="boardform">

<table cellpadding="0" cellspacing="0">
	<tr align="center" valign="middle">
		<td colspan="5">�����ϱ�</td>
	</tr>
	<tr>
		<td style="font-family:����; font-size:12" height="16">
			<div align="center">��������</div>
		</td>
		<td>
			<select name="qna_category" style="font-family:����; font-size:12; width:97px;">
				<option value="��ǰ����">��ǰ����</option>
				<option value="��������">��������</option>
				<option value="��۹���">��۹���</option>
				<option value="�Ա�Ȯ��">�Ա�Ȯ��</option>
				<option value="�ֹ�����">�ֹ�����</option>
				<option value="��Ÿ����">��Ÿ����</option>
				<option value="��ȯ����">��ȯ����</option>
				<option value="�ؿܹ��">�ؿܹ��</option>
			</select>
		</td>
		
		<td align="right" style="font-family:����; font-size:12" height="16">
			<input name="qna_secret" type="checkbox" value="y">
			��б�
		</td>
	</tr>
	<tr>
		<td style="font-family:����; font-size:12" height="16">
			<div align="center">�� ��</div>
		</td>
		<td colspan="2">
			<input name="qna_subject" type="text" size="50" maxlength="100" value="" />
		</td>
	</tr>
	<tr>
		<td style="font-family:����; font-size:12">
			<div align="center">�� ��</div>
		</td>
		<td colspan="2">
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
			<a href="javascript:addboard()">[���]</a>&nbsp;&nbsp;
			<a href="javascript:history.go(-1)">[�ڷ�]</a>
		</td>
	</tr>
</table>
</form>
<!-- �Խ��� ��� -->
</body>
</html>