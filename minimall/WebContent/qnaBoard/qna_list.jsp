<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
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
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>�̴ϸ�</title>
	<link href="${pageContext.request.contextPath}/css/reset.css"  rel="stylesheet" >
	<link href="${pageContext.request.contextPath}/css/style.css"  rel="stylesheet" >
</head>
<body>
	<!-- �Խ��� ����Ʈ -->
	<form action="${pageContext.request.contextPath}/Qna/QnaListAction.qn" method="post">
	<table class="basic">
	<%
	if(listcount > 0){
	%>
		<tr align="center" valign="middle">
			<td colspan="4">�����ϱ�</td>
			<td align=right>
				<font size=2>�� ���� : ${listcount }</font>
			</td>
		</tr>
		
		<tr align="center" valign="middle" bordercolor="#333333">
			<td style="font-family:Tahoma;font-size:8pt;" width="8%" height="26">
				<div align="center">��ȣ</div>
			</td>
			<td style="font-family:Tahoma;font-size:8pt;" width="50%">
				<div align="center">����</div>
			</td>
			<td style="font-family:Tahoma;font-size:8pt;" width="14%">
				<div align="center">�ۼ���</div>
			</td>
			<td style="font-family:Tahoma;font-size:8pt;" width="17%">
				<div align="center">��¥</div>
			</td>
			<td style="font-family:Tahoma;font-size:8pt;" width="11%">
				<div align="center">��ȸ��</div>
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
		
			<td style="font-family:Tahoma;font-size:10pt;">
				<div align="left">
				<%-- <%if(Qnalist.getBOARD_RE_LEV()!=0){ %>
					<%for(int a=0;a<=Qnalist.getBOARD_RE_LEV()*2;a++){ %>
					&nbsp;
					<%} %>
					��
				<%}else{ %>
					��
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
				[����]&nbsp;
				<%}else{ %>
				<a style="cursor:pointer;"  onclick="getNextBlock('<%=nowpage-1 %>')">[����]</a>&nbsp;
				<%} %>
				
				<%for(int a=startpage;a<=endpage;a++){
					if(a==nowpage){%>
					<a style="color:#434343; font-weight:bold;" >[<%=a %>]</a>
					<%}else{ %>
					<a style="cursor:pointer;" onclick="getPage('<%=a%>')">[<%=a %>]</a>&nbsp;
					<%} %>
				<%} %> 
				
				<%if(nowpage>=maxpage){ %>
				[����]
				<%}else{ %>
				<a style="cursor:pointer;"  onclick="getNextBlock('<%=nowpage+1 %>')">[����]</a>
				<%} %>
			</td>
		</tr>
		<%
	    } else
		{
		%>
		<tr align="center" valign="middle">
			<td colspan="4">�����ϱ�</td>
			<td align=right>
				<font size=2>��ϵ� ���� �����ϴ�.</font>
			</td>
		</tr>
		<%
		}
		%>
		<tr align="right">
			<td colspan="5">
		   		<a href="${pageContext.request.contextPath}/Qna/QnaAddWrite.qn">[�۾���]</a>
			</td>
		</tr>
	</table>
	</form>
</body>
</html>