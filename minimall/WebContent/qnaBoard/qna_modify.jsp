<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<title>미니몰</title>
	<link href="${pageContext.request.contextPath}/css/reset.css"  rel="stylesheet" >
	<link href="${pageContext.request.contextPath}/css/style.css"  rel="stylesheet" >
	<script>
		function modifyboard() {
			if($('#qnaWriterPw').val() != $('#qna_pass').val()) {
				alert('비밀번호를 확인해주세요!');
				return false;
			} else if($('#qnaWriterPw').val() == $('#qna_pass').val()) {
				modifyform.submit();
			}
		}
	</script>
</head>

<body>
<jsp:include page="/module/headerSub.jsp" />
<div id="container">
	<div class="content">
		<!-- 게시판 수정 -->
		<form name="modifyform" action="${pageContext.request.contextPath}/Qna/QnaModifyAction.qn" method="post">
		<input type="hidden" name="qna_no" value="${qnadto.qna_no}">
		<input type="hidden" name="m_id" value="${qnadto.m_id}"/>
		<input type="hidden" id="qnaWriterPw" value="${qnaWriterPw}"/>	<!-- 글쓴이의 비밀번호(글비번) -->
		<table cellpadding="0" cellspacing="0" class="basic">
			<tr align="center" valign="middle">
				<td colspan="5">문의하기</td>
			</tr>
			<tr>
				<td height="16" style="font-family:돋음; font-size:12">
					<div align="center">제 목</div>
				</td>
				<td>
					<input name="qna_subject" size="50" maxlength="100" value="${qnadto.qna_subject}">
				</td>
			</tr>
			<tr>
				<td style="font-family:돋음; font-size:12">
					<div align="center">내 용</div>
				</td>
				<td>
					<textarea name="qna_content" cols="67" rows="15">${qnadto.qna_content}</textarea>
				</td>
			</tr>
			<tr>
				<td height="16" style="font-family:돋음; font-size:12">
					<div align="center">비밀번호</div>
				</td>
				<td>
					<input type="password" id="qna_pass" name="qna_pass">
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
					<a href="javascript:modifyboard()" name="modifyBtn">[수정]</a>&nbsp;&nbsp;
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