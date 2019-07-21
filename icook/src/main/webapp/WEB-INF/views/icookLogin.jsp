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
<style>
	td{
		vertical-align: middle;
	}

</style>    

</head>
<body>
	<div class="main">
		<!--==============================header=================================-->
		<header>
			<div class="zerogrid">
				<div class="col-full">
					<div class="wrap-col">
						<h1>
							<a href="index2"><img src="images/logo.png" height='230px' width='495px' alt="EXTERIOR"></a>
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
									<li><a href="icookProducts">市集</a>
									<ul>
											<li><a href="cartPage">購物車</a></li>
										</ul></li>

									<li class="with_ul current"><a href="icookLogin">會員專區</a>
										<ul>
											<li  ><a href="icookLogin">會員登入</a></li>
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
					<div class="col-1-5">
						<div class="wrap-col">
							<!--empty-->
						</div>
					</div>
					<div class="col-2-5">
						<div class="wrap-col">
							<h2>響食客登入</h2>
							
				<form id="form" action="perform_login" method="POST">
					<div class="success_wrapper">
						<div class="success">Contact form submitted!<br>
							<strong>We will be in touch soon.</strong>
						</div>
					</div>
					<fieldset>				
					<table>
						<tr> 
							<td><p>Email:</p></td>
							<td>
								<label class="email" for="username">
									 <input type="text" id="username" name="username"> 
									<br class="clear"> 
									<span class="error error-empty">*This is not a valid email address.</span>
									<span class="empty error-empty">*This field is required.</span>
								</label>
							</td>					 
						</tr>
						<tr>
							<td><p>password:</p></td>
							<td>
								<label class="password" for="password">
									<input type="password" id="password" name="password">
									<br class="clear"> 
									<span class="error error-empty">*This is not a valid phone number.</span>
									<span class="empty error-empty">*This field is required.</span>
								</label>
							</td>
						</tr> 
					</table>
				
						<div class="clear"></div>
<!-- 						<div class="btns"> -->
<!-- 							<a data-type="reset" class="btn">clear</a> -->
<!-- 							<a data-type="submit" class="btn">send</a> -->
<!-- 							<div class="clear"></div> -->
<!-- 						</div> -->
						<input id=submit type="submit" value="送出">
					</fieldset>
					<div style="height:40px;">
						<div style="float: left ;margin-top: 5px;vertical-align: middle;">記住我 </div>
						<div style="float: left"><input name="remember-me" type="checkbox" style="width: 15px ;margin-top: 0px"/></div>					
					</div>
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