<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script>
$(document).ready(function(){
	
	var price = parseInt($('#gPrice').val());
	var count = parseInt($('#oCount').val());	
		
	$('#upCount').click(function(){
		
		var count = parseInt($('#oCount').val());	
		$('#oCount').val(count+1);
		$('#oTotal').val(price * (count+1));
		
	})
	
	$('#downCount').click(function(){
		
		if($('#oCount').val() > 0){
			
			var count = parseInt($('#oCount').val());
			$('#oCount').val(count-1);
			$('#oTotal').val(price * (count-1));
		}
		
		
	});
	
});
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/css/reset.css"  rel="stylesheet" >
<link href="${pageContext.request.contextPath}/css/style.css"  rel="stylesheet" >
<link href="${pageContext.request.contextPath}/css/jquery.brickfolio.min.css"  rel="stylesheet" >
</head>
<body>
<jsp:include page="/module/headerMain.jsp" />
<div id="container"> 
	<div class="content">
		<form action="${pageContext.request.contextPath}/Oin/orderInsertPro.oo" method="post">		
			<table border="1">
				<tr>
					<td>��ǰ��</td>
					<td>
						<input type="hidden" name="gName" id="gName" value="${goods.g_name}">
						${goods.g_name}
					</td>
				</tr>
				<tr>
					<td>�Ǹ���</td>
					<td>
						<input type="hidden" name="gId" id="gId" value="${goods.g_id}">
						${goods.g_id}
					</td>
				</tr>
				<tr>
					<td>����</td>
					<td>
						<input type="hidden" name="gPrice" id="gPrice" value="${goods.g_price}">
						${goods.g_price}
					</td>
				</tr>
				<tr>
					<td>����</td>
					<td>
						<input name="oCount" id="oCount" value="1" readonly="readonly">
						<span id="upCount">��</span>/<span id="downCount">��</span><span id="count"></span>
					</td>
				</tr>
				<tr>
					<td>�հ�</td>
					<td>
						<input name="oTotal" id="oTotal" value="${goods.g_price}" readonly="readonly">��
					</td>
				</tr>
				<tr>	
					<td>				
						<input type = "hidden" name="gCode" value="${goods.g_code}">
						<input type = "hidden" name="mId" value="${sessionScope.loginId}">
						<input type="submit" value="����">
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>	
<jsp:include page="/module/footer.jsp" />			
</body>
</html>