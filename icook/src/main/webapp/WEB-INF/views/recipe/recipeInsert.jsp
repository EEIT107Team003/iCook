<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>購物車</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<!-- 	bootstrap -->
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
<!-- 	bootstrap -->
<!-- fontawesome-free -->
<!-- <script type="text/javascript" -->
<%-- 	src='${pageContext.request.contextPath}/css/fontawesome-free/js/all.min.js'></script> --%>
<!-- fontawesome-free -->
<link rel="icon" href="images/favicon.ico">
<link rel="shortcut icon" href="images/favicon.ico" />
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/zerogrid.css" type="text/css"
	media="screen">
<link rel="stylesheet" href="css/responsive.css" type="text/css"
	media="screen">
<link rel="stylesheet" href="css/prettyPhoto.css">
<script src="js/jquery.js"></script>
<script src="js/jquery-migrate-1.1.1.js"></script>
<script src="js/superfish.js"></script>
<script src="js/jquery.easing.1.3.js"></script>
<script src="js/sForm.js"></script>
<script src="js/jquery.prettyPhoto.js"></script>
<script src="js/css3-mediaqueries.js"></script>
<!-- google font -->
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+TC&display=swap"
	rel="stylesheet">



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
<!-- google font -->
<!-- 彈跳視窗 -->
<!-- <link rel="stylesheet" -->
<!-- 	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" -->
<!-- 	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" -->
<!-- 	crossorigin="anonymous"> -->
<!-- <script -->
<!-- 	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" -->
<!-- 	integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" -->
<!-- 	crossorigin="anonymous"></script> -->
<!-- <script -->
<!-- 	src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" -->
<!-- 	integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" -->
<!-- 	crossorigin="anonymous"></script> -->
<!-- 彈跳視窗 -->
<script type="text/javascript">
	window.history.forward(1);

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
<style>
.subscribe {
	margin-left: 20%;
	margin-right: 20%;
	margin-top: 5%;
}

td, th {
	text-align: center;
	font-size: 20px;
	font-family: 'Noto Sans TC', sans-serif;
	line-height: 50px;
}

label {
	font-size: 20px;
	font-family: 'Noto Sans TC', sans-serif;
}

li {
	font-size: 20px;
	font-family: 'Noto Sans TC', sans-serif;
}

#info {
	margin: auto;
	line-height: 200%;
	margin-top: 50px;
}

