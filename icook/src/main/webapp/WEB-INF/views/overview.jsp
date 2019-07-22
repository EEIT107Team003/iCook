<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<spring:url value="/resources/js/lib/sockjs.min.js" var="sockjs" />
<spring:url value="/resources/js/lib/stomp.min.js" var="stomp" />
<spring:url value="/resources/js/script.js" var="script" />
<spring:url value="/resources/js/lib/bootstrap/css/chat.css" var="chatCSS"/>
<spring:url value="/resources/css/chat.css" var="chatroomCSS" />
<spring:url value="/images/logo.png" var="logo"/>
<spring:url value="/resources/css/table.css" var="table" />
<spring:url value="/resources/css/open-iconic-bootstrap.min.css" var="oicbCSS"/>
<spring:url value="/resources/css/animate.css" var="animateCSS"/>
<spring:url value="/resources/css/owl.carousel.min.css" var="ocCSS"/>
<spring:url value="/resources/css/owl.theme.default.min.css" var="otdCSS"/>
<spring:url value="/resources/css/magnific-popup.css" var="mpCSS"/>
<spring:url value="/resources/css/aos.css" var="aosCSS"/>
<spring:url value="/resources/css/ionicons.min.css" var="ioniconsCSS"/>
<spring:url value="/resources/css/bootstrap-datepicker.css" var="bdCSS"/>
<spring:url value="/resources/css/jquery.timepicker.css" var="jtCSS"/>
<spring:url value="/resources/css/flaticon.css" var="flaticonCSS"/>
<spring:url value="/resources/css/icomoon.css" var="icomoonCSS"/>
<spring:url value="/resources/css/style.css" var="styleRCSS"/>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Andrea - Free Bootstrap 4 Template by Colorlib</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Abril+Fatface&display=swap" rel="stylesheet">

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


