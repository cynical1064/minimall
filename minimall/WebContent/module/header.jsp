<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="header">
	<div id="headerWrap">
	<ul>
		<%
			//관리자 메뉴셋팅
			if(false) {		
		%>
			<li>홈</li>	
			<li>판매자 관리</li>
			<li>구매자 관리</li>
			<li>상품 승인대기 리스트</li>
			<li>주문관리</li>
		<%
			//판매자 메뉴셋팅
			}else if(true) {			
		%>
			<li>홈</li>				
			<li>상품 승인대기 리스트</li>
			<li>주문관리</li>
		<%
			//구매자 메뉴 셋팅
			}else if(false) {			
		%>
			<li>홈</li>			
			<li>주문관리</li>
		<%
			}
		%>
	</ul>	
	</div>
</div>	
</body>
</html>