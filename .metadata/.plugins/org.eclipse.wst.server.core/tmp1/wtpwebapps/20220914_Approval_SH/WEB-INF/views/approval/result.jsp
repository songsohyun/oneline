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
<script>
	
	if('${idPwRes}' != '' && '${idPwRes}' == '1'){
		location.href='${contextPath}/list';
	} else if('${idRes}' != '' && '${idRes}' == '0'){
		alert('등록되지 않은 사용자입니다.');
		location.href='${contextPath}';
	} else if('${idRes}' == '1' && '${idPwRes}' == '0'){
		alert('비밀번호가 일치하지 않습니다.');
		location.href='${contextPath}';
	}
	
</script>
</head>
<body>

	

</body>
</html>