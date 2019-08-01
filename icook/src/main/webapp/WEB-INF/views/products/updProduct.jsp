
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<!-- 	========================================================== -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" >
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" ></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" ></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>



<!-- ========================================================================== -->

    <link rel="apple-touch-icon" sizes="76x76" href="${pageContext.request.contextPath}/backStage/assets/img/apple-icon.png">
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/backStage/assets/img/favicon.ico">
    <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>Light Bootstrap Dashboard - Free Bootstrap 4 Admin Dashboard by Creative Tim</title>
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
    <!--     Fonts and icons     -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />
    <!-- CSS Files -->
    <link href="${pageContext.request.contextPath}/backStage/assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/backStage/assets/css/light-bootstrap-dashboard.css?v=2.0.0 " rel="stylesheet" />
    <!-- CSS Just for demo purpose, don't include it in your project -->
    <link href="${pageContext.request.contextPath}/backStage/assets/css/demo.css" rel="stylesheet" />
    
<style type="text/css">
* {
	padding: 0;
	margin: 0;
}

fieldset {
/*     padding-left: 5cm; */
/* 	border: 1px solid rgb(255, 232, 57); */
    margin-left:3ch;
    margin-top:1ch;
    padding:2ch; 
}
.row div{
margin-bottom:15px;
}
.left{
float:left;
width: 60%;
margin-top:100px;
font-size:25px;
}
.left select {
clear:left;
}
.right{
float:right;
width: 30%;
margin-right:10ch;
}
.rightIN{
/* border: 1px solid rgb(255, 232, 57); */
}
.content{
   overflow:auto;  
   width: 100%;  
}
.formGroup{
  margin-left:5ch;   
  margin-bottom:1ch;
}

.pre{
text-align: left;
}
.pre img{
width:150;
height:100;
margin:15px;
}


/* #formUp{ */
/* font-size:20px; */
/* } */

</style>
<title>Products</title>
<link rel='stylesheet'
	href='${pageContext.request.contextPath}/css/styles.css'
	type="text/css" />
</head>
<body>
<div class="wrapper">
        <div class="sidebar" data-image="${pageContext.request.contextPath}/backStage/assets/img/sidebar-5.jpg">
            <!--
        Tip 1: You can change the color of the sidebar using: data-color="purple | blue | green | orange | red"

        Tip 2: you can also add an image using data-image tag
    -->
            <div class="sidebar-wrapper">
                <div class="logo">
                    <a href="../home" class="simple-text">
                                               回前台首頁
                    </a>
                </div>
                <ul class="nav">
                    <li class="nav-item active">
                        <a class="nav-link" href="../backStageDashboard">
                            <i class="nc-icon nc-chart-pie-35"></i>
                            <p>後台首頁</p>
                        </a>
                    </li>
                    <li>
                        <a class="nav-link" href="../productTable">
                            <i class="nc-icon nc-notes"></i>
                            <p>產品管理</p>
                        </a>
                    </li>
                    <li>
                        <a class="nav-link" href="backStageUser">
                            <i class="nc-icon nc-notes"></i>
                            <p>會員管理</p>
                        </a>
                    </li>
                    <li>
                        <a class="nav-link" href="../adminCheckOrders">
                            <i class="nc-icon nc-notes"></i>
                            <p>訂單管理</p>
                        </a>
                    </li>
                    <li>
                        <a class="nav-link" href="../report_forum">
                            <i class="nc-icon nc-notes"></i>
                            <p>檢舉文章管理</p>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="main-panel">
       
			
			
	<script>
		$(document).ready(function() {
			
			
			function catchSelect1(){
				var txt = $("#exampleFormControlSelect1 :selected").text();
				if(txt=='請選擇'){
					var clean=null
					$("#exampleFormControlSelect2").html(clean);
				}
			}	

			$("#exampleFormControlSelect1").change(function() {
				catchSelect1();	 
				var txt = $("#exampleFormControlSelect1 :selected").text();
//	 			console.log('Txt 123: '+txt)
				$("#remark").val(txt);
				$.ajax({                                    
					url : "${pageContext.request.contextPath}/categories/" + txt,
					type : "GET",
					dataType : "json",
					async : true,
					contentType : "application/json",
					success : function(data) {
//	                  console.log('remark :'+$("#remark").val() );
						var names = JSON.parse(JSON.stringify(data).split(","));
			 			console.log(typeof names);
						var txt = "<option value='-1' SELECTED>請選擇</option>";
						for (i in names) {
							console.log(i + ' :' + names[i].name);
							txt += "<option value='"+i+"'>" + names[i].name + "</option>";
						}
						$("#exampleFormControlSelect2").html(txt);
					},
					error : function(data, textStatus, errorThrown) {
						console.log(data);
					},
				});
			})
			
				
		$("#exampleFormControlSelect2").change(function() {
				var txt2= $("#exampleFormControlSelect2 :selected").text();
				console.log('txt2:'+txt2)
				$.ajax({
                    success : function(data) {	
                    console.log(typeof txt2+' ，exampleFormControlSelect1Txt(change) :' + txt2)
                    $("#fileName").val(txt2);
                    console.log('fileName :'+$("#fileName").val() );
					},
					error : function(data, textStatus, errorThrown) {
						console.log(data);
					},
				});
			})
			
		});

		//============================================================================================================
		
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
				$("#exampleFormControlSelect1").append(txt);
			},
			error : function(data, textStatus, errorThrown) {
				console.log(data);
			},
		});

				
		$.fn.serializeObject = function() {
			var o = {};
			var a = this.serializeArray();
			$.each(a, function() {
				if (o[this.name]) {
					if (!o[this.name].push) {
						o[this.name] = [ o[this.name] ];
					}
					o[this.name].push(this.value || '');
				} else {
					o[this.name] = this.value || '';
				}
			});
			return JSON.stringify(o);
		};
	</script>
	
	
