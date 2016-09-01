<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c-rt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
		<script>
			$(document).ready(function() {
				if($('#agreeChange:checked').length != 0) {
					var array = [];
				}
			});
		</script>
	</head>
	<body>
		<form action="${pageContext.request.contextPath}/Gchk/GoodsAdminChk.go?" method="post">
			<table border="1">
				<tr>
					<th>��ȣ</th><th>��ǰ�ڵ�</th><th>��ǰ��</th><th>�Ǹ��ھ��̵�</th><th>ī�װ�</th>
					<th>����</th><th>�󼼳���</th><th>��ϳ�¥</th><th>���ο���</th><th>����üũ</th>
				</tr>
				<c:forEach var="goods" items="${goodsList}" varStatus="status">
					<tr>
						<td>${status.count}</td>
						<td>${goods.g_code}</td>
						<td>${goods.g_name}</td>
						<td>${goods.g_id}</td>
						<td>${goods.g_cate}</td>
						<td>${goods.g_price}</td>
						<td>${goods.g_sangse}</td>
						<td>${goods.g_date}</td>
						<td>${goods.g_agree}</td>
						<td>
							<c:set var="chk" value="${goods.g_agree}o" />
							<c:if test="${chk eq 'No'}">
		    					<input type="checkbox" name="agreeChange" id="agreeChange" value="Y"/>
		    					<c:set var="gCodeArray" value="${goods.g_code}" scope="request"/>
		    					<c:out value="${gCodeArray}"/>
							</c:if>
						</td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan=10>
						<input type="submit" value="����"/>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>