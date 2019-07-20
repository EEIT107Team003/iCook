<!--郭翔宇-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>recipeIndex</title>
<style type="text/css">
</style>
</head>
<body bgcolor="#ffffce">
	<div align="center">
		<h1>recipeIndex</h1>
		<h2>食譜首頁</h2>
		<table border="1" width="50%" bgcolor="#ffffb9">
			<tr align="center">
				<%--align="center" 置中設定--%>
				<td><a href="<c:url value='/recipe/recipeInsert' />">新增食譜</a></td>
				<td><a href="<c:url value='/recipe/recipeUpdateOne' />">修改食譜</a></td>
				<td><a href="<c:url value='/recipe/recipeSelect' />">查詢食譜</a></td>
				<td><a href="<c:url value='/recipe/recipeDelete' />">刪除食譜</a></td>
				<%--<td><input type="button" value="刪除2" onclick="location.href='delete'"></td>--%>
			</tr>
		</table>
		<br>
		<a href="<c:url value='/home' />">返回首頁</a>
		<br>
	</div>
</body>
</html>