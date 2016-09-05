<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<script type="text/javascript">
			function modifygoods(){
				modifyform.submit();
			}
		</script>
	</head>
	<body>
		<%@ include file = "/module/headerSub.jsp" %>
		<form action="${pageContext.request.contextPath}/Gup/GoodsUpdateAtion.go" method="post" name="modifyform">
			<table>
				<tr>
					<td colspan=6><h2 align="center">수정하기</h2></td>
				</tr>
				<tr>
					<td style="font-family:돋음; font-size:12" height="16">
						<div align="center">카테고리</div>
					</td>
					<td style="font-family:돋음; font-size:12">
						<input name="gCate" type="text" size="40" maxlength="30" value="${goods.gCate}"/>
					</td>
				</tr>
				<tr>
					<td style="font-family:돋음; font-size:12" height="16">
						<div align="center">상품명</div>
					</td>
					<td style="font-family:돋음; font-size:12">
						<input name="gName" type="text" size="40" maxlength="30" value="${goods.gName}"/>
					</td>
				</tr>
				<tr>
					<td style="font-family:돋음; font-size:12" height="16">
						<div align="center">가격</div>
					</td>
					<td style="font-family:돋음; font-size:12">
						<input name="gPrice" type="text" size="40" maxlength="30" value="${goods.gPrice}"/>
					</td>
				</tr>			
				<tr>
					<td style="font-family:돋음; font-size:12" height="16">
						<div align="center">상품상세설명</div>
					</td>
					<td style="font-family:돋음; font-size:12">
						<textarea name="gSangse" rows="8" cols="45">${goods.gSangse}</textarea>
					</td>
				</tr>
							
				<tr bgcolor="cccccc">
					<td colspan="2" style="height:1px;">
					</td>
				</tr>
				
				<tr>
					<td colspan="2">&nbsp;%nbsp;<input type="hidden" name="gCode" value="${goods.gCode}"/></td>
				</tr>
		
				<tr align="center" valign="middle">
					<td colspan="2">
						<font size=2>
							<a href="javascript:modifygoods()">[수정]</a>&nbsp;&nbsp;
							<a href="javascript:history.go(-1)">[뒤로]</a>&nbsp;&nbsp;
						</font>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>