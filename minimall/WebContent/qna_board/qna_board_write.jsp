<%@ page language="java" contentType="text/html; charset=EUC-KR"%>

<html>
<head>
	<title>문의하기</title>
	<script language="javascript">
	function addboard(){
		boardform.submit();
	}
	</script>
</head>
<body>
<!-- 게시판 등록 -->
<form action="${pageContext.request.contextPath}/Qna/QnaAddAction.qn" method="post" name="boardform">

<table cellpadding="0" cellspacing="0">
	<tr align="center" valign="middle">
		<td colspan="5">문의하기</td>
	</tr>
	<tr>
		<td style="font-family:돋음; font-size:12" height="16">
			<div align="center">질문유형</div>
		</td>
		<td>
			<select name="QNA_CATEGORY" style="font-family:돋음; font-size:12; width:97px;">
				<option>상품문의</option>
				<option>결제문의</option>
				<option>배송문의</option>
				<option>입금확인</option>
				<option>주문문의</option>
				<option>기타문의</option>
				<option>교환문의</option>
				<option>해외배송</option>
			</select>
		</td>
		
		<td align="right" style="font-family:돋음; font-size:12" height="16">
			<input name="QNA_SECRET" type="checkbox">
			비밀글
		</td>
	</tr>
	<tr>
		<td style="font-family:돋음; font-size:12" height="16">
			<div align="center">제 목</div>
		</td>
		<td colspan="2">
			<input name="QNA_SUBJECT" type="text" size="50" maxlength="100" value="" />
		</td>
	</tr>
	<tr>
		<td style="font-family:돋음; font-size:12">
			<div align="center">내 용</div>
		</td>
		<td colspan="2">
			<textarea name="QNA_CONTENT" cols="67" rows="15"></textarea>
		</td>
	</tr>
	<tr bgcolor="cccccc">
		<td colspan="2" style="height:1px;">
		</td>
	</tr>
	<tr><td colspan="2">&nbsp;</td></tr>
	<tr align="center" valign="middle">
		<td colspan="5">
			<a href="javascript:addboard()">[등록]</a>&nbsp;&nbsp;
			<a href="javascript:history.go(-1)">[뒤로]</a>
		</td>
	</tr>
</table>
</form>
<!-- 게시판 등록 -->
</body>
</html>