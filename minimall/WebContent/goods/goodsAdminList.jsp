<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c-rt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
		<script>
			$(document).ready(function() {
				$('#chkBtn').click(function() {
					console.log('버튼 클릭');
					$('#chkForm').submit();
					/*
					var chkArray = new Array();
					 if($('.agreeChange:checked').length != 0) {
						console.log($('.agreeChange:checked').length);
						for(var i=0; i<$('.agreeChange:checked').length; i++) {
							chkArray[i] = $('#hiddenGcode').val();
							console.log(chkArray[i]);
							
							
						}
					} else {
						$('#chkHelper').text('승인체크해주세요');
					} */
						
						
					
				});
			});
		</script>
	</head>
	<body>
		<form action="${pageContext.request.contextPath}/Gchk/GoodsAdminChk.go" method="post" id="chkForm">
			<table border="1">
				<tr>
					<th>번호</th><th>상품코드</th><th>상품명</th><th>판매자아이디</th><th>카테고리</th>
					<th>가격</th><th>상세내용</th><th>등록날짜</th><th>승인여부</th><th>승인체크</th>
				</tr>
				<c:forEach var="goods" items="${goodsList}" varStatus="status">
					<tr>
						<td>${status.count}</td>
						<td>${goods.g_code}</td>
						<td>${goods.g_name}</td>
						<td>${goods.g_id}</td>
						<td>${goods.g_cate}</td>
						<td>${goods.g_price}</td>
						<td>${goods.g_sangse}</td>
						<td>${goods.g_date}</td>
						<td>${goods.g_agree}</td>
						<td>
							<c:set var="chk" value="${goods.g_agree}o" />
							<c:if test="${chk eq 'No'}">
		    					<input type="checkbox" name="agreeChange" class="agreeChange" value="${goods.g_code}"/>
		    					<%-- <input type="hidden" value="${goods.g_code}" id="hiddenGcode"/> --%>
		    					<%-- <c:set var="gCodeArray" value="${goods.g_code}" scope="request"/> --%>
		    					<%-- <c:out value="${gCodeArray}"/> --%>
							</c:if>
						</td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan=10>
						<input type="button" value="승인" id="chkBtn"/>
						<span id="chkHelper"></span>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>