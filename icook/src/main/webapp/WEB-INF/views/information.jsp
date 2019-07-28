<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
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
	window.history.forward(1);

	function reconfirmOrder() {
		if (confirm("確定送出此份訂單 ? ")) {
			// 接收此資料的Servlet會使用 finalDecision 參數的值
			document.forms[0].finalDecision.value = "ORDER";
			document.forms[0].action = "<c:url value='placeOrder' />";
			document.forms[0].method = "POST";
			document.forms[0].submit();
			return;
		} else {
			return;
		}
	}
</script>
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
	line-height: 50px;
}

label {
	font-size: 20px;
	font-family: 'Noto Sans TC', sans-serif;
}

li {
	font-size: 20px;
	font-family: 'Noto Sans TC', sans-serif;
}

#info {
	margin: auto;
	line-height: 200%;
	margin-top: 50px;
}
</style>
</head>
<body>
	<div class="main">
		<!--==============================header=================================-->
		<header>
		<sec:authorize access="isAuthenticated()">
<!-- 		<div class="btn btn-primary" style="float:right;height: 60px;margin-right:50px;padding-left:50px;padding-right:30px;background-color:#228B22;border-radius: 20%"> -->
		<div class="btn btn-success" onclick="javascript:location.href='user'" style="float:right;margin-right:50px;padding-left:35px;width: 400px">
			<img id="member_photo_image"
				 style="float:left;width:100px;height: 100px;border-radius: 50%; border: 1px solid black"
				 src="<c:url value='/getMemberPhoto/${LoginOK.member_id}' />" />
			<div style=" font-size:60px;float: left;margin-left: 30px;">${LoginOK.nickname}</div>
		</div>
	</sec:authorize>
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
									<li><a href="recipe/recipeIndex">查看食譜</a> <!--<ul>--> <!--<li><a href="#">cat1</a></li>-->
										<!--<li><a href="#">cat2</a></li>--> <!--<li><a href="#">cat3</a></li>-->
										<!--</ul>--></li>
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

									<li><a href="user">會員專區 </a>
										<ul>
											<sec:authorize access="!isAuthenticated()">
												<li><a href="icookLogin">會員登入</a></li>
												<li><a href="icookRegister">會員註冊</a></li>
											</sec:authorize>
											<sec:authorize access="isAuthenticated()">
												<li><a href="index2" data-toggle="modal"
													data-target="#logout">會員登出</a></li>
											</sec:authorize>
											<li><a href="checkOrders">查看訂單</a></li>
											<li><a href="icookAddRecipe">新增食譜</a></li>
											<sec:authorize access="hasRole('ADMIN')">
												<li><a href="productTable">後台</a></li>
											</sec:authorize>
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
		<!-- 確認登出 -->

		<!-- 		<div class="modal fade" id="logout" tabindex="-1" role="dialog" -->
		<!-- 			aria-labelledby="myModalLabel" aria-hidden="true"> -->
		<!-- 			<div class="modal-dialog"> -->
		<!-- 				<div class="modal-content"> -->
		<!-- 					<div class="modal-header" style="border-bottom: 1px solid;"> -->
		<!-- 						<h4 class="modal-title" id="myModalLabel" style="float: left">您即將登出享食天堂</h4> -->
		<!-- 						<button type="button" class="close" data-dismiss="modal" -->
		<!-- 							aria-hidden="true">×</button> -->
		<!-- 					</div> -->
		<!-- 					<div class="modal-body" style="width: 100%"> -->
		<!-- 						<form method="post" action="perform_logout"> -->
		<!-- 							<button type="submit">確定登出</button> -->
		<!-- 						</form> -->
		<!-- 					</div> -->
		<!-- 					<div class="modal-footer"> -->
		<!-- 						<button type="button" class="btn btn-primary" data-dismiss="modal">取消</button> -->
		<!-- 					</div> -->
		<!-- 				</div> -->
		<!-- 			</div> -->
		<!-- 		</div> -->

		<div class="progress">
			<div class="progress-bar progress-bar-striped bg-success"
				role="progressbar" style="width: 75%" aria-valuenow="75"
				aria-valuemin="0" aria-valuemax="100"></div>
		</div>



		<div class='shrink'>
			<div class="content">
				<form action="<c:url value='/placeOrder'/>" method="POST">
					<div class="outer">
						<h1>本次訂購的產品</h1>
						<table id="tfhover" class="table table-striped table-hover">
							<tr>
								<th>產品號</th>
								<th>圖片</th>
								<th>數量</th>
								<th>單價</th>
								<th>小計</th>
								<!-- 					<th></th> -->
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
										<td></td>
									</c:when>
									<c:otherwise>
										<script type="text/javascript">
											
										</script>
										<!-- 										<th><button type='button' class="btn btn-danger" -->
										<%-- 												id='${cart.value.productBean.product_id}' --%>
										<!-- 												onclick='deleteAll()'> -->
										<!-- 												<i class="fas fa-trash"></i>刪除所有 -->
										<!-- 											</button></th> -->
									</c:otherwise>
								</c:choose>
								<c:set var="contains" value="no" />

							</tr>
							<c:forEach var='cart' items='${shoppingCart}'>
								<tr>
									<td>${cart.value.productBean.product_id}</td>
									<td><img width='150' height='150'
										src="<c:url value='/getProductPicture/${cart.value.productBean.product_id}' />" /></td>
									<td>${cart.value.quantity}</td>
									<td>${cart.value.productBean.price}</td>
									<td>${cart.value.subtotal}</td>
									<!-- 									<td><button type='button' class="btn btn-danger" -->
									<%-- 											id='${cart.value.productBean.product_id}' --%>
									<!-- 											onclick='deleId(this)'> -->
									<!-- 											<i class="fas fa-trash"></i>刪除 -->
									<!-- 										</button></td> -->
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
								<!-- 								<th></th> -->
								<!-- 								<th></th> -->
							</tr>
						</table>
						<h1>請輸入收件人資訊</h1>

						<!-- 			<select class="custom-select custom-select-lg mb-3"> -->
						<!-- 				<option selected>Open this select menu</option> -->
						<!-- 				<option value="1">One</option> -->
						<!-- 				<option value="2">Two</option> -->
						<!-- 				<option value="3">Three</option> -->
						<!-- 			</select> -->
						<div class="form-group col-md-6"></div>
						<br>

						<div class="form-row">

							<div class="form-group col-md-6">
								<label for="lastName">姓 </label> <input type="text"
									class="form-control" id='lastName' name="lastName" value=''
									placeholder="lastName" required="required">

							</div>
							<div class="form-group col-md-6">
								<label for="FirstName">名</label> <input type="text"
									class="form-control" id='FirstName' name="FirstName" value=''
									placeholder="FirstName" required="required">
							</div>

							<!-- 				email type會自動檢查email格式 -->
							<div class="form-group col-md-6">
								<label for="inputEmail4">Email</label> <input type="email"
									class="form-control" id='inputEmail4' name="inputEmail4"
									value='' placeholder="Email" required="required">
							</div>
							<div class="form-group col-md-6">
								<label for="tel">手機</label> <input type="tel"
									class="form-control" id='tel' name="tel" value=''
									placeholder="tel" required="required">
							</div>
							<div class="form-group col-md-6">
								<label for="tel">發票抬頭</label> <input type="text"
									class="form-control" id='invoiceTitle' name="invoiceTitle"
									value='' placeholder="(optional)">
							</div>
							<div>
								<hr>
							</div>
							<div class="form-group" id='info'>
								<label for="inputAddress">超商資訊</label>
								<!-- 					 <input type="text" -->
								<!-- 						disabled="disabled" class="form-control" name="shippingAddress"/> -->
								<%-- 						value='<c:out value="${address_string}"/>'> --%>
								<ul>
									<%-- 						<li>訂單編號:<c:out value="${s_processID}" /></li> --%>
									<li>取件門市類別:<c:out value="${s_stCate}" /></li>
									<li>取件門市代號:<c:out value="${s_stCode}" /></li>
									<li>取件門市名稱:<c:out value="${s_stName}" /></li>
									<li>取件門市地址:<c:out value="${s_stAddr}" /></li>
									<li>取件門市電話:<c:out value="${s_stTel}" /></li>
								</ul>
								<input type="hidden" name="shippingAddress"
									value="超商:${s_stCate}/超商代碼:${s_stCode}/門市名稱:${s_stName}/門市地址:${s_stAddr}/門市電話:${s_stTel}">
							</div>
						</div>
						<div align="center">
							<input type="hidden" name="finalDecision" value="確定送出">
							<button type="button"
								onclick="{if(confirm('確定離開嗎?\r\n資料將不會記住喔'))location.href='/icook/cartPage'}"
								class="btn btn-success btn-lg btnSeperate2">回購物車</button>

							<c:choose>
								<c:when test="${!empty shoppingCart}">
									<!-- 如果 -->
									<input type="button" name="OrderBtn" value="確定送出"
										class="btn btn-success btn-lg btnSeperate2"
										onclick="reconfirmOrder()">
								</c:when>
								<c:when test="${empty shoppingCart}">
									<button type="button" id='check' disabled
										onclick='backToshop()' class="btn btn-warning btn-lg">您尚未選購</button>
								</c:when>
								<c:otherwise>
									<!-- 否则 -->
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</form>
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