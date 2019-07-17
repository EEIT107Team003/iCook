<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="java.util.*, java.io.*" %>

<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<title>Products</title>
<link rel='stylesheet'
	href='${pageContext.request.contextPath}/css/styles.css'
	type="text/css" />
<!-- 	============================================================================================== -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" ></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" ></script>
	
	
<style>
* {
	padding: 0;
	margin: 0;
}

.left {
	width: 15%;
	float: left;
}

.right {
	width: 80%;
	float: right;
}

body {
	background-color: white;
}

header {
	margin: auto;
	background-color: #FFC8B4;
}

footer {
   
	margin: auto;
	background-color: #AAFFEE;
}
.search{
 border-right: 1px solid #cccccc ;
 width: 5em;
}

.container {
	margin-left: 5ch;
}

.allPage {
	overflow: auto;
	width: 100%;
	margin-bottom:10ch;
	margin-top:3ch;
}
.page{
margin:auto;
margin-left: 5ch;
}
.page button{
margin-left: 3ch;
width:30px;
}
/* ======================MainShow=================================== */
.field {
	padding: 10px;
}

.mainShow {
	opacity: 100;
	width: 200px;
	filter: alpha(opacity = 100);
	margin:auto;
}

.mainBlock {
	position: absolute;
	width: 100px;
	opacity: 0;
	top: 0;
	left: 0;
}

.divA {
	position: relative;
	margin:auto;
}

.divA img {
      margin:auto;
	-webkit-transition: opacity 2s linear;
	-moz-transition: opacity 2s linear;
	-o-transition: opacity 2s linear;
	transition: opacity 1s linear;
	width: 25cm;
	height: 200px;
}
</style>
</head>
<body>

<script type="text/javascript">
$.ajax({
	url : "${pageContext.request.contextPath}/category",
	type : "POST",
	dataType : "json",
	contentType : "application/json",
	async : true,
	success : function(data) {
		var names = JSON.parse(JSON.stringify(data).split(","));
		var txt = "";
        for (i in names) {
			txt += "<option value='"+i+"'>" + names[i].name + "</option>";
		}
		$("#show").append(txt);
	},
	error : function(data, textStatus, errorThrown) {
		console.log(data);
	},
});

$(document).ready(function() {
	
	function catchSelect1(){
		var txt = $("#show :selected").text();
		if(txt=='請選擇'){
			var clean=null
			$("#show2").html(clean);
		}
	}	
	
	
	$("#show").change(function() {
		catchSelect1();	 
		search();
	})

	$("#show2").change(function() {
		search2();
	})
	
	function search(){
		var txt = $("#show :selected").text();
//			console.log('Txt 123: '+txt)
		$("#remark").val(txt);
		$.ajax({                                    
			url : "${pageContext.request.contextPath}/categories/" + txt,
			type : "GET",
			dataType : "json",
			async : true,
			contentType : "application/json",
			success : function(data) {
//              console.log('remark :'+$("#remark").val() );
				var names = JSON.parse(JSON.stringify(data).split(","));
	 			console.log(typeof names);
				var txt = "<option value='-1' SELECTED id='cr'>請選擇</option>";
				for (i in names) {
					console.log(i + ' :' + names[i].name);
					txt += "<option value='"+i+"'>" + names[i].name + "</option>";
				}
				$("#show2").html(txt);
			},
			error : function(data, textStatus, errorThrown) {
				console.log(data);
			},
		});
	}
	
		
	function search2(){
		var txt2= $("#show2 :selected").text();
		console.log('txt2:'+txt2)
		$.ajax({
            success : function(data) {	
            console.log(typeof txt2+' ，showTxt(change) :' + txt2)
            $("#fileName").val(txt2);
            console.log('fileName :'+$("#fileName").val() );
			},
			error : function(data, textStatus, errorThrown) {
				console.log(data);
			},
		});
	}
	
})

</script>

