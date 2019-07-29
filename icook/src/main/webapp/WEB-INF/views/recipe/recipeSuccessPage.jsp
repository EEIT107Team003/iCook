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
.right2 {
	float: right;
}
</style>
</head>
<body bgcolor="#ffffce">
	<div align="center">
		<div class="right2">
			<%--currentUser=${currentUser}<br> recipeUser=${recipeUser}<br>--%>
			<%--<c:if test="${not empty currentUser}">--%>
			<%--<c:if test="${currentUser == recipeUser}">--%>
			<%--href="${pageContext.request.contextPath}/user/recipeUpdateOne/${recipe.pk_recipe_id}"--%>
			<!--<a-->
			<%--href="<c:url value='/user/recipeUpdateOne/${recipe.pk_recipe_id}'/>"--%>
			<!--class="btn btn-outline-primary">修改</a>-->
			<!--<br>-->
			<%--src="<c:url value='/user/deleteTwo/${recipe.pk_recipe_id}'/>"--%>
			<%--<a href="<c:url value='/user/deleteTwo/${recipe.pk_recipe_id}'/>"--%>
			<!--class="btn btn-outline-danger">刪除</a>-->
			<!--<br>-->
			<%--</c:if>--%>
			<%--</c:if>--%>
		</div>
		<%--第一張table-start--%>
		<!--<table border="1" bgcolor="#ffffb9" width="50%">-->
		<table width="50%">
			<tr align="center">
				<td>食譜名稱</td>
				<td>${recipe.recipe_name}</td>
			</tr>
			<tr align="center">
				<%--<td colspan="2">--%>
				<td>食譜封面照片</td>
				<td><img
					src="<c:url value='/getRecipePicture/${recipe.pk_recipe_id}' />"
					width="300" /></td>
			</tr>
			<tr align="center">
				<td>烹調時間</td>
				<td>${recipe.recipe_time}</td>
			</tr>
			<tr align="center">
				<td>食譜份量</td>
				<td>${recipe.recipe_quantity}</td>
			</tr>
			<tr align="center">
				<td>食譜簡介</td>
				<td>${recipe.recipe_summary}</td>
			</tr>
			<%--<img width='100' height='150' src="<c:url value='/getPicture/${product.bookId}'/>" />--%>
		</table>
		<%--第一張table-end--%>
		<br>
		<%--第二張table-start--%>
		<!--<table border="1" width="50%" bgcolor="#ffffaa">-->
		<table width="50%">
			<!--【recipeBeans】來自於public String updateOneGet(Model model)-->
			<thead>
				<tr align="center">
					<td>食材名稱</td>
					<td>份量</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="recipe2" items="${recipeIngredients}">
					<tr align="center">
						<td>${recipe2.ingredients}</td>
						<td>${recipe2.quantity}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<%--第二張table-end--%>
		<br>
		<%--第三張table-start--%>
		<!--<table border="1" width="50%" bgcolor="#ffff93">-->
		<table width="50%">
			<!--【recipeBeans】來自於public String updateOneGet(Model model)-->
			<thead>
				<tr align="center">
					<td>步驟圖片</td>
					<td>步驟說明</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="recipe3" items="${recipeUnitBean}">
					<tr align="center">
						<td><img
							src="<c:url value='/getRecipePicture2/${recipe.pk_recipe_id}/${recipe3.stepNo}' />"
							width="300" /></td>
						<td>${recipe3.explain}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<%--第三張table-end--%>
		<!--<br>-->
		<%--<a href="<c:url value='/recipe/recipeIndex' />">回食譜首頁</a>--%>
		<br> <a href="<c:url value='/index2' />">回首頁</a>
	</div>
	<script>
		document.onkeydown = function(e) {
			e = window.event || e;
			var keycode = e.keyCode || e.which;
			if (keycode == 116) {
				console.log("禁用F5按鍵");
				if (window.event) {
					console.log("禁用F5按鍵-#2");
					// ie
					try {
						console.log("禁用F5按鍵-#3");
						e.keyCode = 0;
					} catch (e) {
						console.log("禁用F5按鍵-#4");
					}
					e.returnValue = false;
				} else {
					//firefox
					console.log("禁用F5按鍵-#5");
					e.preventDefault();
				}
			}
		}
	</script>
</body>
</html>