<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>購物車</title>
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
<!-- fontawesome-free -->
<script type="text/javascript"
	src='${pageContext.request.contextPath}/css/fontawesome-free/js/all.min.js'></script>
<!-- fontawesome-free -->
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
<!-- google font -->
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+TC&display=swap"
	rel="stylesheet">
<!-- google font -->
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
<script type="text/javascript">
	function editorId(obj) {
		window.location.href = '/icook/product?id=' + obj.id;
	}
	function deleId(obj) {
		// 		var msg = "真的要刪除嗎\n\n請確認！";
		// 		if (confirm(msg) == true) {
		window.location.href = '/icook/deleteCart?id=' + obj.id;
		//		}
	}

	function deleteAll() {
		var msg = "確定要刪除所有嗎?";
		if (confirm(msg) == true) {
			window.location.href = '/icook/deleteCart?id=';
		}
	}
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

<style>
.shrink {
	margin-left: 20%;
	margin-right: 20%;
	margin-top: 5%;
}

td, th {
	text-align: center;
	font-size: 20px;
	font-family: 'Noto Sans TC', sans-serif;
	 line-height:50px;
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
							<a href="index2"><img src="images/logo.png" height='200px'
								width='80%' alt="EXTERIOR"></a>
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
											<li class="with_ul current"><a href="cartPage">購物車</a></li>
										</ul></li>

									<li><a href="icookLogin">會員專區</a>
										<ul>
											<li><a href="icookLogin">會員登入</a></li>
											<li><a href="checkOrders">查看訂單</a></li>
											<li><a href="#">會員登出</a></li>
											<li><a href="#">新增食譜</a></li>
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
		<!--=======content================================-->
		<div class="progress">
			<div class="progress-bar progress-bar-striped bg-success"
				role="progressbar" style="width: 25%" aria-valuenow="25"
				aria-valuemin="0" aria-valuemax="100"></div>
		</div>



		<div class='shrink'>
			<div class="content">
				<table id="tfhover" class="table table-striped table-hover">
					<tr>
						<th>產品號</th>
						<th>圖片</th>
						<th>數量</th>
						<th>單價</th>
						<th>小計</th>
						<th></th>
						<c:set var="contains" value="no" />
						<c:if test="${empty shoppingCart}">
							<c:set var="contains" value="yes" />
							<script type="text/javascript">
								
							</script>
						</c:if>

						<c:choose>
							<c:when test="${contains=='yes'}">
								<script type="text/javascript">
									
								</script>
								<td><button type="button" class="btn btn-outline-light"></button></td>
							</c:when>
							<c:otherwise>
								<script type="text/javascript">
									
								</script>
								<th><button type='button' class="btn btn-danger"
										id='${cart.value.productBean.product_id}'
										onclick='deleteAll()'>
										<i class="fas fa-trash"></i>刪除所有
									</button></th>
							</c:otherwise>
						</c:choose>
						<c:set var="contains" value="no" />
					</tr>
					<c:forEach var='cart' items='${shoppingCart}'>
						<tr>
							<td>${cart.value.productBean.product_id}</td>
							<td><img width='100' height='100'
								src="<c:url value='/getProductPicture/${cart.value.productBean.product_id}'/>" /></td>
							<td>${cart.value.quantity}</td>
							<td>${cart.value.productBean.price}</td>
							<td>${cart.value.subtotal}</td>
							<td><button type='button' class="btn btn-primary"
									id='${cart.value.productBean.product_id}'
									onclick='editorId(this)'>
									<i class="fas fa-edit"></i>修改
								</button></td>
							<td><button type='button' class="btn btn-danger"
									id='${cart.value.productBean.product_id}'
									onclick='deleId(this)'>
									<i class="fas fa-trash"></i>刪除
								</button></td>
						</tr>
						<c:set value="${sum + cart.value.subtotal}" var='sum' />
					</c:forEach>
					<%-- 				<form method='POST' action="<c:url value='/product/addToCart'/>"> --%>
					<%-- 					<input type="hidden" name="productId" value="${product.product_id}" /> --%>
					<%-- 					<input type="hidden" name="price" value="${product.price}" /> --%>
					<!-- 					<input type="hidden" name="quan" id='quan' value="" /> -->
					<!-- 				</form> -->
					<tr>
						<th></th>
						<th></th>
						<th></th>
						<th></th>
						<th><h5>
								合計:
								<c:out value="${sum}" />
							</h5></th>
						<th></th>
						<th></th>
					</tr>
				</table>
				<div align="center">
					<c:choose>
						<c:when test="${!empty shoppingCart}">
							<!-- 如果 -->
							<button type="button" id='check'
								onclick="window.location.href='/icook/toEZship'"
								class="btn btn-outline-success btn-lg">結帳囉!</button>
						</c:when>
						<c:when test="${empty shoppingCart}">
							<button type="button" id='check' disabled
								onclick='checkCartNull()' class="btn btn-success btn-lg">您尚未選購</button>
						</c:when>
						<c:otherwise>
							<!-- 否则 -->
						</c:otherwise>
					</c:choose>
				</div>

				<!-- 			<div align="center"> -->
				<!-- 												<a href="images/big2.jpg" data-gal="prettyPhoto[1]"> -->
				<!-- 				<span><img src="images/thankyou2.gif" height='200px' -->
				<!-- 					width='50%' alt=""></span> -->

				<!-- 			</div> -->
				<!-- 			<div align="center"> -->
				<!-- 				<h1>訂單完成! 已發送訂單確認信 訂單編號: -->
				<%-- 					<c:out value="${orderNo}"/></h1> --%>
				<!-- 								<h3>謝謝老版  Thank you, 已發送訂單確認信</h3> -->
				<!-- 				<br> -->
				<!-- 				<h1> -->
				<!-- 					請記得您剛才的訂單編號: -->
				<%-- 					<c:out value="${orderNo}"/> --%>
				<!-- 					號 並在付款時備註讓我們知道喔! -->
				<!-- 				</h1> -->
				<!-- 				<br> -->
				<!-- 			</div> -->
				<!-- 			<div align="center"> -->
				<!-- 												<a href="images/big2.jpg" data-gal="prettyPhoto[1]"> -->
				<!-- 				<button type="button" class="btn btn-success btn-lg" -->
				<!-- 					onclick="javascript:location.href='/icook/checkOrders'">查看我的訂單</button> -->
				<!-- 			</div> -->
				<!-- 			<div class="zerogrid"> -->
				<!-- 				<div class="col-full"> -->
				<!-- 					<h2></h2> -->
				<!-- 				</div> -->
				<!-- 				<div class="clear"></div> -->

				<!-- 				<div class="row"> -->
				<!-- 					<div> -->

				<!-- 						<div class="col-1-2"></div> -->
				<!-- 						<br> -->

				<!-- 												<div class="col-1-2"> -->
				<!-- 													<div class="wrap-col"> -->
				<!-- 														<a href="images/big4.jpg" data-gal="prettyPhoto[1]"><span><img -->
				<!-- 																src="images/page4_img3.jpg" alt=""></span></a> -->
				<!-- 													</div> -->
				<!-- 												</div> -->
				<!-- 												<div class="col-1-2"> -->
				<!-- 													<div class="wrap-col"> -->
				<!-- 														<a href="images/big1.jpg" data-gal="prettyPhoto[1]"><span><img -->
				<!-- 																src="images/page4_img4.jpg" alt=""></span></a> -->
				<!-- 													</div> -->
				<!-- 												</div> -->
				<!-- 					</div> -->
				<!-- 				</div> -->

				<!-- 				<div class="row"> -->
				<!-- 					<div class="bottom_block"> -->
				<!-- 						<div class="col-1-2"> -->
				<!-- 							<div class="wrap-col"> -->
				<!-- 								<a href="" -->
				<!-- 									onclick="window.open(' /icook/toAIOcheck', 'Paypal', config='height=500,width=500');"> -->
				<!-- 																	data-gal="prettyPhoto[1]" <span> <img -->
				<!-- 										src="images/printBarcode.jpg" alt=""></span> -->
				<!-- 								</a> -->
				<!-- 							</div> -->
				<!-- 						</div> -->
				<!-- 						<div class="col-1-2"> -->
				<!-- 							<div class="wrap-col"> -->
				<!-- 								<a href="" -->
				<!-- 									onclick="window.open(' /icook/payment', 'Paypal', config='height=500,width=500');"> -->
				<!-- 																	data-gal="prettyPhoto[1]" <span> <img -->
				<!-- 										src="images/paypal.png" alt=""></span> -->
				<!-- 								</a> -->
				<!-- 							</div> -->
				<!-- 						</div> -->
				<!-- 												<div class="col-1-2"> -->
				<!-- 													<h3>Follow Us</h3> -->
				<!-- 													<div class="socials"> -->
				<!-- 														<a href="#"></a> <a href="#"></a> <a href="#"></a> -->
				<!-- 													</div> -->
				<!-- 													<nav> -->
				<!-- 														<ul> -->
				<!-- 															<li><a href="index.html">Home</a></li> -->
				<!-- 															<li><a href="index-1.html">About Us</a></li> -->
				<!-- 															<li><a href="index-2.html">Menu</a></li> -->
				<!-- 															<li class="current"><a href="index-3.html">Portfolio</a></li> -->
				<!-- 															<li><a href="index-4.html">News </a></li> -->
				<!-- 															<li><a href="index-5.html">Contacts</a></li> -->
				<!-- 														</ul> -->
				<!-- 													</nav> -->
				<!-- 												</div> -->
				<!-- 												<div class="col-1-2"> -->
				<!-- 													<h3>Email Updates</h3> -->
				<!-- 													<p class="col1"> -->
				<!-- 														Join our digital mailing list and get news<br> deals and be -->
				<!-- 														first to know about events -->
				<!-- 													</p> -->
				<!-- 													<form id="newsletter"> -->
				<!-- 														<div class="success">Your subscribe request has been sent!</div> -->
				<!-- 														<label class="email"> <input type="email" -->
				<!-- 															value="Enter e-mail address"> <a href="#" class="btn" -->
				<!-- 															data-type="submit">subscribe</a> <span class="error">*This -->
				<!-- 																is not a valid email address.</span> -->
				<!-- 														</label> -->
				<!-- 													</form> -->
				<!-- 												</div> -->
				<!-- 					</div> -->
				<!-- 				</div> -->
				<!-- 			</div> -->
				<!-- 		</div> -->
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
	</div>
</body>

</html>