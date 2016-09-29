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
	<table id="qnaBoard" class="basic">
	<%
	if(listcount > 0){
	%>
		<tr>
			<td>문의하기</td>
			<td>
				<font>글 개수 : ${listcount }</font>
			</td>
		</tr>
		
		<tr>
			<td>
				<div>번호</div>
			</td>
			<td>
				<div>제목</div>
			</td>
			<td>
				<div>작성자</div>
			</td>
			<td>
				<div>날짜</div>
			</td>
			<td>
				<div>조회수</div>
			</td>
		</tr>
		
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
		
			<td>
				<div>
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
	
			<td> 
				<div><%=Qnalist.getM_id() %></div>
			</td>
			<td>
				<div><%=Qnalist.getQna_date() %></div>
			</td>	
			<td>
				<div><%=Qnalist.getQna_readcount() %></div>
			</td>
		</tr>
		<%} %>
		<tr>
			<td>
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
				<aonclick="getNextBlock('<%=nowpage+1 %>')">[다음]</a>
				<%} %>
			</td>
		</tr>
		<%
	    } else
		{
		%>
		<tr>
			<td>문의하기</td>
			<td>
				<font>등록된 글이 없습니다.</font>
			</td>
		</tr>
		<%
		}
		%>
		<tr>
			<td>
		   		<a href="${pageContext.request.contextPath}/Qna/QnaAddWrite.qn">[글쓰기]</a>
			</td>
		</tr>
	</table>
	</form>
</body>
</html>