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
<%@ include file = "/module/headerMain.jsp" %>
<div style="width:100%; height:700px;">
	<iframe src="${pageContext.request.contextPath}/Nex-master/slider/transition/random/index.html" style="width:100%; height:100%;"></iframe>
</div>
<div id="container" class="clearFix"> 
	<div class="content">
		<div id="mainImgSectionWrap" >
			<ul class="mainImgSection">
				<li><img src="${pageContext.request.contextPath}/img/maquillage_width_440.jpg" /></li>
				<li><img src="${pageContext.request.contextPath}/img/mode-homme_width_440.jpg" /></li>
				<li><img src="${pageContext.request.contextPath}/img/parfum_width_440.jpg" /></li>
			</ul>
			<ul class="mainImgSection">
				<li><img src="${pageContext.request.contextPath}/img/maquillage_width_440.jpg" /></li>
				<li><img src="${pageContext.request.contextPath}/img/mode-homme_width_440.jpg" /></li>
				<li><img src="${pageContext.request.contextPath}/img/parfum_width_440.jpg" /></li>
			</ul>
			<ul class="mainImgSection">
				<li><img src="${pageContext.request.contextPath}/img/maquillage_width_440.jpg" /></li>
				<li><img src="${pageContext.request.contextPath}/img/mode-homme_width_440.jpg" /></li>
				<li><img src="${pageContext.request.contextPath}/img/parfum_width_440.jpg" /></li>
			</ul>
		</div>
	</div>
</div>
<%@ include file = "/module/footer.jsp" %>
</body> 
</html>