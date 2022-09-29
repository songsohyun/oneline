<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<table border="1" id="tableForm">
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
				<td><a href="detail?seq=${list.seq}&memId=${list.memId}&memName=${list.memName}&boardSubject=${list.boardSubject}&boardContent=${list.boardContent}">${list.boardSubject}</a></td>
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