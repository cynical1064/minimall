<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
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
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/css/reset.css"  rel="stylesheet" >
<link href="${pageContext.request.contextPath}/css/style.css"  rel="stylesheet" >
<script src="${pageContext.request.contextPath}/js/jquery-2.1.4.js" type="text/javascript"></script>
<script>
	$(document).ready(function(){

		$('.goodsDetailTapBtn').eq(0).addClass('on');
		
		$('.goodsDetailTapContent').eq(0).show();
		
		$('.goodsDetailTapBtn').click(function(){
			
			var tapIdx = $('.goodsDetailTapBtn').index(this);	
			
			$('.goodsDetailTapContent').hide();
			
			$('.goodsDetailTapContent').each(function(){
				
				var contentIdx = $('.goodsDetailTapContent').index(this);
				
				if(contentIdx == tapIdx){
					
					$(this).show();
					
				}
				
			});
			
			$('.goodsDetailTapBtn').removeClass('on')
			
			if(!($(this).hasClass('on'))){
				
				$(this).addClass('on');
				
			}			 
			
		});
		
	});
</script>
</head>
<body>
<jsp:include page="/module/headerSub.jsp" />
<div id="container"> 
	<div class="content">
		<div id="detailContent">
			<div id="detailImgArea">
			
			</div>		
			<div id="orderForm">
				<jsp:include page="/order/orderInsertForm.jsp" />
			</div>
		</div>
		<table class="basic tapTable">
			<colgroup>
				<col width="25%">
				<col width="25%">
				<col width="25%">
				<col width="25%">
			</colgroup>
			<tr>
				<th class="goodsDetailTapBtn">상품정보</th>
				<th class="goodsDetailTapBtn">상품리뷰</th>
				<th class="goodsDetailTapBtn">상품Q&A</th>
				<th class="goodsDetailTapBtn">판매자/반품/교환정보</th>
			</tr>
			<tr class="goodsDetailTapContent">
				<td colspan="4">
					<div>
						상품정보
					</div>
				</td>
			</tr>
			<tr class="goodsDetailTapContent">
				<td colspan="4">
					<div id="reviewTab">
						
					</div>
				</td>
			</tr>
			<tr class="goodsDetailTapContent">
				<td colspan="4">
					<div id="qnaTab">
							<!-- 게시판 리스트 -->
						<form action="${pageContext.request.contextPath}/Qna/QnaListAction.qn" method="post">
						<table class="basic">
						<%
						if(listcount > 0){
						%>
							<tr align="center" valign="middle">
								<td colspan="4">문의하기</td>
								<td align=right>
									<font size=2>글 개수 : ${listcount }</font>
								</td>
							</tr>
							
							<tr align="center" valign="middle" bordercolor="#333333">
								<td style="font-family:Tahoma;font-size:8pt;" width="8%" height="26">
									<div align="center">번호</div>
								</td>
								<td style="font-family:Tahoma;font-size:8pt;" width="50%">
									<div align="center">제목</div>
								</td>
								<td style="font-family:Tahoma;font-size:8pt;" width="14%">
									<div align="center">작성자</div>
								</td>
								<td style="font-family:Tahoma;font-size:8pt;" width="17%">
									<div align="center">날짜</div>
								</td>
								<td style="font-family:Tahoma;font-size:8pt;" width="11%">
									<div align="center">조회수</div>
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
										▶
									<%}else{ %>
										▶
									<%} %> --%>
									<a href="./QnaDetailAction.qn?num=<%= Qnalist.getQna_no() %>">
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
									<a href="${pageContext.request.contextPath}/Qna/QnaList.qn?page=<%=nowpage-1 %>">[이전]</a>&nbsp;
									<%} %>
									
									<%for(int a=startpage;a<=endpage;a++){
										if(a==nowpage){%>
										[<%=a %>]
										<%}else{ %>
										<a href="${pageContext.request.contextPath}/Qna/QnaList.qn?page=<%=a %>">[<%=a %>]</a>&nbsp;
										<%} %>
									<%} %>
									
									<%if(nowpage>=maxpage){ %>
									[다음]
									<%}else{ %>
									<a href="${pageContext.request.contextPath}/Qna/QnaList.qn?page=<%=nowpage+1 %>">[다음]</a>
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
					</div>
				</td>
			</tr>
			<tr class="goodsDetailTapContent">
				<td colspan="4">
					<div>
						정보
					</div>
				</td>
			</tr>
		</table>
	</div>
</div>	
<jsp:include page="/module/footer.jsp" />	
</body>
</html>