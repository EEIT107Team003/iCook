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
<!-- 	============================================================================================== -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" ></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" ></script>
	
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/product_css/products.css">
	
	
<!-- 	====================================================================================== -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
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
<style>

.textDiv{
margin: 0;
}
.textDiv p{
font-size:20px;
}



</style>
</head>
<body>

	<script>
	
// ================================起始畫面SHOW====================================
	 firstShow();
    selectLoacl();
    var count;

    function selectLoacl(){
		 var txt=String("${product.categoriesbean.name}")
		 var txt2="${product.categoriesbean.categorybean.name}";
		 console.log(txt)
		 console.log(txt2)
		 $.ajax({                                    
				url : "${pageContext.request.contextPath}/SelectByCategoriesAndDescriptionForProduct/" + txt,
				type : "GET",
				dataType : "json",
				async : true,
				contentType : "application/json",
				success : function(data) {
					var names = JSON.parse(JSON.stringify(data).split(","));
					var ss=JSON.stringify(data).split(",")
							txt="";
					for (i in names) {
				             txt+=
				            	  "<div class='col-sm-6 col-md-3' style='width: 200px; height: 250px;margin-bottom:80px;margin-right:50px'>"
					             +"<div class='mainDiv'>"
					             +"<img src=   \" <c:url value=  '/getProductPicture/"+names[i].product_id+"'   /> \"     />"
					             +"<div class='mainText'  style='font-size: 8px; ''><p>"
					             +"名稱  : "+names[i].name+"</p><p>價格 : "+names[i].price+"</p>"
					             +"<nav class='navbar navbar-light bg-light'><form class='form-inline'>"
					             +"<a class='mh6'   href=\" <c:url value=  '/product?id="+names[i].product_id+"'    /> \"    >" 
					             +"Details</a>"
					             +"</form></nav></div></div></div>"
				         }
						$("#right").html(txt);
				},
				error : function(data, textStatus, errorThrown) {
					console.log(data);
				},
			});
		 
          }
    
    
    function firstShow(){
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
    }
	
	function secondShow(){
		$.ajax({
				url : "${pageContext.request.contextPath}/category",
				type : "POST",
				dataType : "json",
				contentType : "application/json",
				async : true,
				success : function(data) {
					var names = JSON.parse(JSON.stringify(data).split(","));
					var txt = "<option value='-1' SELECTED id='cr'>請選擇</option>";
		            for (i in names) {
						txt += "<option value='"+i+"'>" + names[i].name + "</option>";
					}
					$("#show").html(txt);
				},
				error : function(data, textStatus, errorThrown) {
					console.log(data);	
				},
			});
	    }
		
