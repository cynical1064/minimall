<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/css/reset.css"  rel="stylesheet" >
<link href="${pageContext.request.contextPath}/css/style.css"  rel="stylesheet" >
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		
		$('.delLink').click(function(){
			var idx = $('.delLink').index(this);
			$('.hiddenTd').eq(idx).css('display', 'block');
			$('#hiddenTh').css('display', 'block');
			
		});		
				
	});
		
	
</script>
</head>
<c:if test="${sessionScope.goodsChk}==1">
<script>
	alert('비밀번호가 일치하지 않습니다.');
</script>
</c:if>
<%-- <div id="delWarp">
	<div id="loginContent">
		<span id="closeDelWrap">
			X
		</span>
		<div id="loginArea">		
			<h2>
				본인 확인을 위해 비밀번호를 입력해 주세요
			</h2>
			<form id="delForm" action="${pageContext.request.contextPath}/Odel/orderDeletePro.oo?oNo=${order.o_no}" method="post">
			<table>
			<tr>
				<td><label for="mPw">비밀번호</label></td>
				<td><input type="password" name="mPw" id="mPw"/></td>
				<td><span></span></td>
			</tr>	
			<tr>
				<td colspan="2">
					<div id="delSubmit" style="cursor:pointer;">
						주문취소
					</div>
				</td>
			</tr>				
			</table>	
			</form>		
		</div>
	</div>
</div>
</head> --%>
<body>
<jsp:include page="/module/headerSub.jsp"/>
<div id="container"> 
	<div class="content">
		<table class="basic">
			<tr>
				<th>주문 번호</th><th>상품 이름</th><th>구매자 아이디</th><th>판매자 아이디</th><th>구매자 이름</th><th>배송지</th><th>주문 날짜</th><th>상품 코드</th><th>가격</th><th>수량</th><th>합계</th><th>주문 상태</th><th>주문 취소</th><th id="hiddenTh" style="display:none;">취소 확인</th>
			</tr>
			<c:forEach var="order" items="${orderListOne}">
				<tr>
					<td>${order.o_no}</td>
					<td>${order.g_name}</td>
					<td>${order.m_id}</td>
					<td>${order.g_id}</td>
					<td>${order.m_name}</td>
					<td>${order.m_addr}</td>
					<td>${order.o_date}</td>
					<td>${order.g_code}</td>
					<td>${order.g_price}</td>
					<td>${order.o_count}</td>
					<td>${order.o_total}</td>
					<td>${order.o_state}</td>
					<td class="hiddenTd" style="display:none;"> 비밀번호 확인 : <input type="password" id="delPw" size="10px"></td>
					<td><input type="button" class="delLink" value="주문취소"></td>
					
				</tr>
			</c:forEach>
		</table>	
	</div>
</div>	
<jsp:include page="/module/footer.jsp" />
</body>
</html>