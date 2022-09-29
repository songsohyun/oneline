<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	회원가입
	<hr>
	<form action="">
	ID : <input type="text" oninput="handleOnInput_ID(this)" id="id"> <input type="button" value="중복체크" onclick="id_check()"><br>
	비밀번호 : <input type="password" id="pw"><br>
	비밀번호 확인 : <input type="password" id="pw_check"><br>
	<span id="pw_true" style="color:blue">비밀번호가 일치합니다</span>
	<span id="pw_false" style="color:red">비밀번호가 일치하지않습니다.</span>
	이름 : <input type="text" id="name" oninput = "handleOnInput_NAME(this)"><br>
	<span id="nameCheck" style="color:red">이름은 5글자까지</span>
	이메일  : <input type="text">@<input type="text" id="email"><br>
	휴대폰 : <select>
		<option>010</option>
		<option>011</option>
		<option>016</option>
		<option>017</option>
		<option>019</option>
	</select>
	<input type="text" id="phone_first" oninput="phone_check(this)">-<input type="text" id="phone_last"><br>
	성별 : <input type="radio">남자  <input type="radio">여자 <br>
	주민번호 : <input type="text" id="joomin_first" oninput="joomin_check(this,6)">-<input type="text" id="joomin_last" oninput="joomin_check(this, 7)"><br>
	주소 : <input type="text"><br>
	*주소는 (시/도)만 입력해주세요 (예: 경기도, 서울특별시, 경상남도 등) <br>
	<hr>
	<input type="button" value="가입신청" onclick="pwCheck()"> <input type="reset" value="다시입력"><input type="button" value="취소">
	</form>
	
	<a href="./board.do">dddd</a>
	
	
	
	
	<script type="text/javascript">

		const pw_true = document.getElementById("pw_true");
		const pw_false = document.getElementById("pw_false");
	
		const pw = document.getElementById("pw");
		const pw_check = document.getElementById("pw_check");
		
		const name = document.getElementById("name");
		const nameCheck = document.getElementById("nameCheck");
		
		const phone_first = document.getElementById("phone_first");
		const phone_last = document.getElementById("phone_last");
		
		const joomin_first = document.getElementById("joomin_first");
		let joomin_last = document.getElementById("joomin_last");
		
		const id = document.getElementById("id");
		const email = document.getElementById("email");
		
		pw_true.style.display = 'none';
		pw_false.style.display = 'none';
		nameCheck.style.display = 'none';
		
		function id_check(){
			if(id.value == 'test'){
				alert("중복입니다.");
			}
		}
		
		function handleOnInput_ID(e)  {
			  e.value = e.value.replace(/[^A-Za-z0-9]/ig, '')
		}
		
		function handleOnInput_NAME(e)  {
			  e.value = e.value.replace(/[^A-Za-zㄱ-ㅎㅏ-ㅣ]/ig, '')
			  if(name.value.length > 5){
				  nameCheck.style.display = 'block';
			  }else{
				  nameCheck.style.display = 'none';
			  }
		}
		
		function pwCheck(){
			if(pw.value == pw_check.value){
				pw_true.style.display = 'block';
				pw_false.style.display = 'none';
			}else{
				pw_false.style.display = 'block';
				pw_true.style.display = 'none';
			}
			
		var emailRule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		
		if(!emailRule.test(email.value)) {
			alert("이메일 형식이 일치하지 않습니다.")
		}else{
			alert("이메일 형식이 일치합니다.")
		}
		}

		function phone_check(e) {
			e.value = e.value.replace(/[^1-9]/ig, '')
			if (phone_first.value.length > 3) {
				phone_last.focus();
			}
		}

		function joomin_check(e, maxlength) {
			if (e.value.length > maxlength) {
				e.value = e.value.substr(0, maxlength);
			}
			console.log(joomin_last.value)
			joomin_last.value = joomin_last.value.replace(/(?<=.{1})./gi, "*");
		}
		
		
	</script>
</body>
</html>