<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�̴ϸ�</title>
<link href="${pageContext.request.contextPath}/css/reset.css"  rel="stylesheet" >
<link href="${pageContext.request.contextPath}/css/style.css"  rel="stylesheet" >
<script src="${pageContext.request.contextPath}/js/jquery-2.1.4.js" type="text/javascript"></script>
</head>
<body>
<%@ include file = "/module/header.jsp" %>
<div style="width:100%; height:700px;">
	<iframe src="${pageContext.request.contextPath}/Nex-master/slider/transition/random/index.html" style="width:100%; height:100%;"></iframe>
</div>
<div id="container"> 
	<div class="content"">
		<iframe scrolling="no" src="${pageContext.request.contextPath}/layout/containerLayout.html"  style="width:100%; height:2000px;"></iframe>
	</div>
</div>
<%@ include file = "/module/footer.jsp" %>
</body> 
</html>