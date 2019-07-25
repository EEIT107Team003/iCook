<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>會員訂單細項</title>
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
<script type="text/javascript">
	function to_detail(obj) {

		window.location.href = '/icookProject/orderdetails?id=' + obj.id;
	}
</script>
<style>
.shrink {
	margin-left: 20%;
	margin-right: 20%;
	margin-top: 5%;
}

.info {
	text-align: center;
	font-size: 20px;
	font-family: 'Noto Sans TC', sans-serif;
	color: red;
}

td, th {
	text-align: center;
	font-size: 20px;
	font-family: 'Noto Sans TC', sans-serif;
}

td {
	line-height: 100px;
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
							<a style="height: 200px"
								href="${pageContext.request.contextPath}/index2"><img
								src="${pageContext.request.contextPath}/images/logo.png"
								style="width: 200px; right: 200px; border-radius: 50%;"
								alt="EXTERIOR"></a>
						</h1>

						<div class="menu_block">
							<nav>
								<ul class="sf-menu" style="padding-top: 55px">
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

		<div class="content">
			<h1>

				<hr />
			</h1>

			<div class='shrink'>
				<div class="outer">
					<table class="table table-hover">
						<thead>
							<tr>
								<td scope="col" colspan="9"><p class='info'>
										送貨地址/分店資訊:
										<c:out value="${orderAddress}" />
									</p></td>
							</tr>
							<tr>
								<th scope="col"><p>
										<c:out
											value="會員ID:${LoginOK.member_id}的第${FrontSeqOrderNo}筆消費" />
									</p></th>
							</tr>
							<tr>
								<th scope="col">圖示</th>
								<th scope="col">產品號</th>
								<th scope="col">種類</th>
								<th scope="col">描述</th>
								<th scope="col">尺寸</th>
								<th scope="col">顏色</th>
								<th scope="col">單價</th>
								<th scope="col">數量</th>
								<th scope="col">小計</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var='orderItem' items='${orderItems_List}'>
								<tr>
									<td><img width='200' height='200'
										src="<c:url value='/getProductPicture/${orderItem.productBean.product_id}'/>" /></td>
									<td>${orderItem.productBean.product_id}</td>
									<td>${orderItem.productBean.categoriesbean.name}</td>
									<td>${orderItem.productBean.description}</td>
									<td>${orderItem.productBean.unit_size}</td>
									<td>${orderItem.productBean.color}</td>
									<td>${orderItem.productBean.price}</td>
									<td>${orderItem.quantity}</td>
									<td>${orderItem.subtotal}</td>
									<c:set var='sum' value="${sum+ orderItem.subtotal}" />
								</tr>

							</c:forEach>

							<tr>
								<td><input type="button"
									class="btn btn-outline-success btn-lg" name="back" value="返回"
									onClick="javascript:history.back();"></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td>合計: <c:out value="${sum}" /></td>
							</tr>
						</tbody>
					</table>
					<h1></h1>
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
	</div>
</body>

</html>