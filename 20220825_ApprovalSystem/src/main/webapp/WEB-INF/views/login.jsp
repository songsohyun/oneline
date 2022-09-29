<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>LoginPage</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<style type="text/css">
	*{
	    margin: 0;
	    padding: 0;
	    box-sizing: border-box;
	}
	
	#loginBox{
	    margin: 20px auto;
	    width: 300px;
	    height: 200px;
	    background-color: #ddd;
	    text-align: center;
	}
	
	#idBox label, #pwBox label{
	    display: inline-block;
	    width: 90px;
	    height: 30px;
	    text-align: right;
	}
	
	#idBox {
	    margin-top: 20px;
	}
	
	#loginBtn{
	    margin-top: 20px;
	    width: 90px;
	    height: 30px;
	}
	
	#idBox input, #pwBox input{
	    height: 30px;
	    padding-left: 7px;
	}
	
	#pwBox label{
	    margin-top: 7px;
	}
	
	#loginText{
	    display: block;
	    margin-top: 9px;
	    font-size: 30px;
	    font-weight: bold;
	}
</style>

</head>
<body>
	<div id="container">
        <div id="loginBox">
            <p id="loginText">L O G I N</p>
            <form action="login" method="post">
	            <div id="idBox">
	                <label for="id">아이디 :</label>
	                <input type="text" placeholder="아이디를 입력하세요" id="id" name="empId">
	            </div>
	            <div id="pwBox">
	                <label for="pw">비밀번호 :</label>
	                <input type="password" placeholder="비밀번호를 입력하세요" id="pw" name="empPw">
	            </div>
	            <div id=alertArea></div>
	            <input type="submit" value="로그인" id="loginBtn">
            </form>
        </div>
    </div>
</body>
</html>