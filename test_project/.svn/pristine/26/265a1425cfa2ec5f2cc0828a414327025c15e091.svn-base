<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common.jspf" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/WEB-INF/views/common2.jspf" %>
<title>글쓰기</title>
<script type="text/javascript">
$(function(){
	$('#save').click(function(){
		var subject = $('#subject').val();
		var content = $('#content').val();
		var status = 'save';
		check(subject, content);
		$('#status').attr('value', status);
		$('#writeForm').attr('action', '/start/projectWrite');
		$('#writeForm').attr('method', 'post');
		$('#writeForm').attr('method', 'post');
		$('#writeForm').submit();
	});
	
	$('#approval_req').click(function(){
		var subject = $('#subject').val();
		var content = $('#content').val();
		var status = 'approval_req';
		check(subject, content);
		$('#status').attr('value', status);
		$('#writeForm').attr('action', '/start/projectWrite');
		$('#writeForm').attr('method', 'post');
		$('#writeForm').submit();
	});
	
	$('#approval').click(function(){
		var subject = $('#subject').val();
		var content = $('#content').val();
		var status = 'approval';
		check(subject, content);
		$('#status').attr('value', status);
		$('#writeForm').attr('action', '/start/projectWrite');
		$('#writeForm').attr('method', 'post');
		$('#writeForm').submit();
	});
	
	$('#toList').click(function(){
		location.href = '/start/list';
	});
});
function check(subject, content){
	if(subject == '' || subject == null){
		alert('제목을 입력해주세요.');
		$('#subject').focus();
		throw '';
	} else if(content == '' || content == null){
		alert('내용을 입력해주세요.');
		$('#content').focus();
		throw '';
	}
}
</script>
</head>

<body>
<div id="container" style="width: 700px; margin: auto;" >
<table border="1">
	<thead>
		<tr>
			<td>결재요청</td>
			<td>과장</td>
			<td>부장</td>
		</tr>
	</thead>
	<tbody>
		<c:choose>
			<c:when test="${nextSeq == null }">
				<tr>
					<c:choose>
						<c:when test="${list['0'].APPROVAL_STATUS eq 'approval_req'}">
							<td><input type="checkbox" id="3" value="3" disabled="disabled" checked="checked"></td>
							<td><input type="checkbox" id="2" value="2" disabled="disabled"></td>
							<td><input type="checkbox" id="1" value="1" disabled="disabled"></td>
						</c:when>
						<c:when test="${list['0'].APPROVAL_STATUS eq 'approval'}">
							<td><input type="checkbox" id="3" value="3" disabled="disabled" checked="checked"></td>
							<td><input type="checkbox" id="2" value="2" disabled="disabled" checked="checked"></td>
							<td><input type="checkbox" id="1" value="1" disabled="disabled"></td>
						</c:when>
						<c:when test="${list['0'].APPROVAL_STATUS eq 'approval_comp'}">
							<td><input type="checkbox" id="3" value="3" disabled="disabled" checked="checked"></td>
							<td><input type="checkbox" id="2" value="2" disabled="disabled" checked="checked"></td>
							<td><input type="checkbox" id="1" value="1" disabled="disabled" checked="checked"></td>
						</c:when>
						<c:otherwise>
							<td><input type="checkbox" id="3" value="3" disabled="disabled"></td>
							<td><input type="checkbox" id="2" value="2" disabled="disabled"></td>
							<td><input type="checkbox" id="1" value="1" disabled="disabled"></td>
						</c:otherwise>
					</c:choose>
				</tr>
			</c:when>
			<c:otherwise>
				<tr>
					<td><input type="checkbox" id="3" value="3" disabled="disabled"></td>
					<td><input type="checkbox" id="2" value="2" disabled="disabled"></td>
					<td><input type="checkbox" id="1" value="1" disabled="disabled"></td>
				</tr>
			</c:otherwise>
		</c:choose>
	</tbody>
</table>

<br>

<form id="writeForm" enctype="multipart/form-data">
	<c:choose>
		<c:when test="${nextSeq == null }">
			<span>번호: <input type="text" id="seq" name="seq" value="${list['0'].SEQ }" readonly="readonly"></span><br>
		</c:when>
		<c:otherwise>
			<span>번호: <input type="text" id="seq" name="seq" value="${nextSeq }" readonly="readonly"></span><br>
		</c:otherwise>
	</c:choose>
	<span>작성자: <input type="text" id="name" name="name" value="${user.USER_NAME }" readonly="readonly"></span><br>
	<c:choose>
		<c:when test="${nextSeq == null}">
			<span>
				제목: <input type="text" id="subject" name="subject" ${list['0'].APPROVAL_STATUS eq 'save' ?  '' : 'readonly' } value="${list['0'].SUBJECT }">
			</span>
			<br>
			<span>내용:<br>
				<textarea id="content" name="content" rows="5" cols="30" ${list['0'].APPROVAL_STATUS eq 'save'?  '' : 'readonly' }>${list['0'].CONTENT }</textarea>
			</span>
			<br>
		</c:when>
		<c:otherwise>
			<span>제목: <input type="text" id="subject" name="subject"></span><br>
			<span>내용:<br><textarea id="content" name="content" rows="10" cols="50"></textarea></span><br>
		</c:otherwise>
	</c:choose>
	<c:if test="${(user.RANK eq 3 || user.RANK eq 2) && list['0'].APPROVAL_STATUS eq 'save' }">
		<input type="button" id="save" name="save" value="임시저장">
		<input type="button" id="approval_req" name="approval_req" value="결재요청">
	</c:if>
	<c:if test="${user.RANK eq 1 && list['0'].APPROVAL_STATUS eq 'approval_req' && empty list['0'].UPDATE_DATE1}">
		<input type="button" id="reject" name="reject" value="반려">
		<input type="button" id="approval" name="approval" value="결재요청">
	</c:if>
	<c:if test="${user.RANK eq 0 && list['0'].APPROVAL_STATUS eq 'approval' && !empty list['0'].UPDATE_DATE1}">
		<input type="button" id="reject" name="reject" value="반려">
		<input type="button" id="approval" name="approval" value="결재">
	</c:if>
	<input type="hidden" id= "status" name="status">
	<input type="hidden" name="USER_ID" value="${user.USER_ID}">
	<input type="file" name="file">
</form>
<hr>
<c:if test="${!empty historyList}">
	<table border="1">
		<thead>
			<tr>
				<td>번호</td>
				<td>결재일</td>
				<td>결재자</td>
				<td>결재상태</td>
			</tr>
		</thead>
		
		<tbody>
			<c:forEach items="${historyList}" var="item" varStatus="status">
				<tr>
					<td>${status.count }</td>
					<td>${item.UPDATE_DATE1 }</td>
					<td>${item.APPROVER }</td>
					<td>
						<c:choose>
							<c:when test="${item.APPROVAL_STATUS eq 'save'}">
								임시저장
							</c:when>
							<c:when test="${item.APPROVAL_STATUS eq 'approval'}">
								결재중
							</c:when>
							<c:when test="${item.APPROVAL_STATUS eq 'reject'}">
								반려
							</c:when>
							<c:when test="${item.APPROVAL_STATUS eq 'approval_req'}">
								결재요청
							</c:when>
							<c:when test="${item.APPROVAL_STATUS eq 'approval_comp'}">
								결재완료
							</c:when>
						</c:choose>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</c:if>
<span style="float: none;"><input type="button" id="toList" value="목록으로"></span>

</div>
</body>
</html>