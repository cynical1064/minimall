<%@page import="com.minimall.dto.REBoardDto"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%
	REBoardDto board = (REBoardDto)request.getAttribute("boarddata");
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

	<title>리뷰 게시판</title>
<link href="${pageContext.request.contextPath}/css/reset.css"  rel="stylesheet" >
	<link href="${pageContext.request.contextPath}/css/style.css"  rel="stylesheet" >
	
</head>

<body>

<%@ include file = "/module/headerSub.jsp" %>
<div id="container">
	<div class="content">
	
<!-- 게시판 수정 -->

<table cellpadding="0" cellspacing="0">
	<tr align="center" valign="middle">
		<td colspan="5">리뷰 게시판</td>
	</tr>
	
	<tr>
		<td style="font-family:돋음; font-size:12" height="16">
			<div align="center">제 목&nbsp;&nbsp;</div>
		</td>
		
		<td style="font-family:돋음; font-size:12">
		<%=board.getBOARD_SUBJECT()%>
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
					<%=board.getBOARD_CONTENT() %>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td style="font-family:돋음; font-size:12">
			<div align="center">첨부파일</div>
		</td>
		<td style="font-family:돋음; font-size:12">
		<%if(!(board.getBOARD_FILE()==null)){ %>
		<a href="/reBoard/filedown.jsp?filename=<%=board.getBOARD_FILE()%>">
			<%=board.getBOARD_FILE() %>			
			
			
		</a>
		<%} %>
		</td>
	</tr>
	
	<tr bgcolor="cccccc">
		<td colspan="2" style="height:1px;"></td>
	</tr>
	<tr><td colspan="2">&nbsp;</td></tr>
	
	<tr align="center" valign="middle">
		<td colspan="5">
			<font size=2>
			<a href="${pageContext.request.contextPath}/board/BoardReplyView.reb?num=<%=board.getBOARD_NUM() %>">
			[답변]
			</a>&nbsp;&nbsp;
			<a href="${pageContext.request.contextPath}/board/BoardModify.reb?num=<%=board.getBOARD_NUM() %>">
			[수정]
			</a>&nbsp;&nbsp;
			<a href="${pageContext.request.contextPath}/board/BoardDelete.reb?num=<%=board.getBOARD_NUM() %>">
			[삭제]
			</a>&nbsp;&nbsp;
			<a href="${pageContext.request.contextPath}/board/BoardList.reb">[목록]</a>&nbsp;&nbsp;
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