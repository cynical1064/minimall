<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
			<div class="boardArea">
				<div class="boardWrap">
					<form action="${pageContext.request.contextPath}/Gin/goodsInsertPro.go" method="post" enctype="multipart/form-data">
						<table class="basic">
							<tr>
								<td>판매자아이디</td>
								<td>
									<input type="hidden" name="gId" size="20" value="${sessionScope.loginId}">
									${sessionScope.loginId}
								</td>
							</tr>
							<tr>
								<td>상품명</td>
								<td><input type="text" name="gName" size="20"></td>
							</tr>
							<tr>
								<td>카테고리</td>
								<td><input type="text" name="gCate" size="20"></td>
							</tr>
							<tr>
								<td>가격</td>
								<td><input type="text" name="gPrice" size="20"></td>
							</tr>
							<tr>
								<td>상품상세설명</td>
								<td>
									<textarea name="gSangse" rows="5" cols="21"></textarea>
								</td>
							</tr>
							<tr>
								<td>사진</td>
								<td>
									<input type="file" name="myImage" accept="image/*" />
								</td>
							</tr>
							<tr>
								<td colspan="4"><input type="submit" value="상품등록버튼"></td>
							</tr>
						</table>
					</form>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="/module/footer.jsp" />
	</body>
</html>