<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ page import="com.minimall.dao.QnaDao" %>
<%@ page import="com.minimall.dto.QnaDto" %>
<%
	QnaDto qnadto = (QnaDto)request.getAttribute("qnadto");
%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>미니몰</title>
	<link href="${pageContext.request.contextPath}/css/reset.css"  rel="stylesheet" >
	<link href="${pageContext.request.contextPath}/css/style.css"  rel="stylesheet" >
</head>
<body>
<%@ include file = "/module/headerSub.jsp" %>
<div id="container">
	<div class="content">
		<!-- 게시판 수정 -->
		<table class="basic">
			<tr align="center" valign="middle">
				<td colspan="5">문의하기</td>
			</tr>
			
			<tr>
				<td style="font-family:돋음; font-size:12" height="16">
					<div align="center">제 목&nbsp;&nbsp;</div>
				</td>
				
				<td style="font-family:돋음; font-size:12">
				<%=qnadto.getQna_subject()%>
				</td>
			</tr>
			
			<tr bgcolor="cccccc">
				<td colspan="2" style="height:1px;">
				</td>
			</tr>
			
			<tr>
				<td style="font-family:돋음; font-size:12">
					<div align="center">내 용</div>
				</td>
				<td style="font-family:돋음; font-size:12">
					<table border=0 width=490 height=250 style="table-layout:fixed">
						<tr>
							<td valign=top style="font-family:돋음; font-size:12">
							<%=qnadto.getQna_content() %>
							</td>
						</tr>
					</table>
				</td>
			</tr>	
			<tr bgcolor="cccccc">
				<td colspan="2" style="height:1px;"></td>
			</tr>
			<tr><td colspan="2">&nbsp;</td></tr>
			
			<tr align="center" valign="middle">
				<td colspan="5">
					<font size=2>
					<a href="./QnaReplyView.qn?num=<%=qnadto.getQna_no() %>">
					[답변]
					</a>&nbsp;&nbsp;
					<a href="./QnaModify.qn?num=<%=qnadto.getQna_no() %>">
					[수정]
					</a>&nbsp;&nbsp;
					<a href="./QnaDelete.qn?num=<%=qnadto.getQna_no() %>">
					[삭제]
					</a>&nbsp;&nbsp;
					<a href="./QnaList.qn">[목록]</a>&nbsp;&nbsp;
					</font>
				</td>
			</tr>
		</table>
		<!-- 게시판 수정 -->
	</div>
</div>
<%@ include file = "/module/footer.jsp" %>
</body>
</html>