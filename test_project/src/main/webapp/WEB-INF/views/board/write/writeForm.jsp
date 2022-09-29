<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.3.1.js"/>"></script>
<script>
$(function(){
	$("#submit").click(function(){
	    $("#writeForm").attr("action", '/start/write');
		$("#writeForm").attr("method", "get");
		$("#writeForm").submit();
	});
});
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- 
<form action="<c:url value="/write"/>" method="get">
작성자: <input type="text" name="MEM_NAME" id="MEM_NAME"><br>
ID: <input type="text" name="MEM_ID" id="MEM_ID"><br>
제목: <input type="text" name="BOARD_SUBJECT" id="BOARD_SUBJECT"><br>
내용: <textarea rows="5" cols="40" name="BOARD_CONTENT" id="BOARD_CONTENT"></textarea><br>
<input type="submit" value="등록">
</form> 
--%>

<form id="writeForm">
<input type="hidden" name="seq" id=seq value="${param.seq}">
작성자: <input type="text" name="MEM_NAME" id="MEM_NAME"><br>
ID: <input type="text" name="MEM_ID" id="MEM_ID"><br>
제목: <input type="text" name="BOARD_SUBJECT" id="BOARD_SUBJECT"><br>
내용: <textarea rows="5" cols="40" name="BOARD_CONTENT" id="BOARD_CONTENT"></textarea><br>
</form>
<input type="button" id="submit" value="등록">
</body>
</html>