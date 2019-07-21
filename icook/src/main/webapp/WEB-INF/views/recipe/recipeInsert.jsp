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
<title>recipeInsert</title>
<!--jQuery函式庫引入網址-->
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
</head>
<!--<font>&nbsp;&nbsp;格式為yyyy-MM-dd</font>-->
<!--<body bgcolor="#deffac">-->
<body bgcolor="#ffffce">
	<!--HTML註解-->
	<%--JSP註解--%>
	<%--<a href="<c:url value='/ch01/queryLottery.jsp' />">問單一明牌2</a><br>--%>
	<%--[Ctrl] + [Alt] + [下] = 迅速複製貼上一段程式碼--%>
	<%--[Ctrl] + [Shift] + [C] = 迅速註解程式碼--%>
	<%--[Ctrl] + [/] = 迅速註解程式碼【.java檔案專用快捷鍵】--%>
	<%--[Ctrl] + [Shift] + [O] = 自動 import Java程式類別【.java檔案專用快捷鍵】--%>
	<%--[Ctrl] + [Shift] + [F] = 自動幫程式碼排版--%>
	<%--[Ctrl] + [D] = 刪除一行程式碼--%>
	<%--[Alt] + [上]/[下] = 搬移一行程式碼--%>

	<%-- 1  Integer pk_recipe_id;/*食譜編號*/ --%>
	<%-- 2  String recipe_name;/*食譜名稱*/ --%>
	<%-- 3  String recipe_quantity;/*食譜份量*/ --%>
	<%-- 4  Blob recipe_image;/*食譜圖片*/ --%>
	<%-- 5  String recipe_summary;/*食譜簡介*/ --%>
	<%-- 6  String recipe_time;/*烹調時間*/ --%>
	<%-- 7  String recipe_note;/*小撇步介紹*/ --%>
	<%-- 8  java.sql.Date recipe_date;/*食譜時間日期*/ --%>
	<%-- 9  Integer recipe_display;/*設定食譜是否顯示【1正常顯示，公開給大家看。】【2草稿階段尚未發布，只限本人觀看。】【3對所有人隱藏起來】*/ --%>
	<%-- 10 MultipartFile image_file;/*儲存使用者上傳圖片檔案的欄位*/ --%>
	<%-- 11 String fileName;/* 儲存使用者圖片檔案名稱 */ --%>
	<div align="center">
		<!--HTML註解-->
		<%--JSP註解--%>
		<%--<c:set value="#d3ff93" var="color" />--%>
		<h1>insert</h1>
		<h2>新增一份食譜</h2>
		<%--三個地方要完全一樣--%>
		<%--<br><a href="<c:url value='/home' />">回首頁</a><br>--%>
		<form:form method="POST" modelAttribute="RecipeBean"
			enctype="multipart/form-data"
			action="${pageContext.request.contextPath}/recipe/recipeInsert">
			<%--<form:form method="POST" modelAttribute="RecipeBean" enctype="multipart/form-data">成功--%>
			<%
				//TODO action已經被修改
					/* <table border="1" bgcolor="#ffffb9" width="50%"> */
			%>
			<%-- 第一張table-start --%>
			<%-- 食譜表單 --%>
			<table border="1" bgcolor="#ffffb9" width="50%">
				<tbody>
					<tr align="center">
						<%-- 食譜名稱--%>
						<td><label for="recipe_name">食譜名稱</label></td>
						<td><form:input id="recipe_name" path="recipe_name"
								name="recipe_name" type="text" /></td>
					</tr>
					<tr align="center">
						<%--食譜份量--%>
						<td><label for="recipe_quantity">食譜份量</label></td>
						<td><form:input id="recipe_quantity" path="recipe_quantity"
								name="recipe_quantity" type="text" /></td>
					</tr>
					<tr align="center">
						<%--儲存使用者上傳圖片檔案的欄位--%>
						<td><label for="image_file">食譜圖片</label></td>
						<td><form:input id="image_file" path="image_file"
								name="image_file" type="file" /></td>
					</tr>

					<tr align="center">
						<%--食譜簡介--%>
						<td><label for="recipe_summary">食譜簡介</label></td>
						<td><form:input id="recipe_summary" path="recipe_summary"
								name="recipe_summary" type="text" /></td>
					</tr>
					<tr align="center">
						<%--烹調時間--%>
						<td><label for="recipe_time">烹調時間</label></td>
						<td><form:input id="recipe_time" path="recipe_time"
								name="recipe_time" type="text" /></td>
					</tr>
					<tr align="center">
						<%--小撇步介紹--%>
						<td><label for="recipe_note">小撇步介紹</label></td>
						<td><form:input id="recipe_note" path="recipe_note"
								name="recipe_note" type="text" /></td>
					</tr>
					<tr align="center">
						<%--8.食譜時間日期--%>
						<td><label for="recipe_date">食譜時間日期 </label></td>
						<td>
							<%--path設定要綁定的JavaBean資料屬性--%> <form:input id="recipe_date"
								path="recipe_date" name="recipe_date" type="date" />
						</td>
					</tr>
				</tbody>
			</table>
			<%-- 第一張table-end --%>
			<hr>
			<script>
				
			</script>
			<%-- 第二張table-start --%>
			<%-- 食譜食材表單【動態生成】 --%>
			<table id="recipe_ingredients" border="1" width="30%"
				bgcolor="#ffffaa">
				<thead>
					<tr align="center">
						<th>食材名稱</th>
						<th>份量</th>
						<th>刪除</th>
					</tr>
				</thead>
				<tbody>
					<tr align="center">
						<td><input type="text" name="ingredients2" /></td>
						<td><input type="text" name="quantity2"></input></td>
						<td>
							<button type="button" onclick="deleteCurrentRow1(this)">
								<font color="red">刪除</font>
							</button>
						</td>
					</tr>
				</tbody>
			</table>
			<input type="button" onclick="addCurrentRow1()" value="新增一列"
				style="font-size: 16px" />
			<%-- 第二張table-end --%>
			<hr>
			<script>
				
			</script>
			<%-- 第三張table-end --%>
			<%-- 食譜步驟表單【動態生成】 --%>
			<table id="recipe_unit" border="1" width="60%" bgcolor="#ffffaa">
				<thead>
					<tr align="center">
						<th>圖片</th>
						<th>步驟說明</th>
						<th>刪除</th>
					</tr>
				</thead>
				<tbody>
					<tr align="center">
						<td><input type="file" name="unit_image2" /></td>
						<td><input type="text" name="explain2"></input></td>
						<td>
							<button type="button" onclick="deleteCurrentRow2(this)">
								<font color="red">刪除</font>
							</button>
						</td>
					</tr>
				</tbody>
			</table>
			<input type="button" onclick="addCurrentRow2()" value="新增一列"
				style="font-size: 16px" />
			<%-- 第三張table-end --%>

			<%--這是「送出」按鈕--%>
			<hr>
			<input type="submit" value="確認新增資料" />
		</form:form>
		<%--<br> <a href="home">回首頁</a>--%>
		<%--<br><a href="${pageContext.request.contextPath}">回首頁</a><br>--%>
		<%--<c:set value="#d3ff93" var="color" />--%>
		<%--<a href="<c:url value='/home' />">回首頁</a><br>--%>
		<br> <a href="<c:url value='/recipe/recipeIndex' />">回食譜首頁</a> <br>
		<a href="<c:url value='/home' />">回首頁</a> <br>
	</div>
	<!--<div>-->
	<%--pageContext.request.contextPath&nbsp;=&nbsp;${pageContext.request.contextPath}<br>--%>
	<!--</div>-->
	<script>
		let countIngredients = 1;//食譜食材
		let countUnit = 1;//食譜步驟

		function addCurrentRow1() {
			//新增一列
			countIngredients++;
			let trcomp = "<tr align='center'>";
			trcomp += "<td><input type='text' name='ingredients2' /></td>";
			trcomp += "<td><input type='text' name='quantity2'></input></td>";
			trcomp += "<td>";
			trcomp += "<button type='button' onclick='deleteCurrentRow1(this)'>";
			trcomp += "<font color='red'>刪除</font>";
			trcomp += "</button>";
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
			countUnit = countUnit + 1;
			let trcomp = "<tr align='center'>";
			trcomp = trcomp
					+ "<td><input type='file' name='unit_image2' /></td>";
			trcomp = trcomp
					+ "<td><input type='text' name='explain2'></input></td>";
			trcomp = trcomp + "<td>";
			trcomp = trcomp
					+ "<button type='button' onclick='deleteCurrentRow2(this)'>";
			trcomp = trcomp + "<font color='red'>刪除</font>";
			trcomp = trcomp + "</button>";
			trcomp = trcomp + "</td>";
			trcomp = trcomp + "</tr>";
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
				countUnit = countUnit - 1;
				let tr = obj.parentNode.parentNode;
				let tbody = tr.parentNode;
				tbody.removeChild(tr);
			}
		}
	</script>
</body>
</html>