<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<spring:url value="/resources/js/lib/sockjs.min.js" var="sockjs" />
<spring:url value="/resources/js/lib/stomp.min.js" var="stomp" />
<spring:url value="/resources/js/script.js" var="script" />
<spring:url value="/resources/js/lib/bootstrap/css/chat.css"
	var="chatCSS" />
<%-- <spring:url value="/css/style.css" var="styleCSS"/> --%>
<%-- <spring:url value="/css/slider.css" var="sliderCSS"/> --%>
<%-- <spring:url value="/css/zerogrid.css" var="zerogridCSS"/> --%>
<%-- <spring:url value="/css/responsive.css" var="responsiveCSS"/> --%>
<%-- <spring:url value="/css/superfish.css" var="superfishCSS"/> --%>
<%-- <spring:url value="/js/jquery.js" var="jqueryJS"/> --%>
<%-- <spring:url value="/js/jquery-migrate-1.1.1.js" var="JM111JS"/> --%>
<%-- <spring:url value="/js/superfish.js" var="superfishJS"/> --%>
<%-- <spring:url value="/js/jquery.easing.1.3.js" var="JE13JS"/> --%>
<%-- <spring:url value="/js/sForm.js" var="sFormJS"/> --%>
<%-- <spring:url value="/js/jquery.carouFredSel-6.1.0-packed.js" var="JCFS610PJS"/> --%>
<%-- <spring:url value="/js/tms-0.4.1.js" var="TMSJS"/> --%>
<%-- <spring:url value="/js/css3-mediaqueries.js" var="CSSJS"/> --%>
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
<title>Andrea - Free Bootstrap 4 Template by Colorlib</title>
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
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"
	integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
</head>
<body>

	<div id="colorlib-page">
		<a href="#" class="js-colorlib-nav-toggle colorlib-nav-toggle"><i></i></a>
		<aside id="colorlib-aside" role="complementary" class="js-fullheight">
			<nav id="colorlib-main-menu" role="navigation">
				<ul>
					<li><a href="index.html">Home</a></li>
					<li><a href="fashion.html">Fashion</a></li>
					<li class="colorlib-active"><a href="travel.html">Travel</a></li>
					<li><a href="about.html">About</a></li>
					<li><a href="contact.html">Contact</a></li>
				</ul>
			</nav>

			<div class="colorlib-footer">
				
				<h2 id="colorlib-logo" class="mb-4">
					<img src="${logo}">
				</h2>
				<div class="mb-4">
					<h3>Subscribe for newsletter</h3>
					<form action="#" class="colorlib-subscribe-form">
						<div class="form-group d-flex">
							<div class="icon">
								<span class="icon-paper-plane"></span>
							</div>
							<input type="text" class="form-control"
								placeholder="Enter Email Address">
						</div>
					</form>
				</div>
				<p class="pfooter">
					<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					Copyright &copy;
					<script>
						document.write(new Date().getFullYear());
					</script>
					All rights reserved | This template is made with <i
						class="icon-heart" aria-hidden="true"></i> by <a
						href="https://colorlib.com" target="_blank">Colorlib</a>
					<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
				</p>
			</div>
		</aside>
		<!-- END COLORLIB-ASIDE -->
		<div id="colorlib-main">
			<section class="ftco-section ftco-no-pt ftco-no-pb">
				<div class="container">
					<div class="row d-flex">
						<div class="col-lg-8 px-md-5 py-5">


							<c:forEach var="post" items="${ posts }" varStatus="floor">

								<div class="row pt-md-4">
								<c:if test="${ post.article_id == post.harticle_id }">
									<div
										style="min-width: 680px; min-height: 60px; text-align: center;">
										<h1 class="mb-3">${ post.title }</h1>
									</div>
									</c:if>

									<div style="min-height: 249px; min-width: 680px;">
										<section>
											<article>${ post.text }</article>
										</section>
									</div>
									

									<div class="tag-widget post-tag-container mb-5 mt-5">
										<div  id="btnrow${post.article_id}" style="text-align:right;">
											<a href='${ pageContext.request.contextPath }/forum/reply?harticle_id=${ post.harticle_id }' class='btn btn-outline-info btn-sm'>回覆</a>
										</div>
									</div>

									<div class="about-author d-flex p-4 bg-light">
										<div class="bio mr-5">
											<img src="https://pbs.twimg.com/profile_images/1143465892614774784/kWanqizl_400x400.jpg" alt="Image placeholder"
												class="img-fluid mb-4">
										</div>
										<div class="desc" style="min-width:510px; min-height:162px;">
											<h3>${ post.nickname }</h3>
											<p>自我介紹OUO</p>
											<c:if test="${ post.article_id == post.harticle_id }"><br><br><h3 class="mb-5 font-weight-bold">${ post.replies } Comments</h3></c:if>											
										</div>																		
									</div>										


									<div class="pt-5 mt-5">										
										<ul class="comment-list">								
											<li class="comment">
												<div class="vcard bio">													
												</div>
												<div class="comment-body">
													<h3></h3>
													<div class="meta"></div>
													<p></p>
													<p>														
													</p>
												</div>
											</li>

