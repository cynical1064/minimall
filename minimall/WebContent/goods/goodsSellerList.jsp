<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<link href="${pageContext.request.contextPath}/css/reset.css"  rel="stylesheet" >
		<link href="${pageContext.request.contextPath}/css/style.css"  rel="stylesheet" >
	</head>
	<body>
		<%@ include file = "/module/headerSub.jsp" %>
		<div id="container">
		<div class="content">
			<a href="${pageContext.request.contextPath}/Gin/goodsInsertForm.go">상품 등록</a>
			<table class="basic">
				<tr>
					<th>번호</th><th>상품코드</th><th>상품명</th><th>카테고리</th><th>가격</th>
					<th>상세내용</th><th>등록날짜</th><th>수정</th>
				</tr>
				<c:forEach var="goods" items="${goodsList}" varStatus="status">
					<tr>
						<td>${status.count}</td>
						<td>${goods.g_code}</td>
						<td>${goods.g_name}</td>
						<td>${goods.g_cate}</td>
						<td>${goods.g_price}</td>
						<td>${goods.g_sangse}</td>
						<td>${goods.g_date}</td>
						<td>
							<a href="${pageContext.request.contextPath}/Gup/goodsUpdateForm.go?gCode=${goods.g_code}">수정</a>
						</td>
					</tr>
				</c:forEach>
			</table>
			</div>
		</div>
		<%@ include file = "/module/footer.jsp" %>
	</body>
</html>