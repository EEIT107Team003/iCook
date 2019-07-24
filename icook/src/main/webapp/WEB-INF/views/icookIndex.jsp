<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Home</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="icon" href="images/favicon.ico">
<link rel="shortcut icon" href="images/favicon.ico" />
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/slider.css">
<link rel="stylesheet" href="css/zerogrid.css" type="text/css"
	media="screen">
<link rel="stylesheet" href="css/responsive.css" type="text/css"
	media="screen">

<script src="js/jquery.js"></script>
<script src="js/jquery-migrate-1.1.1.js"></script>
<script src="js/superfish.js"></script>
<script src="js/jquery.easing.1.3.js"></script>
<script src="js/sForm.js"></script>
<script src="js/jquery.carouFredSel-6.1.0-packed.js"></script>
<script src="js/tms-0.4.1.js"></script>
<script src="js/css3-mediaqueries.js"></script>
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

<body style="background-color: #55a237">
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
								<ul class="sf-menu"  style="padding-top:55px">
									<li><a href="index2">ICook</a></li>
									<li><a href="icookAboutUS">關於我們</a>
										<ul>
											<li><a href="icookContact">聯繫我們</a></li>
										</ul></li>
									<li>
										<a href="recipe/recipeIndex">查看食譜</a>
										<!--<ul>-->
											<!--<li><a href="#">cat1</a></li>-->
											<!--<li><a href="#">cat2</a></li>-->
											<!--<li><a href="#">cat3</a></li>-->
										<!--</ul>-->
									</li>
									<li><a href="icookLife">生活誌</a></li>
									<li><a href="forum/overview">討論區</a></li>
									<li><a href="A_articlemainpage">文章區</a>
										<ul>
											<li><a href="A_article">test</a></li>

										</ul></li>


