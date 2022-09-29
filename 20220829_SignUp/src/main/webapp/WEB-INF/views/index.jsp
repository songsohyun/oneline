<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	* {
		margin: 1px;
		padding: 1px;
		font-size: 12px;
	}
	hr {
		width: 90%;
	}
	#signUp_top {
		padding-top: 20px;
		padding-bottom: 20px;
	}
	#signUp_info {
		padding-top: 50px;
		padding-left: 100px;
	}
	.info {
		margin-bottom: 20px;
	}
	input[type="text"] {
		height: 10px;
	}
	input[type="button"] {
		height: 20px;
	}
	input[type="radio"] {
		width: 10px;
		height: 10px;
	}
	.signUp_btns {
		padding-top: 30px;
		width: 90%;
		text-align: center;
	}
</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js" integrity="sha512-aVKKRRi/Q/YV+4mjoKBsE4x3H+BkegoM/em46NNlCqNTmUYADjBbeNefNxYV7giUp0VxICtqdrbqU7iVaeZNXA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script>

	$(document).ready(function(){
		
		$('#idCheck').on('click', function(){
			var regId= /^[a-zA-Z0-9]{1,}$/;
			
			if($('#id').val() == ''){
				alert('아이디 입력하세요');
				$('#id').focus();
			} else if($('#id').val() == 'test'){
				alert('test라는 아이디는 이미 존재합니다.');
				$('#id').val('');
			} else if(regId.test($('#id').val()) == false){
				alert('실패!');
				$('#id').val('');
			} else {
				alert('성공!');
				$('#id').prop('disabled', true);
			}
		});
		
		
		var regNum1 = /^[0-9]{6}$/;
		var regNum2 = /^[0-9]{7}$/;
		$('#num1').on('keyup', function(){
			if($(this).val().length > 7 && regNum1.test($(this).val()) == false){
				alert('생년월일을 숫자 6자리로 입력하세요');
				$(this).val('');
			} else if($(this).val().length > 7 && regNum1.test($(this).val()) == false){
				alert('생년월일을 숫자 6자리로 입력하세요');
				$(this).val('');
			} else if($(this).val().length == 6){
				$('#num2').focus();
			}
		});
		
		
		// 안풀림, 주민번호
		$('#num2').on('keyup', function(){
			
			// 주민번호 뒷자리 히든 value에 넣기
			var num2 = $(this).val();
			var juminOne = num2.charAt(num2.length - 1);
			$('#num3').val($('#num3').val() + juminOne);
			
			// 주민번호 뒷자리 마스킹
			if(num2.length > 1){
				$('#num2').val(num2.slice(0, -1) + '*');
			} 
			
		});
		
		
		$('#btn_signUp').on('click', function(){
			
			var email = $('#email1').val() + "@" + $('#email2').val();
			var regEmail = /^[a-zA-Z0-9_]*@[a-zA-Z]{1,}(\.[a-zA-Z]{2,})$/;
			
			if($('#pw_check').val() == '' || $('#pw_dCheck').val() == '' || $('#email1').val() == '' || $('#email2').val() == '' || $('#num1').val() == '' || $('#num2').val() == ''){
				alert('전부 입력해주세요');
			} else if($('#pw_check').val() != $('#pw_dCheck').val()){
				alert('비밀번호 재입력해주세요.');
				$('#pw_check').val('');
				$('#pw_dCheck').val('');
			} else if(regEmail.test(email) == false){
				alert('이메일 재입력해주세요.');
			} else if(regNum1.test($('#num1').val()) == false) {
				alert('숫자만 입력하세요.');
				$('#num1').val('');
			} /* else if(regNum1.test($('#num1').val())){
				$('#num2').focus();
			} */ else {
				alert('성공!');
			}
			
		});
		
		
		
		$('#name').on('keyup', function(){
			var regName = /^[a-zA-Z가-힣]{1,5}$/;
			var nameStr = $(this).val();
			if($(this).val().length > 6 && regName.test(nameStr) == false) {
				alert('영문, 한글로 5글자까지만 입력 가능합니다.');
				$(this).val('');
				// $(this).val().slice(0, 5);
			} else if($('#name').val().length > 6 && regName.test(nameStr)){
				alert('5글자까지만 입력 가능합니다.');
				$(this).val('');
			}
		});
		
		
		var regPhone = /^[0-9]{4}$/;
		$('#phone1').on('keyup', function(){
			
			if($(this).val().length == 5 && regPhone.test($(this).val()) == false){
				alert('숫자 4자리로 입력하세요');
				$(this).val('');
			} else if($(this).val().length == 4 && regPhone.test($(this).val())){
				$('#phone2').focus();
			}
		});
		
		
		$('#phone2').on('keyup', function(){
			if($(this).val().length == 5 && regPhone.test($(this).val()) == false){
				alert('숫자 4자리로 입력하세요');
				$(this).val('');
			}
		});
		
		$('#btn_reset').on('click', function(){
			$(':text').val('');
			$(':password').val('');
			$(':radio').prop('checked', false);
		});
		
		
	});

</script>
</head>
<body>
	
	<div id="signUp_top">회원가입</div>
	
	<hr>
	
	<div id="signUp_info">
		<div class="info">
			ID : <input type="text" id="id" size="10"> <input type="button" id="idCheck" value="중복체크">	
		</div>
		<div class="info">
			비밀번호 : <input type="password" id="pw_check" size="10">
		</div>
		<div class="info">
			비밀번호 확인 : <input type="password" id="pw_dCheck" size="10">
		</div>
		<div class="info">
			이름 : <input type="text" id="name" size="10">
		</div>
		<div class="info">
			이메일 : <input type="text" id="email1" size="10">@<input type="text" id="email2" size="10">
		</div>
		<div class="info">
			휴대폰 : 
			<select>
				<option value="010">010</option>
				<option value="011">011</option>
				<option value="016">016</option>
				<option value="017">017</option>
				<option value="019">019</option>
			</select>
			-
			<input type="text" id="phone1" size="5"> - <input type="text" id="phone2" size="5">
		</div>
		<div class="info">
			성별 : <input type="radio" name="gender" id="m" value="m"> <label for="m">남자</label>&nbsp;&nbsp;&nbsp;<input type="radio" name="gender" id="f" value="f"> <label for="f">여자</label>
		</div>
		<div class="info">
			주민번호 : <input type="text" id="num1" size="12"> - <input type="text" id="num2" size="12">
			<input type="hidden" id="num3">
 		</div>
		<div>
			주소 : <input type="text" size="12"><br>
			*주소는 (시/도)만 입력해주세요 (예: 경기도, 서울특별시, 경상남도 등)<br>
		</div>
	</div>
	
	<hr>
	
	<div class="signUp_btns">
		<input type="button" id="btn_signUp" value="가입신청">
		<input type="button" id="btn_reset" value="다시입력">
		<input type="button" value="취소">
	</div>
	
	
</body>
</html>