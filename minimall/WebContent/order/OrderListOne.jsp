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
			<td>�ֹ� ��ȣ</td><td>������ ���̵�</td><td>�Ǹ��� ���̵�</td><td>�ֹ� ��¥</td><td>��ǰ �ڵ�</td><td>����</td><td>�հ�</td><td>�ֹ� ����</td><td>�ֹ� ���</td>
		</tr>
		<c:forEach var="order" items="${orderListOne}">
			<tr>
				<td>${order.o_no}</td>
				<td>${order.m_id}</td>
				<td>${order.g_id}</td>
				<td>${order.o_date}</td>
				<td>${order.g_code}</td>
				<td>${order.o_count}</td>
				<td>${order.o_total}</td>
				<td>${order.o_state}</td>
				<td><a href="${pageContext.request.contextPath}/Odel/orderDeletePro.oo?oCode=${order.o_no}">�ֹ� ���</a></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>