<div class="content">

		<section>
					<form:form method='POST' modelAttribute="productBeanObject"
						id="formUp" enctype="multipart/form-data">

						<fieldset class='left'>
							<form:input id="product_id" name="product_id" path="product_id"
								type='hidden' />
							<div class="row">
								<div class="col-7">
									<input type="text" readonly class="form-control-plaintext"
										id="staticEmail" value="編號 :${productBeanObject.product_id}">
									<label for='name'>名稱 : </label>
									<form:input id="name" path="name" type='text'
										value="${previousbean.name}" />
										<div>
									<label for="exampleFormControlSelect1">種類 :</label> <select 
										class="form-control" id="exampleFormControlSelect1"
										style="width: 15ch;height:5ch;font-size:15px;"><option value="0" SELECTED>請選擇</option></select>

										</div>
									<label for="exampleFormControlSelect2"></label> <select
										multiple class="form-control" id="exampleFormControlSelect2"
										style="width: 30ch;height:10ch;font-size:15px;"></select> <input id="fileName"
										name="fileName" type="hidden" /> <input id="remark"
										name="remark" type="hidden" /> <label for="m1">
										<input type="radio" name="gender" value="1"> 上架 </label> <label>
										<input type="radio" name="gender" value="2"> 下架
									</label>
								</div>

								<div class="col-5">
									<div>
										<label for='unit_size'>單位 : </label>
										<form:input id="unit_size" path="unit_size" type='text'
											value="${previousbean.unit_size}" />
									</div>
									<div>
										<label for="price">價格 : </label>
										<form:input id="price" path="price" type='text'
											value="${previousbean.price}" />
									</div>
									<div>
										<label for="color">顏色 : </label>
										<form:input id="color" path="color" type='text'
											value="${previousbean.color}" />
									</div>
									<div>
										<label for="stock">庫存 : </label>
										<form:input id="stock" path="stock" type='text'
											value="${previousbean.stock}" />
									</div>
								</div>
								
								<div class="col-3">
									<label for="productImage">圖片 : </label>
									<form:input id="productImage" path="productImage" type='file'
										accept="image/gif, image/jpeg, image/png" />
								</div>
								<div class="col-4">
									<label for="productPictureTwo">圖片2 : </label>
									<form:input id="productPictureTwo" path="productPictureTwo"
										type='file' accept="image/gif, image/jpeg, image/png" />
								</div>
								<div class="col-4">
									<label for="productPictureThree">圖片3 : </label>
									<form:input id="productPictureThree" path="productPictureThree"
										type='file' accept="image/gif, image/jpeg, image/png" />
								</div>

								<div class="col-4" id="uploadImg1"></div>
								<div class="col-4" id="uploadImg3"></div>
								<div class="col-4" id="uploadImg4"></div>
							</div>
                            <div>
							<label for="description">商品描述 :</label>
								<textarea id="" class="form-control" name="description" rows="6" ></textarea>
								<input id="btnAdd" type='submit' class='btn btn-primary' />
                            </div>
						</fieldset>
					</form:form>
				</section>
		
				
<script>


$("#productImage").change(function(){
	  readURL(this);
	  var txt="<img id='preview_progressbarTW_img' src='#' style='margin-left:5ch;' width='125px' height='150px' />"
	  $("#uploadImg1").html(txt);
	});
