<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<form action="${pageContext.request.contextPath}/Min/m_insert_pro.mo" method="post">

<table border="1">
<tr>
	<td>���̵�</td>
	<td><input type="text" name="m_id" size="20"></td>
<tr>
<tr>
	<td>��ȣ</td>
	<td><input type="password" name="m_pw" size="20"></td>
<tr>
<tr>
	<td>����</td>
	<td><input type="text" name="m_level" size="20"></td>
<tr>
<tr>
	<td>�̸�</td>
	<td><input type="text" name="m_name" size="20"></td>
<tr>
<tr>
	<td>�̸���</td>
	<td><input type="text" name="m_eamil" size="20"></td>
<tr>
<tr>
	<td>���Գ�¥:</td>
	<td><input type="date" name="m_date" size="20"></td>
<tr>
<tr>
	<td>�ּ�:</td>
	<td><input type="text" name="m_addr" size="20"></td>
<tr>
<tr>
	<td colspan="4"><input type="submit" value="ȸ�����Թ�ư"></td>
</tr>
</table>
</form>