<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<table width="100%" border="1">
<tr>
	<td>�̸�</td><td>���̵�</td><td>����</td><td>�̸�</td><td>�̸�
	��</td><td>���Գ�¥</td><td>�ּ�</td><td>����</td><td>����</td>
</tr>

<c:forEach var="member" items="${alm}">

	<tr>
		<td>${member.m_id}</td>
		<td>${member.m_pw}</td>
		<td>${member.m_level}</td>
		<td>${member.m_name}</td>
		<td>${member.m_email}</td>
		<td>${member.m_date}</td>
		<td>${member.m_addr}</td>

		<td>
	<a href="${pageContext.request.contextPath}/member/mUpdateForm.mo?send_id=${member.m_id}">����Ŭ��</a>			
		</td>
		<td>
	<a href="${pageContext.request.contextPath}/member/mDeletePro.mo?send_id=${member.m_id}">����Ŭ��</a>			
		</td>
	</tr>
</c:forEach>
</table>
