<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js" integrity="sha512-aVKKRRi/Q/YV+4mjoKBsE4x3H+BkegoM/em46NNlCqNTmUYADjBbeNefNxYV7giUp0VxICtqdrbqU7iVaeZNXA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</head>
<script>
	
	if('${addRes}' != ''){
		if('${addRes}' == '1'){
			alert('게시글을 등록하였습니다.');
			location.href='${contextPath}/list';
		} else {
			alert('게시글을 등록하지 못했습니다.');
			location.href='${contextPath}/list';
		}
	}
	
	
	if('${modifyRes}' != ''){
		if('${modifyRes}' == '1'){
			alert('게시글을 수정하였습니다.');
			location.href='${contextPath}/list';
		} else {
			alert('게시글을 수정하지 못했습니다.');
			location.href='${contextPath}/list';
		}
	}
	
	
	if('${removeRes}' != ''){
		if('${removeRes}' >= '1'){
			alert('게시글을 삭제하였습니다.');
			location.href='${contextPath}/list';
		} else {
			alert('게시글을 삭제하지 못했습니다.');
			location.href='${contextPath}/list';
		}
	}
	
	
</script>
<body>
</body>
</html>