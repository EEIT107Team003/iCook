<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>顯示完整食譜頁面</title>
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
<!-- <script type="text/javascript" -->
<%-- 	src='${pageContext.request.contextPath}/css/fontawesome-free/js/all.min.js'></script> --%>
<!-- fontawesome-free -->
<link rel="icon" href="${pageContext.request.contextPath}/images/favicon.ico">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/images/favicon.ico" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/zerogrid.css" type="text/css"
	media="screen">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/responsive.css" type="text/css"
	media="screen">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/prettyPhoto.css">
<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-migrate-1.1.1.js"></script>
<script src="${pageContext.request.contextPath}/js/superfish.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.easing.1.3.js"></script>
<script src="${pageContext.request.contextPath}/js/sForm.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.prettyPhoto.js"></script>
<script src="${pageContext.request.contextPath}/js/css3-mediaqueries.js"></script>
<!-- google font -->
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+TC&display=swap"
	rel="stylesheet">

<link rel="icon"
	href="${pageContext.request.contextPath}/images/favicon.ico">
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/images/favicon.ico" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/slider.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/zerogrid.css"
	type="text/css" media="screen">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/responsive.css"
	type="text/css" media="screen">
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script
	src="${pageContext.request.contextPath}/js/jquery-migrate-1.1.1.js"></script>
<script src="${pageContext.request.contextPath}/js/superfish.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.easing.1.3.js"></script>
<script src="${pageContext.request.contextPath}/js/sForm.js"></script>
<script
	src="${pageContext.request.contextPath}/js/jquery.carouFredSel-6.1.0-packed.js"></script>
<script src="${pageContext.request.contextPath}/js/tms-0.4.1.js"></script>
<script src="${pageContext.request.contextPath}/js/css3-mediaqueries.js"></script>

<!-- google font -->
<!-- 彈跳視窗 -->
<!-- <link rel="stylesheet" -->
<!-- 	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" -->
<!-- 	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" -->
<!-- 	crossorigin="anonymous"> -->
<!-- <script -->
<!-- 	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" -->
<!-- 	integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" -->
<!-- 	crossorigin="anonymous"></script> -->
<!-- <script -->
<!-- 	src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" -->
<!-- 	integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" -->
<!-- 	crossorigin="anonymous"></script> -->
<!-- 彈跳視窗 -->
<script>
	$(document).ready(function() {
		if($("#userId").val().trim()!=""){
			$.ajax({ 
				url : "${pageContext.request.contextPath}/user/collectedRecipe",
				type : "POST",
				dataType : "json",
				data:{recipe_id:$("#recipeId").val()},
				async : true,
				success : function(data) {
					var names = JSON.parse(JSON.stringify(data).split(","));
					var txt = "";				
					if(names.length!=0){
						txt+="<button class='btn btn-danger' style='margin-top:6px; float: right;height: 100%' onclick='cancelcollect()'>已收藏</button>";
						$("#collectRecipeButton").html(txt);	
					}else{
						txt+="<button class='btn btn-light' style='margin-top:6px; float: right;height: 100%' onclick='collect()'>加入收藏</button>";
						$("#collectRecipeButton").html(txt);
					}
				},
				error : function(data, textStatus, errorThrown) {
					alert('error')
					console.log("error: "+data);
				},
			});
		}else{
			var txt = "";
			txt+="<button class='btn btn-light' style='margin-top:6px; float: right;height: 100%' onclick='collect()'>加入收藏</button>"
				$("#collectRecipeButton").html(txt);
		}
	});
	
	function collect() {
		if($("#userId").val().trim()!=""){
			$.ajax({ 
				url : "${pageContext.request.contextPath}/user/collectRecipe",
				type : "POST",
				dataType : "json",
				data:{recipe_id:$("#recipeId").val()},
				async : true,
				success : function(data) {
					var names = JSON.parse(JSON.stringify(data).split(","));
					var txt = "";				
					txt+="<button class='btn btn-danger' style='margin-top:6px; float: right;height: 100%' onclick='cancelcollect()'>已收藏</button>"
					$("#collectRecipeButton").html(txt);	
				},
				error : function(data, textStatus, errorThrown) {
					console.log("error: "+data);
				},
			});
		}else{
			$("#collectMe_nologin").click();
		}
	}
	function cancelcollect() {
		$.ajax({ 
			url : "${pageContext.request.contextPath}/user/cancelCollectRecipe",
			type : "GET",
			dataType : "json",
			data:{recipe_id:$("#recipeId").val()},
			async : true,
			success : function(data) {
				var names = JSON.parse(JSON.stringify(data).split(","));
				var txt = "";				
				txt+="<button class='btn btn-light' style='margin-top:6px; float: right;height: 100%' onclick='collect()'>加入收藏</button>"
				$("#collectRecipeButton").html(txt);	
			},
			error : function(data, textStatus, errorThrown) {
				console.log("error: "+data);
			},
		});
	}
