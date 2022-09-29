<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<!-- <script type="text/javascript">
 	$(function(){
 		$("#all").click(function(){ 		
 		    if(	$("#all").is(":checked") ){
 		    	$("[name:chk]").prop("checked", true);
 		    	$("[name:chk]").attr("checked", "checked");
 		    }else{
 		    	$("[name:chk]").prop("checked", false);
  		    	$("[name:chk]").attr("checked");
 		    }
 		})
		
 		function fncCheck(e){
 			// input 갯수
 			var checkBox = $("[name=chk]").length;
 			// 체크된 갯수
 			var checked = $("[name=chk]:checked").length;
			
 			if(checkBox == cheked){
 				$("#all").prop("checked", true);
 			}else{
 				$("#all").prop("checked", false);
 			}
 		}
		
 		$("#btn").click(function(){
 			var checked = $("[name=chk]:checked").length;
			
 			if(checked == 0){
 				alert("체크해");
 			}else if(checked <= 4 || $("#all").is(":checked")){
 				alert("성공");
 			}else{
 				alert("실패");
 			}
 		})
		
 		if(  $(chk).is(":checked") ){
 			$("#dvTxt").append($(chk).value)
 		}else{
 			var txt = $("#dvTxt").text().replace($(chk).value, "");
 			$("#dvTxt").text(txt);
 		}
		
		
 	}) </script> -->
<body>
	<input type="checkbox" id="all" name="all"><label for="all">전체</label>
	<input type="button" value="버튼" id="checkButton"><br>
	<input type="checkbox" id="seoul" name="seoul" value="서울" onclick="chked(this)"><label for="seoul">서울</label>
	<input type="checkbox" id="incheon" name="incheon" value="인천" onclick="chked(this)"><label for="incheon">인천</label>
	<input type="checkbox" id="gyeong" name="gyeong" value="경기" onclick="chked(this)"><label for="gyeong">경기</label>
	<input type="checkbox" id="gang" name="gang" value="강원" onclick="chked(this)"><label for="gang">강원</label>
	<input type="checkbox" id="boo" name="boo" value="부산" onclick="chked(this)"><label for="boo">부산</label>
	<input type="checkbox" id="dae" name="dae" value="대전" onclick="chked(this)"><label for="dae">대전</label>
	<input type="checkbox" id="jun" name="jun" value="전남" onclick="chked(this)"><label for="jun">전남</label>
	<input type="checkbox" id="je" name="je" value="제주" onclick="chked(this)"><label for="je">제주</label>
	<input type="checkbox" id="pyeong" name="pyeong" value="평양" onclick="chked(this)"><label for="pyeong">평양</label>
	<div>체크된 목록 : </div>
	<ul id="list">
		
	</ul>
</body>
<script type="text/javascript">
	let checkBoxs = document.querySelectorAll("input[type='checkbox']");
	
	const allBtn = document.getElementById("all");
	var span = document.createElement("span");
	var list = document.getElementById("list");
	
	let cnt = 0;
	let buttonCnt = 0;
	
	allBtn.addEventListener("click", function(){
		cnt ++;
		if(cnt % 2 != 0){
			for(let i = 1; i<checkBoxs.length ; i++){
				checkBoxs[i].setAttribute("checked", true);
				buttonCnt = 9;
			}
		}else{
			for(let i = 1; i<checkBoxs.length ; i++){
				checkBoxs[i].removeAttribute("checked");
				buttonCnt = 0;
			}
		}
	});
	
	function chked(e){
		if(e.checked){
			span.innerHTML = e.value;
			buttonCnt ++;
			console.log(e.value);
			$("#list").append("<li>" + e.value + "</li>");
			if(buttonCnt == 9){
				allBtn.setAttribute("checked", true);
			}
		}else{
			buttonCnt --;
			for(var i=0; i<list.childNodes.length;i++){
				if(list.childNodes[i].innerHTML == e.value){
					list.childNodes[i].remove();
				}
			}
			console.log(list.childNodes);
			if(buttonCnt < 9){
				allBtn.removeAttribute("checked");
			}
		}
		
	}
	
	const checkButton = document.getElementById("checkButton");
	
	checkButton.addEventListener("click", function(){
		if(buttonCnt <=4 && buttonCnt > 0){
			alert("성공");
		}else{
			alert("실패");
		}
	})
	
	
</script>
</html>