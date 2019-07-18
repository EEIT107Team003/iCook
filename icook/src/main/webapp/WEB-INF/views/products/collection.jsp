<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<title>Product</title>
<link rel='stylesheet' href='${pageContext.request.contextPath}/css/styles.css'  type="text/css" />
</head>
<body>
	<section>
		<div>
			<div class="container" style="text-align: center">
				<h2>產品資料</h2>
			</div>
		</div>
	</section>
	<section class="container">
		<div class="row">
			<img width='100' height='150'
			     src="<c:url value='/getPicture/${product.product_id}'/>" />
			<div class="col-md-5">
			    <h3>成功刪除${delete}資料</h3>
				<p>
					<a href="<spring:url value='/products' />" class="btn btn-default">
						<span class="glyphicon-hand-left glyphicon"></span>返回
					</a> 
					<a href='#' class='btn btn-warning btn-large'> 
					    <span class='glyphicon-shopping-cart glyphicon'></span>加入購物車
					</a>
				</p>
			</div>
		</div>
	</section>
</body>
</html>
