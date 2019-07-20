<!--郭翔宇-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>recipeUpdateOne</title>
</head>
<body bgcolor="#ffffce">
	<div align="center">
		<h1>recipeUpdateOne</h1>
		<h2>修改資料</h2>
		<table border="1" width="50%" bgcolor="#ffffb9">
			<!--【recipeBeans】來自於public String updateOneGet(Model model)-->
			<thead>
				<tr align="center">
					<td>食譜名稱</td>
					<td>食譜簡介</td>
					<td>食譜日期</td>
					<td></td>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="recipe" items="${recipeBeans}">
					<tr align="center">
						<td>${recipe.recipe_name}</td>
						<td>${recipe.recipe_summary}</td>
						<td>${recipe.recipe_date}</td>
						<td><a href="${pageContext.request.contextPath}/recipeUpdateOne/${recipe.pk_recipe_id}">修改</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<br>
		<a href="<c:url value='/recipe/recipeIndex' />">回食譜首頁</a><br>
		<a href="<c:url value='/home' />">回首頁</a><br>
		<%--<a href="<c:url value='/home' />">回首頁</a><br>--%>
		<%--<a href="home">回首頁1</a><br>--%>
		<%--<a href="/home">回首頁1_2[error]</a><br>--%>
		<%--<a href="${pageContext.request.contextPath}">回首頁2</a><br>--%>
		<%--pageContext.request.contextPath&nbsp;=&nbsp;${pageContext.request.contextPath}<br>--%>
	</div>
</body>
</html>