</script>

<style>
.subscribe {
	margin-left: 20%;
	margin-right: 20%;
	margin-top: 5%;
}

.shrink {
	margin-left: 20%;
	margin-right: 20%;
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

/* .subscribe { */
/* 	margin-right: 100px; */
/* 	margin-left: 260px; */
/* } */
</style>
</head>

<body style="background-color: #55a237;">
	<input id="recipeId" name="recipeId" type="hidden" value="${recipe.pk_recipe_id}"/>
	<input id="userId" name="userId" type="hidden" value="${pageContext.request.userPrincipal.name}"/>
	<!--<div class="main">-->
	<!--==============================header=================================-->
	<header>
		<sec:authorize access="isAuthenticated()">
			<div class="btn btn-success"
				onclick="javascript:location.href='user'"
				style="float: right; margin-right: 50px; padding-left: 35px; width: 400px">
				<img id="member_photo_image"
					style="float: left; width: 100px; height: 100px; border-radius: 50%; border: 1px solid black; background-color: white;"
					src="<c:url value='/getMemberPhoto/${bean.member_id}' />" />
				<div style="font-size: 60px; float: left; margin-left: 30px;">${bean.nickname}</div>
			</div>
		</sec:authorize>
		<div class="zerogrid" style="clear: both;">
			<div class="col-full">
				<div class="wrap-col">
					<h1>
						<a style="height: 200px"
							href="${pageContext.request.contextPath}/index2"><img
							src="${pageContext.request.contextPath}/images/logo.png"
							style="width: 200px; right: 200px; border-radius: 50%;"
							alt="EXTERIOR"></a>
					</h1>

					<div class="menu_block" style="float:left;">
							<nav>
								<ul class="sf-menu" style="padding-top: 55px" >
									<li><a href="index2">ICook</a></li>
									<li>
										<a href="<c:url value='/recipe/recipeSelect' />">食譜專區</a>
										<ul>
											<li>
											<a href="<c:url value='/user/recipe/recipeInsert' />">新增食譜</a>
											</li>
											<li>
											<a href="<c:url value='/recipe/recipeSelect' />">查看食譜</a>
											</li>
											<!--<li><a href="#">cat3</a></li>-->
										</ul>
									</li>
									<li><a href="forum/overview">討論區</a></li>
									<li><a href="A_articlemainpage">生活誌</a></li>
									<li><a href="products">市集</a>
										<ul>
											<li><a href="cartPage">購物車</a></li>
										</ul></li>
									<%-- </c:if><c:if test="${pageContext.request.userPrincipal.name==null}"> --%>
									<li><a href="user">會員專區 </a>
										<ul>
											<sec:authorize access="!isAuthenticated()">
												<li><a href="icookLogin">會員登入</a></li>
												<li><a href="icookRegister">會員註冊</a></li>
											</sec:authorize>
											<c:if test="${pageContext.request.userPrincipal.name!=null}">
												<li><a href="index2" data-toggle="modal"
													data-target="#logout">會員登出</a></li>
											</c:if>
											<li><a href="checkOrders">查看訂單</a></li>
											<sec:authorize access="hasRole('ADMIN')">
												<li><a href="backStageDashboard">後台</a></li>
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

	<div style="background-color: white; margin-bottom: 50px">
		<div align="center" class='shrink' style="background-color: white;">
			<table class="table table-hover">
				<thead>
					<tr>
						<th scope="col"><div style="visibility: hidden">區塊中的內容</div></th>
						<th scope="col"><div style="visibility: hidden">區塊中的內容</div></th>

					</tr>
				</thead>
				<tbody>
					<tr align="center" style='background-color: #2FA02F; color: white'>
						<td style='font-size: 35px;'>食譜名稱</td>
						<td style='font-size: 35px'>
							<div>${recipe.recipe_name}</div>
							<div id="collectRecipeButton">
								<button class='btn btn-light' style='margin-top:6px; float: right;height: 100%' onclick='collect()'>加入收藏</button>
							</div>
							<div style="display: none">
								<form method="GET"
									action="${pageContext.request.contextPath}/user/collectRecipe/${recipe.pk_recipe_id}">
									<button class="btn btn-primary" id=collectMe_nologin type="submit">加入收藏</button>
									<%-- 					${pageContext.request.contextPath}/recipe/recipeSuccessPage/two/"+names[i].pk_recipe_id+" --%>
								</form>
							</div>
						</td>
					</tr>
					<tr align="center">
						<%--<td colspan="2">--%>
						<td style='line-height: 150px'><p style='margin-left: 40px'>食譜封面照片</p></td>
						<td><img
							src="<c:url value='/getRecipePicture/${recipe.pk_recipe_id}' />"
							width="300" /></td>
					</tr>
					<tr align="center">
						<td>烹調時間</td>
						<td>${recipe.recipe_time}&nbsp;分鐘</td>
					</tr>
					<tr align="center">
						<td>食譜份量</td>
						<td>${recipe.recipe_quantity}&nbsp;人份</td>
					</tr>
					<tr align="center">
						<td>食譜簡介</td>
						<td>${recipe.recipe_summary}</td>
					</tr>
					<tr align="center">
						<td>食譜分類</td>
						<td><c:if test="${recipe.recipe_item == 'taiwan'}">
							台式
						</c:if> <c:if test="${recipe.recipe_item == 'japan'}">
							日式
						</c:if> <c:if test="${recipe.recipe_item == 'thailand'}">
							泰式
						</c:if></td>
					</tr>
					<tr align="center">
						<td>作者名稱</td>
						<td><a
							href="<c:url value='/members/page?member_id=${memberBean.member_id}' />">${memberBean.nickname}</a></td>
					</tr>

					<tr align="center" style='background-color: #2FA02F; color: white'>
						<td style='font-size: 35px'>食材名稱</td>
						<td style='font-size: 35px'>份量</td>
					</tr>

					<c:forEach var="recipe2" items="${recipeIngredients}">
						<tr align="center">
							<td>${recipe2.ingredients}</td>
							<td>${recipe2.quantity}</td>
						</tr>
					</c:forEach>
					<tr align="center" style='background-color: #2FA02F; color: white'>
						<td style='font-size: 35px'>步驟圖片</td>
						<td style='font-size: 35px'>步驟說明</td>
					</tr>
					<c:forEach var="recipe3" items="${recipeUnitBean}">
						<tr align="center">
							<td><img
								src="<c:url value='/getRecipePicture2/${recipe.pk_recipe_id}/${recipe3.stepNo}' />"
								width="300" /></td>
							<td>${recipe3.explain}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

		</div>
		<div style="height: 50px; background-color: white;"></div>
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
	<script>
		document.onkeydown = function(e) {
			e = window.event || e;
			var keycode = e.keyCode || e.which;
			if (keycode == 116) {
				console.log("禁用F5按鍵");
				if (window.event) {
					console.log("禁用F5按鍵-#2");
					// ie
					try {
						console.log("禁用F5按鍵-#3");
						e.keyCode = 0;
					} catch (e) {
						console.log("禁用F5按鍵-#4");
					}
					e.returnValue = false;
				} else {
					//firefox
					console.log("禁用F5按鍵-#5");
					e.preventDefault();
				}
			}
		}
	</script>
</body>

</html>