<!-- 									<li><a href="products">市集</a> -->
									<li><a href="product?id=61">市集</a>
										<ul>


											<li><a href="cartPage">購物車</a></li>
										</ul></li>

									<li><a href="user">會員專區 </a>
										<ul>
											<c:if test="${pageContext.request.userPrincipal.name==null}">
												<li><a href="icookLogin">會員登入</a></li>
												<li><a href="icookRegister">會員註冊</a></li>
											</c:if>
											<c:if test="${pageContext.request.userPrincipal.name!=null}">
												<li><a href="index2" data-toggle="modal"
													data-target="#logout">會員登出</a></li>
											</c:if>
											<li><a href="checkOrders">查看訂單</a></li>
											<li><a href="icookAddRecipe">新增食譜</a></li>
											<li><a href="backStage">後台</a></li>
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
		<div class="slider-relative">
			<div class="slider-block">
				<div class="slider">
					<ul class="items">
						<li><img src="images/slide.jpg" alt=""></li>
						<li><img src="images/slide1.jpg" alt=""></li>
						<li class="mb0"><img src="images/slide2.jpg" alt=""></li>
					</ul>
				</div>
			</div>
		</div>
		<!--=======content================================-->

		<!-- 		------------------------------------------------------------------------ -->

		<!-- 確認登出 -->

		<div class="modal fade" id="logout" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header" style="border-bottom: 1px solid;">
						<h4 class="modal-title" id="myModalLabel" style="float: left">您即將登出享食天堂</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">×</button>
					</div>
					<div class="modal-body" style="width: 100%">
						<form method="post" action="perform_logout">
							<button type="submit">確定登出</button>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" data-dismiss="modal">取消</button>
					</div>
				</div>
			</div>
		</div>
		<!-- <div class="modal fade" id="logout" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"> -->
		<!-- 	<div class="modal-dialog"> -->
		<!-- 		<div class="modal-content"> -->
		<!-- 					<div class="modal-header"> -->
		<!-- 						<button type="button" class="close" data-dismiss="modal" -->
		<!-- 							aria-hidden="true">×</button> -->
		<!-- 						<h4 class="modal-title" id="myModalLabel">您即將登出享食天堂</h4> -->

		<!-- 					</div> -->
		<!-- 				</div> -->
		<!-- 			<div class="modal-body"> -->
		<!-- 				<form method="post" action="perform_logout"> -->
		<!-- 			        <button type="submit">確定登出</button> -->
		<!-- 			    </form> -->
		<!-- 			</div> -->
		<!-- 			<div class="modal-footer"> -->
		<!-- 				<button type="button" class="btn btn-default" data-dismiss="modal">取消</button> -->
		<!-- 			</div> -->
		<!-- 		</div>/.modal-content -->
		<!-- 	</div>/.modal -->
		<!-- </div> -->

		<!-- 		------------------------------------------------------------------------ -->

		<div class="content page1">
			<div class="zerogrid">
				<div class="row">
					<div class="col-3-5">
						<div class="wrap-col">
							<h2>歡迎光臨</h2>
							<div class="page1_block col1">
								<div class="col-1-3">
									<img src="images/food.gif" alt="">
								</div>
								<div class="col-2-3">
									<div class="extra_wrapper">
										<p>
											<span class="col2"> <!-- 												href="http://blog.templatemonster.com/free-website-templates/" -->
												<!-- 												rel="nofollow">Click here</a> -->
											</span>
											歡迎來到全台灣最大的食譜入口平台,響時天堂提供了最新最富有創意的料理食譜,我們蒐集並提供的食譜老少咸宜,在家或者在外面烹調都可以輕易上手.
										</p>
										請跟著我們的食譜步驟,展開一系列的美食奇幻之旅吧! <br> <a href="#" class="btn">去看食譜!</a>
									</div>
								</div>
								<div class="clear"></div>
							</div>
						</div>
					</div>
					<div class="col-2-5">
						<div class="wrap-col">
							<h2>關注</h2>
							<ul class="list">
								<li>200多種各國特色的料理以及私房廚藝</li>
								<li>最精緻最生動的教學,讓你立馬看完之後就能上手!</li>
								<li>多位長期合作的美食部落客綜合評鑑優等網站</li>
								<li>每周至少推出10道精選料理</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-full">
					<div class="hor_separator"></div>
				</div>
				<div class="row">
					<div class="col-full">
						<div class="wrap-col">
							<div class="car_wrap">
								<h2>特選食譜</h2>

								<div style="visibility: hidden">區塊中的內容</div>
								<div style="visibility: hidden">區塊中的內容</div>
								<a href="#" class="prev"></a><a href="#" class="next"></a>
								<ul class="carousel1">
									<li><div>
											<img src="images/seafood.jpg" alt="">
											<div class="col1 upp">
												<a href="#">爆炒海瓜子</a>
											</div>
											<span> Dorem ipsum dolor amet consectetur</span>
											<!-- 											<div class="price">45$</div> -->
										</div></li>
									<li><div>
											<img src="images/noodle.jpg" alt="">
											<div class="col1 upp">
												<a href="#">蚵仔麵線</a>
											</div>
											<span> Dorem ipsum dolor amet consectetur</span>
											<!-- 											<div class="price">45$</div> -->
										</div></li>
									<li><div>
											<img src="images/Omlette.jpg" alt="">
											<div class="col1 upp">
												<a href="#">蛋包飯</a>
											</div>
											<span> Dorem ipsum dolor amet consectetur</span>
											<!-- 											<div class="price">45$</div> -->
										</div></li>
									<li><div>
											<img src="images/meat.jpg" alt="">
											<div class="col1 upp">
												<a href="#">梅干扣肉</a>
											</div>
											<span> Dorem ipsum dolor amet consectetur</span>
											<!-- 											<div class="price">45$</div> -->
										</div></li>
									<!-- 									<li><div> -->
									<!-- 											<img src="images/duck.jpg" alt=""> -->
									<!-- 											<div class="col1 upp"> -->
									<!-- 												<a href="#">Lorem ipsum doamet consectet kim</a> -->
									<!-- 											</div> -->
									<!-- 											<span> Dorem ipsum dolor amet consectetur</span> -->
									<!-- 											<div class="price">45$</div> -->
									<!-- 										</div></li> -->
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="col-full">
					<div class="hor_separator"></div>
				</div>
				<div class="row">
					<div class="col-full">
						<div class="wrap-col">
							<div class="car_wrap">
								<h2>特選食譜</h2>

								<div style="visibility: hidden">區塊中的內容</div>
								<div style="visibility: hidden">區塊中的內容</div>
								<a href="#" class="prev"></a><a href="#" class="next"></a>
								<ul class="carousel1">
									<li><div>
											<img src="images/seafood.jpg" alt="">
											<div class="col1 upp">
												<a href="#">爆炒海瓜子</a>
											</div>
											<span>海瓜子洗淨。 蒜頭切片、辣椒切段、蔥切斜段、薑絲準備好。
												油兩大匙爆香鍋，加入蒜頭、薑絲.....</span>
											<!-- 											<div class="price">45$</div> -->
										</div></li>
									<li><div>
											<img src="images/noodle.jpg" alt="">
											<div class="col1 upp">
												<a href="#">蚵仔麵線</a>
											</div>
											<span>備一大鍋放水+全部食材+酌料1→一起煮至紅麵線軟爛


												再加入食材2一起拌勻煮滾，再用酌料1的太白粉水勾芡 起鍋前倒些香油…</span>
											<!-- 											<div class="price">45$</div> -->
										</div></li>
									<li><div>
											<img src="images/Omlette.jpg" alt="">
											<div class="col1 upp">
												<a href="#">蛋包飯</a>
											</div>
											<span> 蛋包飯長的可愛又好吃, 一直都是很受歡迎的料理之一! 蛋包飯要包得好看, 一定要快! 狠!
												準! ...</span>
											<!-- 											<div class="price">45$</div> -->
										</div></li>
									<li><div>
											<img src="images/meat.jpg" alt="">
											<div class="col1 upp">
												<a href="#">梅干扣肉</a>
											</div>
											<span>梅乾菜洗淨切碎，蒜末、辣椒末用剛剛煎肉的油下去炒香油不夠可以加點。拌炒出香氣，加醬油、冰糖、...</span>
											<!-- 											<div class="price">45$</div> -->
										</div></li>
									<!-- 									<li><div> -->
									<!-- 											<img src="images/duck.jpg" alt=""> -->
									<!-- 											<div class="col1 upp"> -->
									<!-- 												<a href="#">Lorem ipsum doamet consectet kim</a> -->
									<!-- 											</div> -->
									<!-- 											<span> Dorem ipsum dolor amet consectetur</span> -->
									<!-- 											<div class="price">45$</div> -->
									<!-- 										</div></li> -->
								</ul>
							</div>
						</div>
					</div>
				</div>

				<div class="col-full">
					<!-- 					<div class="hor_separator"></div> -->
				</div>

				<div class='subscribe'>
					<div class="row">
						<div class="bottom_block">
							<div class="col-1-2">
								<h3>追蹤我們</h3>
								<div class="socials">
									<a href="#"></a> <a href="#"></a> <a href="#"></a>
								</div>
								<nav>
									<!-- 								<ul> -->
									<!-- 									<li class="current"><a href="index.html">Home</a></li> -->
									<!-- 									<li><a href="index-1.html">About Us</a></li> -->
									<!-- 									<li><a href="index-2.html">Menu</a></li> -->
									<!-- 									<li><a href="index-3.html">Portfolio</a></li> -->
									<!-- 									<li><a href="index-4.html">News </a></li> -->
									<!-- 									<li><a href="index-5.html">Contacts</a></li> -->
									<!-- 								</ul> -->
								</nav>
							</div>

							<div class="col-1-2">
								<h3>Email 訂閱</h3>
								<p class="col1">
									訂閱我們讓你每天都能夠做自己喜愛的料理吧<br>
								</p>


							</div>
							<div></div>
							<form id="newsletter">
								<label class="email"> <input type="email"
									value="Enter e-mail address"> <a href="#" class="btn"
									data-type="submit">訂閱</a>
								</label>
							</form>
						</div>
					</div>
				</div>


			</div>
		</div>
	</div>

	<!--==============================footer=================================-->

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
		
	};

	webSocket.onclose = function() {
		console.log("connection closed");
	};

	webSocket.onerror = function wserror(message) {
		console.log("error: " + message);
	}
</script>


<script type="text/javascript" src="${pageContext.request.contextPath}/article/bootstrap-notify-master/bootstrap-notify.min.js"></script>

	
</body>
</html>