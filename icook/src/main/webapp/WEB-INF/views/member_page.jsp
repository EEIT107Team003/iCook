<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<title>Responsive HTML5 Website Template for Developers | 3rd
	Wave Media</title>
<!--     Meta -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description"
	content="Responsive HTML5 Website landing Page for Developers">
<meta name="author" content="3rd Wave Media">
<link rel="shortcut icon" href="favicon.ico">
<link
	href='http://fonts.googleapis.com/css?family=Lato:300,400,300italic,400italic'
	rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Montserrat:400,700'
	rel='stylesheet' type='text/css'>
<!--     Global CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/plugins/bootstrap/css/bootstrap.min.css">
<!--     Plugins CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/plugins/font-awesome/css/font-awesome.css">
<!--     github acitivity css -->
<!--     <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/octicons/2.0.2/octicons.min.css"> -->
<!--     <link rel="stylesheet" href="http://caseyscarborough.github.io/github-activity/github-activity-0.1.0.min.css"> -->
<!--     Theme CSS   -->
<link id="theme-style" rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/styles.css">
<!--     HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--     [if lt IE 9]>
<!--       <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script> -->
<!--       <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script> -->
<!--     <![endif]-->
<!-- <!--     CSS字型 -->
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+TC&display=swap"
	rel="stylesheet">
<script>	
	$(document).ready(function() {
		if($("#userId").val()!=null){
		$.ajax({ 
			url : "${pageContext.request.contextPath}/members/page/checkTracked",
			type : "POST",
			dataType : "json",
			data:{member_id:$("#memberId").val()},
			async : true,
			success : function(data) {
				var names = JSON.parse(JSON.stringify(data).split(","));
				var txt = "";				
				
				if(names.length==0){
					txt+="<button id=trackMe type=submit>加入追蹤</button>"
					$("#trackbutton").html(txt);
				}else{
					txt+="<button id=trackCancel type=submit>取消追蹤</button>"
					$("#trackbutton").html(txt);
				}
			},
			error : function(data, textStatus, errorThrown) {
				console.log("error: "+data);
			},
		});
	}
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

		var currentUrl = this.location.href
		console.log(currentUrl);
	});
</script>

<style>
.member_photo {
	width: 175px;
	height: 175px;
	border-radius: 50%;
	border: 2px solid black;
	margin-left: 0px;
}

.member_info {
	padding-left: 15px;
	width: 300px;
	height: 100%;
	background-color: rgb(242, 255, 213, 1);
	border: 2px dashed black;
	border-radius: 10px;
	text-align: center;
}

.change_cover {
	float: right;
	background-color: #D8D8D8;
	color: black;
	border: 1px solid black;
	border-radius: 5px;
}

.items {
	padding-top: 5px;
	padding-bottom: 5px;
	text-align: center;
	width: 33.3%;
}

.contain_mytrack {
	border: 1px solid black;
	width: 100%;
	height: 130px;
	margin-bottom: 10px;
	padding-left: 10px;
}

.contain_mytrack_photo {
	border-radius: 50%;
	border: 1px solid black;
	width: 100px;
	height: 100px;
	margin-top: 15px;
	margin-right: 20px;
	float: left;
}

.contain_mytrack_Info {
	height: 130px;
	width: 80%;
	margin-left: 20px;
}

.contain_mytrack_title {
	color: black;
	margin-top: 5px;
	height: 30px;
	font-size: 25px;
	font-family: 'Noto Sans TC', sans-serif;;
	font-weight: 900;
}

.contain_mytrack_summary {
	height: 70%;
	font-family: 'Noto Sans TC', sans-serif;
}

