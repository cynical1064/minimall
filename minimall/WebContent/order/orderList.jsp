<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<tr>
			<td>주문 번호</td><td>구매자 아이디</td><td>팜내자 아이디</td><td>주문 날짜</td><td>상품 코드</td><td>수량</td><td>합계</td><td>주문 상태</td><td>주문 취소</td>
		</tr>
		<c:forEach var="order" items="${orderArrayList}">
			<tr>
				<td>${order.o_no}</td>
				<td>${order.m_id}</td>
				<td>${order.g_id}</td>
				<td>${order.o_date}</td>
				<td>${order.g_code}</td>
				<td>${order.o_count}</td>
				<td>${order.o_total}</td>
				<td>${order.o_state}</td>
				<td><a href="${pageContext.request.contextPath}/Odel/orderDeletePro.oo?oCode=${order.ora_no}">주문 취소</a></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>