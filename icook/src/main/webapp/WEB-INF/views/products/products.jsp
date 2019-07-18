<<<<<<< HEAD
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
/* 	background-color: #FFC8B4; */
    
}

footer {
   
	margin: auto;
	background-color: #AAFFEE;
}
.search{
 border-right: 1px solid #cccccc ;
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
	width: 50px;
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
	width: 10cm;
	height: 200px;
}

/* ============================================================= */


</style>
</head>
<body>

	<script>
	
// ================================起始畫面SHOW====================================
	 firstShow();
    var count;
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
				$("#show3").append(txt);
			},
			error : function(data, textStatus, errorThrown) {
				console.log(data);
			},
		});

		$(document).ready(function() {
			selectAll();
			page();
		
		
			
		$("#show3").change(function() {
			catchSelect1();	 
			search3();
		})
		
		function search3(){
			var txt = $("#show3 :selected").text();
// 			console.log('Txt 123: '+txt)
			$("#remark2").val(txt);
			$.ajax({                                    
				url : "${pageContext.request.contextPath}/categories/" + txt,
				type : "GET",
				dataType : "json",
				async : true,
				contentType : "application/json",
				success : function(data) {
//                  console.log('remark2 :'+$("#remark2").val() );
					var names = JSON.parse(JSON.stringify(data).split(","));
// 		 			console.log(typeof names);
					var txt = "<option value='-1' SELECTED id='cr'>請選擇</option>";
					for (i in names) {
// 						console.log(i + ' :' + names[i].name);
						txt += "<option value='"+i+"'>" + names[i].name + "</option>";
					}
					$("#show4").html(txt);
				},
				error : function(data, textStatus, errorThrown) {
					console.log(data);
				},
			});
		}
		
		$("#show4").change(function() {
			search4();
		})
		function search4(){
			var txt4= $("#show4 :selected").text();
			$.ajax({
                success : function(data) {	
                $("#fileName2").val(txt4);
				},
				error : function(data, textStatus, errorThrown) {
					console.log(data);
				},
			});
		}
		
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
	
	
		$("#show2").change(function() {
			search2();
		})
			
	
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
				           txt+="<li class='page-item'><input type = 'button' class='page-link'  style='margin-left: 3ch;width:5ch;' name='stock' onclick='edit(this)'  value="+i+"></input></li>"   
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
					            	  "<div class='col-sm-6 col-md-3' style='width: 180px; height: 180px;margin-bottom:90px'>"
						             +"<div class=''>"
						             +"<img width='75' height='75'src=   \" <c:url value=  '/getProductPicture/"+names[i].product_id+"'   /> \"     />"
						             +"<div class=''  height='100' style='font-size: 8px; ''><p>"
						             +names[i].name+"</p><p>"+names[i].unit_size+" "+names[i].color+" "+names[i].remark
						             +"</p><p>"+names[i].price+"</p><p>庫存:"+names[i].stock+"</p>"
						             +"<nav class='navbar navbar-light bg-light'><form class='form-inline'>"
						             +"<a class='btn btn-sm btn-outline-secondary'   href=\" <c:url value=  '/products/product?id="+names[i].product_id+"'    /> \"    >" 
						             +"詳細資料</a>"
						             +"<a class='btn btn-sm btn-outline-secondary'   href=\" <c:url value=  '/products/product/addToCollection?id="+names[i].product_id+"'    /> \"    >" 
						             +"新增收藏</a>"
						             +"<a class='btn btn-sm btn-outline-secondary'   href=\" <c:url value=  '/products/products/upd?id="+names[i].product_id+"'    /> \"    >" 
						             +"更新</a>"
						             +"</form></nav></div></div></div>"
					         }
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
					            	  "<div class='col-sm-6 col-md-3' style='width: 180px; height: 180px;margin-bottom:90px'>"
						             +"<div class=''>"
						             +"<img width='75' height='75'src=   \" <c:url value=  '/getProductPicture/"+names[i].product_id+"'   /> \"     />"
						             +"<div class=''  height='100' style='font-size: 8px; ''><p>"
						             +names[i].name+"</p><p>"+names[i].unit_size+" "+names[i].color+" "+names[i].remark
						             +"</p><p>"+names[i].price+"</p><p>庫存:"+names[i].stock+"</p>"
						             +"<nav class='navbar navbar-light bg-light'><form class='form-inline'>"
						             +"<a class='btn btn-sm btn-outline-secondary'   href=\" <c:url value=  '/product?id="+names[i].product_id+"'    /> \"    >" 
						             +"詳細資料</a>"
						             +"<a class='btn btn-sm btn-outline-secondary'   href=\" <c:url value=  '/product/addToCollection?id="+names[i].product_id+"'    /> \"    >" 
						             +"新增收藏</a>"
						             +"<a class='btn btn-sm btn-outline-secondary'   href=\" <c:url value=  '/products/upd?id="+names[i].product_id+"'    /> \"    >" 
						             +"更新</a>"
						             +"</form></nav></div></div></div>"

					         }
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
	<header>
	
	
	
	<h1>HEADER</h1>
	Working with server: <%= application.getServerInfo() %><br>
    Servlet Specification: <%= application.getMajorVersion() %>.<%= application.getMinorVersion() %> <br>
    JSP version: <%= JspFactory.getDefaultFactory().getEngineInfo().getSpecificationVersion() %><br>
    Java Version: <%= System.getProperty("java.version") %><br>
		</header>
		
		
	<c:out value="登入者${LoginOK.nickname}"></c:out>
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
							value="0" SELECTED id='ch'>請選擇</option></select> <select id="show2" name="show2" style="width:30ch" class="form-control form-control-sm">
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
				<div class="list-type1">
				
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
				
				
				</div>
				 <a href='productsEx.xls' >AllProductsExcel</a><br>
				<div>
					<div>
						<select id="show3" name="show3" style="width: 30ch"
							class="form-control form-control-sm"><option value="0"
								SELECTED id='ch'>請選擇</option></select> <select id="show4" name="show4"
							style="width: 30ch" class="form-control form-control-sm">
						</select>
					</div>
					<form action="productsByCategoryEx.xls">

						<input id="fileName2" name="fileName2" type="hidden" /> <input
							id="remark2" name="remark2" type="hidden" />
						<div>
							<input id="description2" name="description2" type="text"
								class="form-control mr-sm-2" placeholder="Search"
								aria-label="Search"></input>
						</div>
						<input type="submit" value="ProductsExcel">
					</form>
				</div>
				
				<a href='${pageContext.request.contextPath}'>回首頁</a><BR> <br>
			</section>
		</div>
		

			<script type="text/javascript">
				let adImgs, adsImgs;
				let timer;
				let LEN;
				
			
				document.addEventListener("DOMContentLoaded", function() {
					mainImgs = document
							.querySelectorAll("img.mainShow,img.mainBlock");
				})

				let counter = 0;
				function show() {

					mainImgs[counter].className = "mainBlock";
					counter++;
                    					
					if(counter==8){
						counter=1  //不可打分號，會一直跑進回圈內
					}
					
					mainImgs[counter].className = "mainShow";
                    
				}

				timer = window.setInterval(show, 3000);
			$(document).ready(function() {
			});
			</script>

		<div class="right">

           
			<fieldset class="field">
				<div class="divA">
					<img id="Mai00" class="mainShow"
						src="${pageContext.request.contextPath}/product_image/img01.JPG" alt="" />
					<c:forEach var="i" begin="2" end="8">
						<img id="Mai00" class="mainBlock"
							src="${pageContext.request.contextPath}/product_image/img0${i}.JPG"
							alt="" />
					</c:forEach>
				</div>
			</fieldset>
			<div class="page">
				<form>
					<ul class="pagination">
					</ul>
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

