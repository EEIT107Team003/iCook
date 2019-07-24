
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
	border: 1px solid rgb(255, 232, 57);
	width: 600px;
	
}
.left{
/* float: left; */

}
.content{
   overflow: auto;  
   width: 100%;  
   margin-left: 0ch   
}
.formGroup{
  margin-left:20ch;   
  margin-bottom:1ch;
  
}
.des{
   margin-left:22ch;   
}
.formmIn{
font-size:20px;
}

</style>
<title>Products</title>
<link rel='stylesheet'
	href='${pageContext.request.contextPath}/css/styles.css'
	type="text/css" />
</head>
<body>
   <div class="wrapper">
        <div class="sidebar">
            <!--
        Tip 1: You can change the color of the sidebar using: data-color="purple | blue | green | orange | red"

        Tip 2: you can also add an image using data-image tag
    -->
           
            <div class="sidebar-wrapper">
                <div class="logo">
                    <a href="http://www.creative-tim.com" class="simple-text">
                        Creative Tim
                    </a>
                </div>
                <ul class="nav">
                    <li class="nav-item active">
                        <a class="nav-link" href="addSingleProduct">
                            <i class="nc-icon nc-chart-pie-35"></i>
                            <p>addSingleProduct</p>
                        </a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="backStageDashboard">
                            <i class="nc-icon nc-chart-pie-35"></i>
                            <p>Dashboard</p>
                        </a>
                    </li>
                    <li>
                        <a class="nav-link" href="backStageUser">
                            <i class="nc-icon nc-circle-09"></i>
                            <p>User Profile</p>
                        </a>q
                    </li>
                    <li>
                        <a class="nav-link" href="backStageTable">
                            <i class="nc-icon nc-notes"></i>
                            <p>Table List</p>
                        </a>
                    </li>
                    <li>
                        <a class="nav-link" href="backStageTypography">
                            <i class="nc-icon nc-paper-2"></i>
                            <p>Typography</p>
                        </a>
                    </li>
                    <li>
                        <a class="nav-link" href="backStageIcons">
                            <i class="nc-icon nc-atom"></i>
                            <p>Icons</p>
                        </a>
                    </li>
                    <li>
                        <a class="nav-link" href="backStageMaps">
                            <i class="nc-icon nc-pin-3"></i>
                            <p>Maps</p>
                        </a>
                    </li>
                    <li>
                        <a class="nav-link" href="backStageNotifications">
                            <i class="nc-icon nc-bell-55"></i>
                            <p>Notifications</p>
                        </a>
                    </li>
                    <li class="nav-item active active-pro">
                        <a class="nav-link active" href="backStageUpgrade">
                            <i class="nc-icon nc-alien-33"></i>
                            <p>Upgrade to PRO</p>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="main-panel">
            <!-- Navbar -->
            <nav class="navbar navbar-expand-lg " color-on-scroll="500">
                <div class="container-fluid">
                    <a class="navbar-brand" href="#pablo"> Table List </a>
                    <button href="" class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-bar burger-lines"></span>
                        <span class="navbar-toggler-bar burger-lines"></span>
                        <span class="navbar-toggler-bar burger-lines"></span>
                    </button>
                    <div class="collapse navbar-collapse justify-content-end" id="navigation">
                        <ul class="nav navbar-nav mr-auto">
                            <li class="nav-item">
                                <a href="#" class="nav-link" data-toggle="dropdown">
                                    <i class="nc-icon nc-palette"></i>
                                    <span class="d-lg-none">Dashboard</span>
                                </a>
                            </li>
                            <li class="dropdown nav-item">
                                <a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown">
                                    <i class="nc-icon nc-planet"></i>
                                    <span class="notification">5</span>
                                    <span class="d-lg-none">Notification</span>
                                </a>
                                <ul class="dropdown-menu">
                                    <a class="dropdown-item" href="#">Notification 1</a>
                                    <a class="dropdown-item" href="#">Notification 2</a>
                                    <a class="dropdown-item" href="#">Notification 3</a>
                                    <a class="dropdown-item" href="#">Notification 4</a>
                                    <a class="dropdown-item" href="#">Another notification</a>
                                </ul>
                            </li>
                            <li class="nav-item">
                                <a href="#" class="nav-link">
                                    <i class="nc-icon nc-zoom-split"></i>
                                    <span class="d-lg-block">&nbsp;Search</span>
                                </a>
                            </li>
                        </ul>
                        <ul class="navbar-nav ml-auto">
                            <li class="nav-item">
                                <a class="nav-link" href="#pablo">
                                    <span class="no-icon">Account</span>
                                </a>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="http://example.com" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <span class="no-icon">Dropdown</span>
                                </a>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                                    <a class="dropdown-item" href="#">Action</a>
                                    <a class="dropdown-item" href="#">Another action</a>
                                    <a class="dropdown-item" href="#">Something</a>
                                    <a class="dropdown-item" href="#">Something else here</a>
                                    <div class="divider"></div>
                                    <a class="dropdown-item" href="#">Separated link</a>
                                </div>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#pablo">
                                    <span class="no-icon">Log out</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
            <!-- End Navbar -->
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
		<div class="container">
			<h2 style="text-align: center">
				上架產品資料
			</h2>
			<a href='${pageContext.request.contextPath}/products'>查詢所有產品資料</a>
		</div>	
	</section>
	<hr
		style="height: 1px; border: none; color: #333; background-color: #333;">
	<section >
		<!--       三個地方要完全一樣 -->
		<form:form method='POST' modelAttribute="productBeanObject" class="formmIn"
			 enctype="multipart/form-data" >
			<!-- 		                  	enctype="multipart/form-data"一定要加這個屬性才可以使用上傳檔案這個功能 -->
			
			<fieldset class='form-horizontal'>
              <div class="formGroup">
				<form:input id="product_id"  name="product_id" path="product_id"
					type='hidden' />
					  <input type="text" readonly class="form-control-plaintext" 
					  id="staticEmail" value="編號 :${productBeanObject.product_id}">
                </div>
              <div class="formGroup">
					<label for='name'>名稱描述 : </label>
					<form:input id="name" path="name" type='text' />
				</div>

				<div class="formGroup">
					<label for="exampleFormControlSelect1">種類 :</label> <select
						class="form-control" id="exampleFormControlSelect1"
						style="width: 15ch"><option value="0" SELECTED>請選擇</option></select>

					<label for="exampleFormControlSelect2"></label> <select multiple
						class="form-control" id="exampleFormControlSelect2"
						style="width: 30ch"></select> <input id="fileName" name="fileName"
						type="hidden" /> <input id="remark" name="remark" type="hidden" />
				</div>

				<div class="formGroup">
					<label for='unit_size'>單位 : </label>
					<form:input id="unit_size" path="unit_size" type='text' />
				</div>
				<div class="formGroup">
					<label for="price">價格 :  </label>
					<form:input id="price" path="price" type='text' />
				</div>
				<div class="formGroup">
					<label for="color">顏色 : </label>
					<form:input id="color" path="color" type='text' />
				</div>

				<div class="formGroup">
					<label for="stock">庫存 : </label>
					<form:input id="stock" path="stock" type='text' />
				</div>
				<div class="formGroup">
					<label for="productImage">圖片 : </label>
					<form:input id="productImage" path="productImage" type='file' accept="image/gif, image/jpeg, image/png"/>
				</div>
				<div class="formGroup">
					<label for="productPictureOne">圖片2 : </label>
					<form:input id="productPictureOne" path="productPictureOne" type='file' accept="image/gif, image/jpeg, image/png"/>
				</div>
				<div class="formGroup">
					<label for="productPictureTwo">圖片3 : </label>
					<form:input id="productPictureTwo" path="productPictureTwo" type='file' accept="image/gif, image/jpeg, image/png"/>
				</div>
				<div class="formGroup">
					<label for="productPictureThree">圖片4 : </label>
					<form:input id="productPictureThree" path="productPictureThree" type='file' accept="image/gif, image/jpeg, image/png"/>
				</div>
				<div id="uploadImg"></div>
					<div class="formGroup">
						<label for="m1"><input type="radio" name="gender" value="1" >   上架   </label>
						<label> <input type="radio" name="gender" value="2">    下架         </label>
					</div>
					
				<div class="formGroup">
						<label for="description">商品描述 :</label>
						<textarea id="" class="form-control" name="description" rows="6"></textarea>
					</div>
				<div class="formGroup">
					<input id="btnAdd" type='submit' class='btn btn-primary'
						value="Submit" />
				</div>
				
			</fieldset>
		</form:form>
		
		
