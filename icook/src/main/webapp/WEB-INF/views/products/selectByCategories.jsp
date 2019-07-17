<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<title>Products</title>
<link rel='stylesheet'
	href='${pageContext.request.contextPath}/css/styles.css'
	type="text/css" />
	<style>

.left{
 width:15%;
    float:left;
}
.right{
  width: 85%;
  float: right;
}

</style>
</head>
<body>
	<div>
		<section>
			<div>
				<div class="container" style="text-align: center">
					<h1>產品清單</h1>
				</div>
			</div>
		</section>
		<hr
			style="height: 1px; border: none; color: #333; background-color: #333;">
		
			<section class="container">
		       <div class="row">
        <div class="left">
        <a href='collections'>查詢收藏</a><BR><br>
        <ul>鍋類
           <li><a href='${pageContext.request.contextPath}/SelectByCategories/炒鍋'>炒鍋</a></li>
           <li><a href='${pageContext.request.contextPath}/SelectByCategories/平底鍋'>平底鍋</a></li>
           <li><a href='${pageContext.request.contextPath}/SelectByCategories/湯鍋'>湯鍋</a></li>
        </ul>
        <br>
         <ul>刀具
           <li><a href='${pageContext.request.contextPath}/SelectByCategories/中式剁刀'>中式剁刀</a></li>
           <li><a href='${pageContext.request.contextPath}/SelectByCategories/牛排刀'>牛排刀</a></li>
        </ul>
        <br>
        <ul>食材
           <li><a href='${pageContext.request.contextPath}/SelectByCategories/牛肉'>牛肉</a></li>
           <li><a href='${pageContext.request.contextPath}/SelectByCategories/雞肉'>雞肉</a></li>
           <li><a href='${pageContext.request.contextPath}/SelectByCategories/豬肉'>豬肉</a></li>
           <li><a href='${pageContext.request.contextPath}/SelectByCategories/羊肉'>羊肉</a></li>
        </ul>
        
        <a href='${pageContext.request.contextPath}'>回首頁</a><BR><br>
        </div>

           <div class="right">
				<c:forEach var='product' items='${SelectByCategories}'>
					<div class="col-sm-6 col-md-3" style="width: 360px; height: 360px">
						<div class="thumbnail" style="width: 320px; height: 340px">
							<img width='100' height='200'
								src="<c:url value='/getPicture/${product.product_id}' />" />
							<div class="caption">
								<p>
									<b style='font-size: 16px;'>${product.description}</b>
								</p>
								<p>${product.unit_size}</p>
								<p>${product.color}，${product.categoriesbean.name}</p>
								<p>${product.price}</p>
								<p>目前在庫數量: ${product.stock}</p>
								<p>
									<a
										href="<spring:url value='/product?id=${product.product_id}' />"
										class="btn btn-primary"> <span
										class="glyphicon-info-sigh glyphicon"></span>詳細資料
									</a> <a
										href="<spring:url value='/product/addToCollection?id=${product.product_id}' />"
										class="btn btn-primary"> <span
										class="glyphicon-info-sigh glyphicon"></span>新增收藏
									</a> <a
										href="<spring:url value='/products/upd?id=${product.product_id}' />"
										class="btn btn-primary"> <span
										class="glyphicon-info-sigh glyphicon"></span>更新
									</a>
								</p>
							</div>
						</div>
					</div>
				</c:forEach>
				</div>
	           </div>
			</section>
		</div>
</body>
</html>
