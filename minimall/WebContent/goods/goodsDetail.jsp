<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/css/reset.css"  rel="stylesheet" >
<link href="${pageContext.request.contextPath}/css/style.css"  rel="stylesheet" >
<script src="${pageContext.request.contextPath}/js/jquery-2.1.4.js" type="text/javascript"></script>
<script>
	$(document).ready(function(){

		$('.goodsDetailTapBtn').eq(0).addClass('on');
		
		$('.goodsDetailTapContent').eq(0).show();
		
		$('.goodsDetailTapBtn').click(function(){
			
			var tapIdx = $('.goodsDetailTapBtn').index(this);	
			
			$('.goodsDetailTapContent').hide();
			
			$('.goodsDetailTapContent').each(function(){
				
				var contentIdx = $('.goodsDetailTapContent').index(this);
				
				if(contentIdx == tapIdx){
					
					$(this).show();
					
				}
				
			});
			
			$('.goodsDetailTapBtn').removeClass('on')
			
			if(!($(this).hasClass('on'))){
				
				$(this).addClass('on');
				
			}			 
			
		});
		
	});
	
	var url = "${pageContext.request.contextPath}/Qna/QnaList.qn";
	
	$.get(url, {page:1}, function(data){
		
		$('#list').html(data);	
	
	});
	
	function getPage(no){
		$.get(url, {page:no}, function(data){
			
			$('#list').html(data);	
			
		});
		
	}
	
	function getNextBlock(no){
		var url = "${pageContext.request.contextPath}/Qna/QnaList.qn";
		$.get(url, {page:no}, function(data){
			
			$('#list').html(data);	
			
		});
		
	}

</script>
</head>
<body>
<jsp:include page="/module/headerSub.jsp" />
<div id="container"> 
	<div class="content">
		<div id="detailContent">
			<div id="detailImgArea">
			
			</div>		
			<div id="orderForm">
				<jsp:include page="/order/orderInsertForm.jsp" />
			</div>
		</div>
		<table class="basic tapTable">
			<colgroup>
				<col width="25%">
				<col width="25%">
				<col width="25%">
				<col width="25%">
			</colgroup>
			<tr>
				<th class="goodsDetailTapBtn">��ǰ����</th>
				<th class="goodsDetailTapBtn">��ǰ����</th>
				<th class="goodsDetailTapBtn">��ǰQ&A</th>
				<th class="goodsDetailTapBtn">�Ǹ���/��ǰ/��ȯ����</th>
			</tr>
			<tr class="goodsDetailTapContent">
				<td colspan="4">
					<div>
						��ǰ����
					</div>
				</td>
			</tr>
			<tr class="goodsDetailTapContent">
				<td colspan="4">
					<div id="reviewTab">
						
					</div>
				</td>
			</tr>
			<tr class="goodsDetailTapContent">
				<td colspan="4">
					<div id="list">
						
					</div>
				</td>
			</tr>
			<tr class="goodsDetailTapContent">
				<td colspan="4">
					<div>
						����
					</div>
				</td>
			</tr>
		</table>
	</div>
</div>	
<jsp:include page="/module/footer.jsp" />	
</body>
</html>