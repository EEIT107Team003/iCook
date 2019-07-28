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
                    <a href="home" class="simple-text">
                                               回前台首頁
                    </a>
                </div>
				<ul class="nav">
                   <li>
                        <a class="nav-link" href="backStageDashboard">
                            <i class="nc-icon nc-chart-pie-35"></i>
                            <p>後台首頁</p>
                        </a>
                    </li>
                    <li>
                        <a class="nav-link" href="productTable">
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
                        <a class="nav-link" href="adminCheckOrders">
                            <i class="nc-icon nc-notes"></i>
                            <p>訂單管理</p>
                        </a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="report_forum">
                            <i class="nc-icon nc-chart-pie-35"></i>
                            <p>檢舉文章管理</p>
                        </a>
                    </li>
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
										<c:out value="---------------------------------------------被檢舉文章總覽---------------------------------------------" />
									</h1>
									<div class="outer">
										<table class="table table-hover"  style='text-align:center;'>
											<thead>
												<tr>
													<th scope="col" ><p class='thnew'>被檢舉文章</p></th>
													<th scope="col" style='background-color: '><p class='thnew'>作者</p></th>
													<th scope="col" style='background-color: '><p class='thnew'>文章ID</p></th>
													<th scope="col"
														style='background-color: '><p class='thnew'>分類</p></th>
													<th scope="col"
														style='background-color: '><p class='thnew'>會員ID</p></th>
													<th scope="col" style='background-color: '><p class='thnew'>理由</p></th>
													<th scope="col" style='text-align:center;'><p class='thnew'>檢舉時間</p></th>
													<th scope="col" style='background-color:'><p class='thnew'>審核完成</p></th>
<!-- 													<th scope="col" style='background-color:'><p class='thnew'>款項查核</p></th> -->
<!-- 													<th scope="col" style='background-color: '><p class="btn btn-warning"><a href='orders.xls' style='color:black'>匯出xls</a></p></th> -->
												</tr>
											</thead>
											<tbody>




												<c:forEach var="report" items="${ reports }">
													<tr>
													<td><a href="${ pageContext.request.contextPath }/forum/pick?harticle_id=${ report.fmb.harticle_id }&article_id=${ report.fmb.article_id }"  target="_blank">${ report.fmb.title }</a></td>
														<td>${ report.fmb.username }</td>														
														<td>${ report.fmb.article_id }</td>
														<td>${ report.fmb.category }</td>
														<td>${ report.fmb.memberBean.member_id }</td>																												
														<td>${ report.reportCategory }:${ report.reason }</td>
														<td>${ report.reportTime }</td>
														<td><button type="button" class="btn btn-outline-primary" id="check${report.report_id}" onclick="checked()">審核</button></td>
													</tr>
													<script>
														function checked(){
															$.ajax({
																url:"${ pageContext.request.contextPath }/report_forum/check?report_id=${report.report_id}",
																type:"GET",
																success: function(data){
																	if(data == 1){
																		$("#check${report.report_id}").text("審核完畢");
																		$("#check${report.report_id}").attr("disabled", "true");
																	}
																}
															})
														}
													</script>
												</c:forEach>
											</tbody>
										</table>
									</div>

								</div>
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