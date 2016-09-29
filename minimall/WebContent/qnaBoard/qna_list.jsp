<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.minimall.dto.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	List QnaList=(List)request.getAttribute("qnalist");
	int listcount=((Integer)request.getAttribute("listcount")).intValue();
	int nowpage=((Integer)request.getAttribute("page")).intValue();
	int maxpage=((Integer)request.getAttribute("maxpage")).intValue();
	int startpage=((Integer)request.getAttribute("startpage")).intValue();
	int endpage=((Integer)request.getAttribute("endpage")).intValue();
	System.out.println(QnaList + " : QnaList");
	System.out.println(listcount + " : listcount");
%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>미니몰</title>
	<link href="${pageContext.request.contextPath}/css/reset.css"  rel="stylesheet" >
	<link href="${pageContext.request.contextPath}/css/style.css"  rel="stylesheet" >
</head>
<body>
	<!-- 게시판 리스트 -->
	<form action="${pageContext.request.contextPath}/Qna/QnaListAction.qn" method="post">
	<table class="basic qnaBoard">
	<%
	if(listcount > 0){
	%>
		<%-- <tr align="center" valign="middle">
			<td colspan="4">문의하기</td>
			<td align=right>
				<font size=2>글 개수 : ${listcount }</font>
			</td>
		</tr> --%>
		<thead>
			<tr align="center" valign="middle" bordercolor="#333333">
				<th style="font-family:Tahoma;font-size:8pt;" width="8%" height="26">
					<div align="center">번호</div>
				</th>
				<th style="font-family:Tahoma;font-size:8pt;" width="50%">
					<div align="center">제목</div>
				</th>
				<th style="font-family:Tahoma;font-size:8pt;" width="14%">
					<div align="center">작성자</div>
				</th>
				<th style="font-family:Tahoma;font-size:8pt;" width="17%">
					<div align="center">날짜</div>
				</th>
				<th style="font-family:Tahoma;font-size:8pt;" width="11%">
					<div align="center">조회수</div>
				</th>
			</tr>
		</thead>
		<%
		for(int i=0;i<QnaList.size();i++){
			QnaDto Qnalist=(QnaDto)QnaList.get(i);
		%>
		<tr align="center" valign="middle" bordercolor="#333333"
			onmouseover="this.style.backgroundColor='F8F8F8'"
			onmouseout="this.style.backgroundColor=''">
			<td height="23" style="font-family:Tahoma;font-size:10pt;">
				<%= Qnalist.getQna_no() %>
			</td>
		
			<td style="font-family:Tahoma;font-size:10pt;">
				<div align="left">
				<%-- <%if(Qnalist.getBOARD_RE_LEV()!=0){ %>
					<%for(int a=0;a<=Qnalist.getBOARD_RE_LEV()*2;a++){ %>
					&nbsp;
					<%} %>
					▶
				<%}else{ %>
					▶
				<%} %> --%>
				<a href="${pageContext.request.contextPath}/Qna/QnaDetailAction.qn?num=<%= Qnalist.getQna_no() %>">
					<%=Qnalist.getQna_subject()%>
				</a>
				</div>
			</td>
	
			<td style="font-family:Tahoma;font-size:10pt;">
				<div align="center"><%=Qnalist.getM_id() %></div>
			</td>
			<td style="font-family:Tahoma;font-size:10pt;">
				<div align="center"><%=Qnalist.getQna_date() %></div>
			</td>	
			<td style="font-family:Tahoma;font-size:10pt;">
				<div align="center"><%=Qnalist.getQna_readcount() %></div>
			</td>
		</tr>
		<%} %>
		<tr align=center height=20>
			<td colspan=7 style=font-family:Tahoma;font-size:10pt;>
				<%if(nowpage<=1){ %>
				[이전]&nbsp;
				<%}else{ %>
				<a style="cursor:pointer;"  onclick="getNextBlock('<%=nowpage-1 %>')">[이전]</a>&nbsp;
				<%} %>
				
				<%for(int a=startpage;a<=endpage;a++){
					if(a==nowpage){%>
					<a style="color:#434343; font-weight:bold;" >[<%=a %>]</a>
					<%}else{ %>
					<a style="cursor:pointer;" onclick="getPage('<%=a%>')">[<%=a %>]</a>&nbsp;
					<%} %>
				<%} %> 
				
				<%if(nowpage>=maxpage){ %>
				[다음]
				<%}else{ %>
				<a style="cursor:pointer;"  onclick="getNextBlock('<%=nowpage+1 %>')">[다음]</a>
				<%} %>
			</td>
		</tr>
		<%
	    } else
		{
		%>
		<tr align="center" valign="middle">
			<td colspan="4">문의하기</td>
			<td align=right>
				<font size=2>등록된 글이 없습니다.</font>
			</td>
		</tr>
		<%
		}
		%>
		<tr align="right">
			<td colspan="5">
		   		<a href="${pageContext.request.contextPath}/Qna/QnaAddWrite.qn">[글쓰기]</a>
			</td>
		</tr>
	</table>
	</form>
</body>
</html>