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
					<td>�Ǹ��ھ��̵�</td>
					<td></td>
				</tr>
				<tr>
					<td>��ǰ��</td>
					<td><input type="text" name="gName" size="20"></td>
				</tr>
				<tr>
					<td>ī�װ�</td>
					<td><input type="text" name="gCate" size="20"></td>
				</tr>
				<tr>
					<td>����</td>
					<td><input type="text" name="gPrice" size="20"></td>
				</tr>
				<tr>
					<td>��ǰ�󼼼���</td>
					<td>
						<textarea name="gSangse" rows="5" cols="21"></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="4"><input type="submit" value="��ǰ��Ϲ�ư"></td>
				</tr>
			</table>
		</form>
	</body>
</html>