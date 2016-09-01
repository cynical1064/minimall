<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file = "./module/header.jsp" %>
<a href="${pageContext.request.contextPath}/Gin/goods_insert_form.go">상품등록</a>
<a href="${pageContext.request.contextPath}/Min/mInsert.mo">회원등록</a>
<a href="${pageContext.request.contextPath}/Qna/QnaAddWrite.qn">Q&A</a>
<a href="${pageContext.request.contextPath}/Glist/goods_admin_list.go">상품목록(관리자->상품전체)</a>
</body>
</html>