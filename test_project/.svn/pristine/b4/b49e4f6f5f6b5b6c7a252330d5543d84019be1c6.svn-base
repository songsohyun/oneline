<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common.jspf" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script type="text/javascript">
                                                                                                   
                                                                                                   
                                                                                                   
$(function(){
	$('#delete').click(function(){
		$("#boardList").attr("action", '/start/delete');
		$("#boardList").attr("method", "post");
		$("#boardList").submit();
	});
	
	/* $('#searchBtn').click(function(){
		$("#searchForm").attr("action", '/start/search');
		$("#searchForm").attr("method", "post");
		$("#searchForm").submit();
	}); */
	
	$('#searchBtn').click(function(){
		
		var searchForm = '';
		var condition = $('#condition').val();
		var searchValue = $('#searchValue').val();
		var startDate = $('#stDate').val();
		
		var endDate = $('#enDate').val();
		var currentPage = $('#currentPage').val();
		
		
		
		  $.ajax({
		        url:"/start/search",
		        type:'post',
		        async : true, 
		        data: {
		        	currentPage : currentPage,
		        	searchForm : searchForm,
		        	condition : condition,
		        	searchValue : searchValue,
		        	stDate : startDate,
		        	enDate : endDate
		        },
		        success:function(data){
		        	
		        	$('#content').html(data);
		        	alert(data.totalRecodes);
		        	$.noConflict();
		        
		        },
		        error:function(jqXHR, textStatus, errorThrown){
		            alert("에러 발생~~ \n");
		        }
		    });
	});
	
	$('.datepicker').datepicker({
		dateFormat: 'yy-mm-dd'
	});

});

</script>

<title>Insert title here</title>
</head>
<body>
<div id="content">
<h1>Board List</h1><br>
<form id="searchForm" name="searchForm">
<select id="condition" name="condition">
	<option value="writer">작성자</option>
	<option value="subject">제목</option>
	<option value="content">내용</option>
	<option value="subCon">제목+내용</option>
</select>
<input type="text" id="searchValue" name="searchValue">
<input type="button" id="searchBtn" value="검색"><br>
<input type="text" id="stDate" name="stDate" class="datepicker"> ~ <input type="text" id="enDate" name="enDate" class="datepicker">
</form>

<form id="boardList" action="<c:url value="/writeForm"/>" method="get">
<input type="submit" name="write" id="write" value="글쓰기">
<input type="button" name="delete" id="delete" value="삭제">
<table border="1">
<thead>
  <tr>
  	<th>Check</th>
    <th>번호</th>
    <th>아이디</th>
    <th>이름</th>
    <th>제목</th>
    <th>내용</th>
    <th>입력날짜</th>
    <th>수정날짜</th>
    <th>조회수</th>
  </tr>
</thead>
<tbody>
<c:forEach var="item" items="${list}">
  <tr>
  	<td><input type="checkbox" name="check" id="check" value="${item.SEQ}"></td>
    <td>${item.SEQ}</td>
    <td>${item.MEM_ID}</td>
    <td>${item.MEM_NAME}</td>
    <td>${item.BOARD_SUBJECT}</td>
    <td>${item.BOARD_CONTENT}</td>
    <td>${item.REG_DATE}</td>
    <td>${item.UPT_DATE}</td>
    <td>${item.VIEW_CNT}</td>
    <td><a href="/start//writeForm?seq=${item.SEQ }">글수정</a></td>
  </tr>
</c:forEach>
</tbody>
</table>
<c:choose>
	<c:when test="${paging.blockBegin == 1}">
		처음으로
	</c:when>
	<c:otherwise>
		<a href="${pageContext.request.contextPath}/boardlist?currentPage=${1}">처음으로</a>
	</c:otherwise>
</c:choose>
<c:choose>
	<c:when test="${paging.blockBegin == 1}">
		이전
	</c:when>
	<c:otherwise>
		<a href="${pageContext.request.contextPath}/boardlist?currentPage=${paging.blockBegin - 1}">이전</a>
	</c:otherwise>
</c:choose>
<c:forEach begin="${paging.blockBegin }" end="${paging.blockEnd }" varStatus="status">
	<a href="${pageContext.request.contextPath}/boardlist?currentPage=${status.current}" name="currentPage">[${status.current}]</a>
</c:forEach>
<c:choose>
	<c:when test="${paging.blockEnd == paging.totalPages}">
		다음
	</c:when>
	<c:otherwise>
		<a href="${pageContext.request.contextPath}/boardlist?currentPage=${paging.blockEnd + 1}">다음</a>
	</c:otherwise>
</c:choose>
<c:choose>
	<c:when test="${paging.blockEnd == paging.totalPages}">
		끝으로
	</c:when>
	<c:otherwise>
		<a href="${pageContext.request.contextPath}/boardlist?currentPage=${paging.totalPages}">끝으로</a>
	</c:otherwise>
</c:choose>
</form>
</div>
<input type="text" id="caca" name="caca">
</body>
</html>