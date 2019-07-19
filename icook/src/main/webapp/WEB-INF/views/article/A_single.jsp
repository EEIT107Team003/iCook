<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>



<!DOCTYPE html>
<html>
<head>
<title>Stories - Free Bootstrap 4 Template by Colorlib</title>


<sec:authorize access="isAuthenticated()">

	<sec:authentication property="principal.username" var="username" />


</sec:authorize>




<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,900"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Playfair+Display:400,400i,700,700i,900,900i"
	rel="stylesheet">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/article/css/open-iconic-bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/article/css/animate.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/article/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/article/css/owl.theme.default.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/article/css/magnific-popup.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/article/css/aos.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/article/css/ionicons.min.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/article/css/flaticon.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/article/css/icomoon.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/article/css/style.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
<script src="https://cdn.bootcss.com/jquery/3.4.1/jquery.min.js"></script>


</head>
<body>
	<nav
		class="navbar navbar-expand-lg navbar-dark bg-dark ftco-navbar-light"
		id="ftco-navbar">
		<div class="container">
			<a class="navbar-brand" href="index.html">Stories<span>.</span></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#ftco-nav" aria-controls="ftco-nav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> Menu
			</button>

			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a
						href="${pageContext.request.contextPath}/home" class="nav-link">Home</a></li>

					<li class="nav-item"><a href="about.html" class="nav-link">About</a></li>
					<li class="nav-item"><a href="A_articlemainpage"
						class="nav-link">Foods文章首頁</a></li>
					<li class="nav-item"><a href="lifestyle.html" class="nav-link">Lifestyle</a></li>
					<li class="nav-item"><a href="contact.html" class="nav-link">Contact${username}</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- END nav -->

	<section class="hero-wrap hero-wrap-2"
		style="background-image: url('images/bg_4.jpg');">
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
					<h2 class="mb-3">${Article.article_title}</h2>

					<h3 class=>作者:${Article.article_member.nickname}
						日期:${Article.article_date}</h3>

					<!-- 						需要修改 -->
					<c:if test="${Article.article_member.username == username}">
						<div align="right" class="tagcloud">
							<a
								href="<spring:url value='/TagarticleUpdate?article_num=${Article.article_num}' />"
								class="tag-cloud-link">編輯</a>
						</div>
					</c:if>


					<article>${Article.article_content}</article>



					<div class="tag-widget post-tag-container mb-5 mt-5">
						<div class="tagcloud">
							<a href="#" class="tag-cloud-link">${Article.article_catergoary}</a>
						</div>
					</div>

					<div class="about-author d-flex p-4 bg-light">
						<div class="bio mr-5">
							<img src="images/person_1.jpg" alt="Image placeholder"
								class="img-fluid mb-4">
						</div>
						<div class="desc">

							<!--               簡介 -->
							<h3>George Washington</h3>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
								Ducimus itaque, autem necessitatibus voluptate quod mollitia
								delectus aut, sunt placeat nam vero culpa sapiente consectetur
								similique, inventore eos fugit cupiditate numquam!</p>
						</div>
					</div>

					<!-- 留言 -->
					<div class="pt-5 mt-5">
						<h3 class="mb-5">6 Comments</h3>
						<ul class="comment-list">
							<c:forEach var='MsgBoard' items='${MsgBoards}'>
								<li class="comment">
									<div class="vcard bio">
										<img
											src="<spring:url value='/MemberPhoto?member_id=${MsgBoard.memberid_in_msgs.member_id}' />"
											alt="Image placeholder">

									</div>

									<div class="comment-body">
										<h3>${MsgBoard.memberid_in_msgs.nickname}</h3>
										<div class="meta">${MsgBoard.msgboard_date}</div>
										<p>${MsgBoard.msgboard_content}</p>
									</div>
								</li>
							</c:forEach>

						</ul>
						<!-- END comment-list -->
						<!--               留言板 -->
						<div class="comment-form-wrap pt-5">



							<c:if test="${pageContext.request.userPrincipal.name != null}">
								<h3 class="mb-5">Leave a comment</h3>
								<!-- 新增留言板 -->
								<div class="form-group">
									<label for="message">Message</label>
									<textarea id="editor2" cols="30" rows="10" class="form-control"></textarea>
									<input disabled="disabled" id="catchnum"
										value="${Article.article_num}" type=hidden>
								</div>
								<div class="form-group">
									<input type="button" value="Post Comment"
										class="btn py-3 px-4 btn-primary" id='AJMsgBut'></input>
								</div>

							</c:if>

							<c:if test="${pageContext.request.userPrincipal.name == null}">

								<!-- 新增留言板 -->
								<div class="form-group">

									<h3 class="mb-5">會員開放留言</h3>
								</div>


							</c:if>










							<script>
								$('#AJMsgBut')
										.click(
												function() {
													$
															.ajax(
																	{
																		url : "AjaxMsginsert",
																		type : "POST",
																		data : {
																			catchnum : $(
																					'#catchnum')
																					.val(),
																			msgboard_content : CKEDITOR.instances.editor2
																					.getData()
																		}
																	})
															.done(
																	function(
																			res) {

																		$(".comment-list")
																				.append(
																						'<li class="comment"><div class="vcard bio"><img src="<spring:url value="/MemberPhoto?member_id='
																								+ res[1]
																								+ '"/>" alt="Image placeholder"></div><div class="comment-body"><h3>'
																								+ res[3]
																								+ '</h3><div class="meta">'
																								+ res[2]
																								+ '</div><p>'
																								+ res[0]
																								+ '</p></div></li>');
																								
																		CKEDITOR.instances.editor2.setData('');

										
																	})

												});
							</script>

						</div>
					</div>

				</div>





				<!-- .col-md-8 -->
				<div class="col-lg-4 sidebar pr-lg-5 ftco-animate">
					<div class="sidebar-box">
						<form action="#" class="search-form">
							<div class="form-group">
								<span class="icon icon-search"></span> <input type="text"
									class="form-control" placeholder="Type a keyword and hit enter">
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
						<h3 class="heading mb-4">Recent Blog</h3>
						<div class="block-21 mb-4 d-flex">
							<a class="blog-img mr-4"
								style="background-image: url(images/image_1.jpg);"></a>
							<div class="text">
								<h3>
									<a href="#">Even the all-powerful Pointing has no control
										about the blind texts</a>
								</h3>
								<div class="meta">
									<div>
										<a href="#"><span class="icon-calendar"></span> February
											12, 2019</a>
									</div>
									<div>
										<a href="#"><span class="icon-person"></span> Admin</a>
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
								<h3>
									<a href="#">Even the all-powerful Pointing has no control
										about the blind texts</a>
								</h3>
								<div class="meta">
									<div>
										<a href="#"><span class="icon-calendar"></span> February
											12, 2019</a>
									</div>
									<div>
										<a href="#"><span class="icon-person"></span> Admin</a>
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
								<h3>
									<a href="#">Even the all-powerful Pointing has no control
										about the blind texts</a>
								</h3>
								<div class="meta">
									<div>
										<a href="#"><span class="icon-calendar"></span> February
											12, 2019</a>
									</div>
									<div>
										<a href="#"><span class="icon-person"></span> Admin</a>
									</div>
									<div>
										<a href="#"><span class="icon-chat"></span> 19</a>
									</div>
								</div>
							</div>
						</div>
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
						<h3 class="heading mb-4">Paragraph</h3>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
							Ducimus itaque, autem necessitatibus voluptate quod mollitia
							delectus aut, sunt placeat nam vero culpa sapiente consectetur
							similique, inventore eos fugit cupiditate numquam!</p>
					</div>
				</div>

			</div>
		</div>
	</section>
	<!-- .section -->

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
		src="${pageContext.request.contextPath}/article/js/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/article/js/jquery-migrate-3.0.1.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/article/js/popper.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/article/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/article/js/jquery.easing.1.3.js"></script>
	<script
		src="${pageContext.request.contextPath}/article/js/jquery.waypoints.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/article/js/jquery.stellar.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/article/js/owl.carousel.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/article/js/jquery.magnific-popup.min.js"></script>
	<script src="${pageContext.request.contextPath}/article/js/aos.js"></script>
	<script
		src="${pageContext.request.contextPath}/article/js/jquery.animateNumber.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/article/js/scrollax.min.js"></script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script
		src="${pageContext.request.contextPath}/article/js/google-map.js"></script>
	<script src="${pageContext.request.contextPath}/article/js/main.js"></script>

