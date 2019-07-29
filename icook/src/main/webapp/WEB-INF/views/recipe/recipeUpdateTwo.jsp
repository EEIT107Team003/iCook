<!--郭翔宇-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%-- <%@ page import="java.util.List"%> --%>
<%-- <%@ page import="recipe.model.RecipeIngredientsBean"%> --%>
<!-- import recipe.model.RecipeIngredientsBean; -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>recipeUpdateTwo</title>
</head>
<!--<body bgcolor="#ffffce">-->
<body>
	<div align="center">
		<h2>修改食譜資料</h2>
		<%--三個地方要完全一樣--%>
		<%--<c:url value='/home' />--%>
		<%--<form:form method="POST" modelAttribute="RecipeBean" enctype="multipart/form-data" action="${pageContext.request.contextPath}/updateTwoBack">--%>
		<form:form method="POST" modelAttribute="RecipeBean"
			enctype="multipart/form-data"
			action="${pageContext.request.contextPath}/user/recipe/recipeUpdateTwo">
			<%--<form:input type="hidden" path="pk_recipe_id" />可以幫助我在頁面上儲存PK鑑資料--%>
			<form:input type="hidden" path="pk_recipe_id" />
			<%--<form:input type="hidden" path="pk_recipe_id" />是用來儲存recipe的PK鍵用的--%>
			<form:input type="hidden" path="memberbean" />
			<!--<table border="1" bgcolor="#ffffb9" width="50%">-->
			<table width="50%" class="table table-hover">
				<tbody>
					<tr align="center">
						<!--食譜名稱-->
						<td><label for="recipe_name">食譜名稱</label></td>
						<td><form:input id="recipe_name" path="recipe_name"
								name="recipe_name" type="text" /></td>
					</tr>
					<tr align="center">
						<!--儲存使用者上傳圖片檔案的欄位-->
						<td><label for="image_file">食譜封面照片</label></td>
						<td><form:input id="image_file" path="image_file"
								name="image_file" type="file" /> <img
							src="<c:url value='/getRecipePicture/${RecipeBean.pk_recipe_id}' />" width="200" />
						</td>
					</tr>
					<tr align="center">
						<!--烹調時間-->
						<td><label for="recipe_time">烹調時間</label></td>
						<td><form:input id="recipe_time" path="recipe_time"
								name="recipe_time" type="text" /></td>
					</tr>
					<tr align="center">
						<!--食譜份量-->
						<td><label for="recipe_quantity">食譜份量</label></td>
						<td><form:input id="recipe_quantity" path="recipe_quantity"
								name="recipe_quantity" type="text" /></td>
					</tr>
					<tr align="center">
						<!--食譜簡介-->
						<td><label for="recipe_summary">食譜簡介</label></td>
						<td><form:input id="recipe_summary" path="recipe_summary"
								name="recipe_summary" type="text" /></td>
					</tr>
					<tr align="center">
						<%--食譜分類--%>
						<td><label for="recipe_item">食譜分類</label></td>
						<td><form:select name="recipe_item" path="recipe_item">
								<form:option value="taiwan">臺式</form:option>
								<form:option value="japan">日式</form:option>
								<form:option value="thailand">泰式</form:option>
							</form:select></td>
					</tr>
				</tbody>
			</table>
			<%-- 第一張table-end --%>
			<br>

			<%-- 第二張table-start --%>
			<%-- 食譜食材表單【動態生成】 --%>
			<!--<table id="recipe_ingredients" border="1" width="50%" bgcolor="#ffffaa">-->
			<table id="recipe_ingredients" width="50%">
				<thead>
					<tr align="center">
						<th scope="col">食材名稱</th>
						<th scope="col">份量</th>
						<th scope="col">新增</th>
						<th scope="col">刪除</th>
					</tr>
				</thead>
				<tbody>
					<!--RecipeBean-->
					<%
						//List<RecipeIngredientsBean> ingredientsBeanList = (List<RecipeIngredientsBean>) session
							//.getAttribute("ingredientsBeanList");
							//System.out.println("ingredientsBeanList -> " + ingredientsBeanList);
					%>
					<c:forEach var="recipe2" items="${recipeIngredients}">
						<tr align="center">              
							<td><input type="text" name="ingredients2"
								value="${recipe2.ingredients}" /></td>
							<td><input type="text" name="quantity2"
								value="${recipe2.quantity}" /></td>
							<td><input type="button" onclick="addCurrentRow1()"
								value="新增" style="font-size: 16px" /></td>
							<td><input type="button" onclick="deleteCurrentRow1(this)"
								value="刪除" style="font-size: 16px" /></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<input type="button" onclick="addCurrentRow1()" value="新增一列"
				style="font-size: 16px" />
			<%-- 第二張table-end --%>
			<br>
			<br>
			<%-- 第三張table-start --%>
			<%-- 食譜步驟表單【動態生成】 --%>
			<table id="recipe_unit" border="1" width="50%" bgcolor="#ffff93">
				<thead>
					<tr align="center">
						<th scope="col">步驟圖片</th>
						<th scope="col">步驟說明</th>
						<th scope="col">新增</th>
						<th scope="col">刪除</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="recipe3" items="${recipeUnitBean}">
						<tr align="center">
							<td><input type="file" name="unit_image2" value="" /></td>
							<td><input type="text" name="explain2"
								value="${recipe3.explain}" /></td>
							<td><input type="button" onclick="addCurrentRow2()"
								value="新增" style="font-size: 16px" /></td>
							<td><input type="button" onclick="deleteCurrentRow2(this)"
								value="刪除" style="font-size: 16px" /></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<input type="button" onclick="addCurrentRow2()" value="新增一列"
				style="font-size: 16px" />
			<%-- 第三張table-end --%>
			<br>
			<%--這是「送出」按鈕--%>
			<input type="submit" value="確認修改資料" />
		</form:form>
		<br> <a href="<c:url value='/recipe/recipeIndex' />">回食譜首頁</a> <br>
		<a href="<c:url value='/home' />">回首頁</a> <br>
	</div>
	<%-- 	<a href="/home">回首頁1[error]</a><br> --%>
	<%-- 	<a href="${pageContext.request.contextPath}">回首頁2</a><br> --%>
	<%-- 	<a href="<c:url value='/home' />">回首頁3</a><br> --%>
	<%-- 	<a href="<spring:url value='/home' />">回首頁4</a><br> --%>
	<%-- 	&nbsp; --%>
	<%-- 	pageContext.request.contextPath&nbsp;=&nbsp;${pageContext.request.contextPath}<br> --%>
	<%-- 	c-url&nbsp;=&nbsp;<c:url value='/home' /> --%>
	<%-- 	spring-url&nbsp;=&nbsp;<spring:url value='/home' /> --%>
	<script>
		let countIngredients = 1;//食譜食材
		let countUnit = 1;//食譜步驟
		//recipe_ingredients
		function addCurrentRow1() {
			//新增一列
			countIngredients++;
			let trcomp = "<tr align='center'>";
			trcomp += "<td><input type='text' name='ingredients2' /></td>";
			trcomp += "<td><input type='text' name='quantity2'></input></td>";
			trcomp += "<td>";
			trcomp += "<input type='button' onclick='addCurrentRow1()' value='新增' style='font-size: 16px' />";
			trcomp += "</td>";
			trcomp += "<td>";
			trcomp += "<input type='button' onclick='deleteCurrentRow1(this)' value='刪除' style='font-size: 16px' />";
			trcomp += "</td>";
			trcomp += "</tr>";
			$("#recipe_ingredients tbody tr:last-child").after(trcomp);
			//jQuery 裡面 $("#aa") 指的是 id="aa" 的元素
		}

		function deleteCurrentRow1(obj) {
			//刪除一列
			if (1 == countIngredients) {
				//資料筆數不可為0
				return;
			}
			let isDelete = confirm("確定要刪除嗎？");
			if (isDelete) {
				countIngredients--;
				let tr = obj.parentNode.parentNode;
				let tbody = tr.parentNode;
				tbody.removeChild(tr);
			}
		}

		function addCurrentRow2() {
			//新增一列
			countUnit++;
			let trcomp = "<tr align='center'>";
			trcomp += "<td><input type='file' name='unit_image2' /></td>";
			trcomp += "<td><input type='text' name='explain2'></input></td>";
			trcomp += "<td>";
			trcomp += "<input type='button' onclick='addCurrentRow2()' value='新增' style='font-size: 16px' />";
			trcomp += "</td>";
			trcomp += "<td>";
			trcomp += "<input type='button' onclick='deleteCurrentRow2(this)' value='刪除' style='font-size: 16px' />";
			trcomp += "</td>";
			trcomp += "</tr>";
			$("#recipe_unit tbody tr:last-child").after(trcomp);
			//jQuery 裡面 $("#aa") 指的是 id="aa" 的元素
		}

		function deleteCurrentRow2(obj) {
			//刪除一列
			if (1 == countUnit) {
				//資料筆數不可為0
				return;
			}
			let isDelete = confirm("確定要刪除嗎？");
			if (isDelete) {
				countUnit--;
				let tr = obj.parentNode.parentNode;
				let tbody = tr.parentNode;
				tbody.removeChild(tr);
			}
		}
	</script>
</body>
</html>