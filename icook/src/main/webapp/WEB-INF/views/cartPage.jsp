<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="zh-Hant-TW">

<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel='stylesheet'
	href='${pageContext.request.contextPath}/css/fontawesome-free/css/all.min.css'
	type="text/css" />

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>購物車</title>
<!-- <link rel="stylesheet" href="styles/st1.css"> -->

<script type="text/javascript">
	function editorId(obj) {
		window.location.href = '/icookProject/product?id=' + obj.id;
	}
	function deleId(obj) {
		// 		var msg = "真的要刪除嗎\n\n請確認！";
		// 		if (confirm(msg) == true) {
		window.location.href = '/icookProject/deleteCart?id=' + obj.id;
		//		}
	}

	function deleteAll() {
		var msg = "確定要刪除所有嗎?";
		if (confirm(msg) == true) {
			window.location.href = '/icookProject/deleteCart?id=';
		}
	}
</script>
<style type="text/css">
th, td {
	text-align: center;
}
</style>
</head>

<body>
	<c:out value="登入者${LoginOK.member_id}"></c:out>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="/icookProject">ICook!</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarTogglerDemo02"
			aria-controls="navbarTogglerDemo02" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarTogglerDemo02">
			<ul class="navbar-nav mr-auto mt-2 mt-lg-0">
				<li class="nav-item"><a class="nav-link"
					href='/icookProject/products'>市集</a></li>
				<li class="nav-item"><a class="nav-link" href="#">食譜</a></li>
				<li class="nav-item"><a class="nav-link" href="#">修改商品</a></li>
				<li class="nav-item"><a class="nav-link" href="#">新增商品</a></li>
				<li class="nav-item"><a class="nav-link" href="#">更新產品資料</a></li>
				<li class="nav-item"><a class="nav-link" href="">查詢收藏</a></li>

			</ul>
			<form class="form-inline my-2 my-lg-0">
				<input class="form-control mr-sm-2" type="search"
					placeholder="Search">
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
			</form>
		</div>
	</nav>
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
						id='${cart.value.productBean.product_id}' onclick='editorId(this)'>
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
					onclick="window.location.href='/icookProject/toEZship'"
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