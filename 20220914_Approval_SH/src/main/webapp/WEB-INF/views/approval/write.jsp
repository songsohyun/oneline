<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.checkBox_wrap {
		margin: 15px 0 0 50px;
		
	}
	#checkBox_table {
		border-collapse: collapse;
	}
	#checkBox_table th:nth-child(1) {width: 100px;}
	#checkBox_table th:nth-child(2) {width: 100px;}
	#checkBox_table th:nth-child(3) {width: 100px;}
	#checkBox_table td {text-align: center;}
	.write_wrap {
		margin: 10px 0 0 80px;
	}
	.write_wrap tfoot td {
		text-align: center;
	}
	.history_wrap {
		margin: 10px 0 0 80px;
	}
	.history_wrap table {
		border-collapse: collapse;
	}
	
</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js" integrity="sha512-aVKKRRi/Q/YV+4mjoKBsE4x3H+BkegoM/em46NNlCqNTmUYADjBbeNefNxYV7giUp0VxICtqdrbqU7iVaeZNXA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script>
	
	$(function(){
		
		// fnListNo();
		fnSave();
		fnApproval();
		fnChecked();
		fnCancel();
	});
	
	// 반려
	function fnCancel(){
		$('#btnCancel').on('click', function(){
			$.ajax({
				url: '${contextPath}/cancel',
				type: 'post',
				data: $('#f').serialize(),
				success: function(res){
					if(res > '0'){
						alert('반려되었습니다.');
						location.href='${contextPath}/list';
					} else{
						alert('반려되지 못했습니다.');							
					}
				},
				error: function(jqXHR){
				}
			});
		});
	}
	
	// 상세보기 화면에서 체크박스 표시
	function fnChecked(){
		var checked = '${apprStatus}';
		var writerId = '${writerId}';
		var memId = '${member.memId}';
		
		if((checked >= '2' && checked < '5') || (checked == '5' && writerId != memId)){
			$('#title').attr('readonly', 'readonly');	
			$('#content').attr('readonly', 'readonly');	
		} 
	
		
		if(checked == '2'){
			$('#ch1').prop('checked', true);
		} else if(checked == '3'){
			$('#ch1').prop('checked', true);
			$('#ch2').prop('checked', true);
		} else if(checked == '4'){
			$('#ch1').prop('checked', true);
			$('#ch2').prop('checked', true);
			$('#ch3').prop('checked', true);
		} 
	}
	
	// 결재 버튼 누르면 히스토리&결재 테이블에 정보 저장
	function fnApproval(){
		$('#btnApproval').on('click', function(){
			if($('#title').val() == '' || $('#content').val() == ''){
				alert('제목과 내용을 전부 입력해주세요.');
				return;
			} else {
				$.ajax({
					url: '${contextPath}/approval',
					type: 'post',
					data: $('#f').serialize(),
					success: function(res){
						if(res > '0'){
							alert('결재를 올렸습니다.');
							location.href='${contextPath}/list';
						} else{
							alert('결재를 올리지 못했습니다.');							
						}
					},
					error: function(jqXHR){
					}
				});
			}
		});		
	}
	
	// 임시저장 버튼을 누르면 히스토리&결재 테이블에 정보 저장
	function fnSave(){
		$('#btnSave').on('click', function(){
			if($('#title').val() == '' || $('#content').val() == ''){
				alert('제목과 내용을 전부 입력해주세요.');
				return;
			} else {
				$.ajax({
					url: '${contextPath}/save',
					type: 'post',
					data: $('#f').serialize(),
					success: function(res){
						if(res > '0'){
							alert('임시저장되었습니다.');
							location.href='${contextPath}/list';
						} else{
							alert('임시저장되지 않았습니다.');							
						}
					},
					error: function(jqXHR){
					}
				});
			}
		});
	}
	
	// 게시글 번호
	/*
	function fnListNo(){
		$.ajax({
			url: '${contextPath}/listNo',
			type: 'get',
			dataType: 'text',
			success: function(res){
				$('#no').val(res);
			},
			error: function(jqXHR){
				
			}
		});
	}
	*/
	
	