$("#productPictureTwo").change(function(){
	  readURL3(this);
	  var txt="<img id='preview_progressbarTW_img3' src='#' style='margin-left:5ch;' width='125px' height='150px' />"
	  $("#uploadImg3").html(txt);
	});
$("#productPictureThree").change(function(){
	  readURL4(this);
	  var txt="<img id='preview_progressbarTW_img4' src='#' style='margin-left:5ch;' width='125px' height='150px' />"
	  $("#uploadImg4").html(txt);
	});

 

function readURL(input){

  if(input.files && input.files[0]){

    var reader = new FileReader();

    reader.onload = function (e) {
       $("#preview_progressbarTW_img").attr('src', e.target.result);
    }
    reader.readAsDataURL(input.files[0]);
  }
}
function readURL3(input){

	  if(input.files && input.files[0]){

	    var reader = new FileReader();

	    reader.onload = function (e) {
	       $("#preview_progressbarTW_img3").attr('src', e.target.result);
	    }
	    reader.readAsDataURL(input.files[0]);
	  }
}
function readURL4(input){

	  if(input.files && input.files[0]){

	    var reader = new FileReader();

	    reader.onload = function (e) {
	       $("#preview_progressbarTW_img4").attr('src', e.target.result);
	    }
	    reader.readAsDataURL(input.files[0]);
	  }
}

</script>
		<div class="right">
			<fieldset  style="margin:0;">
				<h1 class="pre">Previous Product</h1>
				<div class="pre">
					<img width='250' height='200'
						src="<c:url value='/getProductPicture/${previousbean.product_id}' />" />
				</div >
				<div class="pre">
				<h2>編碼      :  ${previousbean.product_id}</h2>
				<h2>名稱      :  ${previousbean.name}</h2>
				<h2>種類      :  ${previousbean.categoriesbean.categorybean.name} / ${previousbean.categoriesbean.name}</h2>
				<h3>單位      :  ${previousbean.unit_size}</h3>
				<h3>顏色      : ${previousbean.color}</h3>
				<h3>價格      : ${previousbean.price}</h3>
				<h3>庫存      : ${previousbean.stock}</h3>
				<h3>狀態      : ${status}</h3>
<%--                 <h3>路徑      :..${previousbean.productPictureOnePath}</h3> --%>
<%--                 <h3>路徑      :..${previousbean.productPictureTwoPath}</h3> --%>
<%--                 <h3>路徑      :..${previousbean.productPictureThreePath}</h3> --%>
					<div class="pre">
					<img src="..${previousbean.productPictureOnePath}" />
					<img src="..${previousbean.productPictureTwoPath}" />
					<img src="..${previousbean.productPictureThreePath}" />
				</div >
				</div>
				<c:choose>
				<c:when test="${previousbean.status==1}">
				 <c:set var="status">上架中</c:set>。
				</c:when>
				<c:otherwise>
				<c:set var="status">下架中</c:set>。
				</c:otherwise>
				</c:choose>
				<div class="pre">
					<p>${previousbean.description}</p>
				</div>
			</fieldset>
		</div>
	</div>
           
        </div>
		</div>
		
</body>
<script>
	//使用ckediror需要加入            replace對應到textarea的id 
	CKEDITOR
			.replace(
					'description',
					{
						extraPlugins : 'easyimage',
						cloudServices_tokenUrl : 'https://40733.cke-cs.com/token/dev/Pno0Ld5ha3oNhABb0mnQBXWdL6FXy03CbisbDkPL9hJoOrvd8p0hpHlka5RA',
						cloudServices_uploadUrl : 'https://40733.cke-cs.com/easyimage/upload/'
					});
</script>



<script src="${pageContext.request.contextPath}/backStage/assets/js/core/jquery.3.2.1.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/backStage/assets/js/core/popper.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/backStage/assets/js/core/bootstrap.min.js" type="text/javascript"></script>
<!--  Plugin for Switches, full documentation here: http://www.jque.re/plugins/version3/bootstrap.switch/ -->
<script src="${pageContext.request.contextPath}/backStage/assets/js/plugins/bootstrap-switch.js"></script>
<!--  Chartist Plugin  -->
<script src="${pageContext.request.contextPath}/backStage/assets/js/plugins/chartist.min.js"></script>
<!-- Control Center for Light Bootstrap Dashboard: scripts for the example pages etc -->
<script src="${pageContext.request.contextPath}/backStage/assets/js/light-bootstrap-dashboard.js?v=2.0.0 " type="text/javascript"></script>
<!-- Light Bootstrap Dashboard DEMO methods, don't include it in your project! -->
<script src="${pageContext.request.contextPath}/backStage/assets/js/demo.js"></script>
</html>
