<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script>
	$(document).ready(function(){
		
		$('#loginBtn').click(function(){
			
			$('#loginWrap').show();
			
		});
		
		$('#loginSumbit').click(function(){
			
			if($('#mId').val()==''){
				
				alert('���̵� �Է����ּ���');
				
			}else if($('#mPw').val()==''){
				
				alert('��й�ȣ�� �Է����ּ���');
				
			}else{
				
				$('#loginForm').submit();
				
			}
			
		})
		
	})
</script>
</head>
<div id="loginWrap">
	<div id="loginContent">
		<div id="loginArea">
			<h2>
				Login
			</h2>
			<form id="loginForm" action="${pageContext.request.contextPath}/mLogin/mLogin.mo" method="post">
			<table>
			<tr>
				<td><label for="mId">���̵�</label></td>
				<td><input type="text" name="mId" id="mId" /></td>
				<td><span></span></td>
			</tr>	
			<tr>
				<td><label for="mPw">��й�ȣ</label></td>
				<td><input type="password" name="mPw" id="mPw"/></td>
				<td><span></span></td>
			</tr>	
			<tr>
				<td colspan="2">
					<div id="loginSumbit" style="cursor:pointer;">
						�α���
					</div>
				</td>
			</tr>	
				
			</table>	
			</form>		
		</div>
	</div>
</div>
<%-- <c:choose>
	<c:when test="${sessionScope.loginLevel == null}">
	<!-- 
		sessionScope�� ���ǿ��� ������ Ȯ�� 
		when���� null�ϰ�� �α��� ����
		null�� �ƴҰ�� �α��� ����	
	-->
		<form action="${pageContext.request.contextPath}/mLogin/mLogin.mo" method="post">
			<input type="text" name="mId" />
			<input type="password" name="mPw" />
			<button type="submit">�α���</button>	
		</form>
	</c:when>
	<c:when test="${sessionScope.loginLevel != null}">
		<span>${sessionScope.loginName}�� ȯ���մϴ�.</span>
		<span><a href="${pageContext.request.contextPath}/logout/logout.mo">�α׾ƿ�</a></span>
	</c:when>
</c:choose>	
<body>
<div>
       <div>
              <ul>
                     <c:choose>
                            <c:when test="${sessionScope.loginLevel=='������'}">
                            	<!-- 
									���ǿ� ��� loginLevel�� ���Ѻ��� �޴�����	
								-->
                                         <!-- ������ �޴����� --> 
                                         <li>������</li>
                                                <a href="${pageContext.request.contextPath}/Min/mInsert.mo">ȸ�����</a>
                                                <a href="${pageContext.request.contextPath}/user/user_list.jsp"> 02ȸ������Ʈ </a>
                                                <a href="${pageContext.request.contextPath}/Gin/goodsInsertForm.go"> 03��ǰ��� </a>
                                                <a href="${pageContext.request.contextPath}/Glist/goodsAdminList.go">��ǰ���(������->��ǰ��ü)</a>
                                                <a href="${pageContext.request.contextPath}/Qna/QnaAddWrite.qn">Q&A</a>
                            </c:when>
                            <c:when test="${sessionScope.loginLevel=='�Ǹ���'}">
                                          <!-- �Ǹ��� �޴����� -->
                                          <li>�Ǹ���</li>
                                                <a href="${pageContext.request.contextPath}/Min/mInsert.mo">ȸ�����</a>
                                                <a href="${pageContext.request.contextPath}/Gin/goodsInsertForm.go">��ǰ���</a>
                                                <a href="${pageContext.request.contextPath}/Glist/goodsAdminList.go">��ǰ���(������->��ǰ��ü)</a>
                                                <a href="${pageContext.request.contextPath}/Qna/QnaAddWrite.qn">Q&A</a>
                            </c:when>
                            <c:when test="${sessionScope.loginLevel=='������'}">
                               <!-- ������ �޴����� -->
                               <li>������</li>
                                                <a href="${pageContext.request.contextPath}/Min/mInsert.mo">ȸ�����</a>
                                                <a href="${pageContext.request.contextPath}/Glist/goodsCustomList.go">��ǰ���(������->����Y)</a>
                            					<a href="${pageContext.request.contextPath}/Qna/QnaAddWrite.qn">Q&A</a>
                            </c:when>
                            <c:otherwise>
                               <!-- �⺻�޴����� -->
                               <li>�⺻�޴�</li>
                                          <a href="${pageContext.request.contextPath}/Glist/goodsCustomList.go">04��ǰ����Ʈ </a>
                                          <a href="${pageContext.request.contextPath}/Qna/QnaAddWrite.qn">Q&A</a>
                            </c:otherwise>
                     </c:choose>
              </ul>
       </div>
</div> --%>
<div id="headerMain">
	<div id="headerContent" class="clearFix">
		<div id="logoWrap">
				<h2><a href="${pageContext.request.contextPath}/index.jsp"><img src="${pageContext.request.contextPath}/img/logo.png" alt="logo"></a></h2>
		</div>
		<div id="itemNavWrap">
			<ul id="itemNav">
				<li><a>NEW ITEM</a></li>
				<li><a href="${pageContext.request.contextPath}/Glist/goodsCustomList.go">SHOP</a></li>
				<li><a>COMMUNITY</a></li>
				<li><a>ABOUT</a></li>
				<li><a href="${pageContext.request.contextPath}/Qna/QnaList.qn">Q&A</a></li> 
				<li><a href="${pageContext.request.contextPath}/Qna/QnaList.qn">CONTACT US</a></li> 
			</ul>
		</div>				
		<div id="loginNavWrap">
		<c:choose>
			<c:when test="${sessionScope.loginLevel == null}">
				<ul id="loginNav">
					<li id="loginBtn" style="cursor:pointer"><a>LOGIN</a></li>
					<li style="cursor:pointer"><a href="${pageContext.request.contextPath}/Min/mInsert.mo">JOIN</a></li>
					<li style="cursor:pointer"><a>ORDER</a></li>
				</ul>
			</c:when>
			<c:when test="${sessionScope.loginLevel != null}">
				<c:choose>
					<c:when test="${sessionScope.loginLevel == '������'}">
						<ul id="loginNav">
							<li style="cursor:pointer"><a><span>${sessionScope.loginName}��(${sessionScope.loginLevel}) ȯ���մϴ�.</span></a></li>
							<li style="cursor:pointer"><a href="${pageContext.request.contextPath}/logout/logout.mo">LOGOUT</a></li>
							<li style="cursor:pointer"><a>MEBER</a></li>
							<li style="cursor:pointer"><a href="${pageContext.request.contextPath}/Glist/goodsAdminList.go">���δ��</a></li>
						</ul>
					</c:when>
					<c:otherwise>
						<ul id="loginNav">
							<li style="cursor:pointer"><a><span>${sessionScope.loginName}��(${sessionScope.loginLevel}) ȯ���մϴ�.</span></a></li>
							<li style="cursor:pointer"><a href="${pageContext.request.contextPath}/logout/logout.mo">LOGOUT</a></li>
							<li style="cursor:pointer"><a>ORDER</a></li>
						</ul>
					</c:otherwise>
				</c:choose>
			</c:when>
		</c:choose>	
		</div>
	</div>
</div>
</body>
</html>