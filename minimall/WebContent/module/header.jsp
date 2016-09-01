<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
	$(document).ready(function(){
		
		$('#loginBtn').click(function(){
			
			$('#loginWrap').show();
			
		});
		
		$('#loginSumbit').click(function(){
			
			if($('#mId').val()==''){
				
				alert('아이디를 입력해주세요');
				
			}else if($('#mPw').val()==''){
				
				alert('비밀번호를 입력해주세요');
				
			}else{
				
				$('#loginForm').submit();
				
			}
			
		})
		
	})
</script>
</head>
<div id="loginWrap">
	<div id="loginContent">
		<div id="loginArea">
			<h2>
				Login
			</h2>
			<form id="loginForm" action="${pageContext.request.contextPath}/mLogin/mLogin.mo" method="post">
			<table>
			<tr>
				<td><label for="mId">아이디</label></td>
				<td><input type="text" name="mId" id="mId" /></td>
				<td><span></span></td>
			</tr>	
			<tr>
				<td><label for="mPw">비밀번호</label></td>
				<td><input type="password" name="mPw" id="mPw"/></td>
				<td><span></span></td>
			</tr>	
			<tr>
				<td colspan="2">
					<div id="loginSumbit" style="cursor:pointer;">
						로그인
					</div>
				</td>
			</tr>	
				
			</table>	
			</form>		
		</div>
	</div>
</div>
<%-- <c:choose>
	<c:when test="${sessionScope.loginLevel == null}">
	<!-- 
		sessionScope로 세션영역 데이터 확인 
		when으로 null일경우 로그인 폼을
		null이 아닐경우 로그인 성공	
	-->
		<form action="${pageContext.request.contextPath}/mLogin/mLogin.mo" method="post">
			<input type="text" name="mId" />
			<input type="password" name="mPw" />
			<button type="submit">로그인</button>	
		</form>
	</c:when>
	<c:when test="${sessionScope.loginLevel != null}">
		<span>${sessionScope.loginName}님 환영합니다.</span>
		<span><a href="${pageContext.request.contextPath}/logout/logout.mo">로그아웃</a></span>
	</c:when>
</c:choose>	
<body>
<div>
       <div>
              <ul>
                     <c:choose>
                            <c:when test="${sessionScope.loginLevel=='관리자'}">
                            	<!-- 
									세션에 담긴 loginLevel로 권한별로 메뉴셋팅	
								-->
                                         <!-- 관리자 메뉴셋팅 --> 
                                         <li>관리자</li>
                                                <a href="${pageContext.request.contextPath}/Min/mInsert.mo">회원등록</a>
                                                <a href="${pageContext.request.contextPath}/user/user_list.jsp"> 02회원리스트 </a>
                                                <a href="${pageContext.request.contextPath}/Gin/goodsInsertForm.go"> 03상품등록 </a>
                                                <a href="${pageContext.request.contextPath}/Glist/goodsAdminList.go">상품목록(관리자->상품전체)</a>
                                                <a href="${pageContext.request.contextPath}/Qna/QnaAddWrite.qn">Q&A</a>
                            </c:when>
                            <c:when test="${sessionScope.loginLevel=='판매자'}">
                                          <!-- 판매자 메뉴셋팅 -->
                                          <li>판매자</li>
                                                <a href="${pageContext.request.contextPath}/Min/mInsert.mo">회원등록</a>
                                                <a href="${pageContext.request.contextPath}/Gin/goodsInsertForm.go">상품등록</a>
                                                <a href="${pageContext.request.contextPath}/Glist/goodsAdminList.go">상품목록(관리자->상품전체)</a>
                                                <a href="${pageContext.request.contextPath}/Qna/QnaAddWrite.qn">Q&A</a>
                            </c:when>
                            <c:when test="${sessionScope.loginLevel=='구매자'}">
                               <!-- 구매자 메뉴셋팅 -->
                               <li>구매자</li>
                                                <a href="${pageContext.request.contextPath}/Min/mInsert.mo">회원등록</a>
                                                <a href="${pageContext.request.contextPath}/Glist/goodsCustomList.go">상품목록(구매자->승인Y)</a>
                            					<a href="${pageContext.request.contextPath}/Qna/QnaAddWrite.qn">Q&A</a>
                            </c:when>
                            <c:otherwise>
                               <!-- 기본메뉴셋팅 -->
                               <li>기본메뉴</li>
                                          <a href="${pageContext.request.contextPath}/Glist/goodsCustomList.go">04상품리스트 </a>
                                          <a href="${pageContext.request.contextPath}/Qna/QnaAddWrite.qn">Q&A</a>
                            </c:otherwise>
                     </c:choose>
              </ul>
       </div>
</div> --%>
<div id="header">
	<div id="headerContent" class="clearFix">
		<div id="logoWrap">
				<h2><img src="${pageContext.request.contextPath}/img/logo.png" alt="logo"></h2>
		</div>
		<div id="itemNavWrap">
			<ul id="itemNav">
				<li>NEW ITEM</li>
				<li>SHOP</li>
				<li>COMMUNITY</li>
				<li>ABOUT</li>
				<li>CONTACT US</li>
			</ul>
		</div>				
		<div id="loginNavWrap">
		<c:choose>
			<c:when test="${sessionScope.loginLevel == null}">
				<ul id="loginNav">
					<li id="loginBtn" style="cursor:pointer">LOGIN</li>
					<li style="cursor:pointer">JOIN</li>
					<li style="cursor:pointer">ORDER</li>
				</ul>
			</c:when>
			<c:when test="${sessionScope.loginLevel != null}">
				<ul id="loginNav">
					<li id="loginBtn" style="cursor:pointer"><span>${sessionScope.loginName}님 환영합니다.</span></li>
					<li style="cursor:pointer"><a href="${pageContext.request.contextPath}/logout/logout.mo">LOGOUT</a></li>
					<li style="cursor:pointer">ORDER</li>
				</ul>
			</c:when>
		</c:choose>	
		</div>
	</div>
</div>
</body>
</html>