<!--郭翔宇-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body bgcolor="#deffac">
	<div align="center">
		<h1>update</h1>
		<h2>修改資料</h2>
		<!--三個地方要完全一樣-->
		<%--<c:url value='/home' />--%>
		<form:form method="POST" modelAttribute="RecipeBean" enctype="multipart/form-data" action="${pageContext.request.contextPath}/updateTwoBack">
			<table border="1" bgcolor="#ffffb9" width="50%">
				<tr>
					<!--食譜名稱-->
					<td><label for="recipe_name">食譜名稱</label></td>
					<td>
						<form:input id="recipe_name" path="recipe_name" name="recipe_name" type="text" />
					</td>
				</tr>
				<tr>
					<!--3.食譜份量-->
					<td><label for="recipe_quantity">食譜份量</label></td>
					<td>
						<form:input id="recipe_quantity" path="recipe_quantity" name="recipe_quantity" type="text" />
					</td>
				</tr>
				<tr>
					<!--10.儲存使用者上傳圖片檔案的欄位-->
					<td><label for="image_file"> 食譜圖片 </label></td>
					<td>
						<form:input id="image_file" path="image_file" name="image_file" type="file" />
					</td>
				</tr>

				<tr>
					<!--5.食譜簡介-->
					<td><label for="recipe_summary"> 食譜簡介 </label></td>
					<td>
						<form:input id="recipe_summary" path="recipe_summary" name="recipe_summary" type="text" />
					</td>
				</tr>
				<tr>
					<!--6.烹調時間-->
					<td><label for="recipe_time"> 烹調時間 </label></td>
					<td>
						<form:input id="recipe_time" path="recipe_time" name="recipe_time" type="text" />
					</td>
				</tr>
				<tr>
					<!--7.小撇步介紹-->
					<td><label for="recipe_note"> 小撇步介紹 </label></td>
					<td>
						<form:input id="recipe_note" path="recipe_note" name="recipe_note" type="text" />
					</td>
				</tr>
				<tr>
					<!--8.食譜時間日期-->
					<td><label for="recipe_date">食譜時間日期 </label></td>
					<td>
						<form:input id="recipe_date" path="recipe_date" name="recipe_date" type="date" />
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<div align="center">
							<!-- 這是「送出」按鈕 -->
							<input type="submit" value="確認修改資料" />
						</div>
					</td>
				</tr>
			</table>
		</form:form> 
	</div>
	<br>
	<a href="<c:url value='/home' />">回首頁</a><br>
<!-- 	<a href="/home">回首頁1[error]</a><br> -->
<%-- 	<a href="${pageContext.request.contextPath}">回首頁2</a><br> --%>
<%-- 	<a href="<c:url value='/home' />">回首頁3</a><br> --%>
<%-- 	<a href="<spring:url value='/home' />">回首頁4</a><br> --%>
	<br>
<!-- 	&nbsp; -->
<%-- 	pageContext.request.contextPath&nbsp;=&nbsp;${pageContext.request.contextPath}<br> --%>
<%-- 	c-url&nbsp;=&nbsp;<c:url value='/home' /> --%>
<%-- 	spring-url&nbsp;=&nbsp;<spring:url value='/home' /> --%>
</body>
</html>