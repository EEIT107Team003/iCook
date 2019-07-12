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
<title>successPage</title>
</head>
<body bgcolor="#ffffce">
	<div align="center">
		<h1>successPage</h1>
		<h2>成功頁面</h2>
		<table border="1" bgcolor="#ffffb9" width="50%">
			<tr align="center">
				<td>pageSubject</td>
				<td>${pageSubject}</td>
			</tr>
			<tr align="center">
				<td>recipe</td>
				<td>${recipe}</td>
			</tr>
			<tr align="center">
				<td>recipe.pk_recipe_id</td>
				<td>${recipe.pk_recipe_id}</td>
			</tr>
			<tr align="center">
				<td>recipe.recipe_name</td>
				<td>${recipe.recipe_name}</td>
			</tr>
			<tr align="center">
				<td colspan="2">
					<img src="<c:url value='/getRecipePicture/${recipe.pk_recipe_id}'/>" />
				</td>
			</tr>
			<%--<img width='100' height='150' src="<c:url value='/getPicture/${product.bookId}'/>" />--%>
		</table>
		<br>
		<a href="<c:url value='/home' />">回首頁</a><br>
	</div>
</body>
</html>