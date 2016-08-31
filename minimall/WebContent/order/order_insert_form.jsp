<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script>
$(document).ready(function(){
	
	$('#upCount').click(function(){
		
		var count = parseInt($('#count').text());
		
		$('#count').text(count+1);
		
	})
	
	$('#downCount').click(function(){
		
		var count = parseInt($('#count').text());
		
		if($('#count').text > 0){
		
		$('#count').text(count-1);
		
		}
		
	});
	
});
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<form action="" method="post">

<div>
<input type="text" name="amount" value="">
<span id="upCount">▲</span><span id="douwnCount">▼</span>
</div>

<input type="button" value="구매">
</form>
</body>
</html>