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
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js" integrity="sha512-aVKKRRi/Q/YV+4mjoKBsE4x3H+BkegoM/em46NNlCqNTmUYADjBbeNefNxYV7giUp0VxICtqdrbqU7iVaeZNXA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script>
	
	$(function(){
		
		var listOne = '${listOne}';
		if(listOne != ''){
			$('.addModify').attr('id', 'btnModify').attr('value', '수정');
		} else {
			$('.addModify').attr('id', 'btnAdd').attr('value', '등록');
		}
		
		fnWrite();
		fnModify();
		fnFileAttach();
		fnBtnRemove();
		fnImageSizeCheck();
	});
	
	// 이미지 사이즈 체크 
	function fnImageSizeCheck(){
		$('.fileAttachList').on('change', '.files', function(){
			var choiceFile = $(this);
			var file = $(this)[0].files[0];
			var img = new Image();
			var _URL = window.URL || window.webkitURL;
			img.src = _URL.createObjectURL(file);
			var regExt = /(.*)\.(gif|jpg|jpeg|png|bmp)$/;

			if(!(regExt.test(file.name))){
				alert('gif, jpg, jpeg, png, bmp 파일만 업로드 해주세요.');
				choiceFile.val('');
			} 
			
			img.onload = function(){
				if(!(img.width <= 500 && img.height <= 500)) {
					alert('이미지의 가로, 세로 사이즈가 500 이하만 가능합니다.');
					choiceFile.val('');
				} 					
			}
			
		});
	}

	// 삭제버튼 누르면 해당 파일 선택란 지우기
	function fnBtnRemove(){
		$('.fileAttachList').on('click', '.btnRemove', function(){
			$(this).parent().remove();
		});
	}
	
	// 파일첨부 버튼 생성
	function fnFileAttach(){
		$('.fileAttach').on('click', function(){
			$('.fileAttachList').append($('<div>').html($('<input type="file" name="files" class="files"><input type="button" class="btnRemove" value="삭제">')));
		});
	}
	
	// 게시글 작성
	function fnWrite(){
		$('#btnAdd').on('click', function(){
			if($('#writer').val() == '' || $('#id').val() == '' || $('#title').val() == '' || $('#content').val() == ''){
				alert('내용을 전부 입력해주세요.');
				return;
			} else {
				$('#f').attr('action', '${contextPath}/write').attr('method', 'post').attr('enctype', 'multipart/form-data').submit();
			}
		});
	}
	
	// 게시글 수정
	function fnModify(){
		$('#btnModify').on('click', function(){
			if($('#writer').val() == '' || $('#id').val() == '' || $('#title').val() == '' || $('#content').val() == ''){
				alert('내용을 전부 입력해주세요.');
				return;
			} else {
				$('#f').attr('action', '${contextPath}/modify').attr('method', 'post').attr('enctype', 'multipart/form-data').submit();
			}
		});
	}

</script>
</head>
<body>
	
	<form id="f">
		<input type="hidden" name="seq" value="${listOne.seq}">
		작성자 : <input type="text" name="writer" id="writer" value="${listOne.memName}"><br>
		ID : <input type="text" name="id" id="id" value="${listOne.memId}"><br>
		제목 : <input type="text" name="title" id="title" value="${listOne.boardSubject}"><br>
		내용 : <br>
		<textarea name="content" id="content" rows="7" cols="30">${listOne.boardContent}</textarea><br>	
		<input type="button" class="fileAttach" value="파일첨부"><br>
		<div class="fileAttachList"></div>
		<div id="fileList">
			<c:if test="${not empty fileList}">
				<c:forEach items="${fileList}" var="file">
					<div>
						<a href="${contextPath}/download?fileSeq=${file.fileSeq}">${file.realName}</a>
					</div>
				</c:forEach>
			</c:if>
		</div>
		<input type="button" class="addModify">
	</form>
	
	
</body>
</html>