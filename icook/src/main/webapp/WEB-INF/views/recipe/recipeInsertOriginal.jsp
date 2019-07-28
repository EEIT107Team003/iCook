<!--郭翔宇-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>recipeIndex</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<!--Bootstrap-start-->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"
	integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"
	integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k"
	crossorigin="anonymous"></script>
<!--Bootstrap-end-->
<link rel="icon"
	href="${pageContext.request.contextPath}/images/favicon.ico">
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/images/favicon.ico" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/slider.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/zerogrid.css"
	type="text/css" media="screen">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/responsive.css"
	type="text/css" media="screen">
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script
	src="${pageContext.request.contextPath}/js/jquery-migrate-1.1.1.js"></script>
<script src="${pageContext.request.contextPath}/js/superfish.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.easing.1.3.js"></script>
<script src="${pageContext.request.contextPath}/js/sForm.js"></script>
<script
	src="${pageContext.request.contextPath}/js/jquery.carouFredSel-6.1.0-packed.js"></script>
<script src="${pageContext.request.contextPath}/js/tms-0.4.1.js"></script>
<script src="${pageContext.request.contextPath}/js/css3-mediaqueries.js"></script>
<!-- 彈跳視窗 -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"
	integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"
	integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k"
	crossorigin="anonymous"></script>
<!-- 彈跳視窗 -->

<script>
<!-- 彈跳視窗 -->
	$(window).load(function() {
		$('.slider')._TMS({
			show : 0,
			pauseOnHover : false,
			prevBu : '.prev',
			nextBu : '.next',
			playBu : false,
			duration : 800,
			preset : 'fade',
			pagination : true,//'.pagination',true,'<ul></ul>'
			pagNums : false,
			slideshow : 8000,
			numStatus : false,
			banners : false,
			waitBannerAnimation : false,
			progressBar : false
		})
	});

	$(window).load(function() {
		$('.carousel1').carouFredSel({
			auto : false,
			prev : '.prev',
			next : '.next',
			width : 960,
			items : {
				visible : {
					min : 1,
					max : 4
				},
				height : 'auto',
				width : 240,

			},
			responsive : false,

			scroll : 1,

			mousewheel : false,

			swipe : {
				onMouse : false,
				onTouch : false
			}
		});

	});
</script>
<!--[if lt IE 8]>
       <div style=' clear: both; text-align:center; position: relative;'>
         <a href="http://windows.microsoft.com/en-US/internet-explorer/products/ie/home?ocid=ie6_countdown_bannercode">
           <img src="http://storage.ie6countdown.com/assets/100/images/banners/warning_bar_0000_us.jpg" border="0" height="42" width="820" alt="You are using an outdated browser. For a faster, safer browsing experience, upgrade for free today." />
         </a>
      </div>
    <![endif]-->
<!--[if lt IE 9]>
      <script src="js/html5shiv.js"></script>
      <link rel="stylesheet" media="screen" href="css/ie.css">

    <![endif]-->

