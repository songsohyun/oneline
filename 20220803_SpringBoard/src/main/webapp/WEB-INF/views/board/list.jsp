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
	$(document).ready(function(){
		var chk = document.getElementsByName("chk");
		var rowCnt = chk.length;
		
		$("input[name='allCheck']").click(function(){
			var chk_listArr = $("input[name='chk']");
			for (var i=0; i<chk_listArr.length; i++){
				chk_listArr[i].checked = this.checked;
			}
		});
		
		$("input[name='chk']").click(function(){
			if($("input[name='chk']:checked").length == rowCnt){
				$("input[name='allCheck']")[0].checked = true;
			}
			else{
				$("input[name='allCheck']")[0].checked = false;
			}
		});
		
		$("#searchType").val("${searchMap.searchType}");
	});
	
	function deleteValue(){
		var url = "delete";
		var valueArr = new Array();
	    var list = $("input[name='chk']");
	    for(var i = 0; i < list.length; i++){
	        if(list[i].checked){ //선택되어 있으면 배열에 값을 저장함
	            valueArr.push(list[i].value);
	        }
	    }
	    if (valueArr.length == 0){
	    	alert("선택된 글이 없습니다.");
	    }
	    else{
			var chk = confirm("정말 삭제하시겠습니까?");
			console.log("valueArr : "+ valueArr);
			$.ajax({
			    url : url,                    // 전송 URL
			    method : 'POST',                // POST 방식
			    data : {
			    	valueArr : valueArr
			    },
	            success: function(jdata){
	                if(jdata = 1) {
	                    alert("삭제 성공");
	                    location.replace("list") //list 로 페이지 새로고침
	                }
	                else{
	                    alert("삭제 실패");
	                }
	            }
			});
		}
	};
	
// 	function searchAjax(){
// 		 $.ajax({    
// 	           url      : "getBoardList",
// 	           data     : $("#searchForm").serialize(),
// 	           type     : "POST",
// 	           dataType : "JSON",
// 	           success  : function(obj) {
// 	                getBoardListCallback(obj);
// 					str = "";
// 					console.log(obj.length);
// 					for(var i=0; i<obj.length; i++){
// 						str += '<td><input type=checkbox value='+obj[i].seq+' name=chk id=chk></td>'
// 						str += '<td>'+obj[i].seq+'</td>'
// 						str += '<td>'+obj[i].memName+'('+obj[i].memId+')</td>'
// 						str += '<td><a href="detail?seq='+obj[i].seq+'&memId='+obj[i].memId+'&memName='+obj[i].memName+'&boardSubject='+obj[i].boardSubject+'&boardContent='+obj[i].boardContent+'">'+obj[i].boardSubject+'</a></td>'
// 						str += '<td>'+obj[i].regDate+'</td>'
// 						str += '<td>'+obj[i].uptDate+'</td>'
// 						str += '<td>'+obj[i].viewCnt+'</td>'
// 					}
// 					$("#ajaxTr").html(str);
// 	            },           
// 	            error:function(request,status,error){        
// 	            	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);       }
	            	
// 	         });
// 	    }

		function searchAjax(){
			$.ajax({
				url : "getBoardList",
				data : $("#searchForm").serialize(),
				type : "post",
				success : function(result){
					$("#divForm").html(result);
				},
				error : function(){
					
				}
			})
		}
	    
	    /** 게시판 - 목록 조회  콜백 함수 */

</script>

<body>
	<form id="searchForm">
	<input type="hidden" name="nowPage" value = "1">
		<div>
			<select name="searchType" id="searchType">
				<option selected="selected">선택</option>
				<option value="writer">작성자</option>
				<option value="title">제목</option>
				<option value="writerTitle">작성자 + 제목</option>
			</select>
			<input type="text" name="searchContent" value="${searchMap.searchContent}">
			<input type="button" value="검색" onclick="searchAjax()">
			
		</div>
		<div>
			<input type="date" name="startDate"	value="${searchMap.startDate}">~<input type="date" name="endDate" value="${searchMap.endDate}">
		</div>
	</form>
	
	<input type="button" onclick="location.href='insert'" value="글 등록">
	<input type="button" onclick="deleteValue()" value="다중삭제">
	<!--  -->
	<div id="divForm">
	<table border="1" id="tableForm" style>
		<tr>
			<th><input type="checkbox" name="allCheck"></th>
			<th>글번호</th>
			<th>작성자(ID)</th>
			<th>제목</th>
			<th>작성일</th>
			<th>수정일</th>
			<th>조회수</th>
		</tr>
		<c:forEach items="${list}" var="list">
			<tr id="ajaxTr">
				<td><input type="checkbox" value="${list.seq}" name="chk" id="chk"></td>
				<td>${list.seq}</td>
				<td>${list.memName}(${list.memId})</td>
				<td><a href="detail?seq=${list.seq}&memId=${list.memId}&memName=${list.memName}&boardSubject=${list.boardSubject}&boardContent=${list.boardContent}&fileSeq=${list.seq}">${list.boardSubject}</a></td>
				<td>${list.regDate}</td>
				<td>${list.uptDate}</td>
				<td>${list.viewCnt}</td>
			</tr>
		</c:forEach>
	</table>
		<c:if test="${empty paging.searchType || empty paging.searchContent}">
			<div style="display: block;">
				<a href="./list?nowPage=1&cntPerPage=${paging.cntPerPage}">맨처음</a>		
				<c:if test="${paging.startPage != 1 }">
					<a href="./list?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
				</c:if>
				<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
					<c:choose>
						<c:when test="${p == paging.nowPage }">
							<b>${p}</b>
						</c:when>
						<c:when test="${p != paging.nowPage }">
							<a href="./list?nowPage=${p}&cntPerPage=${paging.cntPerPage}">${p }</a>
						</c:when>
					</c:choose>
				</c:forEach>
				<c:if test="${paging.endPage != paging.lastPage}">
					<a href="./list?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
				</c:if>
				<a href="./list?nowPage=${paging.lastPage}&cntPerPage=${paging.cntPerPage}">맨끝</a>
			</div>
		</c:if>
		<c:if test="${not empty paging.searchType || not empty paging.searchContent}">
			<div style="display: block; text-align: center;">
				<a href="./list?nowPage=1&cntPerPage=${paging.cntPerPage}&searchType=${paging.searchType}&searchContent=${paging.searchContent}">맨처음</a>		
				<c:if test="${paging.startPage != 1 }">
					<a href="./list?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}&searchType=${paging.searchType}&searchContent=${paging.searchContent}">&lt;</a>
				</c:if>
				<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
					<c:choose>
						<c:when test="${p == paging.nowPage }">
							<b>${p}</b>
						</c:when>
						<c:when test="${p != paging.nowPage }">
							<a href="./list?nowPage=${p}&cntPerPage=${paging.cntPerPage}&searchType=${paging.searchType}&searchContent=${paging.searchContent}">${p }</a>
						</c:when>
					</c:choose>
				</c:forEach>
				<c:if test="${paging.endPage != paging.lastPage}">
					<a href="./list?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}&searchType=${paging.searchType}&searchContent=${paging.searchContent}">&gt;</a>
				</c:if>
				<a href="./list?nowPage=${paging.lastPage}&cntPerPage=${paging.cntPerPage}&searchType=${paging.searchType}&searchContent=${paging.searchContent}">맨끝</a>
			</div>
		</c:if>
		</div>
		<!--  -->
</body>

</html>