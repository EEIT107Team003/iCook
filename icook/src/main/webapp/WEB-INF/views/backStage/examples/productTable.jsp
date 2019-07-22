<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--
=========================================================
 Light Bootstrap Dashboard - v2.0.1
=========================================================

 Product Page: https://www.creative-tim.com/product/light-bootstrap-dashboard
 Copyright 2019 Creative Tim (https://www.creative-tim.com)
 Licensed under MIT (https://github.com/creativetimofficial/light-bootstrap-dashboard/blob/master/LICENSE)

 Coded by Creative Tim

=========================================================

 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.  -->
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <link rel="apple-touch-icon" sizes="76x76" href="backStage/assets/img/apple-icon.png">
    <link rel="icon" type="image/png" href="../assets/img/favicon.ico">
    <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>Light Bootstrap Dashboard - Free Bootstrap 4 Admin Dashboard by Creative Tim</title>
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
    <!--     Fonts and icons     -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />
    <!-- CSS Files -->
    <link href="backStage/assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="backStage/assets/css/light-bootstrap-dashboard.css?v=2.0.0 " rel="stylesheet" />
    <!-- CSS Just for demo purpose, don't include it in your project -->
    <link href="backStage/assets/css/demo.css" rel="stylesheet" />
<style type="text/css">
.container{
padding: 0;
margin: 0;
}

.container select{
padding: 0;
margin: 0;
margin-top:2ch;
font-size:10px;
width:20ch;
hight:10px;
float:left;
}
#description{
width:30ch;
}
#searchSub{
float:right;
}

</style>

<script type="text/javascript">
	firstShow();
	
	function firstShow() {
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
					txt += "<option value='"+i+"'>" + names[i].name
							+ "</option>";
				}
				$("#show").append(txt);
			},
			error : function(data, textStatus, errorThrown) {
				console.log(data);
			},
		});
	}
	
	$(document).ready(function() {
		


	function catchSelect1() {
		var txt = $("#show :selected").text();
		if (txt == '請選擇') {
			var clean = null
			$("#show2").html(clean);
		}
	}

	function cleanAllSelect() {
		secondShow()
		var clean = null
		$("#show2").html(clean);
	}

	$("#show2").change(function() {
		search2();
	})

	$("#show").change(function() {
		catchSelect1();
		search();
	})

	function search() {
		var txt = $("#show :selected").text();
		//			console.log('Txt 123: '+txt)
		$("#remark").val(txt);
		$("#fileName").val("");
		//			alert($("#remark").val());
		$.ajax({
			url : "${pageContext.request.contextPath}/categories/" + txt,
			type : "GET",
			dataType : "json",
			async : true,
			contentType : "application/json",
			success : function(data) {
				//              console.log('remark :'+$("#remark").val() );
				var names = JSON.parse(JSON.stringify(data).split(","));
				//		 			console.log(typeof names);
				var txt = "<option value='-1' SELECTED id='cr'>請選擇</option>";
				for (i in names) {
					//						console.log(i + ' :' + names[i].name);
					txt += "<option value='"+i+"'>" + names[i].name
							+ "</option>";
				}
				$("#show2").html(txt);
			},
			error : function(data, textStatus, errorThrown) {
				console.log(data);
			},
		});
	}

	function search2() {
		var txt2 = $("#show2 :selected").text();
		$.ajax({
			success : function(data) {
				$("#fileName").val(txt2);
			},
			error : function(data, textStatus, errorThrown) {
				console.log(data);
			},
		});
	}
	

	
	$("#searchSub").click(function() {
		catchSelect1();	 
		selectAll();
	})
	
	
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
	
// ==============END Document
	})
	
	
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
	        	            	if(names[i].status==1)
	        	            		names[i].status='上架中'
	        	            	if(names[i].status==2)
	        	            		names[i].status='下架中'
	        					txt += "<tr>"
	        					+"<td>"+names[i].product_id+"</td>"
	        					+"<td><img width='130px' height='130px'  src='${pageContext.request.contextPath}/getProductPicture/"+names[i].product_id+"'></td>"
	        					+"<td>"+names[i].name+"</td>"
	        					+"<td>"+names[i].categoriesbean.categorybean.name+" / "+names[i].categoriesbean.name+"</td>"
	        					+"<td>"+names[i].price+"</td>"
	        					+"<td>"+names[i].status+"</td>"
	        					+"<td>"+names[i].stock+"</td>"
	        					+"<td><a class='btn btn-sm btn-outline-secondary'  href='${pageContext.request.contextPath}/products/upd?id="+names[i].product_id+"'    >Update</a> </td>"
	        					+"</tr>";
	        				}
	        				$("#Main").html(txt);
					    }
				     })
	              }
	
	    
</script>
</head>