</script>
</head>
<body>
	
	<div class="checkBox_wrap">
		<table border="1" id="checkBox_table">
			<thead>
				<tr>
					<th>결재요청</th>
					<th>과장</th>
					<th>부장</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><input type="checkbox" id="ch1" onclick="return false;"></td>
					<td><input type="checkbox" id="ch2" onclick="return false;"></td>
					<td><input type="checkbox" id="ch3" onclick="return false;"></td>
				</tr>
			</tbody>
		</table>
	</div>
	
	<div class="write_wrap">
		<form id="f" method="post">
		
			<!-- 작성자 아이디 -->
			<input type="hidden" name="writerId" value="${member.memId}">
			
			<!-- 결재자 아이디 값으로 넣어줘야함 -->
			<!--  
			<input type="hidden" name="approverId" value="${approverId}">
			-->
			
			<table>
				<tbody>
					<tr>
						<td>번호 : </td>
						<td><input type="text" name="no" id="no" value="${listNo}" readonly></td>
					</tr>
					<tr>
						<td>작성자 : </td>
						<td><input type="text" name="writer" value="${memName}" readonly></td>
					</tr>
					<tr>
						<td>제목 : </td>
						<td><input type="text" name="title" id="title" value="${title}"></td>
					</tr>
					<tr>
						<td colspan="2">내용 : </td>
					</tr>
					<tr>
						<td colspan="2"><textarea rows="7" cols="30" name="content" id="content">${content}</textarea></td>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="2">
						
							<!--  
							<c:choose>
								<c:when test="${member.memRank eq 'c' || member.memRank eq 'd'}"><input type="button" value="반려" id="btnCancel"></c:when>
								<c:when test="${member.memRank ne 'c' && member.memRank ne 'd'}"><input type="button" value="임시저장" id="btnSave"></c:when>
							</c:choose>
							<input type="button" value="결재" id="btnApproval">			
							-->		
																
							<c:choose>
								<c:when test="${btnStatus eq 1 or apprStatus eq 1 or (apprStatus eq 5 and member.memId eq writerId)}">
									<input type="button" value="임시저장" id="btnSave">
									<input type="button" value="결재" id="btnApproval">	
								</c:when>
								
								<%-- <c:when test="${(apprStatus == 2 || apprStatus == 3) && member.memRank >= 'c' && writerId != member.memId}"> --%>
								<c:when test="${((apprStatus eq 2 or apprStatus eq 3) and member.memRank eq 'c' and empty approverId) or ((apprStatus eq 2 or apprStatus eq 3) and member.memRank eq 'd')}">
									<input type="button" value="반려" id="btnCancel">
									<input type="button" value="결재" id="btnApproval">
								</c:when>
							</c:choose>
						</td>
					</tr>
				</tfoot>
			</table>
		</form>
	</div>
	
	<div class="history_wrap">
		<table border="1">
			<thead>
				<tr>
					<th>번호</th>
					<th>결재일</th>
					<th>결재자</th>
					<th>결재상태</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${not empty hisList}">
					<c:forEach items="${hisList}" var="item">
						<tr>
							<td>${item.rn}</td>
							<td>
								<fmt:formatDate value="${item.hisRegDate}" pattern="yyyy-MM-dd"/>
							</td>
							<td>${item.memName}</td>
							<td>
								<c:if test="${item.hisApprStatus == 1}">임시저장</c:if>
								<c:if test="${item.hisApprStatus == 2}">결재대기</c:if>
								<c:if test="${item.hisApprStatus == 3}">결재중</c:if>
								<c:if test="${item.hisApprStatus == 4}">결재완료</c:if>
								<c:if test="${item.hisApprStatus == 5}">반려</c:if>
							</td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
	</div>

</body>
</html>