<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<style>
.fixed {
  position: fixed;
  bottom: 0;
  right: 0;;
  background-color: white;
  text-align:right;
}
</style>
  </head>
  <body>

	<div id="colorlib-page">
		<a href="#" class="js-colorlib-nav-toggle colorlib-nav-toggle"><i></i></a>
		<aside id="colorlib-aside" role="complementary" class="js-fullheight">
			<nav id="colorlib-main-menu" role="navigation">
				<ul>
					<li class="colorlib-active"><a href="${ pageContext.request.contextPath }">Home</a></li>
					<li><a href="${ pageContext.request.contextPath }/forum/newPost">發表文章</a></li>
					<li><a href="travel.html">Travel</a></li>
					<li><a href="about.html">About</a></li>
					<li><a href="contact.html">Contact</a></li>
				</ul>
			</nav>

			<div class="colorlib-footer">
				<h2 id="colorlib-logo" class="mb-4"><img src="${logo}"></h2>
				<div class="mb-4">
					<h3>Subscribe for newsletter</h3>
					<form action="#" class="colorlib-subscribe-form">
            <div class="form-group d-flex">
            	<div class="icon"><span class="icon-paper-plane"></span></div>
              <input type="text" class="form-control" placeholder="Enter Email Address">
            </div>
          </form>
				</div>
				<p class="pfooter"><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
	  Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
	  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
			</div>
		</aside> <!-- END COLORLIB-ASIDE -->
		<div id="colorlib-main">
			<section class="ftco-section ftco-no-pt ftco-no-pb">
	    	<div class="container">
	    		<div class="row d-flex">
	    			<div class="col-xl-8 py-5 px-md-5">
	    				<div class="row pt-md-4">
	    				
	    				<c:forEach var="post" items="${ posts }">
								<div class="col-md-12" style=" max-width: 700px; max-height: 310px;  word-break:break-all; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; display: block;">
									<div class="blog-entry ftco-animate d-md-flex">
										<a href="${ pageContext.request.contextPath }/forum/pick?harticle_id=${ post.harticle_id }&article_id=${ post.article_id }" class="img img-2"
											style="background-image: url(<c:url value='/getMemberPhoto/${post.memberBean.member_id}'/>);"></a>
										<div class="text text-2 pl-md-4">
											<h3 class="mb-2">
												<a href="${ pageContext.request.contextPath }/forum/pick?harticle_id=${ post.harticle_id }&article_id=${ post.article_id }">${ post.title }</a>
											</h3>
											<div class="meta-wrap">
												<p class="meta">
													<span><i class="icon-calendar mr-2"></i>${ post.editTime }</span> <span><a href="single.html"><i
															class="icon-folder-o mr-2"></i>${ post.category }</a></span> <span><i
														class="icon-comment2 mr-2"></i>${ post.replies } Comment</span>
												</p>
											</div>
											<p class="mb-4"  style="width:490px; max-width: 490px; max-height: 55px;  word-break:break-all; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; display: block;">${ post.text }</p>
											<p>
												<a href="${ pageContext.request.contextPath }/forum/pick?harticle_id=${ post.harticle_id }&article_id=${ post.article_id }" class="btn-custom">Read More <span
													class="ion-ios-arrow-forward"></span></a>
											</p>
										</div>
									</div>
								</div>
						</c:forEach>
								
								<div class="col-md-12">
									<div class="blog-entry ftco-animate d-md-flex">
										<a href="single.html" class="img img-2" style="background-image: url(images/image_2.jpg);"></a>
										<div class="text text-2 pl-md-4">
				              <h3 class="mb-2"><a href="single.html">Great Things Never Came from Comfort Zone</a></h3>
				              <div class="meta-wrap">
												<p class="meta">
				              		<span><i class="icon-calendar mr-2"></i>June 28, 2019</span>
				              		<span><a href="single.html"><i class="icon-folder-o mr-2"></i>Travel</a></span>
				              		<span><i class="icon-comment2 mr-2"></i>5 Comment</span>
				              	</p>
			              	</div>
				              <p class="mb-4">A small river named Duden flows by their place and supplies it with the necessary regelialia.</p>
				              <p><a href="#" class="btn-custom">Read More <span class="ion-ios-arrow-forward"></span></a></p>
				            </div>
									</div>
								</div>
								<div class="col-md-12">
									<div class="blog-entry ftco-animate d-md-flex">
										<a href="single.html" class="img img-2" style="background-image: url(images/image_3.jpg);"></a>
										<div class="text text-2 pl-md-4">
				              <h3 class="mb-2"><a href="single.html">Paths Are Made by Walking</a></h3>
				              <div class="meta-wrap">
												<p class="meta">
				              		<span>Dec 14, 2018</span>
				              		<span><a href="single.html">Lifestyle</a></span>
				              		<span>5 Comment</span>
				              	</p>
			              	</div>
				              <p class="mb-4">A small river named Duden flows by their place and supplies it with the necessary regelialia.</p>
				              <p><a href="#" class="btn-custom">Read More <span class="ion-ios-arrow-forward"></span></a></p>
				            </div>
									</div>
								</div>
								<div class="col-md-12">
									<div class="blog-entry ftco-animate d-md-flex">
										<a href="single.html" class="img img-2" style="background-image: url(images/image_4.jpg);"></a>
										<div class="text text-2 pl-md-4">
				              <h3 class="mb-2"><a href="single.html">The Secret of Getting Ahead is Getting Started</a></h3>
				              <div class="meta-wrap">
												<p class="meta">
				              		<span>Dec 14, 2018</span>
				              		<span><a href="single.html">Nature</a></span>
				              		<span>5 Comment</span>
				              	</p>
			              	</div>
				              <p class="mb-4">A small river named Duden flows by their place and supplies it with the necessary regelialia.</p>
				              <p><a href="#" class="btn-custom">Read More <span class="ion-ios-arrow-forward"></span></a></p>
				            </div>
									</div>
								</div>
								<div class="col-md-12">
									<div class="blog-entry ftco-animate d-md-flex">
										<a href="single.html" class="img img-2" style="background-image: url(images/image_5.jpg);"></a>
										<div class="text text-2 pl-md-4">
				              <h3 class="mb-2"><a href="single.html">You Can't Blame Gravity for Falling in Love</a></h3>
				              <div class="meta-wrap">
												<p class="meta">
				              		<span>Dec 14, 2018</span>
				              		<span><a href="single.html">Lifestyle</a></span>
				              		<span>5 Comment</span>
				              	</p>
			              	</div>
				              <p class="mb-4">A small river named Duden flows by their place and supplies it with the necessary regelialia.</p>
				              <p><a href="#" class="btn-custom">Read More <span class="ion-ios-arrow-forward"></span></a></p>
				            </div>
									</div>
								</div>
								<div class="col-md-12">
									<div class="blog-entry ftco-animate d-md-flex">
										<a href="single.html" class="img img-2" style="background-image: url(images/image_6.jpg);"></a>
										<div class="text text-2 pl-md-4">
				              <h3 class="mb-2"><a href="single.html">You Can't Blame Gravity for Falling in Love</a></h3>
				              <div class="meta-wrap">
												<p class="meta">
				              		<span>Dec 14, 2018</span>
				              		<span><a href="single.html">Travel</a></span>
				              		<span>5 Comment</span>
				              	</p>
			              	</div>
				              <p class="mb-4">A small river named Duden flows by their place and supplies it with the necessary regelialia.</p>
				              <p><a href="#" class="btn-custom">Read More <span class="ion-ios-arrow-forward"></span></a></p>
				            </div>
									</div>
								</div>
								<div class="col-md-12">
									<div class="blog-entry ftco-animate d-md-flex">
										<a href="single.html" class="img img-2" style="background-image: url(images/image_7.jpg);"></a>
										<div class="text text-2 pl-md-4">
				              <h3 class="mb-2"><a href="single.html">You Can't Blame Gravity for Falling in Love</a></h3>
				              <div class="meta-wrap">
												<p class="meta">
				              		<span>Dec 14, 2018</span>
				              		<span><a href="single.html">Travel</a></span>
				              		<span>5 Comment</span>
				              	</p>
			              	</div>
				              <p class="mb-4">A small river named Duden flows by their place and supplies it with the necessary regelialia.</p>
				              <p><a href="#" class="btn-custom">Read More <span class="ion-ios-arrow-forward"></span></a></p>
				            </div>
									</div>
								</div>
								<div class="col-md-12">
									<div class="blog-entry ftco-animate d-md-flex">
										<a href="single.html" class="img img-2" style="background-image: url(images/image_8.jpg);"></a>
										<div class="text text-2 pl-md-4">
				              <h3 class="mb-2"><a href="single.html">You Can't Blame Gravity for Falling in Love</a></h3>
				              <div class="meta-wrap">
												<p class="meta">
				              		<span><i class="icon-calendar mr-2"></i>June 28, 2019</span>
				              		<span><a href="single.html"><i class="icon-folder-o mr-2"></i>Travel</a></span>
				              		<span><i class="icon-comment2 mr-2"></i>5 Comment</span>
				              	</p>
			              	</div>
				              <p class="mb-4">A small river named Duden flows by their place and supplies it with the necessary regelialia.</p>
				              <p><a href="#" class="btn-custom">Read More <span class="ion-ios-arrow-forward"></span></a></p>
				            </div>
									</div>
								</div>
								<div class="col-md-12">
									<div class="blog-entry ftco-animate d-md-flex">
										<a href="single.html" class="img img-2" style="background-image: url(images/image_9.jpg);"></a>
										<div class="text text-2 pl-md-4">
				              <h3 class="mb-2"><a href="single.html">You Can't Blame Gravity for Falling in Love</a></h3>
				              <div class="meta-wrap">
												<p class="meta">
				              		<span><i class="icon-calendar mr-2"></i>June 28, 2019</span>
				              		<span><a href="single.html"><i class="icon-folder-o mr-2"></i>Travel</a></span>
				              		<span><i class="icon-comment2 mr-2"></i>5 Comment</span>
				              	</p>
			              	</div>
				              <p class="mb-4">A small river named Duden flows by their place and supplies it with the necessary regelialia.</p>
				              <p><a href="#" class="btn-custom">Read More <span class="ion-ios-arrow-forward"></span></a></p>
				            </div>
									</div>
								</div>
								<div class="col-md-12">
									<div class="blog-entry ftco-animate d-md-flex">
										<a href="single.html" class="img img-2" style="background-image: url(images/image_10.jpg);"></a>
										<div class="text text-2 pl-md-4">
				              <h3 class="mb-2"><a href="single.html">You Can't Blame Gravity for Falling in Love</a></h3>
				              <div class="meta-wrap">
												<p class="meta">
				              		<span>Dec 14, 2018</span>
				              		<span><a href="single.html">Lifestyle</a></span>
				              		<span>5 Comment</span>
				              	</p>
			              	</div>
				              <p class="mb-4">A small river named Duden flows by their place and supplies it with the necessary regelialia.</p>
				              <p><a href="#" class="btn-custom">Read More <span class="ion-ios-arrow-forward"></span></a></p>
				            </div>
									</div>
								</div>
								<div class="col-md-12">
									<div class="blog-entry ftco-animate d-md-flex">
										<a href="single.html" class="img img-2" style="background-image: url(images/image_11.jpg);"></a>
										<div class="text text-2 pl-md-4">
				              <h3 class="mb-2"><a href="single.html">You Can't Blame Gravity for Falling in Love</a></h3>
				              <div class="meta-wrap">
												<p class="meta">
				              		<span><i class="icon-calendar mr-2"></i>June 28, 2019</span>
				              		<span><a href="single.html"><i class="icon-folder-o mr-2"></i>Travel</a></span>
				              		<span><i class="icon-comment2 mr-2"></i>5 Comment</span>
				              	</p>
			              	</div>
				              <p class="mb-4">A small river named Duden flows by their place and supplies it with the necessary regelialia.</p>
				              <p><a href="#" class="btn-custom">Read More <span class="ion-ios-arrow-forward"></span></a></p>
				            </div>
									</div>
								</div>
								<div class="col-md-12">
									<div class="blog-entry ftco-animate d-md-flex">
										<a href="single.html" class="img img-2" style="background-image: url(images/image_12.jpg);"></a>
										<div class="text text-2 pl-md-4">
				              <h3 class="mb-2"><a href="single.html">You Can't Blame Gravity for Falling in Love</a></h3>
				              <div class="meta-wrap">
												<p class="meta">
				              		<span><i class="icon-calendar mr-2"></i>June 28, 2019</span>
				              		<span><a href="single.html"><i class="icon-folder-o mr-2"></i>Travel</a></span>
				              		<span><i class="icon-comment2 mr-2"></i>5 Comment</span>
				              	</p>
			              	</div>
				              <p class="mb-4">A small river named Duden flows by their place and supplies it with the necessary regelialia.</p>
				              <p><a href="#" class="btn-custom">Read More <span class="ion-ios-arrow-forward"></span></a></p>
				            </div>
									</div>
								</div>
			    		</div><!-- END-->
			    		<div class="row">
			          <div class="col">
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
	    			<div class="col-xl-4 sidebar ftco-animate bg-light pt-5">
	            <div class="sidebar-box pt-md-4">
	              <form action="${ pageContext.request.contextPath }/forum/search?title=${ param.title }" class="search-form">
	                <div class="form-group">
	                  <span class="icon icon-search"></span>
	                  <input type="text"  name="title" class="form-control" placeholder="Type a keyword and hit enter">
	                </div>
	              </form>
	            </div>
	            <div class="sidebar-box ftco-animate">
	            	<h3 class="sidebar-heading">Categories</h3>
	              <ul class="categories">
	                <li><a href="${ pageContext.request.contextPath }/forum/overview">All <span>(6)</span></a></li>
	                <li><a href="${ pageContext.request.contextPath }/forum/query?category=問題">問題 <span>(8)</span></a></li>
	                <li><a href="${ pageContext.request.contextPath }/forum/query?category=閒聊">閒聊 <span>(2)</span></a></li>
	                <li><a href="${ pageContext.request.contextPath }/forum/query?category=心得">心得 <span>(2)</span></a></li>
	                <li><a href="${ pageContext.request.contextPath }/forum/query?category=自介">自介 <span>(7)</span></a></li>
	                <li><a href="${ pageContext.request.contextPath }/forum/query?category=食材">食材 <span>(7)</span></a></li>
	                <li><a href="${ pageContext.request.contextPath }/forum/query?category=器具">器具 <span>(7)</span></a></li>
	              </ul>
	            </div>
	            
	            <div class="sidebar-box ftco-animate">	          
	              <h3 class="sidebar-heading">Popular Articles</h3>
	              <c:forEach var="pop" items="${ populars }">	             	              
	              <div class="block-21 mb-4 d-flex">
	                <a class="blog-img mr-4" style="background-image: url(<c:url value='/getMemberPhoto/${pop.memberBean.member_id}'/>);"></a>
	                <div class="text">
	                  <h3 class="heading"><a href="${ pageContext.request.contextPath }/forum/pick?harticle_id=${ pop.harticle_id }&article_id=${ pop.article_id }">${ pop.title }</a></h3>
	                  <div class="meta">	                  
	                    <div><span class="icon-calendar"></span> ${ pop.postTime }</div>
	                    <div><span class="icon-person"></span> ${ pop.nickname }</div>
	                    <div><span class="icon-chat"></span> ${ pop.replies } </div>	                    
	                  </div>	                  
	                </div>	                	                
	            </div>
	            </c:forEach>


	            

							<div class="sidebar-box subs-wrap img py-4" style="background-image: url();">
								<div class="overlay"></div>
								<h3 class="mb-4 sidebar-heading">Newsletter</h3>
								<p class="mb-4">Far far away, behind the word mountains, far from the countries Vokalia</p>
	              <form action="#" class="subscribe-form">
	                <div class="form-group">
	                  <input type="text" class="form-control" placeholder="Email Address">
	                  <input type="submit" value="Subscribe" class="mt-2 btn btn-white submit">
	                </div>
	              </form>
	            </div>

	            
	            
