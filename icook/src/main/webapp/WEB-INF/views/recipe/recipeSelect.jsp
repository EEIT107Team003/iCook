<!--郭翔宇-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>recipeSelect</title>
</head>
<body bgcolor="#ffffce">
	<div align="center">
		<h1>recipeSelect</h1>
		<h2>查詢資料</h2>
		<div>
			<form method="POST" action="${pageContext.request.contextPath}/recipe/search">
				搜尋：<input type="text" name="recipeSearch" />
				<input type="submit" value="查詢" />
			</form>
		</div>
		<br>
		<table border="1" width="50%" bgcolor="#ffffb9">
			<!--【recipeBeans】來自於public String updateOneGet(Model model)-->
			<thead>
				<tr align="center">
					<td>食譜名稱</td>
					<td>食譜簡介</td>
					<td>食譜日期</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="recipe" items="${recipeBeans}">
					<tr align="center">
						<td>${recipe.recipe_name}</td>
						<td>${recipe.recipe_summary}</td>
						<td>${recipe.recipe_date}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<br>
		<a href="<c:url value='/recipe/recipeIndex' />">回食譜首頁</a>
		<br>
		<a href="<c:url value='/home' />">回首頁</a>
		<br>
	</div>
</body>
</html>