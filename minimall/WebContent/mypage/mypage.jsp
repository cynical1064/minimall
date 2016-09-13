<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>미니몰</title>
<link href="${pageContext.request.contextPath}/css/reset.css"  rel="stylesheet" >
<link href="${pageContext.request.contextPath}/css/style.css"  rel="stylesheet" >
<script src="${pageContext.request.contextPath}/js/jquery-2.1.4.js" type="text/javascript"></script>
<script>
	$(document).ready(function(){
		
		$('.delMemberBtn').click(function(){
			
			var btnIdx = $('.delMemberBtn').index(this);
			
			$('#memberId').each(function(i){				
				
				
			});
			
		})
		
	})
</script>
</head>
<body>
<jsp:include page="/module/headerSub.jsp" />
<div id="container">
	<div class="content">
		<div id="leftMenuWrap">
			<dl id="leftMenu">
				<dt>마이페이지</dt>
				<c:choose>
					<c:when test="${sessionScope.loginLevel == '관리자'}">
						<dd><a href="${pageContext.request.contextPath}/Mli/mList.mo">Member</a></dd>
						<dd><a href="${pageContext.request.contextPath}/Glist/goodsAdminList.go">승인대기</a></dd>
						<dd>게시글 관리</dd>
					</c:when>
					<c:when test="${sessionScope.loginLevel == '판매자'}">
						<dd>개인정보수정</dd>
						<dd><a href="${pageContext.request.contextPath}/Glist/goodsSellerList.go">등록상품</a></dd>
						<dd>게시글 관리</dd>
					</c:when>
					<c:otherwise>
						<dd>개인정보수정</dd>
						<dd><a href="${pageContext.request.contextPath}/Oli/orderListOne.oo">order</a></dd>
						<dd>게시글 관리</dd>
					</c:otherwise>
				</c:choose>
				<dd></dd>
			</dl>
		</div>
	</div>
</div>
<jsp:include page="/module/footer.jsp" />
</body>
</html>