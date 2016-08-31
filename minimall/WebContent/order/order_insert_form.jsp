<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script>
$(document).ready(function(){
	
	$('#upCount').click(function(){
		
		var count = parseInt($('#count').text());
		
		$('#count').text(count+1);
		
	})
	
	$('#downCount').click(function(){
		
		var count = parseInt($('#count').text());
				
		$('#count').text(count-1);
		
	});
	
});
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
${goods}
${mdto}
	<form action="${pageContext.request.contextPath}/Oin/order_insert_pro.oo" method="post">		
		<table border="1">
			<tr>
				<td>상품명 :</td>
				<td>
					<input name="g_name" id="g_name" value="${goods.g_name}">
				</td>
			</tr>
			<tr>
				<td>판매자 :</td>
				<td>
					<input name="m_name" id="m_name" value="${m.m_name}">
				</td>
			</tr>
			<tr>
				<td>가격 :</td>
				<td>
					<input name="g_price" id="g_price" value="${goods.g_price}">
				</td>
			</tr>
			<tr>
				<td>수량 : </td>
				<td>
					<input name="o_count" id="o_count" value="">
					<span id="upCount">▲</span><span id="downCount">▼</span><span id="count">0</span>
				</td>
			</tr>
			<tr>
				<td>합계 : </td>
				<td>
					<input name="o_total" id="o_total" value="${g_price * o_count}">
				</td>
			</tr>
			<tr>
				<td>
					<input type="submit" value="구매">
				</td>
			</tr>
		</table>
</form>
</body>
</html>