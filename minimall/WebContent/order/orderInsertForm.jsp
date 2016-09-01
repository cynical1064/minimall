<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "com.minimall.dto.GoodsDto" %>
<%@ page import = "com.minimall.dao.GoodsDao" %>
<%@ page import = "com.minimall.dto.MemberDto" %>
<%@ page import = "com.minimall.dao.MemberDao" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script>
$(document).ready(function(){
		
	var price = parseInt($('#g_price').val());
	
	$('#upCount').click(function(){
		
		var count = parseInt($('#o_count').val());
		
		$('#o_count').val(count+1);
		
	})
	
	$('#downCount').click(function(){
		
		var count = parseInt($('#o_count').val());
				
		$('#o_count').val(count-1);
		
		if(count == 1){
			$('#o_count').val(1);
		}
		
	});
	
	var price = parseInt($('#g_price').val());
	
	$('#o_total').val(prcie*count);
	
});
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
${goods}
${mdto}
	<form action="${pageContext.request.contextPath}/Oin/orderInsertPro.oo" method="post">		
		<table border="1">
			<tr>
				<td>상품명 :</td>
				<td>
					<input name="g_name" id="g_name" value="${goods.g_name}" readonly="readonly">
				</td>
			</tr>
			<tr>
				<td>판매자 :</td>
				<td>
					<input name="m_name" id="m_name" value="${mdto.m_name}" readonly="readonly">
				</td>
			</tr>
			<tr>
				<td>가격 :</td>
				<td>
					<input name="g_price" id="g_price" value="${goods.g_price}" readonly="readonly">
				</td>
			</tr>
			<tr>
				<td>수량 : </td>
				<td>
					<input name="o_count" id="o_count" value="1">
					<span id="upCount">▲</span><span id="downCount">▼</span><span id="count"></span>
				</td>
			</tr>
			<tr>
				<td>합계 : </td>
				<td>
					<input name="o_total" id="o_total" value="">
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