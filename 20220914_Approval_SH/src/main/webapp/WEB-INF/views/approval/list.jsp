<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.welcome_wrap, .btn_wrap {
		width: 340px;
	}
	.btn_wrap {
		text-align: right;
		margin-bottom: 10px;
	}
	.date_wrap {
		margin-top: 5px;
	}
	.search_wrap {
		margin-bottom: 10px;
	}
	.listTable {
		border-collapse: collapse;
		border: 1px solid #dccfcf;
	}
</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js" integrity="sha512-aVKKRRi/Q/YV+4mjoKBsE4x3H+BkegoM/em46NNlCqNTmUYADjBbeNefNxYV7giUp0VxICtqdrbqU7iVaeZNXA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script>
	
	$(function(){
		
		$('#column').val('${column}');
		$('#ajaxSearch').val('${apprStatus}');
		
		fnSignOut();
		fnAjaxSearch();
		fnBtnSearch();
	});
	
	// 검색 버튼 눌러서 조회하기
	function fnBtnSearch(){
		$('#btnSearch').on('click', function(){
			$('#f').attr('action', '${contextPath}/list').submit();
		});
	}
	
	// 결재상태 바뀔때마다 검색하기
	function fnAjaxSearch(){
		$('#ajaxSearch').on('change', function(event){
			if($(this).val() == ''){
				event.preventDefault();
				return;
			} else {
				$.ajax({
					url: '${contextPath}/ajaxSearch',
					type: 'POST',
					data: $('#f').serialize(),
					dataType: 'json', 
					success: function(res){
						$('#list_wrap').empty();
						if(res != ''){
							$.each(res, function(i, item){
								var apprRegDate = new Date(item.apprRegDate);
								if(isNaN(apprRegDate) == false){
									var apprRegDateYear = apprRegDate.getFullYear();
									var apprRegDateMonth = (apprRegDate.getMonth() + 1).toString().length != 1 ? apprRegDate.getMonth() + 1 : '0' + (apprRegDate.getMonth() + 1);
									var apprRegDateDay = (apprRegDate.getDate()).toString().length != 1 ? apprRegDate.getDate() : '0' + apprRegDate.getDate();
									var apprRegDateRes = apprRegDateYear + '.' + apprRegDateMonth + '.' + apprRegDateDay;									
								}
								
								var apprDate = new Date(item.apprDate);
								if(isNaN(apprDate) == false){
									var apprDateYear = apprDate.getFullYear();
									var apprDateMonth = (apprDate.getMonth() + 1).toString().length != 1 ? apprDate.getMonth() + 1 : '0' + (apprDate.getMonth() + 1);
									var apprDateDay = (apprDate.getDate()).toString().length != 1 ? apprDate.getDate() : '0' + apprDate.getDate();
									var apprDateRes = apprDateYear + '.' + apprDateMonth + '.' + apprDateDay;									
								}
								
								var tr = $('<tr>')
								.append($('<td>').text(item.apprNo))
								.append($('<td>').text(item.memName))
								.append($('<td>').html('<a href="${contextPath}/detail?apprNo=' + item.apprNo + '">' + item.apprTitle + '</a>'))
								// .append($('<td>').text(item.apprRegDate))
								.append($('<td>').text(apprRegDateRes))
								// .append($('<td>').text(item.apprDate))
								.append($('<td>').text(apprDateRes))
								.append($('<td>').text(item.approverId))
								.append($('<td>').text(item.apprStatus));
								$('#list_wrap').append(tr);
							});
						}
					},
					error: function(jqXHR){
						alert(jqXHR.status);
					}
				});				
			}
		});
	}
	
	// 로그아웃
	function fnSignOut(){
		$('#btnSignOut').on('click', function(){
			if(confirm('로그아웃 하시겠습니까?')){
				location.href='${contextPath}/logOut';
			}
		});
	}
	
</script>
</head>
<body>

	<div class="welcome_wrap">
		<c:choose>
			<c:when test="${member.memRank eq 'a'}">${member.memName}(사원)</c:when>
			<c:when test="${member.memRank eq 'b'}">${member.memName}(대리)</c:when>
			<c:when test="${member.memRank eq 'c'}">${member.memName}(과장)</c:when>
			<c:when test="${member.memRank eq 'd'}">${member.memName}(부장)</c:when>
		</c:choose>
		님 환영합니다.&nbsp;&nbsp;&nbsp;
		<input type="button" id="btnSignOut" value="로그아웃">
	</div>
	<br><br>
	
	<div class="btn_wrap">
		<input type="button" value="글쓰기" onclick="location.href='${contextPath}/writePage'">
		<c:choose>
			<c:when test="${member.memRank eq 'c' || member.memRank eq 'd'}">
				<input type="button" value="대리결재">
			</c:when>
		</c:choose>
	</div>
	
	<div class="search_wrap">
		<form id="f">
			<select name="column" id="column">
				<option value="">선택</option>
				<option value="writer">작성자</option>
				<option value="approver">결재자</option>
				<option value="titleContent">제목+내용</option>
			</select>
			<input type="text" name="query" placeholder="검색어를 입력하세요" value="${query}">
			<select name="apprStatus" id="ajaxSearch">
				<option value="">결재상태</option>
				<option value="1">임시저장</option>
				<option value="2">결재대기</option>
				<option value="3">결재중</option>
				<option value="4">결재완료</option>
				<option value="5">반려</option>
			</select>
			<div class="date_wrap">
				<input type="date" name="startDay" value="${startDay}"> ~ <input type="date" name="endDay" value="${endDay}">
				<input type="button" value="검색" id="btnSearch">
			</div>
		</form>
	</div>
	
	<div class="list">
		<table border="1" class="listTable">
			<thead>
				<tr>
					<th>번호</th>
					<th>작성자</th>
					<th>제목</th>
					<th>작성일</th>
					<th>결재일</th>
					<th>결재자</th>
					<th>결재상태</th>
				</tr>
			</thead>
			<tbody id="list_wrap">
				<c:if test="${not empty list}">
					<c:forEach items="${list}" var="item">
						<tr>
							<td>${item.apprNo}</td>
							<td>${item.memName}</td>
							<td>
								<a href="${contextPath}/detail?apprNo=${item.apprNo}">${item.apprTitle}</a>
							</td>
							<td>
								<fmt:formatDate value="${item.apprRegDate}" pattern="yyyy.MM.dd"/>
							</td>
							<td>
								<fmt:formatDate value="${item.apprDate}" pattern="yyyy.MM.dd"/>
							</td>
							<td>${item.approverId}</td>
							<td>${item.apprStatus}</td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
	</div>


	 
</body>
</html>