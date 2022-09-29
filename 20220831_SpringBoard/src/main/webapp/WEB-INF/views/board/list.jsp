<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#paging_wrap {
		text-align: center;
	}
	.unlink, .link {
		display: inline-block;
		margin-left: 5px;
		margin-right: 5px;
	}
	th:nth-child(1) { width: 10px;}
	th:nth-child(2) { width: 50px;}
	th:nth-child(3) { width: 200px;}
	th:nth-child(4) { width: 200px;}
	th:nth-child(5) { width: 180px;}
	th:nth-child(6) { width: 180px;}
	th:nth-child(7) { width: 50px;}
</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js" integrity="sha512-aVKKRRi/Q/YV+4mjoKBsE4x3H+BkegoM/em46NNlCqNTmUYADjBbeNefNxYV7giUp0VxICtqdrbqU7iVaeZNXA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script>
	
	$(function(){
		
		$('#column').val('${column}');
		fnCheckAll();
		fnCheckOne();
		fnRemove();
		fnSearch(); 
	});
	
	// 삭제하기
	function fnRemove(){
		$('#f').on('submit', function(event){
			if(confirm('게시글을 삭제하시겠습니까?') == false){
				event.preventDefault();
			}
		});
	}
	
	// 개별 선택
	function fnCheckOne(){
		$('.ckOne').on('click', function(){
			let checkAll = true;
			$.each($('.ckOne'), function(i, item){
				if($(item).is(':checked') == false){
					$('.ckAll').prop('checked', false);
					checkAll = false;
					return;
				}
			});
			
			if(checkAll){
				$('.ckAll').prop('checked', true);
			}
		});
	}
	
	// 전체 선택
	function fnCheckAll(){
		$('.ckAll').on('click', function(){
			$('.ckOne').prop('checked', $(this).prop('checked'));
		});
	}
	
	// 검색
	function fnSearch(){
		$('#searchForm').on('submit', function(event){
			if($('#column').val() == '' && $('#query').val() == '' && $('#startDay').val() == '' && $('#endDay').val() == ''){
				event.preventDefault();				
			}
		});
	}

	
</script>
</head>
<body>
	
	<form id="searchForm" action="${contextPath}/search">
		<select name="column" id="column">
			<option value="">선 택</option>
			<option value="MEM_NAME">작성자</option>
			<option value="BOARD_SUBJECT">제 목</option>
			<option value="BOARD_SUB_CON">제목+내용</option>
		</select>
		<input type="text" name="query" id="query" value="${query}">
		<button>검색</button><br>
		<input type="date" name="startDay" id="startDay" value="${startDay}"> ~ <input type="date" name="endDay" id="endDay" value="${endDay}">
	</form>
	
	<form id="f" action="${contextPath}/remove" method="post">
		<input type="button" id="btnWrite" value="글쓰기" onclick="location.href='${contextPath}/writePage'">
		<button>삭제</button>
		<table border="1">
			<thead>
				<tr>
					<th><input type="checkbox" class="ckAll"></th>
					<th>글번호</th>
					<th>작성자(ID)</th>
					<th>제목</th>
					<th>작성일</th>
					<th>수정일</th>
					<th>조회수</th>
				</tr>
			</thead>
			<c:forEach items="${list}" var="list">
				<tbody>
					<tr>
						<td><input type="checkbox" class="ckOne" name="ckOne" value="${list.seq}"></td>
						<td>${list.seq}</td>
						<td>${list.memName}(${list.memId})</td>
						<td>
							<a href="${contextPath}/detailPage?seq=${list.seq}">${list.boardSubject}</a>
						</td>
						<td>${list.regDate}</td>
						<td>${list.uptDate}</td>
						<td>${list.viewCnt}</td>
					</tr>
				</tbody>
			</c:forEach>
			<tfoot>
				<tr>
					<td colspan="7">
						<div id="paging_wrap">
							${paging}
						</div>
					</td>
				</tr>
			</tfoot>
		</table>
	</form>
	
</body>
</html>