<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�̴ϸ�</title>
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
	<div class="content clearFix">
		<div id="leftMenuWrap">
			<dl id="leftMenu" class="">
				<dt>����������</dt>
				<c:choose>
					<c:when test="${sessionScope.loginLevel == '������'}">
						<dd><a href="${pageContext.request.contextPath}/Mli/mList.mo">Member</a></dd>
						<dd><a href="${pageContext.request.contextPath}/Glist/goodsAdminList.go">���δ��</a></dd>
						<dd><a href="">�Խñ� ����</a></dd>
					</c:when>
					<c:when test="${sessionScope.loginLevel == '�Ǹ���'}">
						<dd><a href="${pageContext.request.contextPath}/Mup/mUpdateForm.mo">������������</a></dd>
						<dd><a href="${pageContext.request.contextPath}/Glist/goodsSellerList.go">��ϻ�ǰ</a></dd>
						<dd><a href="">�Խñ� ����</a></dd>
					</c:when>
					<c:otherwise>
						<dd><a href="${pageContext.request.contextPath}/Mup/mUpdateForm.mo">������������</a></dd>
						<dd><a href="${pageContext.request.contextPath}/Oli/orderListOne.oo">order</a></dd>
						<dd><a href="">�Խñ� ����</a></dd>
					</c:otherwise>
				</c:choose>
				
			</dl>
		</div>
		
		<div id="myPageContent">			
			<table class="basic">
				<tr>
					<th>��ȣ</th><th>��ǰ�ڵ�</th><th>��ǰ��</th><th>ī�װ�</th><th>����</th>
					<th>�󼼳���</th><th>��ϳ�¥</th><th>����</th><th>����</th>
				</tr>
				<c:forEach var="goods" items="${goodsList}" varStatus="status">
					<tr>
						<td>${status.count}</td>
						<td>${goods.g_code}</td>
						<td>${goods.g_name}</td>
						<td>${goods.g_cate}</td>
						<td>${goods.g_price}</td>
						<td>${goods.g_sangse}</td>
						<td>${goods.g_date}</td>
						<td>
							<a href="${pageContext.request.contextPath}/Gup/goodsUpdateForm.go?gCode=${goods.g_code}">����</a>
						</td>
						<td>
							<a href="${pageContext.request.contextPath}/Gdel/goodsDeleteAction.go?gCode=${goods.g_code}">����</a>
						</td>
					</tr>
				</c:forEach>
			</table>
			<a href="${pageContext.request.contextPath}/Gin/goodsInsertForm.go">��ǰ ���</a>
		</div>
	</div>
</div>
<jsp:include page="/module/footer.jsp" />
</body>
</html>