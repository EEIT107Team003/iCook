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
					<a href="/icook" class="simple-text"> 回醜後台 </a>
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
			<nav class="navbar navbar-expand-lg " color-on-scroll="500">
				<div class="container-fluid">
					<!-- 					<a class="navbar-brand" href="#pablo"> Table List </a> -->
					<button href="" class="navbar-toggler navbar-toggler-right"
						type="button" data-toggle="collapse"
						aria-controls="navigation-index" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-bar burger-lines"></span> <span
							class="navbar-toggler-bar burger-lines"></span> <span
							class="navbar-toggler-bar burger-lines"></span>
					</button>
					<div class="collapse navbar-collapse justify-content-end"
						id="navigation">
						<ul class="nav navbar-nav mr-auto">
							<li class="nav-item"><a href="#" class="nav-link"
								data-toggle="dropdown"> <i class="nc-icon nc-palette"></i> <span
									class="d-lg-none">Dashboard</span>
							</a></li>
							<li class="dropdown nav-item"><a href="#"
								class="dropdown-toggle nav-link" data-toggle="dropdown"> <i
									class="nc-icon nc-planet"></i> <span class="notification">5</span>
									<span class="d-lg-none">Notification</span>
							</a>
								<ul class="dropdown-menu">
									<a class="dropdown-item" href="#">Notification 1</a>
									<a class="dropdown-item" href="#">Notification 2</a>
									<a class="dropdown-item" href="#">Notification 3</a>
									<a class="dropdown-item" href="#">Notification 4</a>
									<a class="dropdown-item" href="#">Another notification</a>
								</ul></li>
							<li class="nav-item"><a href="#" class="nav-link"> <i
									class="nc-icon nc-zoom-split"></i> <span class="d-lg-block">&nbsp;Search</span>
							</a></li>
						</ul>
						<ul class="navbar-nav ml-auto">
							<li class="nav-item"><a class="nav-link" href="#pablo">
									<span class="no-icon">Account</span>
							</a></li>
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" href="http://example.com"
								id="navbarDropdownMenuLink" data-toggle="dropdown"
								aria-haspopup="true" aria-expanded="false"> <span
									class="no-icon">Dropdown</span>
							</a>
								<div class="dropdown-menu"
									aria-labelledby="navbarDropdownMenuLink">
									<a class="dropdown-item" href="#">Action</a> <a
										class="dropdown-item" href="#">Another action</a> <a
										class="dropdown-item" href="#">Something</a> <a
										class="dropdown-item" href="#">Something else here</a>
									<div class="divider"></div>
									<a class="dropdown-item" href="#">Separated link</a>
								</div></li>
							<li class="nav-item"><a class="nav-link" href="#pablo">
									<span class="no-icon">Log out</span>
							</a></li>
						</ul>
					</div>
				</div>
			</nav>
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
									<h1>
										<c:out value="被檢舉文章一覽" />
									</h1>
									<div class="outer" style="text-align:left;">
										<table class="table table-hover">
											<thead>
												<c:out value="管理者ID:${LoginOK.member_id}"></c:out>
												
											</thead>
											<tbody>
												<%-- 	<h5>系統訂單編號:<c:out value="${systemOrderNo}"/></h5> --%>
											<thead style="text-align:center;">
												<tr>
													<th scope="col" >被檢舉文章</th>
													<th scope="col" >作者</th>
													<th scope="col" >文章ID</th>
													<th scope="col" >分類</th>
													<th scope="col" >會員ID</th>
													<th scope="col" >理由</th>
													<th scope="col" >檢舉時間</th>
													

												</tr>
											</thead>
											<tbody>
											<c:forEach var="report" items="${ reports }">
												<tr >
													<td style="text-align:left;">${ report.fmb.title }</td>
													<td style="text-align:left;">${ report.fmb.username }</td>
													<td style="text-align:left;">${ report.fmb.article_id }</td>
													<td style="text-align:left;">${ report.fmb.category }</td>
													<td style="text-align:left;">${ report.fmb.memberBean.member_id }</td>
													<td style="text-align:left;">${ report.reportCategory } : ${ report.reason }</td>
													<td style="text-align:left;">${ report.reportTime }</td>

												</tr>
											</c:forEach>

												<tr>
													<td><input type="button" class="btn btn-outline-info"
														name="back" value="返回"
														onClick="javascript:history.back();"></td>

												</tr>
											</tbody>
										</table>

									</div>
								</div>

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
