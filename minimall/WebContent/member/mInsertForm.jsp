<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">	
	<title>�̴ϸ�</title>	
	<link href="${pageContext.request.contextPath}/css/reset.css"  rel="stylesheet" >
	<link href="${pageContext.request.contextPath}/css/style.css"  rel="stylesheet" >
	<script src="${pageContext.request.contextPath}/js/jquery-2.1.4.js" type="text/javascript"></script>
</head>

<body>
<jsp:include page="/module/headerSub.jsp"  flush="false" />
<div id="container" >
	<div class="content" >
		<div id="joinWarp">
			<form action="${pageContext.request.contextPath}/Min/mInsertPro.mo" method="post">			
				<table border="1">
				<tr>
					<td><span class="loginTitleTxt">���̵�</span></td>
					<td><input type="text" name="m_id" size="20" placeholder="���̵�"></td>
				<tr>
				<tr>
					<td><span class="loginTitleTxt">��ȣ</span></td>
					<td><input type="password" name="m_pw" size="20" placeholder="��й�ȣ"></td>
				<tr>
				<tr>
					<td><span class="loginTitleTxt">����</span></td>					
					<td>
						<label for="m_level">������</label><input type="radio" name="m_level" size="20" value="������">
						<label for="m_level">�Ǹ���</label><input type="radio" name="m_level" size="20" value="�Ǹ���">
					</td>
				<tr>
				<tr>
					<td><span class="loginTitleTxt">�̸�</span></td>
					<td><input type="text" name="m_name" size="20" placeholder="�̸�"></td>
				<tr>
				<tr>
					<td><span class="loginTitleTxt">�̸���</span></td>
					<td><input type="text" name="m_email" size="20" placeholder="�̸���"></td>
				<tr>
				<tr>
					<td><span class="loginTitleTxt">�ּ�</span></td>
					<td><input type="text" name="m_addr" size="20" placeholder="�ּ�"></td>
				<tr>
				<tr>
					<td colspan="4"><input type="submit" value="ȸ�����Թ�ư"></td>
				</tr>
				</table>
			</form>
		</div>	
	</div>
</div>
<%@ include file = "/module/footer.jsp" %>
</body> 
</html>