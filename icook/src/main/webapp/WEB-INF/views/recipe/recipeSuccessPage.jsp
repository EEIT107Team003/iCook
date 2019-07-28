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
<<<<<<< HEAD
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
	
</script>
<style>
.subscribe {
	margin-left: 20%;
	margin-right: 20%;
	margin-top: 5%;
}

.shrink {
	margin-left: 20%;
	margin-right: 20%;

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


		<div align="center" class='shrink'>


			<table class="table table-hover">
				<thead>
					<tr>
						<th scope="col"><div style="visibility: hidden">區塊中的內容</div></th>
						<th scope="col"><div style="visibility: hidden">區塊中的內容</div></th>

					</tr>
				</thead>
				<tbody>
						<tr align="center" style='background-color:#2FA02F;color:white'>
							<td style='font-size: 35px;' >食譜名稱</td>
							<td style='font-size: 35px'>${recipe.recipe_name}</td>
						</tr>
						<tr align="center">
							<%--<td colspan="2">--%>
							<td style='line-height:150px'><p style='margin-left:40px'>食譜封面照片</p></td>
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

					<tr align="center" style='background-color:#2FA02F;color:white' >
						<td style='font-size: 35px'>食材名稱</td>
						<td style='font-size: 35px'>份量</td>
					</tr>

					<c:forEach var="recipe2" items="${recipeIngredients}">
						<tr align="center">
							<td>${recipe2.ingredients}</td>
							<td>${recipe2.quantity}</td>
						</tr>
					</c:forEach>
					<tr align="center" style='background-color:#2FA02F;color:white'  '>
						<td style='font-size: 35px'>步驟圖片</td>
						<td style='font-size: 35px'>步驟說明</td>
					</tr>

				</tbody>
			</table>

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