section {
	border: 1px solid rgb(220, 220, 220);
	border-top: 0px
}
</style>
</head>
<body>
	
	<input id="memberId" name="memberId" type="hidden" value="${member.member_id}"/>
	<input id="userId" name="userId" type="hidden" value="${pageContext.request.userPrincipal.name}"/>

	<a href="${pageContext.request.contextPath}/logout_page"
		class="alert alert-dark" role="alert">會員登出</a>
	<a href="${pageContext.request.contextPath}/home"
		class="alert alert-dark" role="alert">回到首頁</a>
	<header class="header"
		style="background-image:url(<c:url value='/getCoverPhoto/${member.member_id}' />) ;background-size:100% 100%">
		<div class="container">
			<img class="profile-image img-responsive pull-left member_photo"
				id="member_photo_image"
				src="<c:url value='/getMemberPhoto/${member.member_id}' />" />

			<div class="profile-content pull-left member_info">
				<h1 class="name">${member.nickname}</h1>
				<h2 id="member_resume" class="desc" style="font-size: 10px">${member.resume}</h2>
				<ul class="social list-inline">
					<li><a href="#"><i class="fa fa-twitter"></i></a></li>
					<li><a href="#"><i class="fa fa-google-plus"></i></a></li>
					<li><a href="#"><i class="fa fa-linkedin"></i></a></li>
					<li><a href="#"><i class="fa fa-github-alt"></i></a></li>
					<li class="last-item"><a href="#"><i
							class="fa fa-hacker-news"></i></a></li>
				</ul>
			</div>
		</div>
		<!--//container-->
	</header>
	<!--//header-->

	
	<form method="POST" action="${pageContext.request.contextPath}/members/page/track?member_id=${member.member_id}">
		<div id="trackbutton">
			<button id=trackMe type="submit">加入追蹤</button>
		</div>
	</form>

	<div class="container sections-wrapper">
		<div class="row">
			<div class="primary col-md-8 col-sm-12 col-xs-12">
				<ul id="myTab" class="nav nav-tabs">
					<li class="active"><a href="user_myrecipe" data-toggle="tab">我的食譜</a>
					</li>
					<li><a href="user_mycollectrecipe" data-toggle="tab">我的收藏</a>
					</li>
					<li><a id="user_mytrack" data-toggle="tab">我的追蹤</a></li>
					<li><a href="user_myforum" data-toggle="tab">我的文章</a></li>
				</ul>

				<section class="about section">
					<div class="section-inner">
						<div id="myTabContent" class="tab-content">
							<!-- 							<div class="tab-pane fade in active" id="user_contain"> -->
							<div id="user_contain">
								<!--                 				<iframe src="hw1.html" frameborder="0" class="HWView" id="aa">dsdsds</iframe> -->
							</div>
						</div>
					</div>
					<!--//section-inner-->
				</section>
				<!--//section-->
			</div>
			<!--//primary-->
			<div class="secondary col-md-4 col-sm-12 col-xs-12">
				<aside class="info aside section">
					<div class="section-inner">
						<h2 class="heading sr-only">Basic Information</h2>
						<div class="content">
							<table width="100%">
								<tr>
									<th class="items">食譜數量</th>
									<th class="items">被追蹤數</th>
									<th class="items">文章總數</th>
								</tr>
								<tr>
									<th class="items">${member.recipe_num }</th>
									<th class="items">${member.tracked_num }</th>
									<th class="items">${member.forum_num }</th>
								</tr>
							</table>
						</div>
						<!--//content-->
					</div>
					<!--//section-inner-->
				</aside>
				<!--//aside-->
			</div>
			<!--//secondary-->
		</div>
		<!--//row-->
	</div>
	<!--//masonry-->

	<footer class="footer">
		<div class="container text-center">
<!-- 			<small class="copyright">Designed with <i class="fa fa-heart"></i> -->
<!-- 				by <a href="http://themes.3rdwavemedia.com" target="_blank">3rd -->
<!-- 					Wave Media</a> for developers -->
<!-- 			</small> -->
		</div>
		<!--//container-->
	</footer>
	<!--//footer-->

	<!-- Javascript -->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/assets/plugins/jquery-1.11.1.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/assets/plugins/jquery-migrate-1.2.1.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/assets/plugins/jquery-rss/dist/jquery.rss.min.js"></script>
	<!-- github activity plugin -->
	<script type="text/javascript"
		src="http://cdnjs.cloudflare.com/ajax/libs/mustache.js/0.7.2/mustache.min.js"></script>
	<script type="text/javascript"
		src="http://caseyscarborough.github.io/github-activity/github-activity-0.1.0.min.js"></script>
	<!-- custom js -->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/assets/js/main.js"></script>
</body>
</html>