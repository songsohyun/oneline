<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table, th, td {
		border: 1px solid #000;
		border-collapse: collapse;
		text-align: center;
	}
</style>
</head>
<body>
	<table>
		<thead>
			<tr>
				<th>SEQ</th>
				<th>이름</th>
				<th>아이디</th>
				<th>과목</th>
			</tr>
		</thead>
		<c:forEach items="${list}" var="board">
			<tbody>
				<tr>
					<td><c:out value="${board.SEQ}"></c:out></td>
					<td><c:out value="${board.MEM_NAME}"></c:out></td>
					<td><c:out value="${board.MEM_ID}"></c:out></td>
					<td><c:out value="${board.BOARD_SUBJECT}"></c:out></td>
				</tr>
			</tbody>
		</c:forEach>
	</table>
</body>
</html>