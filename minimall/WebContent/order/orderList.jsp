<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/css/reset.css"  rel="stylesheet" >
<link href="${pageContext.request.contextPath}/css/style.css"  rel="stylesheet" >
<link href="${pageContext.request.contextPath}/css/jquery.brickfolio.min.css"  rel="stylesheet" >
</head>
<body>
<jsp:include page="/module/headerSub.jsp" />
<div id="container"> 
	<div class="content">
		<table class="basic">
			<tr>
				<td>주문 번호</td><td>상품 이름</td><td>구매자 아이디</td><td>판매자 아이디</td><td>구매자 이름</td><td>배송지</td><td>주문 날짜</td><td>상품 코드</td><td>가격</td><td>수량</td><td>합계</td><td>주문 상태</td><td>주문 취소</td>
			</tr>
			<c:forEach var="order" items="${orderList}">
				<tr>
					<td>${order.o_no}</td>
					<td>${order.g_name}</td>
					<td>${order.m_id}</td>
					<td>${order.g_id}</td>
					<td>${order.m_name}</td>
					<td>${order.m_addr}</td>
					<td>${order.o_date}</td>
					<td>${order.g_code}</td>
					<td>${order.g_price}</td>
					<td>${order.o_count}</td>
					<td>${order.o_total}</td>
					<td>${order.o_state}</td>
					<td><a href="${pageContext.request.contextPath}/Odel/orderDeletePro.oo?oNo=${order.o_no}">주문 취소</a></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</div>	
<jsp:include page="/module/footer.jsp" />	
</body>
</html>