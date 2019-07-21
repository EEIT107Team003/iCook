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
<title>successPage</title>
</head>
<body bgcolor="#ffffce">
	<div align="center">
		<h2>${pageSubject}</h2>
		<table border="1" bgcolor="#ffffb9" width="50%">
			<tr align="center">
				<td>食譜名稱</td>
				<td>${recipe.recipe_name}</td>
			</tr>
			<tr align="center">
				<td>食譜份量</td>
				<td>${recipe.recipe_quantity}</td>
			</tr>
			<tr align="center">
				<%--<td colspan="2">--%>
				<td>食譜圖片</td>
				<td><img
					src="<c:url value='/getRecipePicture/${recipe.pk_recipe_id}' />" />
				</td>
			</tr>
			<tr align="center">
				<td>食譜簡介</td>
				<td>${recipe.recipe_summary}</td>
			</tr>
			<tr align="center">
				<td>烹調時間</td>
				<td>${recipe.recipe_time}</td>
			</tr>
			<tr align="center">
				<td>小撇步介紹</td>
				<td>${recipe.recipe_note}</td>
			</tr>
			<tr align="center">
				<td>食譜時間日期</td>
				<td>${recipe.recipe_date}</td>
			</tr>
			<%--<img width='100' height='150' src="<c:url value='/getPicture/${product.bookId}'/>" />--%>
		</table>
		<br> <a href="<c:url value='/recipe/recipeIndex' />">回食譜首頁</a> <br>
		<a href="<c:url value='/home' />">回首頁</a> <br>
	</div>
</body>
</html>