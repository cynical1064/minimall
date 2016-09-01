<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<table border="1">
			<tr>
				<th>��ȣ</th><th>��ǰ��</th><th>�Ǹ��ھ��̵�</th><th>ī�װ�</th><th>����</th><th>��ϳ�¥</th>
			</tr>
			<c:forEach var="goods" items="${goodsList}" varStatus="status">
				<tr>
					<td>${status.count}</td>
					<td><a href="${pageContext.request.contextPath}/Oin/order_insert_form.oo?gCode=${goods.g_code}">${goods.g_name}</a></td>
					<td>${goods.g_id}</td>
					<td>${goods.g_cate}</td>
					<td>${goods.g_price}</td>
					<td>${goods.g_date}</td>
				</tr>
			</c:forEach>
		</table>
	</body>
</html>