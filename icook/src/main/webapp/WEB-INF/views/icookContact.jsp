<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Contacts</title>
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
<link rel="stylesheet" href="css/form.css">
<script src="js/jquery.js"></script>
<script src="js/jquery-migrate-1.1.1.js"></script>
<script src="js/superfish.js"></script>
<script src="js/jquery.easing.1.3.js"></script>
<script src="js/sForm.js"></script>
<script src="js/Forms.js"></script>
<script src="js/css3-mediaqueries.js"></script>
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
											<li  class="with_ul current"><a href="icookContact">聯繫我們</a></li>
										</ul></li>
									<li><a href="icookMenu">查看食譜</a>
										<ul>

											<li><a href="#">cat1</a></li>
											<li><a href="#">cat2</a></li>
											<li><a href="#">cat3</a></li>
										</ul>
									<li><a href="icookLife">生活誌</a></li>
									<li><a href="icookVideo">討論區</a></li>
									<li><a href="icookProducts">市集</a>
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
			<div class="zerogrid">
				<div class="row">
					<div class="col-2-5">
						<div class="wrap-col">
							<h2>Find Us</h2>
							<div class="map">
								<figure class="img_inner">
									<iframe
										src="http://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=Brooklyn,+New+York,+NY,+United+States&amp;aq=0&amp;sll=37.0625,-95.677068&amp;sspn=61.282355,146.513672&amp;ie=UTF8&amp;hq=&amp;hnear=Brooklyn,+Kings,+New+York&amp;ll=40.649974,-73.950005&amp;spn=0.01628,0.025663&amp;z=14&amp;iwloc=A&amp;output=embed"></iframe>
								</figure>
								<address>
									<dl>
										<dt>
											<p>
												The Company Name Inc.<br> 8901 Marmora Road,<br>
												Glasgow, D04 89GR.
											</p>
										</dt>
										<dd>
											<span>Freephone:</span>+1 800 559 6580
										</dd>
										<dd>
											<span>Telephone:</span>+1 800 603 6035
										</dd>
										<dd>
											<span>FAX:</span>+1 800 889 9898
										</dd>
									</dl>
								</address>

							</div>
						</div>
					</div>
					<div class="col-1-5">
						<div class="wrap-col">
							<!--empty-->
						</div>
					</div>
					<div class="col-2-5">
						<div class="wrap-col">
							<h2>Contact Us</h2>
							<form id="form">
								<div class="success_wrapper">
									<div class="success">
										Contact form submitted!<br> <strong>We will be
											in touch soon.</strong>
									</div>
								</div>
								<fieldset>
									<label class="name"> <input type="text" value="Name:">
										<br class="clear"> <span class="error error-empty">*This
											is not a valid name.</span><span class="empty error-empty">*This
											field is required.</span>
									</label> <label class="email"> <input type="text"
										value="E-mail:"> <br class="clear"> <span
										class="error error-empty">*This is not a valid email
											address.</span><span class="empty error-empty">*This field is
											required.</span>
									</label> <label class="phone"> <input type="tel" value="Phone:">
										<br class="clear"> <span class="error error-empty">*This
											is not a valid phone number.</span><span class="empty error-empty">*This
											field is required.</span>
									</label> <label class="message"> <textarea>Message:</textarea>
										<br class="clear"> <span class="error">*The
											message is too short.</span> <span class="empty">*This field
											is required.</span>
									</label>
									<div class="clear"></div>
									<div class="btns">
										<a data-type="reset" class="btn">clear</a><a
											data-type="submit" class="btn">send</a>
										<div class="clear"></div>
									</div>
								</fieldset>
							</form>
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
									<li><a href="index-2.html">Menu</a></li>
									<li><a href="index-3.html">Portfolio</a></li>
									<li><a href="index-4.html">News </a></li>
									<li class="current"><a href="index-5.html">Contacts</a></li>
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