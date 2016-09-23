<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>미니몰</title>
		<link href="${pageContext.request.contextPath}/css/reset.css"  rel="stylesheet" >
		<link href="${pageContext.request.contextPath}/css/style.css"  rel="stylesheet" >
	</head>
	<body>	
		<jsp:include page="/module/headerSub.jsp" />
		<div id="container">
			<div class="content">
				<table class="basic">
					<tr>
						<th>번호</th><th>이미지</th><th>상품명</th><th>판매자아이디</th><th>카테고리</th><th>가격</th><th>등록날짜</th>
					</tr>
					<c:set var="listChk" value="${goodsList}" />
					<c:choose>
						<c:when test="${listChk eq null}">
							<tr>
								<td colspan=7>등록된 상품이 없습니다.</td>
							</tr>
						</c:when>
						<c:when test="${listChk ne null}">
							<c:forEach var="goods" items="${goodsList}" varStatus="status">
								<tr>
									<td>${status.count}</td>
									<td><img id="customImage" src="data:image/${gImageType[status.index]};base64, ${b64[status.index]}" alt="image not found" width="50px" height="50px"/></td>
									<td><a href="${pageContext.request.contextPath}/Gdetail/goodsDetailAction.go?gCode=${goods.g_code}">${goods.g_name}</a></td>
									<td>${goods.g_id}</td>
									<td>${goods.g_cate}</td>
									<td>${goods.g_price}</td>
									<td>${goods.g_date}</td>
								</tr>
							</c:forEach>
							<tr>
								<td colspan=7>
									<c:choose>
										<c:when test="${page <= 1}">
											[이전]&nbsp;
										</c:when>
										<c:otherwise>
											<a href="${pageContext.request.contextPath}/Glist/goodsCustomList.go?page=${page-1}">[이전]</a>&nbsp;
										</c:otherwise>
									</c:choose>
									<c:forEach begin="${startPage}" end="${endPage}" varStatus="status">
										<c:choose>
											<c:when test="${status.count == page}">
												[${status.count}]
											</c:when>
											<c:otherwise>
												<a href="${pageContext.request.contextPath}/Glist/goodsCustomList.go?page=${status.count}">[${status.count}]</a>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</td>
							</tr>
						</c:when>
					</c:choose>
				</table>
			</div>
		</div>
		<jsp:include page="/module/footer.jsp" />
	</body>
</html>