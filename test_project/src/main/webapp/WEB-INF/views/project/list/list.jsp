<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common.jspf" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/WEB-INF/views/common2.jspf" %>
<title>결재게시판</title>
<script type="text/javascript">
function check(stDate, enDate){
	if(stDate == null && stDate == ''){
		alert('시작 날짜를 입력하세요.');
		$('#stDate').focus();
		throw '';
	} else if(enDate == null && stDate == ''){
		alert('끝 날짜를 입력하세요.');
		$('#enDate').focus();
		throw '';
	}
}
$(function(){
	$('#logout').click(function(){
		location.href = '/start/projectLogout';
	});
	
	$('#sub').click(function(){
		alert('준비중입니다.');
	});
	
	$('#write').click(function(){
		location.href = '/start/projectWriteForm';
	});
	
	 $("[data-link]").click(function() {
	        window.location.href = $(this).attr("data-link");
	        return false;
	    });
	 
	 $('.datepicker').datepicker({
			 dateFormat : 'yy/mm/dd'
	 });
	 
	 $('#searchBtn').click(function(){
		 var searchValue = $('#searchForm').serialize();
		 $.ajax({
			 url : '/start/list',
			 data : searchValue,
	         	error : function(){
	                alert('통신실패!!');
	            },
	            success : function(data){
	                $('#container').html(data);
	                $.noConflict();
	               
	            }
		 });
	 });
	 
	 /* $('#enDate').change(function(){
		 var stDate = $('stDate').val();
		 var enDate = $('enDate').val();
		 check(stDate, enDate);
		 var searchValue = $('#searchForm').serialize();
		 $.ajax({
			 url : '/start/list',
			 data : searchValue,
	         	error : function(){
	                alert('통신실패!!');
	            },
	            success : function(data){
	                $('#container').html(data);
	                $.noConflict();
	               
	            }
		 });
	 }); */
	 
	 $('#status').change(function(){
		 
		 var searchValue = $('#searchForm').serialize();
		 
		 $.ajax({
			 url : '/start/list',
			 data : searchValue,
	         	error : function(){
	                alert('통신실패!!');
	            },
	            success : function(data){
	                $('#container').html(data);
	                $.noConflict();
	               
	            }
		 });
	 });
	 
	 $("input[id^='currentPage']").click(function(){
		 var currentPage = $(this).attr('currentPage');
		 $('#searchForm').attr('action', '/start/list?currentPage='+currentPage);
		 $('#searchForm').attr('method', 'post');
		 $('#searchForm').submit();
	 });
});
</script>
<style type="text/css">
	[data-link]:HOVER {
    cursor: pointer;
    background-color: silver;
    
}
</style>
</head>
<body>
	<div id="container" style="width: 750px; margin: auto;">
		<span>
			${sessionScope.user.USER_NAME}
			<c:choose>
				<c:when test="${sessionScope.user.RANK == 3}">
					(사원)
				</c:when>
				<c:when test="${sessionScope.user.RANK == 2}">
					(대리)
				</c:when>
				<c:when test="${sessionScope.user.RANK == 1}">
					(과장)
				</c:when>
				<c:when test="${sessionScope.user.RANK == 0}">
					(부장)
				</c:when>
			</c:choose>
			님 환영합니다.
		</span>
		<span>
			<input type="button" id="logout" value="로그아웃">
		</span>
		<br>
		<c:if test="${user.RANK != 3 && user.RANK != 2}">
			<span>(대리결재일: 00 ~ 00)</span>
		</c:if>
		<c:choose>
			<c:when test="${user.RANK == 3 || user.RANK == 2 }">
				<span style="float: right;"><input type="button" id="write" value="글쓰기"></span>
			</c:when>
			<c:otherwise>
				<span style="float: right;"><input type="button" id="sub" value="대리결재"></span>
			</c:otherwise>
		</c:choose>
	
		<div>
			<form id="searchForm">
			<c:choose>
				<c:when test="${params.searchCon != null }">
					<span>
						<select	id="searchCon" name="searchCon">
							<option>==선택==</option>
							<option value="writer" ${params.searchCon eq  'writer' ? 'selected' : ''}>작성자</option>
							<option value="subCon" ${params.searchCon eq  'subCon' ? 'selected' : ''}>제목+내용</option>
							<option value="approver" ${params.searchCon eq  'approver' ? 'selected' : ''}>결재자</option>
						</select>
					</span>
					<span>
						<input type="text" id="searchValue" name="searchValue" value="${params.searchValue }">
					</span>
				</c:when>
				<c:otherwise>
					<span>
						<select	id="searchCon" name="searchCon">
							<option>==선택==</option>
							<option value="writer">작성자</option>
							<option value="subCon">제목+내용</option>
							<option value="approver">결재자</option>
						</select>
					</span>
					<span>
						<input type="text" id="searchValue" name="searchValue">
					</span>
				</c:otherwise>
			</c:choose>
			<select id="status" name="status">
				<!-- 임시저장, 결재완료 추가 -->
				<option value="">=결재상태==</option>
				<option value="save" ${params.status eq 'save' ? 'selected' : ''}>임시저장</option>
				<option value="approval_req" ${params.status eq 'approval_req' ? 'selected' : ''}>결재요청</option>
				<option value="approval" ${params.status eq 'approval' ? 'selected' : ''}>결재중</option>
				<option value="reject" ${params.status eq 'reject' ? 'selected' : ''}>반려</option>
				<option value="approval_comp" ${params.status eq 'approval_comp' ? 'selected' : ''}>결재완료</option>
			</select>
			<br>
			<select id="dateOption" name="dateOption">
				<option>==날짜검색==</option>
				<option value="createDate" ${params.dateOption eq 'createDate' ? 'selected' : ''}>작성일</option>
				<option value="approvalDate" ${params.dateOption eq 'approvalDate' ? 'selected' : ''}>결재일</option>
			</select>
			<c:choose>
				<c:when test="${params.stDate != null && params.enDate != null }">
					<span>
						<input type="text" id="stDate" name="stDate" class="datepicker" autocomplete="off" value="${params.stDate }"> ~ 
						<input type="text" id="enDate" name="enDate" class="datepicker" autocomplete="off" value="${params.enDate }">
					</span>
				</c:when>
				<c:otherwise>
					<span>
						<input type="text" id="stDate" name="stDate" class="datepicker" autocomplete="off"> ~ 
						<input type="text" id="enDate" name="enDate" class="datepicker" autocomplete="off">
						</span>
				</c:otherwise>
			</c:choose>
				<span>
					<input type="button" id="searchBtn" value="검색">
				</span>
			</form>
			<br>
		</div>
		<div>
			<table border="1">
				<thead>
					<tr>
						<td>번호</td>	
						<td>작성자</td>	
						<td>제목</td>	
						<td>작성일</td>	
						<td>결재일</td>	
						<td>결재자</td>	
						<td>결재상태</td>	
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="item" varStatus="status">
						<tr data-link="/start/projectDetail?SEQ=${item.SEQ }">
							<td>${item.RNUM }</td>
							<td>${item.USER_NAME }</td>
							<td>${item.CONTENT }</td>
							<td>${item.CREATE_DATE }</td>
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
		</div>
		<div id="pagination">
			<c:choose>
				<c:when test="${pagination.beginBlock == 1}">
					<input type="button" value="이전" onclick="alert('첫 페이지입니다.');">
				</c:when>
				<c:otherwise>
					<a href="/start/list?currentPage=${pagination.beginBlock - 1}" id="currentPage">[이전]</a>
					<input type="button" id="currentPage" value="이전" currentPage="${pagination.beginBlock - 1}" >
				</c:otherwise>
			</c:choose>
			<c:forEach begin="${pagination.beginBlock }" end="${pagination.endBlock}" varStatus="status">
				<input type="button" id="currentPage${status.current }" value="${status.current }" currentPage="${status.current }">
			</c:forEach>
			<c:choose>
				<c:when test="${pagination.endBlock == pagination.totalPages}">
					<input type="button" value="다음" onclick="alert('마지막 페이지입니다.');">
				</c:when>
				<c:otherwise>
					<input type="button" id="currentPage" value="다음" currentPage="${pagination.endBlock + 1}">
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</body>
</html>