<style type="text/css">
.subscribe {
	margin-right: 100px;
	margin-left: 260px;
}
</style>
</head>
<!--<body bgcolor="#ffffce">-->
<!--<font>&nbsp;&nbsp;格式為yyyy-MM-dd</font>-->
<!--<body bgcolor="#deffac">-->
<body>
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
		<!--<h1>insert</h1>-->
		<h2>新增一份食譜</h2>
		<%--三個地方要完全一樣--%>

		<!--<div class='shrink'>-->
		<div class='subscribe'>
			<%--<br><a href="<c:url value='/home' />">回首頁</a><br>--%>
			<form method="POST" enctype="multipart/form-data"
				action="${pageContext.request.contextPath}/user/recipe/recipeInsert">
				<%--<form:form method="POST" modelAttribute="RecipeBean" enctype="multipart/form-data">成功--%>
				<%
					// TODO action已經被修改
					// <table border="1" bgcolor="#ffffb9" width="50%">
				%>
				<%-- 第一張table-start --%>
				<%-- 食譜表單 --%>
				<!--<table border="1" bgcolor="#ffffb9" width="50%">-->
				<fieldset>
					<legend>食譜</legend>
					<table width="50%" class="table table-hover">
						<tbody>
							<tr align="center">
								<%-- 食譜名稱--%>
								<td><label for="recipe_name">食譜名稱</label></td>
								<td><input id="recipe_name" name="recipe_name" type="text" /></td>
							</tr>
							<tr align="center">
								<%--儲存使用者上傳圖片檔案的欄位--%>
								<td><label for="image_file">食譜封面照片</label></td>
								<td><input id="image_file" name="image_file" type="file" /></td>
							</tr>
							<tr align="center">
								<%--烹調時間--%>
								<td><label for="recipe_time">烹調時間</label></td>
								<td><input id="recipe_time" name="recipe_time" type="text" /></td>
							</tr>
							<tr align="center">
								<%--食譜份量--%>
								<td><label for="recipe_quantity">食譜份量</label></td>
								<td><input id="recipe_quantity" name="recipe_quantity"
									type="text" /></td>
							</tr>
							<tr align="center">
								<%--食譜簡介--%>
								<td><label for="recipe_summary">食譜簡介</label></td>
								<td><input id="recipe_summary" name="recipe_summary"
									type="text" /></td>
							</tr>
							<tr align="center">
								<%--食譜分類--%>
								<td><label for="recipe_item">食譜分類</label></td>
								<td><select name="recipe_item">
										<option value="taiwan">臺式</option>
										<option value="japan">日式</option>
										<option value="thailand">泰式</option>
								</select></td>
							</tr>
						</tbody>
					</table>
				</fieldset>
				<!--第一張table-end-->
				<!--<input type="submit" value="確認新增資料" />-->
				<br>

				<%-- 第二張table-start --%>
				<%-- 食譜食材表單【動態生成】 --%>
				<!--<table id="recipe_ingredients" border="1" width="50%" bgcolor="#ffffaa">-->
				<fieldset>
					<legend>食材-份量</legend>
					<table id="recipe_ingredients" width="50%"
						class="table table-hover">
						<thead>
							<tr align="center">
								<th scope="col">食材名稱</th>
								<th scope="col">份量</th>
								<th scope="col">新增</th>
								<th scope="col">刪除</th>
							</tr>
						</thead>
						<tbody>
							<tr align="center">
								<!--<c:set var='count' value="${count+1}" />-->
								<td><input type="text" name="ingredients2" /></td>
								<td><input type="text" name="quantity2"></input></td>
								<td><input type="button" onclick="addCurrentRow1()"
									value="新增" style="font-size: 16px" /></td>
								<td><input type="button" onclick="deleteCurrentRow1(this)"
									value="刪除" style="font-size: 16px" /></td>

							</tr>
						</tbody>
					</table>

				</fieldset>
				<%-- 第二張table-end --%>
				<br>
				<%-- 第三張table-start --%>
				<%-- 食譜步驟表單【動態生成】 --%>
				<!--<table id="recipe_unit" border="1" width="50%" bgcolor="#ffff93">-->
				<!-- 				<fieldset> -->
				<!-- 					<legend>食譜步驟</legend> -->

				<table id="recipe_unit" width="50%" class="table table-hover">
					<thead>
						<tr align="center">
							<th scope="col">步驟圖片</th>
							<th scope="col">步驟說明</th>
							<th scope="col">新增</th>
							<th scope="col">刪除</th>
						</tr>
					</thead>
					<tbody>
						<tr align="center">
							<td><input type="file" name="unit_image2" /></td>
							<td><input type="text" name="explain2"></input></td>
							<td><input type="button" onclick="addCurrentRow2()"
								value="新增" style="font-size: 16px" /></td>
							<td><input type="button" onclick="deleteCurrentRow2(this)"
								value="刪除" style="font-size: 16px" /></td>
						</tr>
					</tbody>
				</table>
				<br>
				<%--這是「送出」按鈕--%>
				<input type="submit" value="確認新增資料" />
			</form>
			<!-- 				</fieldset> -->
			<!--<input type="button" onclick="addCurrentRow2()" value="新增一列" style="font-size: 16px" />-->
			<%-- 第三張table-end --%>
		</div>


		<!-- 			<table class="table table-hover"> -->
		<!-- 				<thead> -->
		<!-- 					<tr> -->
		<!-- 						<th scope="col">#</th> -->
		<!-- 						<th scope="col">First</th> -->
		<!-- 						<th scope="col">Last</th> -->
		<!-- 						<th scope="col">Handle</th> -->
		<!-- 					</tr> -->
		<!-- 				</thead> -->
		<!-- 				<tbody> -->
		<!-- 					<tr> -->
		<!-- 						<th scope="row">1</th> -->
		<!-- 						<td>Mark</td> -->
		<!-- 						<td>Otto</td> -->
		<!-- 						<td>@mdo</td> -->
		<!-- 					</tr> -->
		<!-- 					<tr> -->
		<!-- 						<th scope="row">2</th> -->
		<!-- 						<td>Jacob</td> -->
		<!-- 						<td>Thornton</td> -->
		<!-- 						<td>@fat</td> -->
		<!-- 					</tr> -->
		<!-- 					<tr> -->
		<!-- 						<th scope="row">3</th> -->
		<!-- 						<td colspan="2">Larry the Bird</td> -->
		<!-- 						<td>@twitter</td> -->
		<!-- 					</tr> -->
		<!-- 				</tbody> -->
		<!-- 			</table> -->


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
	<script>
		//使用AJAX傳送資料，第一張表單
		//id=postAll
		//		$("#postAll").click(function() {
		//			$.ajax({
		//				url:"這裡填入請求網址",
		//				type:"這裡填入請求類型",
		//				success: function(){}; 
		//			});
		//		});
	</script>
</body>
</html>