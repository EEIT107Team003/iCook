<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<spring:url value="/resources/js/lib/sockjs.min.js" var="sockjs" />
<spring:url value="/resources/js/lib/stomp.min.js" var="stomp" />
<spring:url value="/resources/js/script.js" var="script" />
<spring:url value="/resources/js/lib/bootstrap/css/chat.css"
	var="chatCSS" />
<spring:url value="/images/logo.png" var="logo" />
<spring:url value="/resources/css/table.css" var="table" />
<spring:url value="/resources/css/open-iconic-bootstrap.min.css"
	var="oicbCSS" />
<spring:url value="/resources/css/animate.css" var="animateCSS" />
<spring:url value="/resources/css/owl.carousel.min.css" var="ocCSS" />
<spring:url value="/resources/css/owl.theme.default.min.css"
	var="otdCSS" />
<spring:url value="/resources/css/magnific-popup.css" var="mpCSS" />
<spring:url value="/resources/css/aos.css" var="aosCSS" />
<spring:url value="/resources/css/ionicons.min.css" var="ioniconsCSS" />
<spring:url value="/resources/css/bootstrap-datepicker.css" var="bdCSS" />
<spring:url value="/resources/css/jquery.timepicker.css" var="jtCSS" />
<spring:url value="/resources/css/flaticon.css" var="flaticonCSS" />
<spring:url value="/resources/css/icomoon.css" var="icomoonCSS" />
<spring:url value="/resources/css/style.css" var="styleRCSS" />
<!DOCTYPE html>
<html lang="en">
<head>
<title>享食天堂</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Abril+Fatface&display=swap"
	rel="stylesheet">

<link rel="stylesheet" href=" ${oicbCSS}">
<link rel="stylesheet" href="${animateCSS}">
<link rel="stylesheet" href="${ocCSS}">
<link rel="stylesheet" href="${otdCSS}">
<link rel="stylesheet" href="${mpCSS}">
<link rel="stylesheet" href="${aosCSS}">
<link rel="stylesheet" href="${ioniconsCSS}">
<link rel="stylesheet" href="${bdCSS}">
<link rel="stylesheet" href="${jtCSS}">
<link rel="stylesheet" href="${flaticonCSS}">
<link rel="stylesheet" href="${icomoonCSS}">
<link rel="stylesheet" href="${styleRCSS}">

