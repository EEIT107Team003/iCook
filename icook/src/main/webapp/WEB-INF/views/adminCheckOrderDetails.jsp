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

td , th{
	text-align: center;
}
</style>


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
		<c:out value="管理者ID:${LoginOK.member_id}"></c:out>
	</h1>
	<br>
<%-- 	<h5>系統訂單編號:<c:out value="${systemOrderNo}"/></h5> --%>
	<div class="outer">
		<table class="table table-hover">
			<thead>
				<tr>
					<th scope="col">訂購者ID</th>
					<th scope="col">系統單號</th>
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
					<td>${orderItem.memberBean.member_id}</td>
					<td>${orderItem.orderBean.orderNo}</td>
						<td><img width='50' height='50'
				src="<c:url value='/getPicture/${orderItem.productBean.product_id}'/>"/></td>
						<td>${orderItem.productBean.product_id}</td>
						<td>${orderItem.productBean.categoriesbean.name}</td>
						<td>${orderItem.productBean.description}</td>
						<td>${orderItem.productBean.unit_size}</td>
						<td>${orderItem.productBean.color}</td>
						<td>${orderItem.productBean.price}</td>
						<td>${orderItem.quantity}</td>
						<td>${orderItem.subtotal}</td>
					</tr>
					
					<c:set  var='OrderNoSum' value="${OrderNoSum+orderItem.orderBean.orderNo}"/>
					<c:set  var='counter' value="${counter+1}"  />
					<c:set   var='sum' value="${sum+orderItem.subtotal}" />
				</c:forEach>
				<c:set value="${OrderNoSum/counter}" var='systemOrderNo' />
				<tr>
					<td><input type="button"  class="btn btn-outline-info" name="back" value="返回"onClick="javascript:history.back();"></td>
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