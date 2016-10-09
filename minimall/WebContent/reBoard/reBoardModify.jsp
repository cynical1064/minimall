<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
	<title>문의하기</title>
	<link href="${pageContext.request.contextPath}/css/reset.css"  rel="stylesheet" >
	<link href="${pageContext.request.contextPath}/css/style.css"  rel="stylesheet" >
	<script>
		function modifyboard() {
			if($('#rebWriterPw').val() != $('#reb_pass').val()) {
				alert('비밀번호를 확인해주세요!');
				return false;
			} else if($('#rebWriterPw').val() == $('#reb_pass').val()) {
				modifyform.submit();
			}
		}
	</script>
</head>

<body>
<!-- 게시판 수정 -->
<jsp:include page="/module/headerSub.jsp" />
<div id="container">
	<div class="content">
<form action="${pageContext.request.contextPath}/Reb/rebModifyAction.reb" method="post" name="modifyform">
<input type="hidden" name="reb_no" value="${rebDto.reb_no}">
<input type="hidden" name="m_id" value="${rebDto.m_id}"/>
<input type="hidden" id="rebWriterPw" value="${rebWriterPw}"/>	<!-- 글쓴이의 비밀번호(글비번) -->
		
<table cellpadding="0" cellspacing="0"class="basic">
	<tr align="center" valign="middle">
		<td colspan="5">문의하기</td>
	</tr>
	<tr>
		<td height="16" style="font-family:돋음; font-size:12">
			<div align="center">제 목</div>
		</td>
		<td>
			<input name="reb_subject" size="50" maxlength="100" 
				value="${rebDto.reb_subject}">
		</td>
	</tr>
	<tr>
		<td style="font-family:돋음; font-size:12">
			<div align="center">내 용</div>
		</td>
		<td>
			<textarea name="reb_content" cols="67" rows="15">${rebDto.reb_content}</textarea>
		</td>
	</tr>
	<tr>
		<td height="16" style="font-family:돋음; font-size:12">
			<div align="center">비밀번호</div>
		</td>
	<td>
					<input type="password" id="reb_pass" name="reb_pass">
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
			<a href="javascript:modifyboard()"name="modifyBtn">[수정]</a>&nbsp;&nbsp;
			<a href="javascript:history.go(-1)">[뒤로]</a>&nbsp;&nbsp;
			</font>
		</td>
	</tr>
</table>
</form>
<!-- 게시판 수정 -->
</div>
</div>
<jsp:include page = "/module/footer.jsp" />
</body>
</html>