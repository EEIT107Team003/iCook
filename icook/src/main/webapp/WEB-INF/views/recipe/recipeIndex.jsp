<!--郭翔宇-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>recipeIndex</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="icon" href="${pageContext.request.contextPath}/images/favicon.ico">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/images/favicon.ico" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/slider.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/zerogrid.css" type="text/css"
	media="screen">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/responsive.css" type="text/css"
	media="screen">

<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-migrate-1.1.1.js"></script>
<script src="${pageContext.request.contextPath}/js/superfish.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.easing.1.3.js"></script>
<script src="${pageContext.request.contextPath}/js/sForm.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.carouFredSel-6.1.0-packed.js"></script>
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
									<li><a href="icookMenu">查看食譜</a>
										<ul>
<!-- 											<li><a href="#">cat1</a></li> -->
<!-- 											<li><a href="#">cat2</a></li> -->
<!-- 											<li><a href="#">cat3</a></li> -->
										</ul>
									<li><a href="icookLife">生活誌</a></li>
									<li><a href="icookVideo">討論區</a></li>
									<li><a href="icookProducts">市集</a>
										<ul>
											<li class="with_ul current"><a href="cartPage">購物車</a></li>
										</ul></li>

									<li><a href="icookLogin">會員專區</a>
										<ul>
											<li><a href="icookLogin">會員登入</a></li>
											<li><a href="checkOrders">查看訂單</a></li>
											<li><a href="#">會員登出</a></li>
											<li><a href="#">新增食譜</a></li>
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
		<div align="center" class="content">
			<!--<h1>recipeIndex</h1>-->
			<!--<h2>食譜首頁</h2>-->
			<!--<table border="0" width="50%" bgcolor="#ffffb9">-->
			<table width="50%">
				<tr align="center">
					<%--align="center" 置中設定--%>
					<td><a href="<c:url value='/user/recipe/recipeInsert' />"
						class="btn btn-outline-primary">新增食譜</a></td>
						
					<td><a href="<c:url value='/user/recipe/recipeUpdateOne' />"
						class="btn btn-outline-secondary">修改食譜</a></td>
						
					<td><a href="<c:url value='/recipe/recipeSelect' />"
						class="btn btn-outline-secondary">查詢食譜</a></td>
						
					<td><a href="<c:url value='/user/recipe/recipeDelete' />"
						class="btn btn-outline-danger">刪除食譜</a></td>
						
					<%--<td><input type="button" value="刪除2" onclick="location.href='delete'"></td>--%>
				</tr>
			</table>
			<br> <a href="<c:url value='/home' />">返回首頁</a> <br>
		</div>
		<footer>
			<div class="zerogrid">
				<div class="col-full">
					<!-- 				<div class="wrap-col"> -->
					<!-- 					&copy; Copyright &copy; 2013.Company name All rights reserved.<a -->
					<!-- 						target="_blank" href="http://sc.chinaz.com/moban/">&#x7F51;&#x9875;&#x6A21;&#x677F;</a> -->
					<!-- 				</div> -->
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