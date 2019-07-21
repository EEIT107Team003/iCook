<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>About Us</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">





<link rel="icon" href="images/favicon.ico">
<link rel="shortcut icon" href="images/favicon.ico" />
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/zerogrid.css" type="text/css"
	media="screen">
<link rel="stylesheet" href="css/responsive.css" type="text/css"
	media="screen">
	
	
	
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel='stylesheet'
	href='${pageContext.request.contextPath}/css/fontawesome-free/css/all.min.css'
	type="text/css" />

<script src="js/jquery.js"></script>
<script src="js/jquery-migrate-1.1.1.js"></script>
<script src="js/superfish.js"></script>
<script src="js/jquery.easing.1.3.js"></script>
<script src="js/sForm.js"></script>
<script src="js/jquery.carouFredSel-6.1.0-packed.js"></script>
<script src="js/css3-mediaqueries.js"></script>
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
<style type="text/css">
th, td {
	text-align: center;
}
</style>
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
									<li class="with_ul current"><a href="icookAboutUS">關於我們</a>
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

									<li><a href="icookLogin">會員專區</a>
										<ul>
											<li><a href="icookLogin">會員登入</a></li>
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


		<c:out value="登入者${LoginOK.nickname}"></c:out>
		<div class="progress">
			<div class="progress-bar progress-bar-striped bg-info"
				role="progressbar" style="width: 25%" aria-valuenow="25"
				aria-valuemin="0" aria-valuemax="100"></div>
		</div>
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
								id='${cart.value.productBean.product_id}' onclick='deleteAll()'>
								<i class="fas fa-trash"></i>刪除所有
							</button></th>
					</c:otherwise>
				</c:choose>
				<c:set var="contains" value="no" />

			</tr>
			<c:forEach var='cart' items='${shoppingCart}'>
				<tr>
					<td>${cart.value.productBean.product_id}</td>
					<td><img width='30' height='30'
						src="<c:url value='/getPicture/${cart.value.productBean.product_id}' />" /></td>
					<td>${cart.value.quantity}</td>
					<td>${cart.value.productBean.price}</td>
					<td>${cart.value.subtotal}</td>
					<td><button type='button' class="btn btn-primary"
							id='${cart.value.productBean.product_id}'
							onclick='editorId(this)'>
							<i class="fas fa-edit"></i>確認修改(改下拉)
						</button></td>
					<td><button type='button' class="btn btn-danger"
							id='${cart.value.productBean.product_id}' onclick='deleId(this)'>
							<i class="fas fa-trash"></i>刪除
						</button></td>
				</tr>
				<c:set value="${sum + cart.value.subtotal}" var='sum' />
			</c:forEach>
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
					<button type="button" id='check' disabled onclick='checkCartNull()'
						class="btn btn-outline-success btn-lg">您尚未選購</button>
				</c:when>
				<c:otherwise>
					<!-- 否则 -->
				</c:otherwise>
			</c:choose>
		</div>
		<!--==============================footer=================================-->

		<footer>
			<div class="zerogrid">
				<div class="col-full">
					<div class="wrap-col">
					</div>
				</div>
			</div>
		</footer>
		<div style="display: none">
			<script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540'
				language='JavaScript' charset='gb2312'></script>
		</div>
</body>
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
<script type="text/javascript"
	src='${pageContext.request.contextPath}/css/fontawesome-free/js/all.min.js'></script>
</html>