<!-- 											
										<!-- END comment-list -->

									
										</ul>
									</div>
									
								</div>
								<!-- END-->
								<c:forEach var="user" items="${ LoginOK }" >
						<script type="text/javascript">
						var memberId = ${ user.member_id };
						var article_id = ${ post.article_id };
							$.ajax({
								url: "${ pageContext.request.contextPath }/forum/isLogin?article_id=${ post.article_id }",
								type: "GET",								
								success: function(data){
									console.log(data);
									var AmemberId = data;
									if(memberId==AmemberId){										
// 										$("#btnrow${post.article_id}").append(("<a href='${ pageContext.request.contextPath }/forum/reply?harticle_id=${ post.harticle_id }' class='btn btn-outline-info btn-sm'>回覆</a>"))
										$("#btnrow${post.article_id}").append(("<a href='${ pageContext.request.contextPath }/forum/edit?harticle_id=${ post.harticle_id }&article_id=${ post.article_id }'role='button' class='btn btn-outline-info btn-sm'>編輯</a>"))
										$("#btnrow${post.article_id}").append(("<input type='button' class='btn btn-outline-danger btn-sm'  onclick='deleteArticle()' style='float:right;'  value='刪除'/>"))										
									} 
									if(memberId != null){
										$("#btnrow${post.article_id}").append(("<button id='likebtn${post.article_id}' class='btn btn-outline-success my-2 my-sm-0 btn-sm' value='${ post.article_id }' style='float: left'>${ post.likes }Like</button>"))
										$("#likebtn${post.article_id}").click(function() {
											$.ajax({
														url : "${ pageContext.request.contextPath }/forum/like?article_id=${post.article_id}",
														type : "GET",
														success : function(data) {
																							var likes = data;
																							var newlikes = likes+ " Like"
																							$("#likebtn${post.article_id}").text(newlikes);}});});
									}
								}
							})
						

						
							
							function deleteArticle(){
										let isDelete = confirm("確定刪除？")
										if(isDelete){
											window.location.replace("${ pageContext.request.contextPath }/forum/delete?harticle_id=${ post.harticle_id }&article_id=${ post.article_id }");
										}
							}
							
									
					</script>
					</c:forEach>


							
				</c:forEach>
						</div>
						
						<div class="col-lg-4 sidebar ftco-animate bg-light pt-5">
							<div class="sidebar-box pt-md-4">
								<form action="#" class="search-form">
									<div class="form-group">
										<span class="icon icon-search"></span> <input type="text"
											class="form-control"
											placeholder="Type a keyword and hit enter">
									</div>
								</form>
							</div>
							<div class="sidebar-box ftco-animate">
								<h3 class="sidebar-heading">Categories</h3>
								<ul class="categories">
									<li><a href="#">Fashion <span>(6)</span></a></li>
									<li><a href="#">Technology <span>(8)</span></a></li>
									<li><a href="#">Travel <span>(2)</span></a></li>
									<li><a href="#">Food <span>(2)</span></a></li>
									<li><a href="#">Photography <span>(7)</span></a></li>
								</ul>
							</div>

							<div class="sidebar-box ftco-animate">
								<h3 class="sidebar-heading">Popular Articles</h3>
								<div class="block-21 mb-4 d-flex">
									<a class="blog-img mr-4"
										style="background-image: url(images/image_1.jpg);"></a>
									<div class="text">
										<h3 class="heading">
											<a href="#">Even the all-powerful Pointing has no control</a>
										</h3>
										<div class="meta">
											<div>
												<a href="#"><span class="icon-calendar"></span> June 28,
													2019</a>
											</div>
											<div>
												<a href="#"><span class="icon-person"></span> Dave Lewis</a>
											</div>
											<div>
												<a href="#"><span class="icon-chat"></span> 19</a>
											</div>
										</div>
									</div>
								</div>
								<div class="block-21 mb-4 d-flex">
									<a class="blog-img mr-4"
										style="background-image: url(images/image_2.jpg);"></a>
									<div class="text">
										<h3 class="heading">
											<a href="#">Even the all-powerful Pointing has no control</a>
										</h3>
										<div class="meta">
											<div>
												<a href="#"><span class="icon-calendar"></span> June 28,
													2019</a>
											</div>
											<div>
												<a href="#"><span class="icon-person"></span> Dave Lewis</a>
											</div>
											<div>
												<a href="#"><span class="icon-chat"></span> 19</a>
											</div>
										</div>
									</div>
								</div>
								<div class="block-21 mb-4 d-flex">
									<a class="blog-img mr-4"
										style="background-image: url(images/image_3.jpg);"></a>
									<div class="text">
										<h3 class="heading">
											<a href="#">Even the all-powerful Pointing has no control</a>
										</h3>
										<div class="meta">
											<div>
												<a href="#"><span class="icon-calendar"></span> June 28,
													2019</a>
											</div>
											<div>
												<a href="#"><span class="icon-person"></span> Dave Lewis</a>
											</div>
											<div>
												<a href="#"><span class="icon-chat"></span> 19</a>
											</div>
										</div>
									</div>
								</div>
							</div>

							<div class="sidebar-box ftco-animate">
								<h3 class="sidebar-heading">Tag Cloud</h3>
								<ul class="tagcloud">
									<a href="#" class="tag-cloud-link">animals</a>
									<a href="#" class="tag-cloud-link">human</a>
									<a href="#" class="tag-cloud-link">people</a>
									<a href="#" class="tag-cloud-link">cat</a>
									<a href="#" class="tag-cloud-link">dog</a>
									<a href="#" class="tag-cloud-link">nature</a>
									<a href="#" class="tag-cloud-link">leaves</a>
									<a href="#" class="tag-cloud-link">food</a>
								</ul>
							</div>

							<div class="sidebar-box subs-wrap img"
								style="background-image: url(images/bg_1.jpg);">
								<div class="overlay"></div>
								<h3 class="mb-4 sidebar-heading">Newsletter</h3>
								<p class="mb-4">Far far away, behind the word mountains, far
									from the countries Vokalia</p>
								<form action="#" class="subscribe-form">
									<div class="form-group">
										<input type="text" class="form-control"
											placeholder="Email Address"> <input type="submit"
											value="Subscribe" class="mt-2 btn btn-white submit">
									</div>
								</form>
							</div>

							<div class="sidebar-box ftco-animate">
								<h3 class="sidebar-heading">Archives</h3>
								<ul class="categories">
									<li><a href="#">December 2018 <span>(10)</span></a></li>
									<li><a href="#">September 2018 <span>(6)</span></a></li>
									<li><a href="#">August 2018 <span>(8)</span></a></li>
									<li><a href="#">July 2018 <span>(2)</span></a></li>
									<li><a href="#">June 2018 <span>(7)</span></a></li>
									<li><a href="#">May 2018 <span>(5)</span></a></li>
								</ul>
							</div>


							<div class="sidebar-box ftco-animate">
								<h3 class="sidebar-heading">Paragraph</h3>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
									Ducimus itaque, autem necessitatibus voluptate quod mollitia
									delectus aut.</p>
							</div>
						</div>
						<!-- END COL -->
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
	

</body>
</html>

