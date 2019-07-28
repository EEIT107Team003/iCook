<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>會員訂單頁</title>
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
	margin-left: 15%;
	margin-right: 15%;
	margin-top: 5%;
}

td, th {
	text-align: center;
	font-size: 20px;
	font-family: 'Noto Sans TC', sans-serif;
}

#member {
	font-size: 40px;
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

		<div class="content">


			<div class='shrink'>
				<h1></h1>
				<div class="outer">
					<table class="table table-hover">

						<thead>
							<tr>
								<th colspan="8"><p id='member'>
										<c:out value="會員ID:${LoginOK.nickname}的訂單" />
									</p></th>
							</tr>
							<tr>
								<td><div style="visibility: hidden">區塊中的內容</div></td>
							</tr>
							<tr>
								<th scope="col">序號</th>
								<th scope="col">訂單詳情</th>
								<th scope="col">取貨單號</th>
								<th scope="col">訂購日期</th>
								<th scope="col">預計出貨時間</th>
								<th scope="col">應付金額</th>
								<!-- 								<th scope="col">取貨地址</th> -->
								<th scope="col">發票</th>
								<th scope="col">付款驗證</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var='OrderBean' items='${orders_list}'>
								<c:set value="${sum+1}" var='sum' />
								<tr>
									<td><c:out value="${sum}" /></td>
									<td><form method='POST'
											action="<c:url value='/orderdetails?id=${OrderBean.memberbean.member_id}&orderNo=${OrderBean.orderNo}'/>">
											<input type="hidden" name="memberCheck"
												value="${OrderBean.memberbean.member_id}" /> <input
												type="hidden" name="SeqOrderNoForMember" value="${sum}" />
											<input class="btn btn-outline-success" type="submit"
												value="檢視該訂單" />
										</form></td>
									<td>${OrderBean.orderNo}</td>
									<td>${OrderBean.orderDate}</td>
									<td>${OrderBean.shippingDate}</td>
									<td>${OrderBean.totalAmount}</td>
									<%-- 									<td>${OrderBean.shippingAddress}</td> --%>
									<td>${OrderBean.invoiceTitle}</td>

									<c:set var="contains" value="no" />
									<c:if test="${OrderBean.payment eq 'OK'}">
										<c:set var="contains" value="yes" />
										<script type="text/javascript">
											
										</script>
									</c:if>
									<c:choose>
										<c:when test="${contains=='yes'}">
											<script type="text/javascript">
												
											</script>
											<i class="fas fa-check"></i>
											<td><p style='background-color: #00CD00'>已查核</p></td>
										</c:when>
										<c:otherwise>
											<script type="text/javascript">
												
											</script>
											<td><p style='background-color: #fcba03'>查核中</p></td>
										</c:otherwise>
									</c:choose>
									<c:set var="contains" value="no" />

									<td></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
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