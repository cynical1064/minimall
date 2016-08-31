<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
	<div>
		<ul>
			<c:choose>
			       <c:when test="true">
						<!-- 관리자 메뉴셋팅 -->
						<li>관리자</li>
			       </c:when>
			       <c:when test="false">
			       		<!-- 판매자 메뉴셋팅 -->
			       		<li>판매자</li>
			       </c:when>
			       <c:when test="false">
			          <!-- 구매자 메뉴셋팅 -->
			          <li>구매자</li>
			       </c:when>
			       <c:otherwise>
			          <!-- 기본메뉴셋팅 -->
			          <li>기본메뉴</li>
			       </c:otherwise>
			</c:choose>
		</ul>
	</div>
</div>
</body>
</html>