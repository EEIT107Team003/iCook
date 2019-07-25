<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
<!-- google font -->
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+TC&display=swap"
	rel="stylesheet">
<!-- google font -->


<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel='stylesheet'
	href='${pageContext.request.contextPath}/css/fontawesome-free/css/all.min.css'
	type="text/css" />
<link rel="apple-touch-icon" sizes="76x76"
	href="backStage/assets/img/apple-icon.png">
<link rel="icon" type="image/png" href="../assets/img/favicon.ico">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>Light Bootstrap Dashboard - Free Bootstrap 4 Admin
	Dashboard by Creative Tim</title>
<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no'
	name='viewport' />
<!--     Fonts and icons     -->
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200"
	rel="stylesheet" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />
<!-- CSS Files -->
<link href="backStage/assets/css/bootstrap.min.css" rel="stylesheet" />
<link href="backStage/assets/css/light-bootstrap-dashboard.css?v=2.0.0 "
	rel="stylesheet" />
<!-- CSS Just for demo purpose, don't include it in your project -->
<link href="backStage/assets/css/demo.css" rel="stylesheet" />
<link
	href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel='stylesheet'
	href='${pageContext.request.contextPath}/css/fontawesome-free/css/all.min.css'
	type="text/css" />
<style type="text/css">
.outer {
	margin: 50px 5% 20% 10%;
}

td {
	text-align: center;
}
th {
	text-align: center;
}
.urgent {
	background-color: red;
}



.shrink {
	margin-left: 10%;
	margin-right: 10%;
	margin-top: 5%;
}

td{
	text-align: center;
	font-size: 20px;
	font-family: 'Noto Sans TC', sans-serif;
	line-height: 20px;
}
th{ 

} 
.thnew{
font-family: 'Noto Sans TC', sans-serif;
font-size: 20px;
text-align: center;
color: #aa4fff;

}

.thnewHeader{
	font-family: 'Noto Sans TC', sans-serif;
}



