<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>About Us</title>
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
<script src="js/jquery.carouFredSel-6.1.0-packed.js"></script>
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
	$(window).load(function() {
		$('.carousel2').carouFredSel({
			auto : false,
			prev : '.prev1',
			next : '.next1',
			width : 410,
			items : {
				visible : {
					min : 1,
					max : 1
				},
				height : 'auto',
				width : 410,

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
</head>
<body>
	<div class="main">
		<!--==============================header=================================-->
		<header>
			<div class="zerogrid">
				<div class="col-full">
					<div class="wrap-col">
						<h1>
							<a style="height:200px" href="${pageContext.request.contextPath}/index2"><img src="${pageContext.request.contextPath}/images/logo.png" style="width: 200px ;right: 200px ;border-radius: 50%;" alt="EXTERIOR"></a>
						</h1>

						<div class="menu_block">
							<nav>
								<ul class="sf-menu"  style="padding-top:55px">
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
					<div class="col-2-5">
						<div class="wrap-col">
							<h2>About Us</h2>
							<img src="images/page2_img1.jpg" alt="" class="img_inner">
							<p class="col1">Curabitur in turpisju massa. Donec et nibh
								non turpis pellentesque suscipit eget.</p>
							<p>Ghfgop Maecnas cursus fringilla sagittis. Donec eu felis
								purus, iaculis fringilla ipsum. Inte ger non nulla sem, eget
								volutpat augue. Curabitur in turpisju massa. Donec et nibh non
								turpis pellentesque suscipit eget.</p>
							Donec eu felis purus, iaculis fringilla ipsum. Integer non. nulla
							sem, eget volutpat augue. Curabitur in turpisju massa. Donec et
							nibh non turpis pellentesque suscipit eget vel odio. Sed tempus
							orci tempus libero suscipit elementum. Aliquam consectetur.
							Ghfgop Maecnas cursus. <br> <a href="#" class="btn m1">More</a>
						</div>
					</div>
					<div class="col-1-5">
						<div class="wrap-col">
							<!--empty-->
						</div>
					</div>
					<div class="col-2-5">
						<div class="wrap-col">
							<h2>Testimonials</h2>
							<ul class="testimo">
								<li>
									<blockquote>
										<img src="images/page2_img2.png" alt="">
										<div class="extra_wrapper">
											<div class="title">
												Sara &amp; Kevin <br> Jonson
											</div>
										</div>
										<div class="clear"></div>
										<p class="col1">
											<a href="#">Euismod pellentesque in dui. Semper, enim
												eget eleifend faucibus, sem libero gravida erat, sit amet
												viverra dui nisl non nulla. Pellentesque in dui euismod. </a>
										</p>
										<p>Curabitur felis purus, iaculis fringi. ipsum. Integer
											non nulla sem, eget volutpat augue. Ghfgop Maecnas cursus
											fringilla sagittis. Donec eu felis purus, iaculis fringilla
											ipsum. Inte ger non nulla sem, eget volutpat augue. Curabitur
											in turpisju massa. Donec et nibh non turpis pellentesque
											suscipit eget vel odio. Aliquam consectetur. Fringilla ipsum.
										</p>
										<p>Ringilla ipsum. Donec et nibh non turpis pellentesque
											suscipit eget vel odio. Sed tempus orci tempus libero
											suscipit elementum. Aliquam consectetur. Ghfgop Maecnas
											cursus fringilla sagittis. Donec eu felis purus, iaculis
											fringi. ipsum. Integer non nulla sem, eget volutpat augue.
											Ghfgop pelle ntesque suscipit eget consectetur.</p>
									</blockquote>
								</li>
							</ul>
						</div>
					</div>
				</div>


				<div class="col-full">
					<div class="hor_separator hor1"></div>
					<h2 class="head1">Our Best Chefs</h2>
				</div>
				<div class="clear"></div>

				<div class="row">
					<div class="chefs">
						<div class="col-1-4">
							<div class="wrap-col">
								<img src="images/page2_img3.jpg" alt="" class="img_inner">
								<p class="col1">
									<a href="#">Ann Franklin</a>
								</p>
								Nulla pellentesque tempus quam nec porta. Donec nec lorem enim.
								Aenean velit velit, faucibus sed porta quis, gt er semper ac
								elit. Aliquam hendrerit mo lestie turpis condimentum tristique.
								Fty aliquam malesuada orci a massa yht. semper sed interdum arcu
							</div>
						</div>
						<div class="col-1-4">
							<div class="wrap-col">
								<img src="images/page2_img4.jpg" alt="" class="img_inner">
								<p class="col1">
									<a href="#"> Milisa Dayemond</a>
								</p>
								Lorem ipsum pellentesque tempus quam nec porta. Donec nec lorem
								enim. Aenean velit velit, faucibus sed porta quis, gt er semper
								ac elit. Aliquam hendrerit mo lestie turpis condimentum
								tristique. Fty aliquam malesuada orci a massa iaculis. Integer a
								diam a odio.
							</div>
						</div>
						<div class="col-1-4">
							<div class="wrap-col">
								<img src="images/page2_img5.jpg" alt="" class="img_inner">
								<p class="col1">
									<a href="#">Liza Croft</a>
								</p>
								Aenean velittempus quam nec porta. Donec nec lorem enim. Aenean
								velit velit, faucibus sed porta quis, gt er semper ac elit.
								Aliquam hendrerit mo lestie turpis condimentum tristique. Fty
								aliquam malesuada orci a massa yht. semper sed interdum.
							</div>
						</div>
						<div class="col-1-4">
							<div class="wrap-col">
								<img src="images/page2_img6.jpg" alt="" class="img_inner">
								<p class="col1">
									<a href="#">Alan Soares</a>
								</p>
								Donec necllentesque tempus quam nec porta. Donec nec lorem enim.
								Aenean velit velit, faucibus sed porta quis, gt er semper ac
								elit. Aliquam hendrerit mo lestie turpis condimentum tristique.
								Fty aliquam malesuada orci a massa yht. semper sed interdum.
							</div>
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
									<li class="current"><a href="index-1.html">About Us</a></li>
									<li><a href="index-2.html">Menu</a></li>
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