<header>
	<h1>HEADER</h1>
	Working with server: <%= application.getServerInfo() %><br>
    Servlet Specification: <%= application.getMajorVersion() %>.<%= application.getMinorVersion() %> <br>
    JSP version: <%= JspFactory.getDefaultFactory().getEngineInfo().getSpecificationVersion() %><br>
    Java Version: <%= System.getProperty("java.version") %><br>
	</header>
	<c:out value="登入者${LoginOK.member_id}"></c:out>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="/">ICook!</a>
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
				<li class="nav-item"><a class="nav-link" href="#">(修改商品)</a></li>
				<li class="nav-item"><a class="nav-link" href='products/add'>(新增商品)</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="products/upd">(更新產品)</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="collections">查詢收藏</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="cartPage">購物車</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="checkOrders">檢視訂單(會員用)</a>
				</li>
				<li class="nav-item"><a class="nav-link"
					href="adminCheckOrders">查看訂單(僅限admin的URL)</a></li>

			</ul>
			<form class="form-inline my-2 my-lg-0">
				<input class="form-control mr-sm-2" type="search" placeholder="查詢商品">
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
			</form>
		</div>
	</nav>
    
	<div class="allPage">
		<div class="left">
			<section class="container">
				<div>
					<h1>產品清單</h1>
				</div>
				<label for='show'> 種類</label>
				<div>
					<select id="show" name="show" style="width:30ch" class="form-control form-control-sm"><option
							value="0" SELECTED id='ch'>請選擇</option></select> <select id="show2" name="show" style="width:30ch" class="form-control form-control-sm">
					</select>
				</div>
				<nav class="navbar navbar-light bg-light">
				<form class="searchDiv" id="searchDiv" method="POST" class="form-inline">
					<input id="fileName" name="fileName" type="hidden" /> <input
						id="remark" name="remark" type="hidden" /><input id="stock" name="stock" type="hidden" />
					<div>
						<input id="description" name="description" type="text"  class="form-control mr-sm-2" placeholder="Search" aria-label="Search"></input>
					</div>
					<div>
						  <input type="button"class="btn btn-outline-success my-2 my-sm-0" value="Search">
					</div>
				</form>
				</nav>
			</section>
			<section class="container">
			


				<a href='collections'>查詢收藏</a><BR> <br>
				<a href='products/add'>新增產品資料</a>
					<h4>鍋類</h4>
				<ul style="cursor: pointer">
					<li><a class="search">炒鍋</a></li>
					<li><a class="search">平底鍋</a></li>
					<li><a class="search">湯鍋</a></li>
				</ul>
					<h4>刀具</h4>
				<ul style="cursor: pointer">
					<li><a class="search">式剁刀</a></li>
					<li><a class="search">牛排刀</a></li>
				</ul>
					<h4>食材</h4>
				<ul style="cursor: pointer">
					<li><a class="search">牛肉</a></li>
					<li><a class="search">雞肉</a></li>
					<li><a class="search">豬肉</a></li>
					<li><a class="search">羊肉</a></li>
				</ul>
				<a href='${pageContext.request.contextPath}'>回首頁</a><BR> <br>
			</section>
		</div>


		<div class="right">
            
			<section class="container">
		<div class="row">
			<img width='100' height='150'
			     src="<c:url value='/getProductPicture/${product.product_id}'/>" />
			<div class="col-md-5">
				<h3>${product.description}</h3>
				<p>顏色: ${product.color}</p>
				<p>單價: ${product.price}</p>
				<p>分類: ${product.categoriesbean.name}</p>
				<p> ${collection.productBean.categoriesbean.name}
					<strong>商品編號: </strong> <span class='label label-warning'>
						${product.product_id} </span>
				</p>
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
			
			
			<div class="page">
			<form >
				<input type = 'button' id="Previous"   value="Previous"/>
				<input type = 'button' id="Next"   value="Next"/>
				<div id="pageNum">
				</div>
<!-- 				<input type = 'button' id="next"  onclick="edit(this)" value="1"/> -->
			</form>
			</div>
			<section id="right"></section>
		</div>
		<div class="right"></div>
	</div>
	<footer>
	<h1>FOOTER</h1>
	</footer>
</body>
</html>
