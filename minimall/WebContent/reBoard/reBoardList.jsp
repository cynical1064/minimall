<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<%-- <html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>미니몰</title>
	<link href="${pageContext.request.contextPath}/css/reset.css"  rel="stylesheet" >
	<link href="${pageContext.request.contextPath}/css/style.css"  rel="stylesheet" >
</head>
<body>
	<!-- 게시판 리스트 -->
	<form action="${pageContext.request.contextPath}/Reb/rebListAction.reb" method="post">
	<table class="basic">
	<c:choose>
		<c:when test="${listcount>0}">	
			<tr align="center" valign="middle">
				<td colspan="4">문의하기</td>
				<td align=right>
					<font size=2>글 개수 : ${listcount}</font>
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
			<c:forEach var="list2" items="${reblist}" varStatus="i">
				<tr align="center" valign="middle" bordercolor="#333333"
					onmouseover="this.style.backgroundColor='F8F8F8'"
					onmouseout="this.style.backgroundColor=''">
					<td height="23" style="font-family:Tahoma;font-size:10pt;">
						${list2.reb_no}
					</td>
				
					<td style="font-family:Tahoma;font-size:10pt;">
						<div align="left">
						<%if(Qnalist.getBOARD_RE_LEV()!=0){ %>
							<%for(int a=0;a<=Qnalist.getBOARD_RE_LEV()*2;a++){ %>
							&nbsp;
							<%} %>
							▶
						<%}else{ %>
							▶
						<%} %>
						<a href="${pageContext.request.contextPath}/Reb/rebDetailAction.reb?num=${list2.reb_no}">
							${list2.reb_subject}
						</a>
						</div>
					</td>
			
					<td style="font-family:Tahoma;font-size:10pt;">
						<div align="center">${list2.m_id}</div>
					</td>
					<td style="font-family:Tahoma;font-size:10pt;">
						<div align="center">${list2.reb_date}</div>
					</td>	
					<td style="font-family:Tahoma;font-size:10pt;">
						<div align="center">${list2.reb_readcount}</div>
					</td>
				</tr>
			</c:forEach>
			<tr align=center height=20>
				<td colspan=7 style=font-family:Tahoma;font-size:10pt;>
					<c:choose>
						<c:when test="${page<=1}">
							[이전]&nbsp;
						</c:when>
						<c:otherwise>
							<a style="cursor:pointer;" onclick="getNextBlock('${page-1}')">[이전]</a>&nbsp;
						</c:otherwise>
					</c:choose>
					<c:forEach begin="${startpage}" end="${endpage}" varStatus="a">
						<c:choose>
							<c:when test="${a.count==page}">
								<a style="color:#434343; font-weight:bold;" >[${a.count}]</a>
							</c:when>
							<c:otherwise>
								<a style="cursor:pointer;" onclick="getPage('${a.count}')">[${a.count}]</a>&nbsp;
							</c:otherwise>
						</c:choose>			
						<c:choose>
							<c:when test="${page>=maxpage}">
								[다음]
							</c:when>
							<c:otherwise>
								<a style="cursor:pointer;"  onclick="getNextBlock('${page+1}')">[다음]</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</td>
			</tr>
			</c:when>
			<c:otherwise>
				<tr align="center" valign="middle">
					<td colspan="4">문의하기</td>
					<td align=right>
						<font size=2>등록된 글이 없습니다.</font>
					</td>
				</tr>
			</c:otherwise>
		</c:choose>
		<tr align="right">
			<td colspan="5">
		   		<a href="${pageContext.request.contextPath}/Reb/rebAddWrite.reb">[글쓰기]</a>
			</td>
		</tr>
	</table>
	</form>
