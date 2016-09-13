<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/css/reset.css"  rel="stylesheet" >
<link href="${pageContext.request.contextPath}/css/style.css"  rel="stylesheet" >
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		
		$('.delLink').click(function(){
			var idx = $('.delLink').index(this);
			$('.hiddenTd').eq(idx).css('display', 'block');
			$('#hiddenTh').css('display', 'block');
			
		});		
				
	});
		
	
</script>
</head>
<c:if test="${sessionScope.goodsChk}==1">
<script>
	alert('��й�ȣ�� ��ġ���� �ʽ��ϴ�.');
</script>
</c:if>
<%-- <div id="delWarp">
	<div id="loginContent">
		<span id="closeDelWrap">
			X
		</span>
		<div id="loginArea">		
			<h2>
				���� Ȯ���� ���� ��й�ȣ�� �Է��� �ּ���
			</h2>
			<form id="delForm" action="${pageContext.request.contextPath}/Odel/orderDeletePro.oo?oNo=${order.o_no}" method="post">
			<table>
			<tr>
				<td><label for="mPw">��й�ȣ</label></td>
				<td><input type="password" name="mPw" id="mPw"/></td>
				<td><span></span></td>
			</tr>	
			<tr>
				<td colspan="2">
					<div id="delSubmit" style="cursor:pointer;">
						�ֹ����
					</div>
				</td>
			</tr>				
			</table>	
			</form>		
		</div>
	</div>
</div>
</head> --%>
<body>
<jsp:include page="/module/headerSub.jsp"/>
<div id="container"> 
	<div class="content">
		<table class="basic">
			<tr>
				<th>�ֹ� ��ȣ</th><th>��ǰ �̸�</th><th>������ ���̵�</th><th>�Ǹ��� ���̵�</th><th>������ �̸�</th><th>�����</th><th>�ֹ� ��¥</th><th>��ǰ �ڵ�</th><th>����</th><th>����</th><th>�հ�</th><th>�ֹ� ����</th><th>�ֹ� ���</th><th id="hiddenTh" style="display:none;">��� Ȯ��</th>
			</tr>
			<c:forEach var="order" items="${orderListOne}">
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
					<td class="hiddenTd" style="display:none;"> ��й�ȣ Ȯ�� : <input type="password" id="delPw" size="10px"></td>
					<td><input type="button" class="delLink" value="�ֹ����"></td>
					
				</tr>
			</c:forEach>
		</table>	
	</div>
</div>	
<jsp:include page="/module/footer.jsp" />
</body>
</html>