<body>
    <div class="wrapper">
        <div class="sidebar" data-image="backStage/assets/img/sidebar-5.jpg">
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
                        </a>
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
            <script type="text/javascript">
        	firstShow();
            function firstShow(){
        	$.ajax({
        			url : "${pageContext.request.contextPath}/allProductForProductTable",
        			type : "POST",
        			dataType : "json",
        			contentType : "application/json",
        			async : true,
        			success : function(data) {
        				var names = JSON.parse(JSON.stringify(data).split(","));
        				var txt = "";
        	            for (i in names) {
        	            	if(names[i].status==1)
        	            		names[i].status='上架中'
        	            	if(names[i].status==2)
        	            		names[i].status='下架中'
        					txt += "<tr>"
        					+"<td>"+names[i].product_id+"</td>"
        					+"<td><img width='130px' height='130px'  src='${pageContext.request.contextPath}/getProductPicture/"+names[i].product_id+"'></td>"
        					+"<td>"+names[i].name+"</td>"
        					+"<td>"+names[i].categoriesbean.categorybean.name+" / "+names[i].categoriesbean.name+"</td>"
        					+"<td>"+names[i].price+"</td>"
        					+"<td>"+names[i].status+"</td>"
        					+"<td>"+names[i].stock+"</td>"
        					+"<td><a class='btn btn-sm btn-outline-secondary'  href='${pageContext.request.contextPath}/products/upd?id="+names[i].product_id+"'    >Update</a> </td>"
        					+"</tr>";
        				}
        				$("#Main").html(txt);
        			},
        			error : function(data, textStatus, errorThrown) {
        				console.log(data);
        			},
        		});
            }
        	
            </script>
            <div class="content">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card strpied-tabled-with-hover">
                                <div class="card-header ">
                                    <h4 class="card-title">產品後台</h4>
                                    <p class="card-category">Here is the background of the product</p>
									<a href="${pageContext.request.contextPath}/products/add" style="width:10ch;height:4ch;margin:1ch;" class="btn btn-secondary" 
									role="button" aria-pressed="true">Insert</a>
							     	<a href="productsEx.xls" class="btn btn-secondary btn-lg active" role="button" aria-pressed="true" style="line-height:5px;margin:1ch;" >AllProductsExcel</a>
									<section class="container">
										<nav class="navbar navbar-light bg-light">
											<form class="searchDiv"  method="GET" id="searchDiv"  action="productsByCategoryEx.xls"
												class="form-inline">
												<input id="fileName" name="fileName" type="hidden" /> <input
													id="remark" name="remark" type="hidden" /><input
													id="stock" name="stock" type="hidden" />
													
													<select id="show" name="show"
												class="form-control form-control-sm"><option
													value="0" SELECTED id='ch'>請選擇</option></select> <select id="show2" 
												name="show2" class="form-control form-control-sm">
											</select>
													<input id="description" name="description" type="text"  style="height:5ch"
														class="form-control mr-sm-2" placeholder="Search">
															<input type="submit" class="btn btn-secondary" value="ProductsExcel"  style="margin-left:35ch;;height:4ch;">
														<input type="button" id="searchSub"
									class="btn btn-secondary"  style="width:10ch;height:4ch;margin-top:2ch;" value="Search">
											</form>
										</nav>
									</section>
								</div>
								<p>
								<p>
								<p>
                                    <table class="table table-hover table-striped">
                                        <thead>
                                            <th>ID</th>
                                            <th>Name</th>
                                            <th>Picture</th>
                                            <th>Category</th>
                                            <th>Price</th>
                                            <th>status</th>
                                            <th>stock</th>
                                        </thead>
                                        <tbody id="Main">
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
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
                        </ul>
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
<!--   Core JS Files   -->
<script src="backStage/assets/js/core/jquery.3.2.1.min.js" type="text/javascript"></script>
<script src="backStage/assets/js/core/popper.min.js" type="text/javascript"></script>
<script src="backStage/assets/js/core/bootstrap.min.js" type="text/javascript"></script>
<!--  Plugin for Switches, full documentation here: http://www.jque.re/plugins/version3/bootstrap.switch/ -->
<script src="backStage/assets/js/plugins/bootstrap-switch.js"></script>
<!--  Google Maps Plugin    -->
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
<!--  Chartist Plugin  -->
<script src="backStage/assets/js/plugins/chartist.min.js"></script>
<!--  Notifications Plugin    -->
<script src="backStage/assets/js/plugins/bootstrap-notify.js"></script>
<!-- Control Center for Light Bootstrap Dashboard: scripts for the example pages etc -->
<script src="backStage/assets/js/light-bootstrap-dashboard.js?v=2.0.0 " type="text/javascript"></script>
<!-- Light Bootstrap Dashboard DEMO methods, don't include it in your project! -->
<script src="backStage/assets/js/demo.js"></script>

</html>