</body>
</html> --%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>미니몰</title>
	<link href="${pageContext.request.contextPath}/css/reset.css"  rel="stylesheet" >
	<link href="${pageContext.request.contextPath}/css/style.css"  rel="stylesheet" >
	<script src="${pageContext.request.contextPath}/js/jquery-2.1.4.js" type="text/javascript"></script>
	<script>
		$(document).ready(function(){
			
			$('.subject').click(function(){
				var sessionId = $('#sessionId').val();
				console.log(sessionId);
				var count = $('.subject').index(this);
				//console.log(count);
				var listId = $('.listId').eq(count).val();
				//console.log(idValue);
				var gId = $('#gId').val();
				console.log(gId);
				
				var loginLevel = $('#loginLevel').val();
				
				/* if(sessionId == gId) {
					return true;
				} else if(sessionId == listId) {
					return true;
				} else if(loginLevel == "관리자") {
					return true;
				} else {
					alert('접근권한이 없습니다.');
					return false;
				} */
				//		seller	asd1000				1234
				if(sessionId == gId || sessionId == listId || loginLevel == "관리자") {
					return true;
				} else {
					alert('접근권한이 없습니다.');
					return false;
				}
			});
			
			$('#rebWrite').click(function(){
				var sessionId = $('#sessionId').val();
				if(sessionId == "") {
					alert('로그인 후 이용해주세요.');
					$('#loginWrap').show();
					return false;
				}
			});
		});
	</script>
	
</head>
<body>

	<!-- 게시판 리스트 -->
	<form action="${pageContext.request.contextPath}/Reb/rebList.reb" method="post">
	<input type="hidden" id="sessionId" value="${sessionScope.loginId}">
	<input type="hidden" id="loginLevel" value="${sessionScope.loginLevel}">
	<input type="hidden" id="gId" value="${g_id}">
	<table class="basic">
	<c:choose>
		<c:when test="${listcount>0}">
lll${gCode}
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
			<c:forEach var="list" items="${reblist}" varStatus="status">
				<tr align="center" valign="middle" bordercolor="#333333"
					onmouseover="this.style.backgroundColor='F8F8F8'"
					onmouseout="this.style.backgroundColor=''">
					<td height="23" style="font-family:Tahoma;font-size:10pt;">
						${list.reb_no}
					</td>
				
					<td style="font-family:Tahoma;font-size:10pt;">
						<div align="left">
							<c:if test='${list.reb_secret eq "y"}'>
								<span><img src="../img/padlock.png" width="16" height="16" align="middle"></span>
								<a class="subject" href="${pageContext.request.contextPath}/Reb/rebDetailAction.reb?num=${list.reb_no}&gCode=${gCode}">
									${list.reb_subject}
								</a>
								<input type="hidden" class="listId" value="${list.m_id}">
							</c:if>
							<c:if test='${list.reb_secret eq "n"}'>
								<a href="${pageContext.request.contextPath}/Reb/rebDetailAction.reb?num=${list.reb_no}&gCode=${gCode}">
									${list.reb_subject}
								</a>
							</c:if>
						</div>
					</td>
			
					<td style="font-family:Tahoma;font-size:10pt;">
						<div align="center">${list.m_id}</div>
					</td>
					
					<td style="font-family:Tahoma;font-size:10pt;">
						<div align="center">${list.reb_date}</div>
					</td>	
					<td style="font-family:Tahoma;font-size:10pt;">
						<div align="center">${list.reb_readcount}</div>
					</td>
				</tr>
			</c:forEach>
			<tr align=center height=20>
				<td colspan=7 style=font-family:Tahoma;font-size:10pt;>
					<c:choose>
						<c:when test="${page<=1}">
							[이전]&nbsp;
						</c:when>
						<c:otherwise>
							<a style="cursor:pointer;" onclick="getNextBlock('${page-1}')">[이전]</a>&nbsp;
						</c:otherwise>
					</c:choose>
					<c:forEach begin="${startpage}" end="${endpage}" varStatus="a">
						<c:choose>
							<c:when test="${a.count==page}">
								<a style="color:#434343; font-weight:bold;" >[${a.count}]</a>
							</c:when>
							<c:otherwise>
								<a style="cursor:pointer;" onclick="getPage('${a.count}')">[${a.count}]</a>&nbsp;
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:choose>
						<c:when test="${page>=maxpage}">
							[다음]
						</c:when>
						<c:otherwise>
							<a style="cursor:pointer;"  onclick="getNextBlock('${page+1}')">[다음]</a>
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			</c:when>
			<c:otherwise>
				<tr align="center" valign="middle">
					<td colspan="4">문의하기</td>
					<td align=right>
						<font size=2>등록된 글이 없습니다.</font>
					</td>
				</tr>
			</c:otherwise>
		</c:choose>
		<tr align="right">
			<td colspan="5">
		   		<a id="rebWrite" href="${pageContext.request.contextPath}/Reb/rebAddWrite.reb?gCode=${gCode}">[글쓰기]</a>
			</td>
		</tr>
	</table>
	</form>
</body>
</html>