<!--郭翔宇-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>recipeIndex</title>
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
				<td><a href="<c:url value='/recipe/recipeInsert' />"
					class="btn btn-outline-primary">新增食譜</a></td>
				<td><a href="<c:url value='/recipe/recipeUpdateOne' />"
					class="btn btn-outline">修改食譜</a></td>
				<td><a href="<c:url value='/recipe/recipeSelect' />"
					class="btn btn">查詢食譜</a></td>
				<td><a href="<c:url value='/recipe/recipeDelete' />" class="btn">刪除食譜</a></td>
				<%--<td><input type="button" value="刪除2" onclick="location.href='delete'"></td>--%>
			</tr>
		</table>
		<br> <a href="<c:url value='/home' />">返回首頁</a> <br>
	</div>
</body>
</html>