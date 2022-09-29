<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js" integrity="sha512-aVKKRRi/Q/YV+4mjoKBsE4x3H+BkegoM/em46NNlCqNTmUYADjBbeNefNxYV7giUp0VxICtqdrbqU7iVaeZNXA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<style>
	#signIn_wrap {
		width: 300px;
		margin: 0 auto;
		margin-top: 50px;
	}
	#btnLogin {
		text-align: center;
	}
</style>
<script>

	$(function(){
		fnSignIn();
	});
	
	
	function fnSignIn(){
		$("#f").on("submit", function(event){
			if($('#id').val() == '' || $('#pw').val() == ''){
				alert('아이디와 비밀번호를 전부 입력해주세요.');
				event.preventDefault();
				return;
			}
		});	
	}
	
	
</script>
</head>
<body>
	
	<div id="signIn_wrap">
		<form id="f" action="${contextPath}/signIn" method="post">
			<table>
				<caption>Login</caption>
				<tbody>
					<tr>
						<td>아이디: </td>
						<td>
							<input type="text" name="id" id="id" placeholder="아이디를 입력하세요">
						</td>
					</tr>
					<tr>
						<td>비밀번호: </td>
						<td>
							<input type="password" name="pw" id="pw" placeholder="비밀번호를 입력하세요">
						</td>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="2" id="btnLogin">
							<button>로그인</button>
						</td>
					</tr>
				</tfoot>
			</table>
		</form>
	</div>
	
</body>
</html>