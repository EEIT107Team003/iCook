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

td {
	text-align: center;
	font-size: 20px;
	font-family: 'Noto Sans TC', sans-serif;
	line-height: 20px;
}

th {
	
}

.thnew {
	font-family: 'Noto Sans TC', sans-serif;
	font-size: 20px;
	text-align: center;
	color: #aa4fff;
}

.thnewHeader {
	font-family: 'Noto Sans TC', sans-serif;
}

td {
	
}
</style>
<script type="text/javascript">
	function lockMember(id) {
		$.ajax({ 
			url : "${pageContext.request.contextPath}/backStageUser/lock",
			type : "POST",
			dataType : "json",
			data:{member_id:id},
			async : true,
			success : function(data) {
				var txt = "";
// 				alert(data);
				if(data==0){
	 				$("#enabled"+id).html("<button type='button' class='btn btn-danger' id='locked' onclick='unlockMember("+id+")'>鎖定</button>");					
				}
			},
			error : function(data, textStatus, errorThrown) {
				console.log("error: "+data);
			},
		});
	}
	function unlockMember(id) {
		$.ajax({ 
			url : "${pageContext.request.contextPath}/backStageUser/unlock",
			type : "POST",
			dataType : "json",
			data:{member_id:id},
			async : true,
			success : function(data) {
				var txt = "";
// 				alert(data);
				if(data==1){
	 				$("#enabled"+id).html("<button type='button' class='btn btn-success' id='unlocked' onclick='lockMember("+id+")'>可用</button>");					
				}
			},
			error : function(data, textStatus, errorThrown) {
				console.log("error: "+data);
			},
		});
	}
</script>

</head>

<body>

	<div class="wrapper">
		<div class="sidebar" data-image="backStage/assets/img/sidebar-5.jpg">


			<div class="sidebar-wrapper">
				<div class="logo">
					<a href="/icook" class="simple-text"> 回前台首頁 </a>
				</div>
				<ul class="nav">
					<li><a class="nav-link" href="backStageDashboard"> <i
							class="nc-icon nc-chart-pie-35"></i>
							<p>後台首頁</p>
					</a></li>
					<li><a class="nav-link" href="productTable"> <i
							class="nc-icon nc-notes"></i>
							<p>產品管理</p>
					</a></li>
					<li class="nav-item active"><a class="nav-link active" href="backStageUser"> <i
							class="nc-icon nc-notes"></i>
							<p>會員管理</p>
					</a></li>
					<li>
						<a class="nav-link" href="adminCheckOrders"> <i
							class="nc-icon nc-notes"></i>
							<p>訂單管理</p>
					</a></li>
					<li><a class="nav-link" href="report_forum"> <i
							class="nc-icon nc-notes"></i>
							<p>檢舉文章管理</p>
					</a></li>
				</ul>
			</div>
		</div>
		<div class="main-panel">

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
										<c:out
											value="---------------------------------------------會員管理---------------------------------------------" />
									</h1>
									<div class="outer">
										<table class="table table-hover">
											<thead>
												<tr>
													<th scope="col" style='background-color:'><p
															class='thnew'>會員編號</p></th>
													<th scope="col" style='background-color:'><p
															class='thnew'>帳號</p></th>
													<th scope="col" style='background-color:'><p
															class='thnew'>密碼</p></th>
													<th scope="col" style='background-color:'><p
															class='thnew'>暱稱</p></th>
													<th scope="col" style='background-color:'><p
															class='thnew'>註冊日期</p></th>
													<th scope="col" style='background-color:'><p
															class='thnew'>是否可用</p></th>
													<th scope="col" style='background-color:'><p
															class='thnew'></p></th>
												</tr>
											</thead>
											<tbody>

												<c:forEach var='member' items='${members}'>
													<tr>
														<td id='odno'>${member.member_id}</td>
														<td id='odno'>${member.username}</td>
														<td id='odno'>${member.password}</td>
														<td id='odno'>${member.nickname}</td>
														<td id='odno'>${member.register_date}</td>
														<td id='odno'><c:if test="${member.enabled==true}">
																<div id="enabled${member.member_id}">
																	<button id="unlocked" class='btn btn-success'
																		onclick="lockMember(${member.member_id})">可用</button>
																</div>
															</c:if> <c:if test="${member.enabled==false}">
																<div id="enabled${member.member_id}">
																	<button id="locked" class='btn btn-danger'
																		onclick="unlockMember(${member.member_id})">鎖定</button>
																</div>
															</c:if></td>
														<td></td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
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
