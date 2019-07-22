<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="jquery-3.4.1.min.js"></script>
<link
	href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel='stylesheet'
	href='${pageContext.request.contextPath}/css/fontawesome-free/css/all.min.css'
	type="text/css" />
	
	
	<link rel="stylesheet" href="animate.min.css">
<style type="text/css">
.outer {
	margin: 50px 5% 20% 10%;
}

td, th {
	text-align: center;
}

/* .urgentFlash{ */
/*   background-color: #004A7F; */
/*   -webkit-border-radius: 10px; */
/*   border-radius: 10px; */
/*   border: none; */
/*   color: #FFFFFF; */
/*   cursor: pointer; */
/*   display: inline-block; */
/*   font-family: Arial; */
/*   font-size: 20px; */
/*   padding: 5px 10px; */
/*   text-align: center; */
/*   text-decoration: none; */
/*   -webkit-animation: glowing 1500ms infinite; */
/*   -moz-animation: glowing 1500ms infinite; */
/*   -o-animation: glowing 1500ms infinite; */
/*   animation: glowing 1500ms infinite; */
/* } */
/* @-webkit-keyframes glowing { */
/*   0% { background-color: #B20000; -webkit-box-shadow: 0 0 3px #B20000; } */
/*   50% { background-color: #FF0000; -webkit-box-shadow: 0 0 40px #FF0000; } */
/*   100% { background-color: #B20000; -webkit-box-shadow: 0 0 3px #B20000; } */
/* } */

/* @-moz-keyframes glowing { */
/*   0% { background-color: #B20000; -moz-box-shadow: 0 0 3px #B20000; } */
/*   50% { background-color: #FF0000; -moz-box-shadow: 0 0 40px #FF0000; } */
/*   100% { background-color: #B20000; -moz-box-shadow: 0 0 3px #B20000; } */
/* } */

/* @-o-keyframes glowing { */
/*   0% { background-color: #B20000; box-shadow: 0 0 3px #B20000; } */
/*   50% { background-color: #FF0000; box-shadow: 0 0 40px #FF0000; } */
/*   100% { background-color: #B20000; box-shadow: 0 0 3px #B20000; } */
/* } */

/* @keyframes glowing { */
/*   0% { background-color: #B20000; box-shadow: 0 0 3px #B20000; } */
/*   50% { background-color: #FF0000; box-shadow: 0 0 40px #FF0000; } */
/*   100% { background-color: #B20000; box-shadow: 0 0 3px #B20000; } */
/* } */
.urgent {
	background-color: red;
}
</style>
<script type="text/javascript">
	function setOK(obj) {
		var msg = "確定收到款項了嗎";
		if (confirm(msg) == true) {
			window.location.href = '/icook/setPaymentOK?id=' + obj.id;
			return true;
		}
	}
</script>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="/icook">ICook!</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarTogglerDemo02"
			aria-controls="navbarTogglerDemo02" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarTogglerDemo02">
			<ul class="navbar-nav mr-auto mt-2 mt-lg-0">
				<li class="nav-item"><a class="nav-link" href='products'>市集</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="#">食譜</a></li>
				<li class="nav-item"><a class="nav-link" href="#">修改商品</a></li>
				<li class="nav-item"><a class="nav-link" href='products/add'>(新增商品)</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="products/upd">(更新產品)</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="collections">查詢收藏</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="cartPage">購物車</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="checkOrders">檢視訂單</a>
				</li>

				<li class="nav-item"><a class="nav-link" href="information">(測試田個資)</a>
				</li>

			</ul>
			<form class="form-inline my-2 my-lg-0">
				<input class="form-control mr-sm-2" type="search" placeholder="查詢商品">
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
			</form>
		</div>
	</nav>
	<h1>
		<c:out value="系統訂單:超過時間標註紅色" />
	</h1>
	<div class="outer">
		<table class="table table-hover">
			<thead>
				<tr>
					<th scope="col" style='background-color: #b7d985'>系統訂單號</th>
					<th scope="col" style='background-color: #26ea20'>訂單詳情</th>
					<th scope="col" style='background-color: #ebcfc7;'>訂購日期</th>
					<th scope="col" style='background-color: hsla(14, 100%, 53%, 0.6);'>預計出貨時間</th>
					<th scope="col" style='background-color: rgba(50, 115, 220, 0.3);'>訂購會員</th>
					<th scope="col" style='background-color: #ffbfa7'>應收金額</th>
					<!-- 					<th scope="col" style='background-color: #ffbfa7'>付款方式</th> -->
					<th scope="col" style='background-color: #cd85f5'>發貨地址</th>
					<th scope="col" style='background-color: #25f4e3'>發票</th>
					<th scope="col" style='background-color: #feeb03;'>款項查核</th>
					<th scope="col" style='background-color: #feeb03;'>匯出</th>
				</tr>
			</thead>
			<tbody>




				<c:forEach var='OrderBean' items='${orders_list}'>
					<tr>
					<td>${OrderBean.orderNo}</td>
						
						<%-- 						<td id='odno'>${OrderBean.orderNo}</td> --%>
						<td>
							<form method='POST'
								action="<c:url value='/adminCheckOrderDetails?id=${OrderBean.memberbean.member_id}'/>">
								<input type="hidden" name="adminCheck" value="admin" /> <input
									type="hidden" name="OrderNo" value="${OrderBean.orderNo}" /> <input
									class="btn btn-outline-success" type="submit" value="檢視該訂單" />
							</form>
						</td>
						<td>${OrderBean.orderDate}</td>
						<c:set var="contains" value="no" />
						<c:forEach var="urgentOrderNo" items="${urgentOrders_No}">
							<c:if test="${urgentOrderNo eq OrderBean.orderNo}">
								<c:set var="contains" value="yes" />
							</c:if>
						</c:forEach>
						<c:choose>
							<c:when test="${contains=='yes'}">
							<td id='odno' class='urgent'>${OrderBean.shippingDate}</td>
								<script type="text/javascript">
								</script>
							</c:when>
							<c:otherwise>
								<td>${OrderBean.shippingDate}</td>
								<script type="text/javascript">
									
								</script>
							</c:otherwise>
						</c:choose>
						
						
						<td>${OrderBean.memberbean.username}</td>
						<td>${OrderBean.totalAmount}</td>
						<td>${OrderBean.shippingAddress}</td>
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
								<td>查核完畢</td>
							</c:when>
							<c:otherwise>
								<script type="text/javascript">
									
								</script>
								<td><input type="button" class="btn btn-success"
									id="${OrderBean.orderNo}" onclick='setOK(this)' value="收到款項"></td>
							</c:otherwise>
						</c:choose>
						<c:set var="contains" value="no" />
						<%-- 						<td><input type="button" id="${OrderBean.orderNo}" onclick='setOK(this)' value="OK"></td> --%>
						<td><a href='orders.xls'>匯出xls</a></td>
					</tr>
					
				</c:forEach>
			</tbody>
		</table>
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



<script
	src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>
</html>