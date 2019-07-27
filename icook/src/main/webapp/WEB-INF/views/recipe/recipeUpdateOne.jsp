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
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
</head>
<body bgcolor="#ffffce">
	<div align="center">
		<h1>recipeUpdateOne</h1>
		<h2>修改資料</h2>
<!-- 		<table border="0" width="50%" bgcolor="#ffffb9"> -->
		<table border="0" width="50%">
			<!--【recipeBeans】來自於public String updateOneGet(Model model)-->
			<thead>
				<tr align="center">
					<td>食譜名稱</td>
					<td>食譜簡介</td>
					<td>修改</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="recipe" items="${recipeBeans}">
					<tr align="center">
						<td>${recipe.recipe_name}</td>
						<td>${recipe.recipe_summary}</td>
						<td><a href="${pageContext.request.contextPath}/user/recipeUpdateOne/${recipe.pk_recipe_id}">修改</a></td>
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