td {
	
}
</style>
<script type="text/javascript">
	function setOK(obj) {
		var msg = "確定收到款項了嗎";
		if (confirm(msg) == true) {
			window.location.href = '/icook/setPaymentOK?id=' + obj.id;
			return true;
		}
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
					<a href="/icook" class="simple-text">
						回醜後台 </a>
				</div>
				<ul class="nav">
					<li><a class="nav-link" href="backStageDashboard"> <i
							class="nc-icon nc-chart-pie-35"></i>
							<p>Dashboard</p>
					</a></li>
					<li><a class="nav-link" href="productTable"> <i
							class="nc-icon nc-chart-pie-35"></i>
							<p>productTable</p>
					</a></li>
					<li><a class="nav-link" href="backStageUser"> <i
							class="nc-icon nc-circle-09"></i>
							<p>User Profile</p>
					</a></li>
					<li class="nav-item active"><a class="nav-link"
						href="adminCheckOrders"> <i class="nc-icon nc-notes"></i>
							<p>訂單管理</p>
					</a></li>
					<li>
                        <a class="nav-link" href="report_forum">
                            <i class="nc-icon nc-notes"></i>
                            <p>檢舉文章管理</p>
                        </a>
                    </li>
					<li><a class="nav-link" href="backStageTypography"> <i
							class="nc-icon nc-paper-2"></i>
							<p>Typography</p>
					</a></li>
					<li><a class="nav-link" href="backStageIcons"> <i
							class="nc-icon nc-atom"></i>
							<p>Icons</p>
					</a></li>
					<li><a class="nav-link" href="backStageMaps"> <i
							class="nc-icon nc-pin-3"></i>
							<p>Maps</p>
					</a></li>
					<li><a class="nav-link" href="backStageNotifications"> <i
							class="nc-icon nc-bell-55"></i>
							<p>Notifications</p>
					</a></li>
					<li class="nav-item active active-pro"><a
						class="nav-link active" href="backStageUpgrade"> <i
							class="nc-icon nc-alien-33"></i>
							<p>Upgrade to PRO</p>
					</a></li>
				</ul>
			</div>
		</div>
		<div class="main-panel">
			<!-- Navbar -->
<!-- 			<nav class="navbar navbar-expand-lg " color-on-scroll="500"> -->
<!-- 				<div class="container-fluid"> -->
<!-- <!-- 					<a class="navbar-brand" href="#pablo"> Table List </a> -->
<!-- 					<button href="" class="navbar-toggler navbar-toggler-right" -->
<!-- 						type="button" data-toggle="collapse" -->
<!-- 						aria-controls="navigation-index" aria-expanded="false" -->
<!-- 						aria-label="Toggle navigation"> -->
<!-- 						<span class="navbar-toggler-bar burger-lines"></span> <span -->
<!-- 							class="navbar-toggler-bar burger-lines"></span> <span -->
<!-- 							class="navbar-toggler-bar burger-lines"></span> -->
<!-- 					</button> -->
<!-- 					<div class="collapse navbar-collapse justify-content-end" -->
<!-- 						id="navigation"> -->
<!-- 						<ul class="nav navbar-nav mr-auto"> -->
<!-- 							<li class="nav-item"><a href="#" class="nav-link" -->
<!-- 								data-toggle="dropdown"> <i class="nc-icon nc-palette"></i> <span -->
<!-- 									class="d-lg-none">Dashboard</span> -->
<!-- 							</a></li> -->
<!-- 							<li class="dropdown nav-item"><a href="#" -->
<!-- 								class="dropdown-toggle nav-link" data-toggle="dropdown"> <i -->
<!-- 									class="nc-icon nc-planet"></i> <span class="notification">5</span> -->
<!-- 									<span class="d-lg-none">Notification</span> -->
<!-- 							</a> -->
<!-- 								<ul class="dropdown-menu"> -->
<!-- 									<a class="dropdown-item" href="#">Notification 1</a> -->
<!-- 									<a class="dropdown-item" href="#">Notification 2</a> -->
<!-- 									<a class="dropdown-item" href="#">Notification 3</a> -->
<!-- 									<a class="dropdown-item" href="#">Notification 4</a> -->
<!-- 									<a class="dropdown-item" href="#">Another notification</a> -->
<!-- 								</ul></li> -->
<!-- 							<li class="nav-item"><a href="#" class="nav-link"> <i -->
<!-- 									class="nc-icon nc-zoom-split"></i> <span class="d-lg-block">&nbsp;Search</span> -->
<!-- 							</a></li> -->
<!-- 						</ul> -->
<!-- 						<ul class="navbar-nav ml-auto"> -->
<!-- 							<li class="nav-item"><a class="nav-link" href="#pablo"> -->
<!-- 									<span class="no-icon">Account</span> -->
<!-- 							</a></li> -->
<!-- 							<li class="nav-item dropdown"><a -->
<!-- 								class="nav-link dropdown-toggle" href="http://example.com" -->
<!-- 								id="navbarDropdownMenuLink" data-toggle="dropdown" -->
<!-- 								aria-haspopup="true" aria-expanded="false"> <span -->
<!-- 									class="no-icon">Dropdown</span> -->
<!-- 							</a> -->
<!-- 								<div class="dropdown-menu" -->
<!-- 									aria-labelledby="navbarDropdownMenuLink"> -->
<!-- 									<a class="dropdown-item" href="#">Action</a> <a -->
<!-- 										class="dropdown-item" href="#">Another action</a> <a -->
<!-- 										class="dropdown-item" href="#">Something</a> <a -->
<!-- 										class="dropdown-item" href="#">Something else here</a> -->
<!-- 									<div class="divider"></div> -->
<!-- 									<a class="dropdown-item" href="#">Separated link</a> -->
<!-- 								</div></li> -->
<!-- 							<li class="nav-item"><a class="nav-link" href="#pablo"> -->
<!-- 									<span class="no-icon">Log out</span> -->
<!-- 							</a></li> -->
<!-- 						</ul> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</nav> -->
			<!-- End Navbar -->
			<div class="content">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-12">
							<div class="card strpied-tabled-with-hover">
								<div class="card-header ">
<!-- 									<h4 class="card-title">訂單總覽</h4> -->
									<!--                                     <p class="card-category">Here is a subtitle for this table</p> -->
								</div>
								<div class="card-body table-full-width table-responsive">
									<h1 class='thnewHeader' align='center'>
										<c:out value="---------------------------------------------系統訂單總覽---------------------------------------------" />
									</h1>
									<div class="outer">
										<table class="table table-hover">
											<thead>
												<tr>
													<th scope="col" ><p class='thnew'>系統訂單號</p></th>
													<th scope="col" style='background-color: '><p class='thnew'>訂單詳情</p></th>
													<th scope="col" style='background-color: '><p class='thnew'>訂購日期</p></th>
													<th scope="col"
														style='background-color: '><p class='thnew'>預計出貨時間</p></th>
													<th scope="col"
														style='background-color: '><p class='thnew'>訂購會員</p></th>
													<th scope="col" style='background-color: '><p class='thnew'>應收金額</p></th>
													<!-- 					<th scope="col" style='background-color: #ffbfa7'>付款方式</th> -->
<!-- 													<th scope="col" style='background-color:'>發貨地址</th> -->
													<th scope="col" style='background-color:'><p class='thnew'>發票</p></th>
													<th scope="col" style='background-color:'><p class='thnew'>款項查核</p></th>
<!-- 													<th scope="col" style='background-color: '><p class='thnew'><a href='orders.xls'>匯出xls</a></p></th> -->
													<th scope="col" style='background-color: '><p class="btn btn-warning"><a href='orders.xls' style='color:black'>匯出xls</a></p></th>
												</tr>
											</thead>
											<tbody>




												<c:forEach var='OrderBean' items='${orders_list}'>
													<tr>
														<td>${OrderBean.orderNo}</td>

														<%-- 						<td id='odno'>${OrderBean.orderNo}</td> --%>
														<td>
															<form method='POST'
																action="<c:url value='/adminCheckOrderDetails?id=${OrderBean.memberbean.member_id}'/>">
																<input type="hidden" name="adminCheck" value="admin" />
																<input type="hidden" name="OrderNo"
																	value="${OrderBean.orderNo}" /> <input
																	class="btn btn-outline-success" type="submit"
																	value="檢視該訂單" />
															</form>
														</td>
														<td>${OrderBean.orderDate}</td>
														<c:set var="contains" value="no" />
														<c:forEach var="urgentOrderNo" items="${urgentOrders_No}">
															<c:if test="${urgentOrderNo eq OrderBean.orderNo}">
																<c:set var="contains" value="yes" />
															</c:if>
														</c:forEach>
														<c:choose>
															<c:when test="${contains=='yes'}">
																<td id='odno' class='urgent'>${OrderBean.shippingDate}</td>
																<script type="text/javascript">
																	
																</script>
															</c:when>
															<c:otherwise>
																<td>${OrderBean.shippingDate}</td>
																<script type="text/javascript">
																	
																</script>
															</c:otherwise>
														</c:choose>


														<td>${OrderBean.memberbean.username}</td>
														<td>${OrderBean.totalAmount}</td>
<%-- 														<td>${OrderBean.shippingAddress}</td> --%>
														<td>${OrderBean.invoiceTitle}</td>
														<c:set var="contains" value="no" />
														<c:if test="${OrderBean.payment eq 'OK'}">
															<c:set var="contains" value="yes" />
															<script type="text/javascript">
																
															</script>
														</c:if>

														<c:choose>
															<c:when test="${contains=='yes'}">
																<script type="text/javascript">
																	
																</script>
																<td>查核完畢</td>
															</c:when>
															<c:otherwise>
																<script type="text/javascript">
																	
																</script>
																<td><input type="button" class="btn btn-success"
																	id="${OrderBean.orderNo}" onclick='setOK(this)'
																	value="收到款項"></td>
															</c:otherwise>
														</c:choose>
														<c:set var="contains" value="no" />
														<%-- 						<td><input type="button" id="${OrderBean.orderNo}" onclick='setOK(this)' value="OK"></td> --%>
														<td></td>
													</tr>

												</c:forEach>
											</tbody>
										</table>
									</div>
									<!--                                     <table class="table table-hover table-striped"> -->
									<!--                                         <thead> -->
									<!--                                             <th>ID</th> -->
									<!--                                             <th>Name</th> -->
									<!--                                             <th>Salary</th> -->
									<!--                                             <th>Country</th> -->
									<!--                                             <th>City</th> -->
									<!--                                         </thead> -->
									<!--                                         <tbody> -->
									<!--                                             <tr> -->
									<!--                                                 <td>1</td> -->
									<!--                                                 <td>Dakota Rice</td> -->
									<!--                                                 <td>$36,738</td> -->
									<!--                                                 <td>Niger</td> -->
									<!--                                                 <td>Oud-Turnhout</td> -->
									<!--                                             </tr> -->
									<!--                                             <tr> -->
									<!--                                                 <td>2</td> -->
									<!--                                                 <td>Minerva Hooper</td> -->
									<!--                                                 <td>$23,789</td> -->
									<!--                                                 <td>Curaçao</td> -->
									<!--                                                 <td>Sinaai-Waas</td> -->
									<!--                                             </tr> -->
									<!--                                             <tr> -->
									<!--                                                 <td>3</td> -->
									<!--                                                 <td>Sage Rodriguez</td> -->
									<!--                                                 <td>$56,142</td> -->
									<!--                                                 <td>Netherlands</td> -->
									<!--                                                 <td>Baileux</td> -->
									<!--                                             </tr> -->
									<!--                                             <tr> -->
									<!--                                                 <td>4</td> -->
									<!--                                                 <td>Philip Chaney</td> -->
									<!--                                                 <td>$38,735</td> -->
									<!--                                                 <td>Korea, South</td> -->
									<!--                                                 <td>Overland Park</td> -->
									<!--                                             </tr> -->
									<!--                                             <tr> -->
									<!--                                                 <td>5</td> -->
									<!--                                                 <td>Doris Greene</td> -->
									<!--                                                 <td>$63,542</td> -->
									<!--                                                 <td>Malawi</td> -->
									<!--                                                 <td>Feldkirchen in Kärnten</td> -->
									<!--                                             </tr> -->
									<!--                                             <tr> -->
									<!--                                                 <td>6</td> -->
									<!--                                                 <td>Mason Porter</td> -->
									<!--                                                 <td>$78,615</td> -->
									<!--                                                 <td>Chile</td> -->
									<!--                                                 <td>Gloucester</td> -->
									<!--                                             </tr> -->
									<!--                                         </tbody> -->
									<!--                                     </table> -->
								</div>
							</div>
						</div>
<!-- 						<div class="col-md-12"> -->
<!-- 							<div class="card card-plain table-plain-bg"> -->
<!-- 								<div class="card-header "> -->
<!-- 									<h4 class="card-title">Table on Plain Background</h4> -->
<!-- 									<p class="card-category">Here is a subtitle for this table</p> -->
<!-- 								</div> -->
<!-- 								<div class="card-body table-full-width table-responsive"> -->
<!-- 									<table class="table table-hover"> -->
<!-- 										<thead> -->
<!-- 											<th>ID</th> -->
<!-- 											<th>Name</th> -->
<!-- 											<th>Salary</th> -->
<!-- 											<th>Country</th> -->
<!-- 											<th>City</th> -->
<!-- 										</thead> -->
<!-- 										<tbody> -->
<!-- 											<tr> -->
<!-- 												<td>1</td> -->
<!-- 												<td>Dakota Rice</td> -->
<!-- 												<td>$36,738</td> -->
<!-- 												<td>Niger</td> -->
<!-- 												<td>Oud-Turnhout</td> -->
<!-- 											</tr> -->
<!-- 											<tr> -->
<!-- 												<td>2</td> -->
<!-- 												<td>Minerva Hooper</td> -->
<!-- 												<td>$23,789</td> -->
<!-- 												<td>Curaçao</td> -->
<!-- 												<td>Sinaai-Waas</td> -->
<!-- 											</tr> -->
<!-- 											<tr> -->
<!-- 												<td>3</td> -->
<!-- 												<td>Sage Rodriguez</td> -->
<!-- 												<td>$56,142</td> -->
<!-- 												<td>Netherlands</td> -->
<!-- 												<td>Baileux</td> -->
<!-- 											</tr> -->
<!-- 											<tr> -->
<!-- 												<td>4</td> -->
<!-- 												<td>Philip Chaney</td> -->
<!-- 												<td>$38,735</td> -->
<!-- 												<td>Korea, South</td> -->
<!-- 												<td>Overland Park</td> -->
<!-- 											</tr> -->
<!-- 											<tr> -->
<!-- 												<td>5</td> -->
<!-- 												<td>Doris Greene</td> -->
<!-- 												<td>$63,542</td> -->
<!-- 												<td>Malawi</td> -->
<!-- 												<td>Feldkirchen in Kärnten</td> -->
<!-- 											</tr> -->
<!-- 											<tr> -->
<!-- 												<td>6</td> -->
<!-- 												<td>Mason Porter</td> -->
<!-- 												<td>$78,615</td> -->
<!-- 												<td>Chile</td> -->
<!-- 												<td>Gloucester</td> -->
<!-- 											</tr> -->
<!-- 										</tbody> -->
<!-- 									</table> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
					</div>
				</div>
			</div>
			<footer class="footer">
				<div class="container-fluid">
					<nav>
						<ul class="footer-menu">
							<li><a href="#"> Home </a></li>
							<li><a href="#"> Company </a></li>
							<li><a href="#"> Portfolio </a></li>
							<li><a href="#"> Blog </a></li>
						</ul>
						<p class="copyright text-center">
							©
							<script>
								document.write(new Date().getFullYear())
							</script>
							<a href="http://www.creative-tim.com">Creative Tim</a>, made with
							love for a better web
						</p>
					</nav>
				</div>
			</footer>
		</div>
	</div>
	<!--   -->
	<!-- <div class="fixed-plugin">
    <div class="dropdown show-dropdown">
        <a href="#" data-toggle="dropdown">
            <i class="fa fa-cog fa-2x"> </i>
        </a>

        <ul class="dropdown-menu">
			<li class="header-title"> Sidebar Style</li>
            <li class="adjustments-line">
                <a href="javascript:void(0)" class="switch-trigger">
                    <p>Background Image</p>
                    <label class="switch">
                        <input type="checkbox" data-toggle="switch" checked="" data-on-color="primary" data-off-color="primary"><span class="toggle"></span>
                    </label>
                    <div class="clearfix"></div>
                </a>
            </li>
            <li class="adjustments-line">
                <a href="javascript:void(0)" class="switch-trigger background-color">
                    <p>Filters</p>
                    <div class="pull-right">
                        <span class="badge filter badge-black" data-color="black"></span>
                        <span class="badge filter badge-azure" data-color="azure"></span>
                        <span class="badge filter badge-green" data-color="green"></span>
                        <span class="badge filter badge-orange" data-color="orange"></span>
                        <span class="badge filter badge-red" data-color="red"></span>
                        <span class="badge filter badge-purple active" data-color="purple"></span>
                    </div>
                    <div class="clearfix"></div>
                </a>
            </li>
            <li class="header-title">Sidebar Images</li>

            <li class="active">
                <a class="img-holder switch-trigger" href="javascript:void(0)">
                    <img src="../assets/img/sidebar-1.jpg" alt="" />
                </a>
            </li>
            <li>
                <a class="img-holder switch-trigger" href="javascript:void(0)">
                    <img src="../assets/img/sidebar-3.jpg" alt="" />
                </a>
            </li>
            <li>
                <a class="img-holder switch-trigger" href="javascript:void(0)">
                    <img src="..//assets/img/sidebar-4.jpg" alt="" />
                </a>
            </li>
            <li>
                <a class="img-holder switch-trigger" href="javascript:void(0)">
                    <img src="../assets/img/sidebar-5.jpg" alt="" />
                </a>
            </li>

            <li class="button-container">
                <div class="">
                    <a href="http://www.creative-tim.com/product/light-bootstrap-dashboard" target="_blank" class="btn btn-info btn-block btn-fill">Download, it's free!</a>
                </div>
            </li>

            <li class="header-title pro-title text-center">Want more components?</li>

            <li class="button-container">
                <div class="">
                    <a href="http://www.creative-tim.com/product/light-bootstrap-dashboard-pro" target="_blank" class="btn btn-warning btn-block btn-fill">Get The PRO Version!</a>
                </div>
            </li>

            <li class="header-title" id="sharrreTitle">Thank you for sharing!</li>

            <li class="button-container">
				<button id="twitter" class="btn btn-social btn-outline btn-twitter btn-round sharrre"><i class="fa fa-twitter"></i> · 256</button>
                <button id="facebook" class="btn btn-social btn-outline btn-facebook btn-round sharrre"><i class="fa fa-facebook-square"></i> · 426</button>
            </li>
        </ul>
    </div>
</div>
 -->
</body>
<!--   Core JS Files   -->
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
<script type="text/javascript"
	src='${pageContext.request.contextPath}/css/fontawesome-free/js/all.min.js'></script>



<script
	src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>

<script src="backStage/assets/js/core/jquery.3.2.1.min.js"
	type="text/javascript"></script>
<script src="backStage/assets/js/core/popper.min.js"
	type="text/javascript"></script>
<script src="backStage/assets/js/core/bootstrap.min.js"
	type="text/javascript"></script>
<!--  Plugin for Switches, full documentation here: http://www.jque.re/plugins/version3/bootstrap.switch/ -->
<script src="backStage/assets/js/plugins/bootstrap-switch.js"></script>
<!--  Google Maps Plugin    -->
<script type="text/javascript"
	src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
<!--  Chartist Plugin  -->
<script src="backStage/assets/js/plugins/chartist.min.js"></script>
<!--  Notifications Plugin    -->
<script src="backStage/assets/js/plugins/bootstrap-notify.js"></script>
<!-- Control Center for Light Bootstrap Dashboard: scripts for the example pages etc -->
<script src="backStage/assets/js/light-bootstrap-dashboard.js?v=2.0.0 "
	type="text/javascript"></script>
<!-- Light Bootstrap Dashboard DEMO methods, don't include it in your project! -->
<script src="backStage/assets/js/demo.js"></script>

</html>
