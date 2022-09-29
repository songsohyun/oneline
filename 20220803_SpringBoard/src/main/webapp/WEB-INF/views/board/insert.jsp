<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<script type="text/javascript">
		window.onload = function(){
			var fileArea = document.getElementById("fileArea");
			var addFile = document.getElementById("addFile");
			var remBtn = document.getElementById("remBtn");
			var n = 1;

			addFile.addEventListener('click', function(){
				
				var div = document.createElement("div");
				div.innerHTML = "<input type=file name=file"+n+" id=file"+n+" onchange=chkFile(this)><input type=button value=삭제 onclick=rmBtn(this)>";
				
				fileArea.append(div);
				console.log(file);
				console.log(remBtn);
				n++;
			});
			
		}
		
		function rmBtn(e){
			e.parentNode.remove();
		}
		
		function chkFile(e){
			let splitSlash = e.value.split("\\");
			let slashPop = splitSlash.pop();
			let splitComma = slashPop.split(".");
			let commaPop = splitComma.pop();
			
			if(!(commaPop == 'png' || commaPop == 'jpg' || commaPop == 'bmp')){
				alert("사진만 가능");
				e.value = '';
			}
			
			var file = e.files[0];
			
			var _URL = window.URL
			var img = new Image();
			
			img.src = _URL.createObjectURL(file);
			img.onload = function(){
				if(img.width > 500 || img.height > 500){
					alert("사이즈 맞추셈");
					e.value = "";
				}
			}
		}
		
		var file = $("input[type=file]");
		
		console.log(file);
	</script>
<body>
		<c:if test="${empty detailList}">
			<form action="insertBoard" method="post" enctype="multipart/form-data">
				작성자 : <input type="text" name="memName" value="${detailList[0].memName}" required><br>
				ID : <input type="text" name="memId" value="${detailList[0].memId}" required><br>
				제목 : <input type="text" name="boardSubject" value="${detailList[0].boardSubject}" required><br>
				내용: <br>
				<textarea rows="5" cols="30" name="boardContent" required>${detailList[0].boardContent}</textarea><br>
				<input type="submit" value="등록">
				<input type="button" value="파일 추가" id="addFile">
				<div id="fileArea">
					<!-- 파일이 추가되는 영역 -->
				</div>
			</form>		
		</c:if>
		<c:if test="${not empty detailList}">
			<form action="updateBoard" method="post">
				<input type="hidden" name="seq" value="${detailList[0].seq}">
				작성자 : <input type="text" name="memName" value="${detailList[0].memName}" id="memName"><br>
				ID : <input type="text" name="memId" value="${detailList[0].memId}" id="memId"><br>
				제목 : <input type="text" name="boardSubject" value="${detailList[0].boardSubject}" id="boardSubject"><br>
				내용: <br>
				<textarea rows="5" cols="30" name="boardContent" id="boardContent">${detailList[0].boardContent}</textarea><br>
				<input type="submit" value="수정" id="uptButton">	
				<c:forEach items="${fileMap}" var="fileMap">
					<a href="download?fileName=${fileMap.saveName}">${fileMap.saveName}</a>
				</c:forEach>
			</form>		
		</c:if>
</body>
	
</html>