<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Portfolio</title>
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
<!-- 	bootstrap -->
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

<script>
	$(document).ready(function() {
		$("a[data-gal^='prettyPhoto']").prettyPhoto({
			theme : 'facebook'
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
</head>
<body>
	<div class="main">
		<!--==============================header=================================-->
		<header>
			<div class="zerogrid">
				<div class="col-full">
					<div class="wrap-col">
						<h1>
							<a href="index2"><img src="images/logo.png" alt="EXTERIOR"></a>
						</h1>

						<div class="menu_block">
							<nav>
								<ul class="sf-menu">
									<li><a href="index2">ICook</a></li>
									<li><a href="icookAboutUS">關於我們</a>
										<ul>
											<li><a href="icookContact">聯繫我們</a></li>
										</ul></li>
									<li><a href="icookMenu">查看食譜</a>
										<ul>

											<li><a href="#">cat1</a></li>
											<li><a href="#">cat2</a></li>
											<li><a href="#">cat3</a></li>
										</ul>
									<li><a href="icookLife">生活誌</a></li>
									<li><a href="icookVideo">討論區</a></li>
									<li class="with_ul current"><a href="icookProducts">市集</a>
										<ul>
											<li><a href="cartPage">購物車</a></li>
										</ul></li>

									<li><a href="icookLogin">會員專區</a>
										<ul>
											<li><a href="icookLogin">會員登入</a></li>
											<li><a href="checkOrders">查看訂單</a></li>
											<li><a href="#">會員登出</a></li>
											<li><a href="#">新增食譜</a></li>
											<ul></li>

								</ul>
							</nav>
							<div class="clear"></div>
						</div>
						<div class="clear"></div>
					</div>
				</div>
		</header>
		<!--=======content================================-->

		<div class="content">
			<div align="center">
				<!-- 								<a href="images/big2.jpg" data-gal="prettyPhoto[1]"> -->
				<span><img src="images/thankyou2.gif" height='200px'
					width='50%' alt=""></span>

			</div>
			<div align="center">
				<h1>訂單完成! 已發送訂單確認信 訂單編號:
					<c:out value="${orderNo}"/></h1>
				<!-- 				<h3>謝謝老版  Thank you, 已發送訂單確認信</h3> -->
				<br>
				<h1>
					請記得您剛才的訂單編號:
					<c:out value="${orderNo}"/>
					號 並在付款時備註讓我們知道喔!
				</h1>
				<br>
			</div>
			<div align="center">
				<!-- 								<a href="images/big2.jpg" data-gal="prettyPhoto[1]"> -->
				<button type="button" class="btn btn-success btn-lg"
					onclick="javascript:location.href='/icook/checkOrders'">查看我的訂單</button>
			</div>
			<div class="zerogrid">
				<div class="col-full">
					<h2></h2>
				</div>
				<div class="clear"></div>

				<div class="row">
					<div>

						<div class="col-1-2"></div>
						<br>

						<!-- 						<div class="col-1-2"> -->
						<!-- 							<div class="wrap-col"> -->
						<!-- 								<a href="images/big4.jpg" data-gal="prettyPhoto[1]"><span><img -->
						<!-- 										src="images/page4_img3.jpg" alt=""></span></a> -->
						<!-- 							</div> -->
						<!-- 						</div> -->
						<!-- 						<div class="col-1-2"> -->
						<!-- 							<div class="wrap-col"> -->
						<!-- 								<a href="images/big1.jpg" data-gal="prettyPhoto[1]"><span><img -->
						<!-- 										src="images/page4_img4.jpg" alt=""></span></a> -->
						<!-- 							</div> -->
						<!-- 						</div> -->
					</div>
				</div>

				<div class="row">
					<div class="bottom_block">
						<div class="col-1-2">
							<div class="wrap-col">
								<a href=""
									onclick="window.open(' /icook/toAIOcheck', 'Paypal', config='height=500,width=500');">
									<!-- 								data-gal="prettyPhoto[1]" --> <span> <img
										src="images/printBarcode.jpg" alt=""></span>
								</a>
							</div>
						</div>
						<div class="col-1-2">
							<div class="wrap-col">
								<a href=""
									onclick="window.open(' /icook/payment', 'Paypal', config='height=500,width=500');">
									<!-- 								data-gal="prettyPhoto[1]" --> <span> <img
										src="images/paypal.png" alt=""></span>
								</a>
							</div>
						</div>
						<!-- 						<div class="col-1-2"> -->
						<!-- 							<h3>Follow Us</h3> -->
						<!-- 							<div class="socials"> -->
						<!-- 								<a href="#"></a> <a href="#"></a> <a href="#"></a> -->
						<!-- 							</div> -->
						<!-- 							<nav> -->
						<!-- 								<ul> -->
						<!-- 									<li><a href="index.html">Home</a></li> -->
						<!-- 									<li><a href="index-1.html">About Us</a></li> -->
						<!-- 									<li><a href="index-2.html">Menu</a></li> -->
						<!-- 									<li class="current"><a href="index-3.html">Portfolio</a></li> -->
						<!-- 									<li><a href="index-4.html">News </a></li> -->
						<!-- 									<li><a href="index-5.html">Contacts</a></li> -->
						<!-- 								</ul> -->
						<!-- 							</nav> -->
						<!-- 						</div> -->
						<!-- 						<div class="col-1-2"> -->
						<!-- 							<h3>Email Updates</h3> -->
						<!-- 							<p class="col1"> -->
						<!-- 								Join our digital mailing list and get news<br> deals and be -->
						<!-- 								first to know about events -->
						<!-- 							</p> -->
						<!-- 							<form id="newsletter"> -->
						<!-- 								<div class="success">Your subscribe request has been sent!</div> -->
						<!-- 								<label class="email"> <input type="email" -->
						<!-- 									value="Enter e-mail address"> <a href="#" class="btn" -->
						<!-- 									data-type="submit">subscribe</a> <span class="error">*This -->
						<!-- 										is not a valid email address.</span> -->
						<!-- 								</label> -->
						<!-- 							</form> -->
						<!-- 						</div> -->
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--==============================footer=================================-->

	<!-- 	<footer> -->
	<!-- 		<div class="zerogrid"> -->
	<!-- 			<div class="col-full"> -->
	<!-- 				<div class="wrap-col"> -->
	<!-- 					&copy; Copyright &copy; 2013.Company name All rights reserved.<a -->
	<!-- 						target="_blank" href="http://sc.chinaz.com/moban/">&#x7F51;&#x9875;&#x6A21;&#x677F;</a> -->
	<!-- 				</div> -->
	<!-- 			</div> -->
	<!-- 		</div> -->
	<!-- 	</footer> -->
	<div style="display: none">
		<script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540'
			language='JavaScript' charset='gb2312'></script>
	</div>
</body>

</html>