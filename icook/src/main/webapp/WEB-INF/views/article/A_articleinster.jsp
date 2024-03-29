<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
<script src="https://cdn.bootcss.com/web-socket-js/1.0.0/web_socket.js"></script>
<script src="https://cdn.bootcss.com/jquery/3.4.1/jquery.min.js"></script>
<title>Stories - Free Bootstrap 4 Template by Colorlib</title>
<meta charset="utf-8"> 
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">

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
<script type="text/javascript"
	src="${pageContext.request.contextPath}/article/ckeditor/ckeditor.js"></script>

<!-- 套版使用 -->
<link rel="icon" href="images/favicon.ico">
<link rel="shortcut icon" href="images/favicon.ico" />
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/zerogrid.css" type="text/css"
	media="screen">
<link rel="stylesheet" href="css/responsive.css" type="text/css"
	media="screen">
<link rel="stylesheet" href="css/prettyPhoto.css">




</head>
<body>
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
								
								<li><a href="recipe/recipeIndex">查看食譜</a> <!--<ul>--> <!--<li><a href="#">cat1</a></li>-->
									<!--<li><a href="#">cat2</a></li>--> <!--<li><a href="#">cat3</a></li>-->
									<!--</ul>--></li>
								
								<li><a href="forum/overview">討論區</a></li>
								<li><a href="A_articlemainpage">生活誌</a></li>


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
						<h1 class="mb-3 bread">Article Single</h1>
						<p class="breadcrumbs">
							<span class="mr-2"><a href="index.html">Home <i
									class="ion-ios-arrow-forward"></i></a></span> <span>Article Single<i
								class="ion-ios-arrow-forward"></i></span>
						</p>
					</div>
				</div>
			</div>
		</section>

		<section class="ftco-section">
			<div class="container">
				<div class="row">
					<div class="col-lg-8 order-lg-last ftco-animate">
						<!--           title -->




						<h2 class="mb-3">新增一篇文章</h2>

						<form:form method="POST" modelAttribute="Articlebean"
							class="bg-light p-5 contact-form" enctype="multipart/form-data">

							<!-- 						<div class="form-group"> -->

							<%-- 							<form:input path="article_date" type="text" class="form-control"  --%>
							<%-- 								placeholder="日期(西元年-月份-日期)" /> --%>
							<!-- 						</div> -->
							<div style="color: #FF0000; font-size: 60%; display: inline">${ErrorMsg.error_Article_date}</div>
							<div class="form-group">
								<form:input path="article_title" type="text"
									class="form-control" placeholder="標題" />
							</div>
							<div style="color: #FF0000; font-size: 60%; display: inline">${ErrorMsg.error_Article_title}</div>

							<!-- 						<div class="form-group"> -->
							<%-- 							<form:input path="article_author" type="text" --%>
							<%-- 								class="form-control" placeholder="作者" /> --%>
							<!-- 						</div> -->
							<%-- 						<div style="color: #FF0000; font-size: 60%; display: inline">${ErrorMsg.error_Article_author}</div> --%>

							<div class="form-group">
								<form:select path="article_status" class="form-control">
									<option value="1">公開</option>
									<option value="2">隱藏</option>

								</form:select>
							</div>
							<div class="form-group">
								<form:select path="article_catergoary">
									<option value="美食新聞">美食新聞</option>
									<option value="廚具新聞">廚具新聞</option>
									<option value="其他">其他</option>
								</form:select>
							</div>
							<div class="form-group">
								<form:input path="ArticleImage" type="file" class="form-control"
									placeholder="上傳封面照片" />
							</div>
							<div class="form-group">
								<form:textarea rows="100%" cols="100%" name="editor1"
									path="article_content" id="editor1" />
							</div>
							<div style="color: #FF0000; font-size: 60%; display: inline">${ErrorMsg.error_Article_content}</div>



							<!-- 						<div class="form-group"> -->


							<!-- 							<div id="msg-box" -->
							<!-- 								style="width: 500px; height: 400px; background: #eee; overflow: auto;"></div> -->
							<!-- 						</div> -->







							<div class="form-group">
								<input type="submit" value="Send Article" onclick="sendMsg();"
									class="btn btn-primary py-3 px-5">
							</div>


						</form:form>


					</div>
					<!-- .col-md-8 -->
					<div class="col-lg-4 sidebar pr-lg-5 ftco-animate">
						<div class="sidebar-box">
							<form action="#" class="search-form">
								<div class="form-group">
									<span class="icon icon-search"></span> <input type="text"
										class="form-control"
										placeholder="Type a keyword and hit enter">
								</div>
							</form>
						</div>
						<div class="sidebar-box ftco-animate">
							<ul class="categories">
								<h3 class="heading mb-4">Categories</h3>
								<li><a href="#">Travel <span>(12)</span></a></li>
								<li><a href="#">Tour <span>(22)</span></a></li>
								<li><a href="#">Destination <span>(37)</span></a></li>
								<li><a href="#">Drinks <span>(42)</span></a></li>
								<li><a href="#">Foods <span>(14)</span></a></li>
								<li><a href="#">Travel <span>(140)</span></a></li>
							</ul>
						</div>

						<div class="sidebar-box ftco-animate">
							news
							<h3 class="heading mb-4">Recent Blog</h3>

							<c:forEach var='ArticleThree' items='${ArticleThrees}'>
								<div class="block-21 mb-4 d-flex">
									<a class="blog-img mr-4"
										href="<spring:url value='/article?article_num=${ArticleThree.article_num}' />">
										<img width="100px" height="100px"
										src="<c:url value='/getartPicture/${ArticleThree.article_num}'/>">
									</a>



									<div class="text">
										<h3>
											<a
												href="<spring:url value='/article?article_num=${ArticleThree.article_num}' />">${ArticleThree.article_title}
											</a>
										</h3>
										<div class="meta">
											<div>
												<a href="#"><span class="icon-calendar"></span>
													${ArticleThree.article_date} </a>
											</div>
											<div>
												<a href="#"><span class="icon-person"></span>
													${ArticleThree.article_member.nickname}</a>
											</div>

										</div>
									</div>
								</div>
							</c:forEach>



						</div>

						<div class="sidebar-box ftco-animate">
							<h3 class="heading mb-4">Tag Cloud</h3>
							<div class="tagcloud">
								<a href="#" class="tag-cloud-link">dish</a> <a href="#"
									class="tag-cloud-link">menu</a> <a href="#"
									class="tag-cloud-link">food</a> <a href="#"
									class="tag-cloud-link">sweet</a> <a href="#"
									class="tag-cloud-link">tasty</a> <a href="#"
									class="tag-cloud-link">delicious</a> <a href="#"
									class="tag-cloud-link">desserts</a> <a href="#"
									class="tag-cloud-link">drinks</a>
							</div>
						</div>

						<div class="sidebar-box ftco-animate">
							<h3 class="heading mb-4">相關開發人員</h3>
							<p>EEIT107 第三組</p>
						</div>
					</div>

				</div>
			</div>
		</section>
		<!-- .section -->
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

</body>


<script>
	var webSocket = new WebSocket("ws:/localhost:8080/icook/ArtBroadcast");
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



<script>
	CKEDITOR
			.replace(
					'editor1',
					{
						height : 800,
						extraPlugins : 'easyimage',
						cloudServices_tokenUrl : 'https://40733.cke-cs.com/token/dev/Pno0Ld5ha3oNhABb0mnQBXWdL6FXy03CbisbDkPL9hJoOrvd8p0hpHlka5RA',
						cloudServices_uploadUrl : 'https://40733.cke-cs.com/easyimage/upload/'
					});
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

</html>