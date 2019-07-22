<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://cdn.bootcss.com/web-socket-js/1.0.0/web_socket.js"></script>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
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
<title>Stories - Free Bootstrap 4 Template by Colorlib</title>
</head>
<body>
	<nav
		class="navbar navbar-expand-lg navbar-dark bg-dark ftco-navbar-light"
		id="ftco-navbar">
		<div class="container">
			<a class="navbar-brand" href="index2"><img width="240"
				height="111.5" src="images/logo.png" alt="EXTERIOR"></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#ftco-nav" aria-controls="ftco-nav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> Menu
			</button>

			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a
						href="${pageContext.request.contextPath}/home" class="nav-link">Home</a></li>
					<c:if
						test="${pageContext.request.userPrincipal.name == 'aa'||pageContext.request.userPrincipal.name =='dd'}">
						<li class="nav-item"><a href="A_insert" class="nav-link">新增一篇文章</a></li>
					</c:if>
					<li class="with_ul current"><a href="index2">ICook</a></li>
					<li class="nav-item active"><a href="A_findAll"
						class="nav-link">Foods文章首頁</a></li>
					<li class="nav-item"><a href="icookLogin" class="nav-link">會員專區</a></li>
					<li class="nav-item"><a href="cartPage" class="nav-link">購物車</a></li>
					<li class="nav-item"><a href="icookLife" class="nav-link">生活誌</a></li>

				</ul>
			</div>
		</div>
	</nav>
	<!-- END nav -->

		
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
<!-- 	<marquee direction="left" height="30" scrollamount="8" -->
<!-- 		behavior="alternate" id="ArcBroadcast" style="color: green;"></marquee> -->
<%-- 		<form> --%>
<!-- 				<input id="messageField" type="text" > <input -->
<!-- 					onclick="sendMsg();" value="send" type="button" > -->
<%-- 			</form> --%>

			<div id="msg-box"
				style="width: 500px; height: 400px; background: #eee; overflow: auto;" ></div>
				</div>
		<div class="container">
			<div class="row">
				<div class="col-lg-9">
					<div class="row">

						<c:forEach var='Article' items='${Articles}'>
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
											<a
												href="<spring:url value='/article?article_num=${Article.article_num}' />"
												class="btn btn-black py-2">Read More <span
												class="icon-arrow_forward ml-4"></span>
											</a>
										</p>
									</div>
								</div>
							</div>
						</c:forEach>
