<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<link href="${pageContext.request.contextPath}/css/reset.css"  rel="stylesheet" >
		<link href="${pageContext.request.contextPath}/css/style.css"  rel="stylesheet" >
		<script src="${pageContext.request.contextPath}/js/jquery-2.1.4.js" type="text/javascript"></script>
		<script>
			function modifygoods(){
				modifyform.submit();
			}
		</script>
	</head>
	<body>
		<%@ include file = "/module/headerSub.jsp" %>
		<div id="container">
			<div class="content">
				<form action="${pageContext.request.contextPath}/Gup/GoodsUpdateAtion.go" method="post" name="modifyform">
					<table class="basic">
						<tr>
							<td colspan=6><h2 align="center">수정하기</h2></td>
						</tr>
						
						<c:forEach var="goods" items="${goodsDto}">
							<tr>
								<td>카테고리</td>
								<td><input name="gCate" type="text" size="40" maxlength="30" value="${goods.g_cate}"/></td>
							</tr>
							<tr>
								<td>상품명</td>
								<td><input name="gName" type="text" size="40" maxlength="30" value="${goods.g_name}"/></td>
							</tr>
							<tr>
								<td>가격</td>
								<td><input name="gPrice" type="text" size="40" maxlength="30" value="${goods.g_price}"/></td>
							</tr>
							<tr>
								<td>상품상세설명</td>
								<td><input type="hidden" name="gCode" value="${goods.g_code}"/>
									<textarea name="gSangse" rows="8" cols="45">${goods.g_sangse}</textarea>
								</td>
							</tr>
						</c:forEach>
						<tr>
							<td colspan="2">
								<a href="javascript:modifygoods()">[수정]</a>&nbsp;&nbsp;
								<a href="javascript:history.go(-1)">[뒤로]</a>&nbsp;&nbsp;
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
		<%@ include file = "/module/footer.jsp" %>
	</body>
</html>