<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>article</title>
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

<!-- 秉諺 -->
<link
	href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,900"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Playfair+Display:400,400i,700,700i,900,900i"
	rel="stylesheet">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/article/acss/open-iconic-bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/article/acss/animate.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/article/acss/owl.carousel.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/article/acss/owl.theme.default.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/article/acss/magnific-popup.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/article/acss/aos.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/article/acss/ionicons.min.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/article/acss/flaticon.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/article/acss/icomoon.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/article/acss/style.css">
<!-- 秉諺 -->





<!-- 套版 -->
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
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+TC&display=swap" rel="stylesheet">
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
	function to_detail(obj) {

		window.location.href = '/icookProject/orderdetails?id=' + obj.id;
	}
</script>
<style>
.shrink{
	margin-left: 10%;
	margin-right: 10%;
	margin-top: 5%;
}
td, th{
	text-align:center;
	font-size: 20px;
	font-family: 'Noto Sans TC', sans-serif;
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
			<h1>
				<c:out value="會員ID:${LoginOK.member_id}的第${FrontSeqOrderNo}筆消費"></c:out>
				<hr />
			</h1>

			<div class='shrink'>
				<div class="outer">
					<table class="table table-hover">
						<thead>
							<tr>
								<td scope="col" colspan="9">送貨地址/分店資訊:<c:out value="${orderAddress}"/></td>
							</tr>
							<tr>
								<td scope="col"></td>
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
									<td><img width='50' height='50'
										src="<c:url value='/getProductPicture/${orderItem.productBean.product_id}'/>" /></td>
									<td>${orderItem.productBean.product_id}</td>
									<td>${orderItem.productBean.categoriesbean.name}</td>
									<td>${orderItem.productBean.description}</td>
									<td>${orderItem.productBean.unit_size}</td>
									<td>${orderItem.productBean.color}</td>
									<td>${orderItem.productBean.price}</td>
									<td>${orderItem.quantity}</td>
									<td>${orderItem.subtotal}</td>
								</tr>
								<c:set var='sum' value="${sum+ orderItem.subtotal}" />
							</c:forEach>

							<tr>
								<td><input type="button" class="btn btn-outline-success"
									name="back" value="返回" onClick="javascript:history.back();"></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td><h5>
										合計:
										<c:out value="${sum}" />
									</h5></td>
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
<!-- 						&copy; Copyright &copy; 2013.Company name All rights reserved.<a -->
<!-- 							target="_blank" href="http://sc.chinaz.com/moban/">&#x7F51;&#x9875;&#x6A21;&#x677F;</a> -->
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