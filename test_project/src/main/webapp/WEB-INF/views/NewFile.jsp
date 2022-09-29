<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.3.1.js"/>"></script>
<script type="text/javascript">


//아이디 중복 체크
$(function() {
	
	$('#idCheck').click(function(){
		var id = $('#id').val();
		var idStr = '#id';
//		var idReg1 = /^[가-힣]+$/;
		var idReg2 = /^[가-힣a-zA-Z0-9]+$/;
		wordCheck(id, idReg2, idStr);
		return;
	});
	
	$('#name').keyup(function(){
		var name = $('#name').val();
		var nameStr = '#name';
		var idReg2 = /^[ㄱ-ㅎ가-힣a-zA-Z]+$/;
		wordCheck(name, idReg2, nameStr);
		
		if(name.length > 5){
			$('#name').val(name.substring(0, 5));
			alert('최대 5자 까지 가능합니다.');
		}
	});
	
	$('#commit').click(function(){
		var check = true;
		
		validate(check);
		var emailRegExp = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
		var email = $('#email1').val()+'@'+$('#email2').val();
		if(!check){
			if($('input[name=password]').val() != $('input[name=passwordConf]').val()){
				alert('암호가 일치하지 않습니다. 다시입력하세요.');
				return;
			}
			
			if($('input[name=password]').val() != $('input[name=passwordConf]').val()){
				alert('암호가 일치하지 않습니다.');
				return;
			}
			
			if(!emailRegExp.test(email)){
				alert('올바른 형식의 이메일주소를 입력하세요.');
			}
		}
	});
	
	$('#reWrite').click(function(){
		document.getElementById("joinForm").reset();
	});
	
	
});

function validate(check){
	
	if($('#id').val() == ''){
		alert('아이디를 입력하세요.');
		check = false;
	} else if($('#password').val() == ''){
		alert('암호를 입력하세요.');
		check = false
	} else if($('#passwordConf').val() == ''){
		alert('암호확인을 입력하세요.');
		check = false
	} else if($('#name').val() == ''){
		alert('이름을 입력하세요.');
		check = false
	} else if($('#email1').val() == '' || $('#email2').val() == ''){
		alert('이메일을 입력하세요.');
		check = false
	} else if($('#email1').val() == '' || $('#email2').val() == ''){
		alert('이메일을 입력하세요.');
		check = false
	}
}

function wordCheck(text, regExp, str){
	if(!regExp.test(text)) {
		$(str).val('');
		$(str).focus();
		alert('올바른 값을 입력하세요.');
		return false;
	}
}
</script>
<title>test</title>
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