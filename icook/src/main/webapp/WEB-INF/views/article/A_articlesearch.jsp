<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://cdn.bootcss.com/web-socket-js/1.0.0/web_socket.js"></script>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,900"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Playfair+Display:400,400i,700,700i,900,900i"
	rel="stylesheet">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/article/acss/open-iconic-bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/article/acss/animate.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/article/acss/owl.carousel.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/article/acss/owl.theme.default.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/article/acss/magnific-popup.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/article/acss/aos.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/article/acss/ionicons.min.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/article/acss/flaticon.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/article/acss/icomoon.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/article/acss/style.css">

<!-- 套版使用 -->
<link rel="icon" href="images/favicon.ico">
<link rel="shortcut icon" href="images/favicon.ico" />
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/zerogrid.css" type="text/css"
	media="screen">
<link rel="stylesheet" href="css/responsive.css" type="text/css"
	media="screen">
<link rel="stylesheet" href="css/prettyPhoto.css">



<title>Stories - Free Bootstrap 4 Template by Colorlib</title>
</head>
<body>
	<!-- 	<nav -->
	<!-- 		class="navbar navbar-expand-lg navbar-dark bg-dark ftco-navbar-light" -->
	<!-- 		id="ftco-navbar"> -->
	<!-- 		<div class="container"> -->
	<!-- 			<a class="navbar-brand" href="index2"><img width="240" -->
	<!-- 				height="111.5" src="images/logo.png" alt="EXTERIOR"></a> -->
	<!-- 			<button class="navbar-toggler" type="button" data-toggle="collapse" -->
	<!-- 				data-target="#ftco-nav" aria-controls="ftco-nav" -->
	<!-- 				aria-expanded="false" aria-label="Toggle navigation"> -->
	<!-- 				<span class="oi oi-menu"></span> Menu -->
	<!-- 			</button> -->

	<!-- 			<div class="collapse navbar-collapse" id="ftco-nav"> -->
	<!-- 				<ul class="navbar-nav ml-auto"> -->
	<!-- 					<li class="nav-item"><a -->
	<%-- 						href="${pageContext.request.contextPath}/home" class="nav-link">Home</a></li> --%>
	<%-- 					<c:if --%>
	<%-- 						test="${pageContext.request.userPrincipal.name == 'aa'||pageContext.request.userPrincipal.name =='dd'}"> --%>
	<!-- 						<li class="nav-item"><a href="A_insert" class="nav-link">新增一篇文章</a></li> -->
	<%-- 					</c:if> --%>
	<!-- 					<li class="with_ul current"><a href="index2">ICook</a></li> -->
	<!-- 					<li class="nav-item active"><a href="A_findAll" -->
	<!-- 						class="nav-link">Foods文章首頁</a></li> -->
	<!-- 					<li class="nav-item"><a href="icookLogin" class="nav-link">會員專區</a></li> -->
	<!-- 					<li class="nav-item"><a href="cartPage" class="nav-link">購物車</a></li> -->
	<!-- 					<li class="nav-item"><a href="icookLife" class="nav-link">生活誌</a></li> -->

	<!-- 				</ul> -->
	<!-- 			</div> -->
	<!-- 		</div> -->
	<!-- 	</nav> -->
	<!-- END nav -->
	<!-- 	套版上面 -->


	<%
		List list = (List) request.getAttribute("list");
		pageContext.setAttribute("list", list);
	%>
	<%@ include file="page1.file"%>
	<header>
		<sec:authorize access="isAuthenticated()">
			<!--   <div class="btn btn-primary" style="float:right;height: 60px;margin-right:50px;padding-left:50px;padding-right:30px;background-color:#228B22;border-radius: 20%"> -->
			<div class="btn btn-success"
				onclick="javascript:location.href='user'"
				style="float: right; margin-right: 50px; padding-left: 35px; width: 400px">
				<img id="member_photo_image"
					style="float: left; width: 100px; height: 100px; border-radius: 50%; border: 1px solid black"
					src="<c:url value='/getMemberPhoto/${bean.member_id}' />" />
				<div style="font-size: 60px; float: left; margin-left: 30px;">${bean.nickname}</div>
			</div>
		</sec:authorize>
		<div class="zerogrid">
			<div class="col-full">
				<div class="wrap-col">
					<h1>

						<c:choose>

							<c:when
								test="${pageContext.request.userPrincipal.name == 'admin@gmail.com'||pageContext.request.userPrincipal.name =='admin'}">

								<a style="height: 200px" href="A_insert"><img
									src="${pageContext.request.contextPath}/images/logo.png"
									style="width: 200px; right: 200px; border-radius: 50%;"
									alt="EXTERIOR"></a>
							</c:when>
							<c:otherwise>


								<a style="height: 200px"
									href="${pageContext.request.contextPath}/index2"><img
									src="${pageContext.request.contextPath}/images/logo.png"
									style="width: 200px; right: 200px; border-radius: 50%;"
									alt="EXTERIOR"></a>


							</c:otherwise>



						</c:choose>

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
								<li><a href="A_articlemainpage">文章區</a></li>


								<!-- 									<li><a href="products">市集</a> -->
								<li><a href="products">市集</a>
									<ul>


										<li><a href="cartPage">購物車</a></li>
									</ul></li>
								<%-- </c:if><c:if test="${pageContext.request.userPrincipal.name==null}"> --%>
								<li><a href="user">會員專區 </a>
									<ul>
										<sec:authorize access="!isAuthenticated()">
											<li><a href="icookLogin">會員登入</a></li>
											<li><a href="icookRegister">會員註冊</a></li>
										</sec:authorize>
										<c:if test="${pageContext.request.userPrincipal.name!=null}">
											<li><a href="index2" data-toggle="modal"
												data-target="#logout">會員登出</a></li>
										</c:if>
										<li><a href="checkOrders">查看訂單</a></li>
										<li><a href="icookAddRecipe">新增食譜</a></li>
										<li><a href="productTable">後台</a></li>
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



	<div style="background-color: white;">
		<section class="hero-wrap hero-wrap-2"
			style="background-image: url('article/aimages/bg_4.jpg');">
			<div class="overlay"></div>
			<div class="container">
				<div
					class="row no-gutters slider-text align-items-end justify-content-center">
					<div class="col-md-9 ftco-animate pb-5 text-center">
						<h1 class="mb-3 bread">Foods</h1>
						<p class="breadcrumbs">
							<span class="mr-2"><a href="index.html">Home <i
									class="ion-ios-arrow-forward"></i></a></span> <span>Foods <i
								class="ion-ios-arrow-forward"></i></span>
						</p>
					</div>
				</div>
			</div>
		</section>


		<section class="ftco-section">

			<!-- 	跑馬燈 測試成功排版問題-->
			<!-- 		<marquee direction="left" height="30" scrollamount="8" -->
			<!-- 			behavior="alternate" id="ArcBroadcast" style="color: green;"></marquee> -->
			<%-- 		<form> --%>
			<!-- 				<input id="messageField" type="text" > <input -->
			<!-- 					onclick="sendMsg();" value="send" type="button" > -->
			<%-- 			</form> --%>

			<!-- 		<div id="msg-box" -->
			<!-- 			style="width: 500px; height: 400px; background: #eee; overflow: auto;"></div> -->








			<div class="container">
				<div class="row">
					<div class="col-lg-9">
						<div class="row">

							<c:forEach var='Article' items='${list}' begin="<%=pageIndex%>"
								end="<%=pageIndex+rowsPerPage-1%>">
								<div class="col-md-4 ftco-animate">
									<div class="blog-entry">
										<a
											href="<spring:url value='/article?article_num=${Article.article_num}' />"
											class="img-2"> <img class="img-fluid"
											alt="Colorlib Template" style="width: 600px; height: 335px"
											src="<c:url value='/getartPicture/${Article.article_num}'/>"></a>
										<!-- 								寬800*高1000最佳像素 -->
										<div class="text pt-3">

											<p class="meta d-flex">
												<span class="pr-3">${Article.article_date}</span>
												<%-- 											<fmt:parseDate var="parseDate" --%>
												<%-- 												value="${Article.article_date}" pattern="yyyy-MM-dd HH:mm" --%>
												<%-- 												parseLocale="Asia/Taipei" /> --%>

												<%-- 											<span class="ml-auto pl-3"> ${Article.article_date} </span> --%>
											</p>

											<h3>
												<a
													href="<spring:url value='/article?article_num=${Article.article_num}' />">${Article.article_title}</a>
											</h3>
											<p class="mb-0">
												<c:choose>
													<c:when
														test="${pageContext.request.userPrincipal.name == 'admin@gmail.com'||pageContext.request.userPrincipal.name =='admin' && Article.article_status==2}">

														<a
															href="<spring:url value='/article?article_num=${Article.article_num}' />"
															class="btn btn-black py-2">此篇文章已被隱藏<span
															class="icon-arrow_forward ml-4"></span>
														</a>
													</c:when>
													<c:otherwise>
														<a
															href="<spring:url value='/article?article_num=${Article.article_num}' />"
															class="btn btn-black py-2">Read More <span
															class="icon-arrow_forward ml-4"></span>
														</a>
													</c:otherwise>

												</c:choose>
											</p>
										</div>
									</div>
								</div>
							</c:forEach>


						</div>
						<div class="row mt-5">
							<div class="col text-center">
								<div class="block-27">
									<ul>
										<%@ include file="page2.file"%>
									</ul>
								</div>
							</div>
						</div>
					</div>


					<!-- 相關網站 -->
					<div class="col-lg-3">
						<div class="sidebar-wrap">
							<div>

								<h3 align="center">相關網站</h3>
								<br>
								<ul class="category-image">

									<li style="height: 220.75px; height: 140px;"><a
										href="http://www.tcetva.tw/"> <img
											src="${pageContext.request.contextPath}/article/aimages/news1.jpg ">
									</a></li>
									<li style="height: 220.75px; height: 140px;"><a
										href="https://travel-shop.top-link.com.tw/"><img
											src="${pageContext.request.contextPath}/article/aimages/news2.jpg ">
									</a></li>
									<li style="height: 220.75px; height: 140px;"><a
										href="https://safood.tw/japan-exhibition"><img
											src="${pageContext.request.contextPath}/article/aimages/news3.jpg ">

									</a></li>
								</ul>
							</div>

							<br> <br> <br>
							<div class="sidebar-box p-4 ftco-animate">
								<form action="findArctile?article_title=${param.article_title}"
									class="search-form">
									<div class="form-group">
										<span class="icon icon-search"></span> <input type="text"
											name="article_title" class="form-control"
											placeholder="Search" formaction="" />


									</div>

								</form>
							</div>



							<div class="sidebar-box categories text-center ftco-animate">
								<h2 class="heading mb-4">Categories</h2>
								<ul class="category-image">
									<li><a
										href="<spring:url value='/findArctiCatergory?article_catergoary=食安新聞' />"
										class="img d-flex align-items-center justify-content-center text-center"
										style="background-image: url(article/aimages/category-1.jpg);">
											<div class="text">
												<h3>美食新聞</h3>
											</div>
									</a></li>
									<li><a
										href="<spring:url value='/findArctiCatergory?article_catergoary=廚具新聞' />"
										class="img d-flex align-items-center justify-content-center text-center"
										style="background-image: url(article/aimages/category-2.jpg);">
											<div class="text">
												<h3>廚具新聞</h3>
											</div>
									</a></li>
									<li><a
										href="<spring:url value='/findArctiCatergory?article_catergoary=其他' />"
										class="img d-flex align-items-center justify-content-center text-center"
										style="background-image: url(article/aimages/category-3.jpg);">
											<div class="text">
												<h3>其他</h3>
											</div>
									</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>

	<section class="ftco-subscribe ftco-section bg-light">
		<div class="overlay">
			<div class="container">
				<div class="row d-flex justify-content-center">
					<div
						class="col-md-8 text-wrap text-center heading-section ftco-animate">
						<h2 class="mb-4">
							<span>Subcribe to our Newsletter</span>
						</h2>
						<p>A small river named Duden flows by their place and supplies
							it with the necessary regelialia. It is a paradisematic country,
							in which roasted parts of sentences fly into your mouth.</p>
						<div class="row d-flex justify-content-center mt-4 mb-4">
							<div class="col-md-8">
								<form action="#" class="subscribe-form">
									<div class="form-group d-flex">
										<input type="text" class="form-control"
											placeholder="Enter email address"> <input
											type="submit" value="Subscribe" class="submit px-3">
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>


	<footer class="ftco-footer ftco-footer-2 ftco-section">
		<div class="container">
			<div class="row mb-5">
				<div class="col-md">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2">Stories</h2>
						<p>Far far away, behind the word mountains, far from the
							countries Vokalia and Consonantia, there live the blind texts.</p>
						<ul
							class="ftco-footer-social list-unstyled float-md-left float-lft mt-5">
							<li class="ftco-animate"><a href="#"><span
									class="icon-twitter"></span></a></li>
							<li class="ftco-animate"><a href="#"><span
									class="icon-facebook"></span></a></li>
							<li class="ftco-animate"><a href="#"><span
									class="icon-instagram"></span></a></li>
						</ul>
					</div>
				</div>
				<div class="col-md">
					<div class="ftco-footer-widget mb-4 ml-md-5">
						<h2 class="ftco-heading-2">Information</h2>
						<ul class="list-unstyled">
							<li><a href="#" class="py-2 d-block">Terms of Uses</a></li>
							<li><a href="#" class="py-2 d-block">About Stories</a></li>
							<li><a href="#" class="py-2 d-block">Privacy Policy</a></li>
							<li><a href="#" class="py-2 d-block">Accessibility Help</a></li>
							<li><a href="#" class="py-2 d-block">Advertise with us</a></li>
						</ul>
					</div>
				</div>
				<div class="col-md">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2">Categories</h2>
						<ul class="list-unstyled">
							<li><a href="#" class="py-2 d-block">Food</a></li>
							<li><a href="#" class="py-2 d-block">Restaurant</a></li>
							<li><a href="#" class="py-2 d-block">Dessert</a></li>
							<li><a href="#" class="py-2 d-block">Lifestyle</a></li>
							<li><a href="#" class="py-2 d-block">Recipes</a></li>
						</ul>
					</div>
				</div>
				<div class="col-md">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2">Have a Questions?</h2>
						<div class="block-23 mb-3">
							<ul>
								<li><span class="icon icon-map-marker"></span><span
									class="text">203 Fake St. Mountain View, San Francisco,
										California, USA</span></li>
								<li><a href="#"><span class="icon icon-phone"></span><span
										class="text">+2 392 3929 210</span></a></li>
								<li><a href="#"><span class="icon icon-envelope"></span><span
										class="text">info@yourdomain.com</span></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 text-center">

					<p>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						Copyright &copy;
						<script>
							document.write(new Date().getFullYear());
						</script>
						All rights reserved | This template is made with <i
							class="icon-heart color-danger" aria-hidden="true"></i> by <a
							href="https://colorlib.com" target="_blank">Colorlib</a>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					</p>
				</div>
			</div>
		</div>
	</footer>



	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
	</div>


	<script
		src="${pageContext.request.contextPath}/article/ajs/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/article/ajs/jquery-migrate-3.0.1.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/article/ajs/popper.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/article/ajs/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/article/ajs/jquery.easing.1.3.js"></script>
	<script
		src="${pageContext.request.contextPath}/article/ajs/jquery.waypoints.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/article/ajs/jquery.stellar.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/article/ajs/owl.carousel.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/article/ajs/jquery.magnific-popup.min.js"></script>
	<script src="${pageContext.request.contextPath}/article/ajs/aos.js"></script>
	<script
		src="${pageContext.request.contextPath}/article/ajs/jquery.animateNumber.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/article/ajs/scrollax.min.js"></script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script
		src="${pageContext.request.contextPath}/article/ajs/google-map.js"></script>
	<script src="${pageContext.request.contextPath}/article/ajs/main.js"></script>
	<script>
		var webSocket = new WebSocket("ws:/localhost:8080/icook/ArtBroadcast");
		// 		var msgField = document.getElementById("messageField");
		// 		var divMsg = document.getElementById("msg-box");
		// 		var Broadcast = document.getElementById("ArcBroadcast");
		var newnew = "有一則新消息"
		function sendMsg() {
			var msgToSend = newnew.value;
			webSocket.send(msgToSend);

		}

		webSocket.onmessage = function(message) {
			$.notify({
				title : '<strong>新消息</strong>',
				icon : 'glyphicon glyphicon-star',
				message : "有一篇文章發表摟，快去看看!"
			}, {
				type : 'info',
				animate : {
					enter : 'animated fadeInUp',
					exit : 'animated fadeOutRight'
				},
				placement : {
					from : "bottom",
					align : "right"
				},
				offset : 20,
				spacing : 10,
				z_index : 1031,
			});

		}

		webSocket.onopen = function(message) {
			console.log("connection onopen");
		};

		webSocket.onclose = function() {
			console.log("connection closed");
		};

		webSocket.onerror = function wserror(message) {
			console.log("error: " + message);
		}
	</script>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"
		integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"
		integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k"
		crossorigin="anonymous"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/article/bootstrap-notify-master/bootstrap-notify.min.js"></script>




</body>
</html>