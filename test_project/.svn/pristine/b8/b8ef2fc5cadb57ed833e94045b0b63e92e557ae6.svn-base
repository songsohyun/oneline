<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.3.1.js"/>"></script>
<script type="text/javascript">

$(function() {
	
	
	//아이디 중복 체크
	$('#idCheck').click(function(){
		
		var id = $('#id').val();
		
		if('test' == id){
			alert('중복된 아이디입니다. 다시 입력해주세요');
			$('#id').val('');
		} else if(id == ''){
			alert('아이디를 입력해주세요.');
		} else {
			alert('사용가능한 아이디입니다.');
		}
	});
	
	$('#commit').click(function(){
		
		var id = $('#id').val();
		
		var password = $('#password').val();
		var passwordConf = $('#passwordConf').val();
		
		var email = $('#email1').val()+'@'+$('#email2').val();
		var emailPattern = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
		
		var address = $('#address').val();
		var pattern = /^[ㄱ-ㅎ|가-힣|a-z|A-Z|0-9|\*]+$/;
		
		
		if(id == ''){
			alert('아이디를 입력하세요.');
		} else if(password == ''){
			alert('암호를 입력하세요.');
		} else if(password != passwordConf){
		//비밀번호 중복 체크
			alert('암호가 일치하지 않습니다. 다시 확인해주세요.');
		} else if(!emailPattern.test(email)) {
		//이메일 형식 체크
			alert('이메일 주소를 다시 확인해주세요.');
		} else if(!pattern.test(address)){
		//주소 특문 제외
			alert('주소는 문자와 숫자만 사용가능합니다.');
		}
	});
	
	$('#name').keyup(function(){
		var name = $('#name').val();
		var pattern = /^[ㄱ-ㅎ|가-힣|a-z|A-Z|\*]+$/;
		//이름 길이 제한
		if(name.length > 5 || name.length == 0){
			alert('이름이 너무 길거나 짧습니다. 다시 입력하세요.')
			$('#name').val('');
		}
		//특문 제외
		if(!pattern.test(name)){
			alert('한글 또는 영문만 사용가능합니다.');
			$('#name').val('');
		}
	});
	
	//전화번호 포커스 이동
	$( "#phoneNum2" ).on( "keyup" ,function () {
	    var mch = $( this ).val().match( /[0-9]/g )
	    if ( mch != null && mch.length == 4 ) {
	        $( "#phoneNum3" ).focus();
	    }
	} );
	
	//다시입력
	$('#reWrite').click(function(){
		$('#joinForm')[0].reset();
	});
	
	$( "#socialNum2" ).on( "keyup" ,function () {
	    var socialNum2 = $( this ).val();
	    var firstNum = socialNum2.substring(0,0);
	    var star='';
	    if (socialNum2.length >= 2 ) {
	    	
	    	for(var i=1; i<socialNum2.length; i++){
	    		star+='*';
	    	}
	        $(this).val(firstNum+star);
	    }
	} );
	

});
</script>
<title>회원가입</title>
</head>

<body>
<form id="joinForm">
id: <input type="text" id="id" name="id"><input type="button" id="idCheck" name="idCheck" value="중복체크">
<br>
비밀번호: <input type="password" id="password" name="password">
<br>
비밀번호 확인: <input type="password" id="passwordConf" name="passwordConf">
<br>
이름: <input type="text" id="name" name="name">
<br>
이메일: <input type="text" id="email1" name="email1">@<input type="text" id="email2" name="email2">
<br>
휴대폰: 
<select id="phoneNum1">
	<option value="010" selected="selected">010</option>
	<option value="011">011</option>
	<option value="016">016</option>
</select>
-
<input type="text" id="phoneNum2" name="phoneNum2" size="4" maxlength="4">
-
<input type="text" id="phoneNum3" name="phoneNum3" size="4" maxlength="4">
<br>
성별: <input type="radio" id="sex" name="sex" value="male">남자
<input type="radio" id="sex" name="sex" value="female">여자
<br>
주민번호: <input type="text" id="socialNum1" name="socialNum1" size="6" maxlength="6">
-
<input type="text" id="socialNum2" name="socialNum2" size="7" maxlength="7">
<br>
주소: <input type="text" id="address" name="address">
<br>
*주소는 (시/도)만 입력해주세요(예:경기도, 서울특별시, 경상남도 등)
<br>
<input type="button" id="commit" name="commit" value="가입신청">
<input type="button" id="reWrite" name="reWrite" value="다시입력">
<input type="button" id="cancel" name="cancel" value="취소">
</form>
</body>
</html>