/* .subscribe { */
/* 	margin-right: 100px; */
/* 	margin-left: 260px; */
/* } */
</style>
</head>
<body>
	<div class="main">
		<!--==============================header=================================-->
		<header>
			<div class="zerogrid">
				<div class="col-full">
					<div class="wrap-col">
						<h1>
							<a style="height: 200px"
								href="${pageContext.request.contextPath}/index2"><img
								src="${pageContext.request.contextPath}/images/logo.png"
								style="width: 200px; right: 200px; border-radius: 50%;"
								alt="EXTERIOR"></a>
						</h1>

						<div class="menu_block">
							<nav>
								<ul class="sf-menu" style="padding-top: 55px">
									<li><a href="index2">ICook</a></li>
									<li><a href="icookAboutUS">關於我們</a>
										<ul>
											<li><a href="icookContact">聯繫我們</a></li>
										</ul></li>
									<li><a href="recipe/recipeIndex">查看食譜</a> <!--<ul>--> <!--<li><a href="#">cat1</a></li>-->
										<!--<li><a href="#">cat2</a></li>--> <!--<li><a href="#">cat3</a></li>-->
										<!--</ul>--></li>
									<li><a href="icookLife">生活誌</a></li>
									<li><a href="forum/overview">討論區</a></li>
									<li><a href="A_articlemainpage">文章區</a>
										<ul>
											<li><a href="A_article">test</a></li>

										</ul></li>


									<li><a href="products">市集</a>
										<ul>


											<li><a href="cartPage">購物車</a></li>
										</ul></li>

									<li><a href="user">會員專區 </a>
										<ul>
											<sec:authorize access="!isAuthenticated()">
												<li><a href="icookLogin">會員登入</a></li>
												<li><a href="icookRegister">會員註冊</a></li>
											</sec:authorize>
											<sec:authorize access="isAuthenticated()">
												<li><a href="index2" data-toggle="modal"
													data-target="#logout">會員登出</a></li>
											</sec:authorize>
											<li><a href="checkOrders">查看訂單</a></li>
											<li><a href="icookAddRecipe">新增食譜</a></li>
											<sec:authorize access="hasRole('ADMIN')">
												<li><a href="productTable">後台</a></li>
											</sec:authorize>
										</ul></li>
								</ul>
							</nav>
							<div class="clear"></div>
						</div>
						<div class="clear"></div>
					</div>
				</div>
			</div>
		</header>
		<!--=======content================================-->
		<!-- 確認登出 -->

		<!-- 		<div class="modal fade" id="logout" tabindex="-1" role="dialog" -->
		<!-- 			aria-labelledby="myModalLabel" aria-hidden="true"> -->
		<!-- 			<div class="modal-dialog"> -->
		<!-- 				<div class="modal-content"> -->
		<!-- 					<div class="modal-header" style="border-bottom: 1px solid;"> -->
		<!-- 						<h4 class="modal-title" id="myModalLabel" style="float: left">您即將登出享食天堂</h4> -->
		<!-- 						<button type="button" class="close" data-dismiss="modal" -->
		<!-- 							aria-hidden="true">×</button> -->
		<!-- 					</div> -->
		<!-- 					<div class="modal-body" style="width: 100%"> -->
		<!-- 						<form method="post" action="perform_logout"> -->
		<!-- 							<button type="submit">確定登出</button> -->
		<!-- 						</form> -->
		<!-- 					</div> -->
		<!-- 					<div class="modal-footer"> -->
		<!-- 						<button type="button" class="btn btn-primary" data-dismiss="modal">取消</button> -->
		<!-- 					</div> -->
		<!-- 				</div> -->
		<!-- 			</div> -->
		<!-- 		</div> -->

		<div align="center">
			<!--HTML註解-->
			<%--JSP註解--%>
			<%--<c:set value="#d3ff93" var="color" />--%>
			<!--<h1>insert</h1>-->
			<h2></h2>
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
						<legend></legend>
						<table width="50%" class="table table-hover">
							<tbody>
								<tr align="center">
									<td colspan="2"><p style='font-size: 50px'>新增一份食譜</p></td>
								</tr>
								<tr>
									<%-- 食譜名稱--%>
									<td><label for="recipe_name">食譜名稱</label></td>
									<td><input id="recipe_name" name="recipe_name" type="text" /></td>
								</tr>
								<tr align="center">
									<%--儲存使用者上傳圖片檔案的欄位--%>
									<td><label for="image_file"><p
												style='margin-left: 37px'>食譜封面照片</p></label></td>
									<td><p style='margin-left: 110px'>
											<input id="image_file" name="image_file" type="file" />
										</p></td>
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
						<!-- 						<legend>食材-份量</legend> -->
						<table id="recipe_ingredients" class="table table-hover">
							<thead>
								<tr align="center">
									<th scope="col">食材名稱</th>
									<th scope="col">份量</th>
									<th scope="col">新增</th>
									<th scope="col">刪除</th>
								</tr>
							</thead>
							<tbody align="left">
								<tr align="" >
									<!--<c:set var='count' value="${count+1}" />-->
									<td><input type="text" name="ingredients2" /></td>
									<td><input type="text" name="quantity2"></input></td>
									<td><input type="button" class="btn btn-success"
										onclick="addCurrentRow1()" value="新增" style="font-size: 16px" /></td>
									<td><input type="button" onclick="deleteCurrentRow1(this)"
										value="刪除" class="btn btn-danger" style="font-size: 16px" /></td>

								</tr>
								<tr>
									<th scope="col"><p style='margin-left:10px'>步驟圖片</p></th>
									<th scope="col">步驟說明</th>
									<th scope="col">新增</th>
									<th scope="col">刪除</th>
								</tr>
								<tr>
									<td><p style='margin-left:110px'><input type="file" name="unit_image2"  /></p></td>
									<td><input type="text" name="explain2"></input></td>
									<td><input type="button" onclick="addCurrentRow2()"
										value="新增" class="btn btn-success" style="font-size: 16px" /></td>
									<td><input type="button" onclick="deleteCurrentRow2(this)"
										value="刪除" class="btn btn-danger" style="font-size: 16px" /></td>
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

<!-- 					<table id="recipe_unit" class="table table-hover"> -->
<!-- 						<thead> -->
<!-- 							<tr align="center"> -->
<!-- 								<th scope="col">步驟圖片</th> -->
<!-- 								<th scope="col">步驟說明</th> -->
<!-- 								<th scope="col">新增</th> -->
<!-- 								<th scope="col">刪除</th> -->
<!-- 							</tr> -->
<!-- 						</thead> -->
<!-- 						<tbody> -->
<!-- 							<tr align="center"> -->
<!-- 								<td><input type="file" name="unit_image2" /></td> -->
<!-- 								<td><input type="text" name="explain2"></input></td> -->
<!-- 								<td><input type="button" onclick="addCurrentRow2()" -->
<!-- 									value="新增" class="btn btn-success" style="font-size: 16px" /></td> -->
<!-- 								<td><input type="button" onclick="deleteCurrentRow2(this)" -->
<!-- 									value="刪除" class="btn btn-danger" style="font-size: 16px" /></td> -->
<!-- 							</tr> -->
<!-- 						</tbody> -->
<!-- 					</table> -->
					<br>
					<%--這是「送出」按鈕--%>
					<input class="btn btn-outline-primary" type="submit" value="確認新增資料" />
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

			<%-- 			<br> <a href="<c:url value='/recipe/recipeIndex' />">回食譜首頁</a> <br> --%>
			<%-- 			<a href="<c:url value='/home' />">回首頁</a> <br> --%>
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

		<!--==============================footer=================================-->

		<footer>
			<div class="zerogrid">
				<div class="col-full">
					<div class="wrap-col">
						<!-- 						&copy; Copyright &copy; 2013.Company name All rights reserved.<a -->
						<!-- 							target="_blank" href="http://sc.chinaz.com/moban/">&#x7F51;&#x9875;&#x6A21;&#x677F;</a> -->
					</div>
				</div>
			</div>
		</footer>
		<div style="display: none">
			<script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540'
				language='JavaScript' charset='gb2312'></script>
		</div>
	</div>
</body>

</html>