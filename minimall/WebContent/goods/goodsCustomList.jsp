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
				<div id="customSortWarp" class="clearFix">
					<h3>SHOP</h3>
					<ul id="sortList">
						<li>낮은가격 <span>▲</span></li>
						<li>높은가격 <span>▼</span></li>
						<li>최신순</li>
					</ul>
				</div>			
					<c:set var="listChk" value="${goodsList}" />
					<c:choose>
						<c:when test="${listChk eq null}">
							<div>
								<p>등록된 상품이 없습니다.</p>
							</div>
						</c:when>						
						<c:when test="${listChk ne null}">
						<ul id="customListWrap" class="clearFix">
							<c:forEach var="goods" items="${goodsList}" varStatus="status">
								<li>
									<a href="${pageContext.request.contextPath}/Gdetail/goodsDetailAction.go?gCode=${goods.g_code}">
										<%-- <span>${status.count}</span> --%>
										<p><img id="customImage" src="data:image/${gImageType[status.index]};base64, ${b64[status.index]}" alt="image not found" /></p>
										<p><span>상품명 : </span>${goods.g_name}</p>
										<p><span>판매자 : </span>${goods.g_id}</p>
										<p><span>가격 : </span>&#8361; ${goods.g_price}</p>
									</a>
								</li>	
							</c:forEach>
						</ul>	
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