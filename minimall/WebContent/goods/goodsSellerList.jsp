<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<script type="text/javascript">
			function sellergoods(){
				sellerform.submit();
			}
		</script>
	</head>
	<body>
		<%@ include file = "/module/headerSub.jsp" %>
		<div id="container">
		<div class="content">
			<form action="${pageContext.request.contextPath}/Gup/GoodsUpdateForm.go" method="post" id="sellerform">
				<table class="basic">
					<tr>
						<th>번호</th><th>상품코드</th><th>상품명</th><th>카테고리</th>
						<th>가격</th><th>상세내용</th><th>등록날짜</th><th>수정</th>
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
								<input type="hidden" name="loginId" value="${sessionScope.loginId}"/>
								<input type="button" value="수정" id="chkBtn"/>
							</td>
						</tr>
					</c:forEach>
				</table>
			</form>
			</div>
		</div>
		<%@ include file = "/module/footer.jsp" %>
	</body>
</html>