<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>미니몰</title>
<link href="${pageContext.request.contextPath}/css/reset.css"  rel="stylesheet" >
<link href="${pageContext.request.contextPath}/css/style.css"  rel="stylesheet" >
<script src="${pageContext.request.contextPath}/js/jquery-2.1.4.js" type="text/javascript"></script>
</head>
<body>
<%@ include file = "/module/header.jsp" %>
<div id="container" style="width:100%; height:100%;">
	<div class="content" style="width:70%; height:700px;">
		<form action="${pageContext.request.contextPath}/Min/mInsertPro.mo" method="post">			
			<table border="1">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="m_id" size="20"></td>
			<tr>
			<tr>
				<td>암호</td>
				<td><input type="password" name="m_pw" size="20"></td>
			<tr>
			<tr>
				<td>권한</td>
				
				<td><input type="text" name="m_level" size="20"></td>
			<tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="m_name" size="20"></td>
			<tr>
			<tr>
				<td>이메일</td>
				<td><input type="text" name="m_email" size="20"></td>
			<tr>
			<tr>
				<td>주소:</td>
				<td><input type="text" name="m_addr" size="20"></td>
			<tr>
			<tr>
				<td colspan="4"><input type="submit" value="회원가입버튼"></td>
			</tr>
			</table>
		</form>
	</div>
</div>
<%@ include file = "/module/footer.jsp" %>
</body> 
</html>