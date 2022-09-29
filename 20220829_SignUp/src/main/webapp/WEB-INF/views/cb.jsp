<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js" integrity="sha512-aVKKRRi/Q/YV+4mjoKBsE4x3H+BkegoM/em46NNlCqNTmUYADjBbeNefNxYV7giUp0VxICtqdrbqU7iVaeZNXA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script>

	$(document).ready(function(){
		
		// 전체 선택
		$('.ckAll').on('click', function(){
						
			if($(this).is(':checked')){
				$('#area').empty();
				$('#area').text('서울 인천 경기 강원 부산 대전 전남 제주 평양');
			} else {
				$('#area').empty();
			}
			
			$('.ckOne').prop('checked', $(this).prop('checked'));
		});
		
		// 개별 선택
		$('.ckOne').on('click', function(){
			
			if($(this).is(':checked')){
				$('#area').append(' ' + $(this).val() + ' ');
			} else {
				$('#area').text($('#area').text().replace($(this).val(), ''));
			}
			
			let checkAll = true;
			$.each($('.ckOne'), function(i, item){
				if($(item).is(':checked') == false){
					$('.ckAll').prop('checked', false);
					checkAll = false;
					return;
				}
			});
			
			if(checkAll){
				$('.ckAll').prop('checked', true);
			}
		});
		
		
		// 버튼 클릭
		$('#btn').on('click', function(){
			var ckCnt = $('.ckOne:checked').length;
			if(ckCnt >= 4) {
				alert('성공!');
			} else {
				alert('실패!');
			}
		});
		

	});
	
</script>
</head>
<body>
	
	<input type="checkbox" class="ckAll">전체 <input type="button" id="btn" value="버튼"><br>
	<input type="checkbox" class="ckOne" value="서울"> 서울
	<input type="checkbox" class="ckOne" value="인천"> 인천
	<input type="checkbox" class="ckOne" value="경기"> 경기
	<input type="checkbox" class="ckOne" value="강원"> 강원
	<input type="checkbox" class="ckOne" value="부산"> 부산
	<input type="checkbox" class="ckOne" value="대전"> 대전
	<input type="checkbox" class="ckOne" value="전남"> 전남
	<input type="checkbox" class="ckOne" value="제주"> 제주
	<input type="checkbox" class="ckOne" value="평양"> 평양
	
	<div id="area"></div>
	
</body>
</html>