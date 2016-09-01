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
</head>
<body>
	<form action="${pageContext.request.contextPath}/Oin/orderInsertPro.oo" method="post">		
		<table border="1">
			<c:forEach var="goodsList" items="${goodsList}">
			<tr>
				<td>상품명</td>
				<td>
					<input type="hidden" name="gName" id="gName" value="${goodsList.g_name}">
					${goodsList.g_name}
				</td>
			</tr>
			<tr>
				<td>판매자</td>
				<td>
					<input type="hidden" name="gId" id="gId" value="${goodsList.g_id}">
					${goodsList.g_id}
				</td>
			</tr>
			<tr>
				<td>가격</td>
				<td>
					<input type="hidden" name="gPrice" id="gPrice" value="${goodsList.g_price}">
					${goodsList.g_price}
				</td>
			</tr>
			<tr>
				<td>수량</td>
				<td>
					<input name="oCount" id="oCount" value="1" readonly="readonly">
					<span id="upCount">▲</span>/<span id="downCount">▼</span><span id="count"></span>
				</td>
			</tr>
			<tr>
				<td>합계</td>
				<td>
					<input name="oTotal" id="oTotal" value="${goodsList.g_price}" readonly="readonly">원
				</td>
			</tr>
			<tr>	
				<td>
					<input type="submit" value="구매">
				</td>
			</tr>			
			<input type = "hidden" name="gCode" value="${goodsList.g_code}">
			<input type = "hidden" name="mId" value="${sessionScope.loginId}">
		</c:forEach>
		</table>
</form>
</body>
</html>