<script>

$("#productImage").change(function(){
	  readURL(this);
	  var txt="<img id='preview_progressbarTW_img' src='#' style='margin-left:5ch;' width='300px' height='300px' />"
	  $("#uploadImg").html(txt);
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

</script>
	</section>
	</div>
	</div>
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
            <footer class="footer">
                <div class="container-fluid">
                    <nav>
                        <ul class="footer-menu">
                            <li>
                                <a href="#">
                                    Home
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    Company
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    Portfolio
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    Blog
                                </a>
                            </li>
                        </ul>，
                        <p class="copyright text-center">
                            ©
                            <script>
                                document.write(new Date().getFullYear())
                            </script>
                            <a href="http://www.creative-tim.com">Creative Tim</a>, made with love for a better web
                        </p>
                    </nav>
                </div>
                
            </footer>
        </div>
</body>

<script src="${pageContext.request.contextPath}/backStage/assets/js/core/jquery.3.2.1.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/backStage/assets/js/core/popper.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/backStage/assets/js/core/bootstrap.min.js" type="text/javascript"></script>
<!--  Plugin for Switches, full documentation here: http://www.jque.re/plugins/version3/bootstrap.switch/ -->
<script src="${pageContext.request.contextPath}/backStage/assets/js/plugins/bootstrap-switch.js"></script>
<!--  Google Maps Plugin    -->
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
<!--  Chartist Plugin  -->
<script src="${pageContext.request.contextPath}/backStage/assets/js/plugins/chartist.min.js"></script>
<!--  Notifications Plugin    -->
<script src="${pageContext.request.contextPath}/backStage/assets/js/plugins/bootstrap-notify.js"></script>
<!-- Control Center for Light Bootstrap Dashboard: scripts for the example pages etc -->
<script src="${pageContext.request.contextPath}/backStage/assets/js/light-bootstrap-dashboard.js?v=2.0.0 " type="text/javascript"></script>
<!-- Light Bootstrap Dashboard DEMO methods, don't include it in your project! -->
<script src="${pageContext.request.contextPath}/backStage/assets/js/demo.js"></script>
</html>
