<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
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
<div id="headerMain">
	<div id="headerContent" class="clearFix">
		<div id="logoWrap">
				<h2><a href="${pageContext.request.contextPath}/index.jsp"><img src="${pageContext.request.contextPath}/img/logo.png" alt="logo"></a></h2>
		</div>
		<div id="itemNavWrap">
			<ul id="itemNav">
				<li><a>NEW ITEM</a></li>
				<li><a href="${pageContext.request.contextPath}/Glist/goodsCustomList.go">SHOP</a></li>
				<li><a>COMMUNITY</a></li>
				<li><a>ABOUT</a></li>
				<li><a href="${pageContext.request.contextPath}/Qna/QnaList.qn">Q&A</a></li> 
				<li><a href="${pageContext.request.contextPath}/Qna/QnaList.qn">CONTACT US</a></li> 
			</ul>
		</div>				
		<div id="loginNavWrap">
		<c:choose>
			<c:when test="${sessionScope.loginLevel == null}">
				<ul id="loginNav">
					<li id="loginBtn" style="cursor:pointer"><a>LOGIN</a></li>
					<li style="cursor:pointer"><a href="${pageContext.request.contextPath}/Min/mInsert.mo">JOIN</a></li>
					<li style="cursor:pointer"><a>ORDER</a></li>
				</ul>
			</c:when>
			<c:when test="${sessionScope.loginLevel != null}">
				<c:choose>
					<c:when test="${sessionScope.loginLevel == '관리자'}">
						<ul id="loginNav">
							<li style="cursor:pointer"><a><span>${sessionScope.loginName}님(${sessionScope.loginLevel}) 환영합니다.</span></a></li>
							<li style="cursor:pointer"><a href="${pageContext.request.contextPath}/logout/logout.mo">LOGOUT</a></li>
							<li style="cursor:pointer"><a>MEBER</a></li>
							<li style="cursor:pointer"><a href="${pageContext.request.contextPath}/Glist/goodsAdminList.go">승인대기</a></li>
						</ul>
					</c:when>
					<c:otherwise>
						<ul id="loginNav">
							<li style="cursor:pointer"><a><span>${sessionScope.loginName}님(${sessionScope.loginLevel}) 환영합니다.</span></a></li>
							<li style="cursor:pointer"><a href="${pageContext.request.contextPath}/logout/logout.mo">LOGOUT</a></li>
							<li style="cursor:pointer"><a>ORDER</a></li>
						</ul>
					</c:otherwise>
				</c:choose>
			</c:when>
		</c:choose>	
		</div>
	</div>
</div>
</body>
</html>