</body>

<script>
	// console.log("Hello world!");
	// alert(document.getElementById("Msgartnum").value);
	// alert(document.getElementById("editor1").value);
	// var xhttp=new XMLHttpRequest();
	// xhttp.onreadystatechange=function(){
	// 	if(xhttp.ready.readyState==4 && xhttp.status==200){
	// // 		document.getElementById("test").innerHTML
	// 		alert(document.getElementById("Msgartnum").value);
	// 		alert(document.getElementById("editor1").value);
	// 	}
	// }

	// function tt(){

	// 	    alert('可以裡我媽');
	// 		alert(params.catchnum);
	// 		alert(params.msgboard_content);

	// }

	// var params = {}; 
	// //params.XX必须与Spring Mvc controller中的参数名称一致    
	// //否则在controller中使用@RequestParam绑定  

	// params.catchnum = document.getElementById("catchnum").value;  
	// params.msgboard_content = CKEDITOR.instances.editor1.getData();
</script>


<script>
	
	
console.log('12345');		
console.log(${username});	
console.log(${Article.article_member.username});
	
</script>
<script>
	CKEDITOR
			.replace(
					'editor2',
					{
						extraPlugins : 'easyimage',
						cloudServices_tokenUrl : 'https://40733.cke-cs.com/token/dev/Pno0Ld5ha3oNhABb0mnQBXWdL6FXy03CbisbDkPL9hJoOrvd8p0hpHlka5RA',
						cloudServices_uploadUrl : 'https://40733.cke-cs.com/easyimage/upload/'
					});
	
	
	
</script>



</html>