// ==========================================EXCEL================================================================
		
	
// 	$.ajax({
// 			url : "${pageContext.request.contextPath}/category",
// 			type : "POST",
// 			dataType : "json",
// 			contentType : "application/json",
// 			async : true,
// 			success : function(data) {
// 				var names = JSON.parse(JSON.stringify(data).split(","));
// 				var txt = "";
// 	            for (i in names) {
// 					txt += "<option value='"+i+"'>" + names[i].name + "</option>";
// 				}
// 				$("#show3").append(txt);
// 			},
// 			error : function(data, textStatus, errorThrown) {
// 				console.log(data);
// 			},
// 		});




		$(document).ready(function() {


			
			
			 
// 	<!-- =============================================Dataisl=================================================================		 -->

	$("a[data-gal^='prettyPhoto']").prettyPhoto({
			theme : 'facebook'
		});



			getstock();

			function getstock(){
			        var names=parseInt("${product.stock}")
			        var txt=""
			        for(var i=1;i<=names;i++) {
						txt += "<option value='"+i+"'>" +i+ "</option>"
					}
			        $("#quantity").append(txt);
			}

			$("#quantity").change(function() {
				var txt = $("#quantity :selected").val();
				$("#quan").val(txt);
			})

			
			
// 	<!-- =============================================Dataisl=================================================================		 -->	
			
// ==========================================SHOW change================================================================
	
	
	function catchSelect1(){
			var txt = $("#show :selected").text();
			if(txt=='請選擇'){
				var clean=null
				$("#show2").html(clean);
			}
		}
	
	function cleanAllSelect(){
		secondShow()		
		var clean=null
			$("#show2").html(clean);
		}
	
	
			
	
		$("#show").change(function() {
			catchSelect1();	 
			search();
		})
		
		function search(){
			var txt = $("#show :selected").text();
// 			console.log('Txt 123: '+txt)
			$("#remark").val(txt);
			 $("#fileName").val("");
			alert($("#remark").val());
			$.ajax({                                    
				url : "${pageContext.request.contextPath}/categories/" + txt,
				type : "GET",
				dataType : "json",
				async : true,
				contentType : "application/json",
				success : function(data) {
//                  console.log('remark :'+$("#remark").val() );
					var names = JSON.parse(JSON.stringify(data).split(","));
// 		 			console.log(typeof names);
					var txt = "<option value='-1' SELECTED id='cr'>請選擇</option>";
					for (i in names) {
// 						console.log(i + ' :' + names[i].name);
						txt += "<option value='"+i+"'>" + names[i].name + "</option>";
					}
					$("#show2").html(txt);
				},
				error : function(data, textStatus, errorThrown) {
					console.log(data);
				},
			});
		}
		
		$("#show2").change(function() {
			search2();
		})
			
		function search2(){
			var txt2= $("#show2 :selected").text();
// 			console.log('txt2:'+txt2)
			$.ajax({
                success : function(data) {	
//                 console.log(typeof txt2+' ，showTxt(change) :' + txt2)
                $("#fileName").val(txt2);
//                 console.log('fileName :'+$("#fileName").val() );
				},
				error : function(data, textStatus, errorThrown) {
					console.log(data);
				},
			});
		}
		
// =================================================LEFT HREF SEARCH====================================
		$(".search").click(function() {
		     	cleanAllSelect()
				var txt = $(this).text();
				var txt2="";
				 $("#fileName").val(txt);
				getOneCategory();
// 				alert("remark :"+ $("#remark").val());
				
				 $("#stock").val(1);
				page();
				selectAll();
		})	
			
		function getOneCategory(){
			var txt= $("#fileName").val();
// 			alert(txt)
			$.ajax({
				url : "${pageContext.request.contextPath}/category/"+txt,
				type : "GET",
				dataType : "json",
				contentType : "application/json",
				async : true,
				success : function(data) {
					var names = JSON.parse(JSON.stringify(data).split(","));
					var txt2=names[0].categorybean.name;
					 $("#remark").val(txt2);
// 						alert("remark IN : "+ $("#remark").val());
				},
				error : function(data, textStatus, errorThrown) {
					console.log(data);
				},
			});
			
		}	
			
		$("#searchDiv").click(function() {
			catchSelect1();	 
// 			console.log($("#searchDiv").serializeObject());
// 			alert($(".search").serializeObject())
            $("#stock").val(1)
			selectAll();
			page();
		})
		
		
	
		function page(){
// 			$("#stock").val(txt);
			$.ajax({
				url : "${pageContext.request.contextPath}/ForPage/",
				type : "POST",
				dataType : "json",
				data :$("#searchDiv").serializeObject(),
				contentType : "application/json",
				success : function(data) {
					var names = JSON.parse(JSON.stringify(data).split(","));
					var ss=JSON.stringify(data).split(",")
					var txt="<li class='page-item'><input  type = 'button' id='Previous' value='&laquo;'  onclick='PreviousClick()'  class='page-link'/></li>";
					count=Math.ceil(names.length/18);
						for (var i=1;i<=count;i++) {
				           txt+="<li class='page-item'><input type = 'button' class='page-link' name='stock' onclick='edit(this)'   value="+i+"></input></li>"   
				         }
						txt+="<li class='page-item'><input type = 'button' id='Next'   value='&raquo;' onclick='NextClick()' class='page-link'/></li>"
// 						console.log("count"+count);
						$(".pagination").html(txt);
				    }
			     })
              }

		});
		
		function PreviousClick() {
// 		 	console.log('txt:'+ $("#stock").val())
		 	var Previous=parseInt($("#stock").val())-1
		 	if(Previous<1)
		 		Previous=1
		 	$("#stock").val(Previous)
// 			 console.log('Previous:'+Previous )
			 selectAll();
		}
		
		function NextClick() {
// 		 	console.log('txt:'+ $("#stock").val())
// 		 	console.log('count:'+ count)
		 	if($("#stock").val()==""||$("#stock").val()==null)
		 		$("#stock").val(1)
		 	var next=parseInt($("#stock").val())+1
		 	if(next>count)
		 		next=count
		 	$("#stock").val(next)
// 			 console.log('next:'+next )
			 selectAll();
		}
		
		function edit(object){
			    var txt=object.value;
			    $("#stock").val(txt);
// 			   	console.log('txt:'+ $("#stock").val())
// 			   	<input type = 'button' id="next"  onclick="edit(this)" value="1"/>
			   	$.ajax({
			   		url : "${pageContext.request.contextPath}/SelectByCategoriesAndDescription/",
					type : "POST",
					dataType : "json",
					data :$("#searchDiv").serializeObject(),
					contentType : "application/json",
					success : function(data) {
						var names = JSON.parse(JSON.stringify(data).split(","));
						var ss=JSON.stringify(data).split(",")
								txt="";
							for (i in names) {
//	 				             console.log(i + ' :' + names[i]	);
					             txt+=
					            	  "<div class='col-sm-6 col-md-3' style='width: 200px; height: 250px;margin-bottom:80px;margin-right:50px'>"
						             +"<div class='mainDiv'>"
						             +"<img src=   \" <c:url value=  '/getProductPicture/"+names[i].product_id+"'   /> \"     />"
						             +"<div class='mainText'  style='font-size: 8px; ''><p>"
						             +"名稱  : "+names[i].name+"</p><p>價格 : "+names[i].price+"</p>"
						             +"<nav class='navbar navbar-light bg-light'><form class='form-inline'>"
						             +"<a class='mh6'   href=\" <c:url value=  '/product?id="+names[i].product_id+"'    /> \"    >" 
						             +"Details</a>"
						             +"</form></nav></div></div></div>"
					         }
// 						             +"<a class='btn btn-sm btn-outline-secondary'   href=\" <c:url value=  '/products/product/addToCollection?id="+names[i].product_id+"'    /> \"    >" 
// 						             +"新增收藏</a>"
// 						             +"<a class='btn btn-sm btn-outline-secondary'   href=\" <c:url value=  '/products/products/upd?id="+names[i].product_id+"'    /> \"    >" 
// 						             +"更新</a>"
//	 						console.log("txt : "+txt)
							$("#right").html(txt);
					}
			   	})
			  
		}
		
		 function selectAll(){
				$.ajax({
					url : "${pageContext.request.contextPath}/SelectByCategoriesAndDescription/",
					type : "POST",
					dataType : "json",
					data :$("#searchDiv").serializeObject(),
					contentType : "application/json",
					success : function(data) {
						var names = JSON.parse(JSON.stringify(data).split(","));
						var ss=JSON.stringify(data).split(",")
								txt="";
							for (i in names) {
//	 				             console.log(i + ' :' + names[i]	);
					             txt+=
					            	  "<div class='col-sm-6 col-md-3' style='width: 200px; height: 250px;margin-bottom:80px;margin-right:50px'>"
						             +"<div class='mainDiv'>"
						             +"<img src=   \" <c:url value=  '/getProductPicture/"+names[i].product_id+"'   /> \"     />"
						             +"<div class='mainText'  style='font-size: 8px; ''><p>"
						             +"名稱  : "+names[i].name+"</p><p>價格 : "+names[i].price+"</p>"
						             +"<nav class='navbar navbar-light bg-light'><form class='form-inline'>"
						             +"<a class='mh6'   href=\" <c:url value=  '/product?id="+names[i].product_id+"'    /> \"    >" 
						             +"Details</a>"
						             +"</form></nav></div></div></div>"
					         }

// 						             +"<a class='btn btn-sm btn-outline-secondary'   href=\" <c:url value=  '/product/addToCollection?id="+names[i].product_id+"'    /> \"    >" 
// 						             +"新增收藏</a>"
// 						             +"<a class='btn btn-sm btn-outline-secondary'   href=\" <c:url value=  '/products/upd?id="+names[i].product_id+"'    /> \"    >" 
// 						             +"更新</a>"
//	 						console.log("txt : "+txt)
							$("#right").html(txt);
					    }
				     })
	              }
		
		 $.fn.serializeObject = function() {
		        var o = {};
		        var a = this.serializeArray();
		        $.each(a, function() {
		            if (o[this.name]) {
		                if (!o[this.name].push) {
		                    o[this.name] = [o[this.name]];
		                }
		                o[this.name].push(this.value || '');
		            } else {
		                o[this.name] = this.value || '';
		            }
		        });
		        return JSON.stringify(o);
		    };
		    

	</script>
	<div class="main">
	<header>
			<div class="zerogrid">
				<div class="col-full">
					<div class="wrap-col">
						<h1>
							<a href="index2"><img src="images/logo.png" alt="EXTERIOR"></a>
						</h1>

						<div class="menu_block">
							<nav>
								<ul class="sf-menu">
									<li class="with_ul current"><a href="index2">ICook</a></li>
									<li><a href="icookAboutUS">關於我們</a>
										<ul>
											<li><a href="icookContact">聯繫我們</a></li>
										</ul></li>
									<li><a href="<c:url value='/recipe/recipeIndex' /> ">查看食譜</a>
									<li><a href="icookLife">生活誌</a></li>
									<li><a href="forum/overview">討論區</a></li>
									<li><a href="A_articlemainpage">文章區</a></li>
									<li><a href="products">市集</a>
									<ul>


											<li><a href="cartPage">購物車</a></li>
										</ul></li>

									<li><a href="icookLogin">會員專區</a>
										<ul>
											<c:if test="${pageContext.request.userPrincipal.name==null}">
												<li><a href="icookLogin">會員登入</a></li>
												<li><a href="icookRegister">會員註冊</a></li>
											</c:if>
											<c:if test="${pageContext.request.userPrincipal.name!=null}">
												<li><a href="index2" data-toggle="modal" data-target="#logout">會員登出</a></li>
											</c:if>
												<li><a href="checkOrders">查看訂單</a></li>
												<li><a href="#">新增食譜</a></li>
												<li><a href="backStage">後台</a></li>
										</ul>

									</li>		
								</ul>
							</nav>
							<div class="clear"></div>
						</div>
						<div class="clear"></div>
					</div>
				</div>
			</div>
		</header>
		
		
	<div class="allPage">
		<div class="left">
			<section class="container">
				<div>
					<h1>產品清單</h1>
				</div>

				<div>
					<select id="show" name="show" class="form-control form-control-sm"><option
							value="0" SELECTED id='ch'>請選擇</option></select> <select id="show2"
						name="show2" class="form-control form-control-sm">
					</select>
				</div>
					<form class="searchDiv" id="searchDiv" method="POST" class="form-inline">
					<input id="fileName" name="fileName" type="hidden" /> <input
						id="remark" name="remark" type="hidden" /><input id="stock" name="stock" type="hidden" />
					<div style="width:26ch;">
						<input id="description" name="description" type="text"   class="form-control mr-sm-2" placeholder="請輸入產品名稱關鍵字" ></input>
						  <input type="button" id="searchSub"class="btn btn-outline-success my-2 my-sm-0" value="收尋">
					</div>
				</form>
			</section>
			<section class="container">


				<div class="list-type1">

					<h1>鍋類</h1>
					<ul style="cursor: pointer">
						<li><a class="search">炒鍋</a></li>
						<li><a class="search">平底鍋</a></li>
						<li><a class="search">湯鍋</a></li>
					</ul>
					<h1>刀具</h1>
					<ul style="cursor: pointer">
						<li><a class="search">式剁刀</a></li>
						<li><a class="search">牛排刀</a></li>
					</ul>
					<h1>食材</h1>
					<ul style="cursor: pointer">
						<li><a class="search">牛肉</a></li>
						<li><a class="search">雞肉</a></li>
						<li><a class="search">豬肉</a></li>
						<li><a class="search">羊肉</a></li>
					</ul>
					<a href='${pageContext.request.contextPath}'>回首頁</a><BR> <br>
					</div>
			</section>
		</div>


		<div class="right">

			<!-- =============================================Dataisl=================================================================		 -->

			<section class="container">
				<div class="row">
				
					<div class="zerogrid" style="width: 100ch; margin: 0; padding: 0;">
						<div class="portfolio">
							<div class="col-1-2">
								<div class="wrap-col">
									<a
										href="images/big3.jpg"
										data-gal="prettyPhoto[1]"><span> <img
											src="<c:url value='/getProductPicture/${product.product_id}'/>"
											alt="" />
									</span></a>
								</div>
							</div>
						</div>
					</div>


					<div class="textDiv">
						<h1 style="font-size: 30px;">商品編號: ${product.product_id}</h1>
						<h1 style="font-size: 30px;">${product.name}</h1>
						<p>分類: ${product.categoriesbean.name}</p>
						<p>顏色: ${product.color}</p>
						<p>單價: ${product.price}</p>
						<p>${product.description}</p>
						請選擇數量:<select id="quantity" name="quantity" style="width: 10ch"
							class="form-control form-control-sm"><option value="0"
								SELECTED id='ch'>0</option></select> <a
							href="<spring:url value='/products' />" class="btn btn-default">
							<span class="glyphicon-hand-left glyphicon"></span>返回
						</a>

						<!-- 						測試 -->
						<form method='POST' action="<c:url value='/product/addToCart'/>">
							<input type="hidden" name="productId"
								value="${product.product_id}" /> <input type="hidden"
								name="price" value="${product.price}" />
							<%-- 								<c:set value="" var="quan1"/> --%>
							<%-- 						<c:out value="${quan1}"></c:out> --%>
							<input type="hidden" name="quan" id='quan' value="" />
							<div align="center">
								<button type="button" class="btn btn-warning"
									onclick="{location.href='/icook/cartPage'}" class="">去購物車</button>
								<input class="btn btn-warning" type="submit" value="加入購物車" />
							</div>

						</form>
					</div>
				</div>

	           	

			</section>
			<!-- =============================================Dataisl=================================================================		 -->

			<form>
				<div class="page">
					<ul class="pagination">
					</ul>
				</div>
			</form>
			<section id="right" class="rightMain"></section>
		</div>
		<div class="right"></div>
	</div>
</div>



	<footer >
		<div class="zerogrid">
			<div class="col-full">
				<div class="wrap-col">
					&copy; Copyright &copy; 2013.Company name All rights reserved.<a
						target="_blank" href="http://sc.chinaz.com/moban/">&#x7F51;&#x9875;&#x6A21;&#x677F;</a>
				</div>
			</div>
		</div>
	</footer >
	<div style="display: none">
		<script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540'
			language='JavaScript' charset='gb2312'></script>
	</div>
</body>
</html>

