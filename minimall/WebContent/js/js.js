<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		
		$('#upCount').click(function(){
			
			var count = parseInt($('#count').text());
			
			$('#count').text(count+1);
			
		})
		
		$('#downCount').click(function(){
			
			var count = parseInt($('#count').text());
			
			$('#count').text(count-1);
			
		})
		
	})
</script>