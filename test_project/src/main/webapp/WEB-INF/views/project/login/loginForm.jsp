<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common.jspf" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/WEB-INF/views/common2.jspf" %>
<script type="text/javascript">
$(function(){
	$('#loginBtn').click(function(){
		
		var userInfo = $('#loginForm').serialize();
		var id = $('#id').val();
		var password = $('#password').val();
		check(id, password);
		
		$.ajax({
	        url:"/start/login",
	        type:'post',
	        data: userInfo,
	        success:function(data){
	            if(data == 'true') {
	            	alert('로그인 되었습니다.');
	            	$("#loginForm").attr("action", '/start/list');
	        		$("#loginForm").attr("method", "post");
	        		$("#loginForm").submit();
	            } else{
	            	alert('아이디 또는 비밀번호를 확인해주세요.');
	            	$('#id').val('');
	            	$('#password').val('');
	            	$('#id').focus();
	            	return;
	            } 
	        },
	        error:function(jqXHR, textStatus, errorThrown){
	            alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);
	            self.close();
	        }
	    });
		
	});
	
});
function check(id, password){
	if(id =='' || id == null){
		alert('아아디를 입력하세요.');
		$('#id').focus();
		throw '';
		
	} else if(password =='' || password == null){
		alert('패스워드를 입력하세요.');
		$('#password').focus();
		throw '';
	}
	
}

</script>
<title>로그인</title>
<style type="text/css">
	.out {
 width: 100%;
 text-align: center;
 padding:20px;
 margin: 15px;
 }
.in {
 display: inline-block;
 width: 50%;
 height: 100px;
 }
	}
</style>
</head>
<body>
하잇!
<div class="out">
    <div class="in">
 <form id="loginForm">
	<b>로그인</b><br>
	아이디: <input type="text" name="id" id="id"><br>
	비밀번호: <input type="password" name="password" id="password"><br>
	<input type="button" id="loginBtn" value="로그인">
</form>
 	</div>
 </div>
</body>
</html>