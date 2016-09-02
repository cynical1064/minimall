<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>미니몰</title>
		<link href="${pageContext.request.contextPath}/css/reset.css"  rel="stylesheet" >
		<link href="${pageContext.request.contextPath}/css/style.css"  rel="stylesheet" >
	</head>
	<body>	
	<%@ include file = "/module/headerSub.jsp" %>
	<div id="container">
		<div class="content">
			<c:if test="${sessionScope.loginLevel == '판매자'}">
				<a href="${pageContext.request.contextPath}/Gin/goodsInsertForm.go">상품 등록</a>
			</c:if>
				<table class="basic">
					<tr>
						<th>번호</th><th>상품명</th><th>판매자아이디</th><th>카테고리</th><th>가격</th><th>등록날짜</th>
					</tr>
					<c:set var="listChk" value="${goodsList}" />
					<c:if test="${listChk eq null}">
						<tr>
							<td colspan=6>등록된 상품이 없습니다.</td>
						</tr>
					</c:if>
					<c:if test="${listChk ne null}">
						<c:forEach var="goods" items="${goodsList}" varStatus="status">
							<tr>
								<td>${status.count}</td>
								<td><a href="${pageContext.request.contextPath}/Oin/orderInsertForm.oo?gCode=${goods.g_code}">${goods.g_name}</a></td>
								<td>${goods.g_id}</td>
								<td>${goods.g_cate}</td>
								<td>${goods.g_price}</td>
								<td>${goods.g_date}</td>
							</tr>
						</c:forEach>
					</c:if>
				</table>
			</div>
		</div>
		<%@ include file = "/module/footer.jsp" %>
	</body>
</html>