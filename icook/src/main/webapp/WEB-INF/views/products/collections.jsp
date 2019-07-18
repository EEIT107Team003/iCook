<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
    href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<title>Products</title>
<link rel='stylesheet' href='${pageContext.request.contextPath}/css/styles.css'  type="text/css" />
</head>
<body>
    <section>
        <div>
            <div class="container" style="text-align: center" >
                <h1>收藏清單</h1>
            </div>
        </div>
    </section>
    <hr style="height:1px;border:none;color:#333;background-color:#333;">
    <section class="container">
        <div class="row">
                <a href='products'>查詢物品</a><BR><br>
                        <a href='icookProject'>回首頁</a><BR><br>
          <c:forEach var='collection' items='${collections}'>
            <div class="col-sm-6 col-md-3" style="width: 360px; height: 360px">
                <div class="thumbnail" style="width: 320px; height: 340px">
                <img width='100' height='200' 
     					src="<c:url value='/getPicture/${collection.productBean.product_id}' />" />
                    <div class="caption">
                         <p>collectionId: ${collection.id}  productId :${collection.productBean.product_id}
                        memberID :${collection.memberBean.member_id}</p>
                         <p>Date:${collection.collect} Price:${collection.productBean.price}</p>
                         <p>${collection.productBean.unit_size}  ${collection.productBean.color}
                         ${collection.productBean.stock}  
                         ${collection.productBean.categoriesbean.name}
                         </p>
                         <a href="<spring:url value='/product?id=${collection.productBean.product_id}' />"
    							class="btn btn-primary">
    							<span class="glyphicon-info-sigh glyphicon"></span>詳細資料
 							</a>
                         <a href="<spring:url value='/collection/delete?id=${collection.id}' />"
    							class="btn btn-primary">
    							<span class="glyphicon-info-sigh glyphicon"></span>刪除
 							</a>
                    </div>
                </div>
            </div>
          </c:forEach>
        </div>
    </section>
</body>
</html>
    