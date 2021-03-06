<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>getArticle</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$('select').val(${pagePerRow});
			$('select').change(function(){
				$('form').submit();
			});
		});
	</script>
</head>
<body>
	<h1>Article List</h1>
	<form action="${pageContext.request.contextPath}/getArticleList" method="get">
		<select name="pagePerRow">
			<option value="3">3줄씩보기
			<option value="5">5줄씩보기
			<option value="10">10줄씩보기
		</select>
	</form>
	<table border="1">
		<thead>
			<tr>
				<th>article ID</th>
				<th>article Title</th>
				<th>article Content</th>
				<th>article File Name</th>
				<th>article File Size</th>
				<th>보기</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}"  var="list">
				<tr>
					<td>${list.articleId}</td>
					<td>${list.articleTitle}</td>
					<td>${list.articleContent}</td>
					<td><a href="${pageContext.request.contextPath}/resources/upload/
							${list.articleFile.articleFileName}.${list.articleFile.articleFileExt}" download>
							${list.articleFile.articleFileName}.${list.articleFile.articleFileExt}</a></td>
					<td>${list.articleFile.articleFileSize} KB</td>
					<td><a href="${pageContext.request.contextPath}/getArticle?articleId=${list.articleId}">보기</a></td>
					<td><a href="${pageContext.request.contextPath}/deleteArticle?articleId=${list.articleId}">삭제</a></td>
				</tr>		
			</c:forEach>
		</tbody>	
	</table>
	<c:if test="${currentPage > 1}">
		<a href="${pageContext.request.contextPath}/getArticleList?currentPage=1&pagePerRow=${pagePerRow}">[처음]</a>
		<a href="${pageContext.request.contextPath}/getArticleList?currentPage=${currentPage - 1}&pagePerRow=${pagePerRow}">[이전]</a>
	</c:if>
	<c:forEach var="i" items="${pageList}">
		<a href="${pageContext.request.contextPath}/getArticleList?currentPage=${i}&pagePerRow=${pagePerRow}">[${i}]</a>
	</c:forEach>
	<c:if test="${currentPage < totalPage}">
		<a href="${pageContext.request.contextPath}/getArticleList?currentPage=${currentPage + 1}&pagePerRow=${pagePerRow}">[다음]</a>
		<a href="${pageContext.request.contextPath}/getArticleList?currentPage=${totalPage}&pagePerRow=${pagePerRow}">[마지막]</a>
	</c:if>
</body>
</html>