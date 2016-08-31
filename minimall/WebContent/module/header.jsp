<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
	<div>
		<ul>
			<%
				//관리자 메뉴셋팅
				if(false) {
			%>
				<li>관리자</li>
			<%
				//판매자 메뉴셋팅
				}else if(true) {
			%>
				<li>판매자</li>
			<%
				//구매자 메뉴셋팅
				}else if(false) {
			%>
				<li>구매자</li>
			<%
				//기본 메뉴 셋팅
				}else if(false) {
			%>
				<li>기본</li>
			<%
				}
			%>
		</ul>
	</div>
</div>
</body>
</html>