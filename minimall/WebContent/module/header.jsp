<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<c:choose>
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
                                                <a href="${pageContext.request.contextPath}/user/user_insert_form.jsp"> 01회원등록 </a>
                                                <a href="${pageContext.request.contextPath}/user/user_list.jsp"> 02회원리스트 </a>
                                                <a href="${pageContext.request.contextPath}/goods/goods_insert_form.jsp"> 03상품등록 </a>
                                                <a href="${pageContext.request.contextPath}/goods/goods_list.jsp"> 04상품리스트 </a>
                            </c:when>
                            <c:when test="${sessionScope.loginLevel=='판매자'}">
                                          <!-- 판매자 메뉴셋팅 -->
                                          <li>판매자</li>
                                                <a href="${pageContext.request.contextPath}/user/user_insert_form.jsp"> 01회원등록 </a>
                                                <a href="${pageContext.request.contextPath}/goods/goods_insert_form.jsp"> 03상품등록 </a>
                                                <a href="${pageContext.request.contextPath}/goods/goods_list.jsp"> 04상품리스트 </a>
                            </c:when>
                            <c:when test="${sessionScope.loginLevel=='구매자'}">
                               <!-- 구매자 메뉴셋팅 -->
                               <li>구매자</li>
                                                <a href="${pageContext.request.contextPath}/user/user_insert_form.jsp"> 01회원등록 </a>
                                                <a href="${pageContext.request.contextPath}/goods/goods_list.jsp"> 04상품리스트 </a>
                            </c:when>
                            <c:otherwise>
                               <!-- 기본메뉴셋팅 -->
                               <li>기본메뉴</li>
                                          <a href="${pageContext.request.contextPath}/goods/goods_list.jsp">04상품리스트 </a>
                            </c:otherwise>
                     </c:choose>
              </ul>
       </div>
</div>

</body>
</html>