<!-- 	            chat -->
	              <div class="fixed"> <div class="col-md-9 col-md-offset-3"  style="width:547.5px; height:400px;">
            <div class="panel panel-primary" style="width:300px; height:400px;">
                <div class="panel-heading">
                    <span class="glyphicon glyphicon-comment"></span> 廣場尬聊
                    
                </div>
                <div class="panel-body" style="min-height:280px; text-align:right;" id="response">
                    <ul class="chat"> </ul>
                </div>
                <div class="panel-footer">
                    <div class="input-group">
                        <input id="text" type="text" class="form-control input-sm" placeholder="說點什麼......" />
                        <span class="input-group-btn">
                            <button class="btn btn-warning btn-sm" id="sendMessage"  onclick="sendMessage();"> 送出</button>
                        </span>
                    </div>
                </div>
            </div>
        </div></div>
<!--         chat -->
        
        
	          </div><!-- END COL -->
	    		</div>
	    	</div>
	    </section>
		</div><!-- END COLORLIB-MAIN -->
	</div><!-- END COLORLIB-PAGE -->

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


  <script src=<spring:url value="/resources/js/jquery.min.js"/>></script>
  <script src=<spring:url value="/resources/js/jquery-migrate-3.0.1.min.js"/>></script>
  <script src=<spring:url value="/resources/js/popper.min.js"/>></script>
  <script src=<spring:url value="/resources/js/bootstrap.min.js"/>></script>
  <script src=<spring:url value="/resources/js/jquery.easing.1.3.js"/>></script>
  <script src=<spring:url value="/resources/js/jquery.waypoints.min.js"/>></script>
  <script src=<spring:url value="/resources/js/jquery.stellar.min.js"/>></script>
  <script src=<spring:url value="/resources/js/owl.carousel.min.js" />></script>
  <script src=<spring:url value="/resources/js/jquery.magnific-popup.min.js"/>></script>
  <script src=<spring:url value="/resources/js/aos.js"/>></script>
  <script src=<spring:url value="/resources/js/jquery.animateNumber.min.js"/>></script>
  <script src=<spring:url value="/resources/js/scrollax.min.js"/>></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src=<spring:url value="/resources/js/google-map.js"/>></script>
  <script src=<spring:url value="/resources/js/main.js"/>></script>
  <script src=<spring:url value="/resources/js/chat.js" />></script>
    <script src="${sockjs}"></script>
	<script src="${stomp}"></script>
	<c:forEach var="user" items="${ LoginOK }">
		<input type="hidden" id="from" value=" ${user.username}" />
		<script src="${script}"></script>
	</c:forEach>
  </body>
</html>