<script type="text/javascript" src="${pageContext.request.contextPath}/article/ckeditor/ckeditor.js"></script>
<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
</head>
<body>

	<div id="colorlib-page">
		<a href="#" class="js-colorlib-nav-toggle colorlib-nav-toggle"><i></i></a>
		<aside id="colorlib-aside" role="complementary" class="js-fullheight">
			<nav id="colorlib-main-menu" role="navigation"
				style="text-align: justify;">
				<div class="container">
					<div class="row">
						<div class="col-sm-1"></div>
						<div class="col-sm-3">
							<ul>
								<li><h3
										style="margin-bottom: 20px;">
										<span class="glyphicon glyphicon-globe"></span><a
											href="${ pageContext.request.contextPath }">&nbsp;&nbsp;首頁</a>
									</h3></li>
								<li class="colorlib-active"><h3 style="margin-bottom: 20px;">
										<span class="glyphicon glyphicon-pencil"></span><a
											href="${ pageContext.request.contextPath }/forum/newPost">&nbsp;&nbsp;發表文章
										</a>
										</h3></li>
								<li><h3 style="margin-bottom: 20px;">
										<span class="glyphicon glyphicon-list-alt"></span><a
											href="${pageContext.request.contextPath}/recipe/recipeSelect">&nbsp;&nbsp;食譜
										</a>
										</h3></li>
								<li><h3 style="margin-bottom: 20px;">
										<span class="glyphicon glyphicon-camera"></span><a
											href="${ pageContext.request.contextPath }/A_articlemainpage">&nbsp;&nbsp;生活誌</a>
										</h3></li>
								<li><h3 style="margin-bottom: 20px;">
										<span class="glyphicon glyphicon-hand-left"></span><a
											href="${ pageContext.request.contextPath }/forum/overview">&nbsp;&nbsp;討論區首頁</a>
										</h3></li>
								<c:if test="${pageContext.request.userPrincipal.name==null}">
									<li><h3 style="margin-bottom: 20px;">
											<span class="glyphicon glyphicon-user"></span><a
												href="${ pageContext.request.contextPath }/icookLogin">&nbsp;&nbsp;會員專區
											</a>
											</h3></li>
								</c:if>
								<c:if test="${pageContext.request.userPrincipal.name!=null}">
									<li><h3 style="margin-bottom: 20px;">
											<span class="glyphicon glyphicon-user"></span><a href="#"
												onclick="logout()">&nbsp;&nbsp;會員登出 </a>
										</h3></li>
									<sec:authorize access="hasRole('ADMIN')">
										<li><h3 style="margin-bottom: 20px;"><span class="glyphicon glyphicon-off"></span><a href="${ pageContext.request.contextPath}/backStageDashboard">&nbsp;&nbsp;後台</a></h3></li>
									</sec:authorize>
								</c:if>
								<li style="display: none;" id="showchat"><h3
										style="margin-bottom: 20px;">
										<span class="glyphicon glyphicon-bullhorn"></span><a href="#"
											id="chatroom" style="color: red;">&nbsp;&nbsp;聊天室 </a>
										</h3></li>
							</ul>
						</div>
						<div class="col-sm-4"></div>
						<div class="col-sm-4"></div>
					</div>
				</div>
			</nav>
			<script>
				function logout() {
					let logoutConfirm = confirm("確定登出？");
					if (logoutConfirm) {
						window.location
								.replace("${ pageContext.request.contextPath }/perform_logout");

					}
				}
			</script>

			<div class="colorlib-footer">
				<h2 id="colorlib-logo" class="mb-4">
					<img src="${logo}" style="width: 90%; height: 90%;">
				</h2>
				<p class="pfooter">
					<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					Copyright &copy;
					<script>
						document.write(new Date().getFullYear());
					</script>
					All rights reserved | iCook
					<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
				</p>
			</div>
		</aside>
		<!-- END COLORLIB-ASIDE -->
		<div id="colorlib-main">
			<section class="ftco-section contact-section px-md-4">
				<div class="container">
					<div class="row d-flex mb-5 contact-info">
						<div class="container jumbotron jumbotron-fluid"
							style="background-image: url(<spring:url value="/resources/images/header.png"/>)">
							<h1 class="display-4">&nbsp;</h1>
							<p class="lead">&nbsp;</p>
						</div>
					</div>
					<div class="row block-9">

						<div class="col-lg-12 d-flex">

							<form:form action="#" class="bg-light p-5 contact-form"
								method='POST' modelAttribute='ForumMainBean'>
								<c:forEach var="post" items="${ posts }">
									<div class="form-group">
										<div>
											<span style="color: red">${ errors.category }</span>
										</div>
										<div>
											<span style="color: red">${ errors.title }</span>
										</div>
										<div class="input-group-prepend">
											<button class="btn btn-outline-secondary dropdown-toggle"
												type="button" data-toggle="dropdown" aria-haspopup="true"
												aria-expanded="false" id="category" value="0"
												disabled="disabled">${ post.category }</button>
											<form:input type="hidden" id="category2" name="category"
												value="${ post.category }" path="category" />
											<input type="text" class="form-control"
												aria-label="Text input with dropdown button"
												id="exampleFormControlInput1" placeholder="name@example.com"
												value="${ post.title }" disabled="true">
											<form:input type="hidden" name="title"
												value="${ post.title }" path="title" />
											<div class="dropdown-menu"></div>
										</div>
									</div>

									<div class="form-group">
										<input type="text" class="form-control"
											placeholder="Signature" name="signature"
											value="${ post.signature }">
									</div>

									<div class="form-group">
										<p style="color: red">${ errors.text }</p>
										<textarea name="text" id="maintext" cols="30" rows="7"
											class="form-control" style="min-height: 400px">${ post.text }</textarea>
									</div>
									<div class="form-group">
										<input type="submit" value="發布貼文"
											class="btn btn-primary py-3 px-5"> <a
											href="${ pageContext.request.contextPath }/forum/overview"
											class="btn btn-primary py-3 px-5">回到公佈欄</a>
									</div>
								</c:forEach>
							</form:form>

						</div>

					</div>
				</div>
			</section>
		</div>
		<!-- END COLORLIB-MAIN -->
	</div>
	<!-- END COLORLIB-PAGE -->

	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
	</div>


	<script src=<spring:url value="/resources/js/jquery.min.js"/>></script>
	<script
		src=<spring:url value="/resources/js/jquery-migrate-3.0.1.min.js"/>></script>
	<script src=<spring:url value="/resources/js/popper.min.js"/>></script>
	<script src=<spring:url value="/resources/js/bootstrap.min.js"/>></script>
	<script src=<spring:url value="/resources/js/jquery.easing.1.3.js"/>></script>
	<script src=<spring:url value="/resources/js/jquery.waypoints.min.js"/>></script>
	<script src=<spring:url value="/resources/js/jquery.stellar.min.js"/>></script>
	<script src=<spring:url value="/resources/js/owl.carousel.min.js" />></script>
	<script
		src=<spring:url value="/resources/js/jquery.magnific-popup.min.js"/>></script>
	<script src=<spring:url value="/resources/js/aos.js"/>></script>
	<script
		src=<spring:url value="/resources/js/jquery.animateNumber.min.js"/>></script>
	<script src=<spring:url value="/resources/js/scrollax.min.js"/>></script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src=<spring:url value="/resources/js/google-map.js"/>></script>
	<script src=<spring:url value="/resources/js/main.js"/>></script>
	<script>
		$("#1").click(function() {
			var cg = document.getElementById("1").text;
			$("#category").attr("value", cg).text(cg);
			$("#category2").attr("value", cg);
		})
		$("#2").click(function() {
			var cg = document.getElementById("2").text;
			$("#category").attr("value", cg).text(cg);
			$("#category2").attr("value", cg);
		})
		$("#3").click(function() {
			var cg = document.getElementById("3").text;
			$("#category").attr("value", cg).text(cg);
			$("#category2").attr("value", cg);
		})
		$("#4").click(function() {
			var cg = document.getElementById("4").text;
			$("#category").attr("value", cg).text(cg);
			$("#category2").attr("value", cg);
		})
		$("#5").click(function() {
			var cg = document.getElementById("5").text;
			$("#category").attr("value", cg).text(cg);
			$("#category2").attr("value", cg);
		})
		$("#6").click(function() {
			var cg = document.getElementById("6").text;
			$("#category").attr("value", cg).text(cg);
			$("#category2").attr("value", cg);
		})

		CKEDITOR
				.replace(
						'maintext',
						{
							extraPlugins : 'easyimage',
							cloudServices_tokenUrl : 'https://40733.cke-cs.com/token/dev/Pno0Ld5ha3oNhABb0mnQBXWdL6FXy03CbisbDkPL9hJoOrvd8p0hpHlka5RA',
							cloudServices_uploadUrl : 'https://40733.cke-cs.com/easyimage/upload/'
						});
		// 		CKEDITOR
		// 		.replace(
		// 				'signaturetext',
		// 				{
		// 					extraPlugins : 'easyimage',
		// 					cloudServices_tokenUrl : 'https://40733.cke-cs.com/token/dev/Pno0Ld5ha3oNhABb0mnQBXWdL6FXy03CbisbDkPL9hJoOrvd8p0hpHlka5RA',
		// 					cloudServices_uploadUrl : 'https://40733.cke-cs.com/easyimage/upload/'
		// 				});
	</script>

</body>
</html>

