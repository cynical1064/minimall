<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�̴ϸ�</title>
<link href="${pageContext.request.contextPath}/css/reset.css"  rel="stylesheet" >
<link href="${pageContext.request.contextPath}/css/style.css"  rel="stylesheet" >
<script src="${pageContext.request.contextPath}/js/jquery-2.1.4.js" type="text/javascript"></script>
<script>
	$(document).ready(function(){
		
		$('#updateBtn').click(function(){
			
			alert('����Ǿ����ϴ�.');
				
			});
			
		});

</script>
</head>
<body>
<jsp:include page="/module/headerSub.jsp" />
<div id="container">
	<div class="content">
		<div id="leftMenuWrap">
			<dl id="leftMenu">
				<dt>����������</dt>
				<c:choose>
					<c:when test="${sessionScope.loginLevel == '������'}">
						<dd><a href="${pageContext.request.contextPath}/Mli/mList.mo">Member</a></dd>
						<dd><a href="${pageContext.request.contextPath}/Glist/goodsAdminList.go">���δ��</a></dd>
						<dd>�Խñ� ����</dd>
					</c:when>
					<c:when test="${sessionScope.loginLevel == '�Ǹ���'}">
						<dd><a href="${pageContext.request.contextPath}/Mup/mUpdateForm.mo">������������</a></dd>
						<dd><a href="${pageContext.request.contextPath}/Glist/goodsSellerList.go">��ϻ�ǰ</a></dd>
						<dd>�Խñ� ����</dd>
					</c:when>
					<c:otherwise>
						<dd><a href="${pageContext.request.contextPath}/Mup/mUpdateForm.mo">������������</a></dd>
						<dd><a href="${pageContext.request.contextPath}/Oli/orderListOne.oo">order</a></dd>
						<dd>�Խñ� ����</dd>
					</c:otherwise>
				</c:choose>
				<dd></dd>
			</dl>
		</div>		
		<div id="myPageContent">
			<div id="joinWarp">
			<form action="${pageContext.request.contextPath}/Mup/mUpdatePro.mo" method="post">			
				<table border="1">
				<tr>
					<td><span class="loginTitleTxt">���̵�</span></td>
					<td><input type="text" name="m_id" size="20" value="${m.m_id}" readonly="readonly"></td>
				<tr>
				<tr>
					<td><span class="loginTitleTxt">��ȣ</span></td>
					<td><input type="password" name="m_pw" size="20"  value="${m.m_pw}"></td>
				<tr>
				<tr>
					<td><span class="loginTitleTxt">����</span></td>					
					<td>
						<c:if test="${m.m_level} == '������'">
							<label for="m_level">������</label><input type="radio" name="m_level" size="20" value="������" checked="checked">
							<label for="m_level">�Ǹ���</label><input type="radio" name="m_level" size="20" value="�Ǹ���">
						</c:if>
						<label for="m_level">������</label><input type="radio" name="m_level" size="20" value="������" >
						<label for="m_level">�Ǹ���</label><input type="radio" name="m_level" size="20" value="�Ǹ���" checked="checked">					
					</td>
				<tr>
				<tr>
					<td><span class="loginTitleTxt">�̸�</span></td>
					<td><input type="text" name="m_name" size="20"  value="${m.m_name}"></td>
				<tr>
				<tr>
					<td><span class="loginTitleTxt">�̸���</span></td>
					<td><input type="text" name="m_email" size="20"  value="${m.m_email}"></td>
				<tr>
				<tr>
					<td><span class="loginTitleTxt">�ּ�</span></td>
					<td><input type="text" name="m_addr" size="20"  value="${m.m_addr}"></td>
				<tr>
				<tr>
					<td colspan="4"><input id="updateBtn" type="submit" value="��������"></td>
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