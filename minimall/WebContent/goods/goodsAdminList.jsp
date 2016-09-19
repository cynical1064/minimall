<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import ="java.awt.image.BufferedImage" %>
<%@ page import ="java.io.ByteArrayInputStream" %>
<%@ page import ="javax.imageio.ImageIO" %>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>�̴ϸ�</title>
		<link href="${pageContext.request.contextPath}/css/reset.css"  rel="stylesheet" >
		<link href="${pageContext.request.contextPath}/css/style.css"  rel="stylesheet" >
		<script src="${pageContext.request.contextPath}/js/jquery-2.1.4.js" type="text/javascript"></script>
		<script>
			$(document).ready(function() {
				$('#chkBtn').click(function() {
					$('#chkForm').submit();
				});
			});
		</script>
	</head>
	<body>
	<%@ include file = "/module/headerSub.jsp" %>
	<div id="container">
		<div class="content">
			<form action="${pageContext.request.contextPath}/Gchk/GoodsAdminChk.go" method="post" id="chkForm">
				<table class="basic">
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
			    					<input type="checkbox" name="agreeChange" class="agreeChange" value="${goods.g_code}"/>
			    					<%-- <input type="hidden" value="${goods.g_code}" id="hiddenGcode"/> --%>
			    					<%-- <c:set var="gCodeArray" value="${goods.g_code}" scope="request"/> --%>
			    					<%-- <c:out value="${gCodeArray}"/> --%>
								</c:if>
							</td>
						</tr>
					</c:forEach>
					<tr>
						<td colspan=10>
							<input type="button" value="����" id="chkBtn"/>
							<span id="chkHelper"></span>
						</td>
					</tr>
				</table>
			</form>
			</div>
		</div>
		<%@ include file = "/module/footer.jsp" %>
	</body>
</html>