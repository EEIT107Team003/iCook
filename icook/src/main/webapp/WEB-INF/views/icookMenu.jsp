<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Menu</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="icon" href="images/favicon.ico">
<link rel="shortcut icon" href="images/favicon.ico" />
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/zerogrid.css" type="text/css"
	media="screen">
<link rel="stylesheet" href="css/responsive.css" type="text/css"
	media="screen">
<script src="js/jquery.js"></script>
<script src="js/jquery-migrate-1.1.1.js"></script>
<script src="js/superfish.js"></script>
<script src="js/jquery.easing.1.3.js"></script>
<script src="js/sForm.js"></script>
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
										</ul></li>
									<li><a href="icookLife">生活誌</a></li>
									<li><a href="forum/overview">討論區</a></li>
									<li><a href="A_articlemainpage">文章區</a>
										<ul>
											<li><a href="A_article">test</a></li>

										</ul></li>


									<li><a href="products">市集</a>
										<ul>


											<li><a href="cartPage">購物車</a></li>
										</ul></li>

									<li><a href="user">會員專區</a>
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
											<ul></li>

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

		<div class="content">
			<div class="zerogrid">

				<div class="row">
					<div class="col-3-6">
						<div class="wrap-col">
							<h2>Our Menu</h2>
							<p class="col2 inn1">
								<a href="#">Integer non metus justo ac posuere turpis.
									Integer iaculis porta metus, in aliquam orci vehicula sit amet.
									Suspendisse turpis mauris, laoreet ac aliquet a lobortis in
									massa. Etiam tortor metus, tincidunt vel congue etu</a>
							</p>
							<p>Aenean sed nunc lorem, nec ornare nibh. Pellentesque vitae
								sem odio. Vivamus vulputate est eget elit rutrum a consectetur
								justo aliquet. Aliquam hendrerit consectetur mi, non molestie
								massa venenatis quis. Integer aliquet euismod nisl, et sagittis
								sem scelerisque sit amet. Etiam dapibus, tellus et imperdiet
								pulvinar, urna nunc consectetur enim, in</p>
							<div class="menu">
								<div class="row">
									<div class="col-1-2">
										<div class="wrap-col">
											<img src="images/page3_img1.jpg" alt="" class="img_inner">
											<h3>
												<a href="#">Donec</a>
											</h3>
										</div>
									</div>
									<div class="col-1-2">
										<div class="wrap-col">
											<img src="images/page3_img2.jpg" alt="" class="img_inner">
											<h3>
												<a href="#">Murtyio</a>
											</h3>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-1-2">
										<div class="wrap-col">
											<img src="images/page3_img3.jpg" alt="" class="img_inner">
											<h3>
												<a href="#">Holity as Polfh</a>
											</h3>
										</div>
									</div>
									<div class="col-1-2">
										<div class="wrap-col">
											<img src="images/page3_img4.jpg" alt="" class="img_inner">
											<h3>
												<a href="#">Kiperty</a>
											</h3>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-1-2">
										<div class="wrap-col">
											<img src="images/page3_img5.jpg" alt="" class="img_inner">
											<h3 class="mb0">
												<a href="#">Gyloit</a>
											</h3>
										</div>
									</div>
									<div class="col-1-2">
										<div class="wrap-col">
											<img src="images/page3_img6.jpg" alt="" class="img_inner">
											<h3 class="mb0">
												<a href="#">Liotymer</a>
											</h3>
										</div>
									</div>
								</div>
							</div>
							<div class="clear"></div>
						</div>
					</div>

					<div class="col-1-6">
						<div class="wrap-col">
							<!--empty-->
						</div>
					</div>

					<div class="col-2-6">
						<div class="wrap-col">
							<h2 class="head2">Chef’s Secrets</h2>
							<ul class="list l1">
								<li><a href="#"> Maecenas malesuada sapien </a></li>
								<li><a href="#">Etiam tortor metus, tincidunt vel
										gtcongue </a></li>
								<li><a href="#">Pellentesque vitae sem odio</a></li>
								<li><a href="#"> Lorem ipsum dolor sit amet, con </a></li>
								<li><a href="#">Provide preferred vendor's list</a></li>
								<li><a href="#">Vivamus vulputate est eget elit s
										tellus et </a></li>
								<li><a href="#"> Nam blandit metus eget pretium </a></li>
								<li><a href="#"> Aaecenas koalesuada sapien </a></li>
								<li><a href="#">Ttiam tortor metus tiklioidunt vel </a></li>
								<li><a href="#">Eellentesque vitae sem odiokhoy</a></li>
								<li><a href="#"> Okoem ipsum dolor sit amet df </a></li>
								<li><a href="#">Rovide preferred vendor's listko
										frefrwq hu</a></li>
								<li><a href="#">Vvamus vulputate est eet elit </a></li>
								<li class="mb0"><a href="#"> Am blandit metus eet
										pretium </a></li>
							</ul>
							<h2 class="head1">Wine List</h2>
							<ul class="list">
								<li><a href="#"> Koalesuada libero </a></li>
								<li><a href="#">Ortor metus vel </a></li>
								<li><a href="#">Eellentesque vitae sem</a></li>
								<li><a href="#"> Ipsum </a></li>
								<li><a href="#">Rovide preferred </a></li>
								<li><a href="#">Vulputate est </a></li>
								<li><a href="#"> Bandit metus </a></li>
							</ul>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="bottom_block">
						<div class="col-1-2">
							<h3>Follow Us</h3>
							<div class="socials">
								<a href="#"></a> <a href="#"></a> <a href="#"></a>
							</div>
							<nav>
								<ul>
									<li><a href="index.html">Home</a></li>
									<li><a href="index-1.html">About Us</a></li>
									<li class="current"><a href="index-2.html">Menu</a></li>
									<li><a href="index-3.html">Portfolio</a></li>
									<li><a href="index-4.html">News </a></li>
									<li><a href="index-5.html">Contacts</a></li>
								</ul>
							</nav>
						</div>
						<div class="col-1-2">
							<h3>Email Updates</h3>
							<p class="col1">
								Join our digital mailing list and get news<br> deals and be
								first to know about events
							</p>
							<form id="newsletter">
								<div class="success">Your subscribe request has been sent!</div>
								<label class="email"> <input type="email"
									value="Enter e-mail address"> <a href="#" class="btn"
									data-type="submit">subscribe</a> <span class="error">*This
										is not a valid email address.</span>
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
				<div class="wrap-col">
					&copy; Copyright &copy; 2013.Company name All rights reserved.<a
						target="_blank" href="http://sc.chinaz.com/moban/">&#x7F51;&#x9875;&#x6A21;&#x677F;</a>
				</div>
			</div>
		</div>
	</footer>
	<div style="display: none">
		<script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540'
			language='JavaScript' charset='gb2312'></script>
	</div>
</body>
</html>