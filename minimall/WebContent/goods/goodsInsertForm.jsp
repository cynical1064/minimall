<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<form action="${pageContext.request.contextPath}/Gin/goodsInsertPro.go" method="post">
			<table border="1">
				<tr>
					<td>판매자아이디</td>
					<td></td>
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
					<td colspan="4"><input type="submit" value="상품등록버튼"></td>
				</tr>
			</table>
		</form>
	</body>
</html>