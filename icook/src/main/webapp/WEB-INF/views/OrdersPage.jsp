<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel='stylesheet'
	href='${pageContext.request.contextPath}/css/fontawesome-free/css/all.min.css'
	type="text/css" />
<style type="text/css">
.outer {
	margin: 50px 5% 20% 10%;
}

td, th {
	text-align: center;
}
</style>
<script type="text/javascript">
	function to_detail(obj) {

		window.location.href = '/icookProject/orderdetails?id=' + obj.id;
	}
	function reconfirm(obj) {

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

		<c:out value="會員ID:${LoginOK.nickname}的訂單"></c:out>
	</h1>
	<div class="outer">
		<table class="table table-hover">
			<thead>
				<tr>
				
					
					<th scope="col">序號</th>
					<th scope="col">訂單詳情</th>
					<th scope="col">取貨單號</th>
					<th scope="col">訂購日期</th>
					<th scope="col">預計出貨時間</th>
					<th scope="col">應付金額</th>
					<th scope="col">取貨地址</th>
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
									type="hidden" name="SeqOrderNoForMember" value="${sum}" /> <input
									class="btn btn-outline-info" type="submit" value="檢視該訂單" />
							</form></td>
						<td>${OrderBean.orderNo}</td>
						<td>${OrderBean.orderDate}</td>
						<td>${OrderBean.shippingDate}</td>
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
								<td class="btn btn-success">已查核</td>
							</c:when>
							<c:otherwise>
								<script type="text/javascript">
									
								</script>
								<td class="btn btn-warning">查核中</td>
							</c:otherwise>
						</c:choose>
						<c:set var="contains" value="no" />

						<td></td>
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
<
</html>