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
				<td>�ֹ� ��ȣ</td><td>��ǰ �̸�</td><td>������ ���̵�</td><td>�Ǹ��� ���̵�</td><td>������ �̸�</td><td>�����</td><td>�ֹ� ��¥</td><td>��ǰ �ڵ�</td><td>����</td><td>����</td><td>�հ�</td><td>�ֹ� ����</td><td>�ֹ� ���</td>
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
					<td><a href="${pageContext.request.contextPath}/Odel/orderDeletePro.oo?oNo=${order.o_no}">�ֹ� ���</a></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</div>	
<jsp:include page="/module/footer.jsp" />	
</body>
</html>