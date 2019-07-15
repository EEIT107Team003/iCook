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
<title>delete</title>
</head>
<body bgcolor="#ffffce">
	<div align="center">
		<h1>delete</h1>
		<h2>刪除資料</h2>
		<br>
		<table border="1" width="50%" bgcolor="#ffffb9">
			<!--【recipeBeans】來自於public String updateOneGet(Model model)-->
			<c:forEach var="recipe" items="${recipeBeans}">
				<tr align="center">
					<td>${recipe.pk_recipe_id}</td>
					<td>${recipe.recipe_name}</td>
					<td><a href="deleteTwo/${recipe.pk_recipe_id}">刪除</a></td>
				</tr>
			</c:forEach>
		</table>
		<a href="<c:url value='/home' />">回首頁</a><br>
	</div>
</body>
</html>