</div>


						<div class="col-md-4 ftco-animate">
							<div class="blog-entry">
								<a href="A_single.jsp" class="img-2"><img
									src="article/aimages/blog-2.jpg" class="img-fluid"
									alt="Colorlib Template"></a>
								<div class="text pt-3">
									<p class="meta d-flex">
										<span class="pr-3">Dessert</span><span class="ml-auto pl-3">March
											01, 2018</span>
									</p>
									<h3>
										<a href="A_single.jsp">Tasty &amp; Delicious Foods</a>
									</h3>
									<p class="mb-0">
										<a href="A_single.jsp" class="btn btn-black py-2">Read
											More <span class="icon-arrow_forward ml-4"></span>
										</a>
									</p>
								</div>
							</div>
						</div>
						<div class="col-md-4 ftco-animate">
							<div class="blog-entry">
								<a href="A_single.jsp" class="img-2"><img
									src="article/aimages/blog-3.jpg" class="img-fluid"
									alt="Colorlib Template"></a>
								<div class="text pt-3">
									<p class="meta d-flex">
										<span class="pr-3">Dessert</span><span class="ml-auto pl-3">March
											01, 2018</span>
									</p>
									<h3>
										<a href="A_single.jsp">Tasty &amp; Delicious Foods</a>
									</h3>
									<p class="mb-0">
										<a href="A_single.jsp" class="btn btn-black py-2">Read
											More <span class="icon-arrow_forward ml-4"></span>
										</a>
									</p>
								</div>
							</div>
						</div>
						<div class="col-md-4 ftco-animate">
							<div class="blog-entry">
								<a href="A_single.jsp" class="img-2"><img
									src="article/aimages/blog-4.jpg" class="img-fluid"
									alt="Colorlib Template"></a>
								<div class="text pt-3">
									<p class="meta d-flex">
										<span class="pr-3">Dessert</span><span class="ml-auto pl-3">March
											01, 2018</span>
									</p>
									<h3>
										<a href="A_single.jsp">Tasty &amp; Delicious Foods</a>
									</h3>
									<p class="mb-0">
										<a href="A_single.jsp" class="btn btn-black py-2">Read
											More <span class="icon-arrow_forward ml-4"></span>
										</a>
									</p>
								</div>
							</div>
						</div>
						<div class="col-md-4 ftco-animate">
							<div class="blog-entry">
								<a href="A_single.jsp" class="img-2"><img
									src="article/aimages/blog-5.jpg" class="img-fluid"
									alt="Colorlib Template"></a>
								<div class="text pt-3">
									<p class="meta d-flex">
										<span class="pr-3">Dessert</span><span class="ml-auto pl-3">March
											01, 2018</span>
									</p>
									<h3>
										<a href="A_single.jsp">Tasty &amp; Delicious Foods</a>
									</h3>
									<p class="mb-0">
										<a href="A_single.jsp" class="btn btn-black py-2">Read
											More <span class="icon-arrow_forward ml-4"></span>
										</a>
									</p>
								</div>
							</div>
						</div>
						<div class="col-md-4 ftco-animate">
							<div class="blog-entry">
								<a href="A_single.jsp" class="img-2"><img
									src="article/aimages/blog-6.jpg" class="img-fluid"
									alt="Colorlib Template"></a>
								<div class="text pt-3">
									<p class="meta d-flex">
										<span class="pr-3">Dessert</span><span class="ml-auto pl-3">March
											01, 2018</span>
									</p>
									<h3>
										<a href="single.html">Tasty &amp; Delicious Foods</a>
									</h3>
									<p class="mb-0">
										<a href="single.html" class="btn btn-black py-2">Read More
											<span class="icon-arrow_forward ml-4"></span>
										</a>
									</p>
								</div>
							</div>
						</div>
						<div class="col-md-4 ftco-animate">
							<div class="blog-entry">
								<a href="single.html" class="img-2"><img
									src="article/aimages/blog-7.jpg" class="img-fluid"
									alt="Colorlib Template"></a>
								<div class="text pt-3">
									<p class="meta d-flex">
										<span class="pr-3">Dessert</span><span class="ml-auto pl-3">March
											01, 2018</span>
									</p>
									<h3>
										<a href="single.html">Tasty &amp; Delicious Foods</a>
									</h3>
									<p class="mb-0">
										<a href="single.html" class="btn btn-black py-2">Read More
											<span class="icon-arrow_forward ml-4"></span>
										</a>
									</p>
								</div>
							</div>
						</div>
						<div class="col-md-4 ftco-animate">
							<div class="blog-entry">
								<a href="single.html" class="img-2"><img
									src="article/aimages/blog-8.jpg" class="img-fluid"
									alt="Colorlib Template"></a>
								<div class="text pt-3">
									<p class="meta d-flex">
										<span class="pr-3">Dessert</span><span class="ml-auto pl-3">March
											01, 2018</span>
									</p>
									<h3>
										<a href="single.html">Tasty &amp; Delicious Foods</a>
									</h3>
									<p class="mb-0">
										<a href="single.html" class="btn btn-black py-2">Read More
											<span class="icon-arrow_forward ml-4"></span>
										</a>
									</p>
								</div>
							</div>
						</div>
						<div class="col-md-4 ftco-animate">
							<div class="blog-entry">
								<a href="single.html" class="img-2"><img
									src="article/aimages/blog-9.jpg" class="img-fluid"
									alt="Colorlib Template"></a>
								<div class="text pt-3">
									<p class="meta d-flex">
										<span class="pr-3">Dessert</span><span class="ml-auto pl-3">March
											01, 2018</span>
									</p>
									<h3>
										<a href="single.html">Tasty &amp; Delicious Foods</a>
									</h3>
									<p class="mb-0">
										<a href="single.html" class="btn btn-black py-2">Read More
											<span class="icon-arrow_forward ml-4"></span>
										</a>
									</p>
								</div>
							</div>
						</div>
					</div>
					<div class="row mt-5">
						<div class="col text-center">
							<div class="block-27">
								<ul>
									<li><a href="#">&lt;</a></li>
									<li class="active"><span>1</span></li>
									<li><a href="#">2</a></li>
									<li><a href="#">3</a></li>
									<li><a href="#">4</a></li>
									<li><a href="#">5</a></li>
									<li><a href="#">&gt;</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>

				<div class="col-lg-3">
					<div class="sidebar-wrap">
						<div class="sidebar-box p-4 about text-center ftco-animate">
							<h2 class="heading mb-4">About Me</h2>
							<img src="article/aimages/author.jpg" class="img-fluid"
								alt="Colorlib Template">
							<div class="text pt-4">
								<p>
									Hi! My name is <strong>Cathy Deon</strong>, behind the word
									mountains, far from the countries Vokalia and Consonantia,
									there live the blind texts. Separated they live in
									Bookmarksgrove right at the coast of the Semantics, a large
									language ocean.
								</p>
							</div>
						</div>


						<div class="sidebar-box p-4 ftco-animate">
							<form action="findArctile?article_title=${param.article_title}"
								class="search-form">
								<div class="form-group">
									<span class="icon icon-search"></span> <input type="text"
										name="article_title" class="form-control" placeholder="Search"
										formaction="" />


								</div>

							</form>
						</div>



						<div class="sidebar-box categories text-center ftco-animate">
							<h2 class="heading mb-4">Categories</h2>
							<ul class="category-image">
								<li><a href="#"
									class="img d-flex align-items-center justify-content-center text-center"
									style="background-image: url(article/aimages/category-1.jpg);">
										<div class="text">
											<h3>Foods</h3>
										</div>
								</a></li>
								<li><a href="#"
									class="img d-flex align-items-center justify-content-center text-center"
									style="background-image: url(article/aimages/category-2.jpg);">
										<div class="text">
											<h3>Kitchenware</h3>
										</div>
								</a></li>
								<li><a href="#"
									class="img d-flex align-items-center justify-content-center text-center"
									style="background-image: url(article/aimages/category-2.jpg);">
										<div class="text">
											<h3>Others</h3>
										</div>
								</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>


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
		var msgField = document.getElementById("messageField");
		var divMsg = document.getElementById("msg-box");
		var Broadcast = document.getElementById("ArcBroadcast");
		function sendMsg() {
			var msgToSend = msgField.value;
			webSocket.send(msgToSend);
			msgField.value = "";
		}

		webSocket.onmessage = function(message) {
			divMsg.innerHTML += "<marquee direction='right' height='30' scrollamount='8' behavior='alternate'>"
					+ message.data + "</marquee>";
			divtoday.innerHTML += message.data;
		}

		webSocket.onopen = function() {
			console.log("connection opened");
		};

		webSocket.onclose = function() {
			console.log("connection closed");
		};

		webSocket.onerror = function wserror(message) {
			console.log("error: " + message);
		}
	</script>


</body>
</html>