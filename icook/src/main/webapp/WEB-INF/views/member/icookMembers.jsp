<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>News</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="icon" href="images/favicon.ico">
<link rel="shortcut icon" href="images/favicon.ico" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/zerogrid.css" type="text/css"
	media="screen">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/responsive.css" type="text/css"
	media="screen">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">	
<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-migrate-1.1.1.js"></script>
<script src="${pageContext.request.contextPath}/js/superfish.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.easing.1.3.js"></script>
<script src="${pageContext.request.contextPath}/js/sForm.js"></script>
<script src="${pageContext.request.contextPath}/js/css3-mediaqueries.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>

<link href="https://fonts.googleapis.com/css?family=Noto+Sans+TC&display=swap" rel="stylesheet">


<script>

	$(document).ready(function() {
		if($("#userId").val().trim()!=""){
			$.ajax({ 
				url : "${pageContext.request.contextPath}/members/page/checkTracked",
				type : "POST",
				dataType : "json",
				data:{member_id:$("#memberId").val()},
				async : true,
				success : function(data) {
					var names = JSON.parse(JSON.stringify(data).split(","));
					var txt = "";				
					if(names.length!=0){
						txt+="<input type='button' id='trackCancel' name='trackCancel' value='取消追蹤' onclick='trackCancel()';/>"
						$("#trackbutton").html(txt);
					}else{
						txt+="<input type='button' id='trackMe' name='trackMe' value='加入追蹤' onclick='trackMe()';/>"
						$("#trackbutton").html(txt);	
					}
				},
				error : function(data, textStatus, errorThrown) {
					console.log("error: "+data);
				},
			});
		}else{
			var txt = "";
			txt+="<input type='button' id='trackMe' name='trackMe' value='加入追蹤' onclick='trackMe()';/>"
				$("#trackbutton").html(txt);
		}
	
		$("#user_myforum").click(function(){
// 			alert("fdfdfdfdfdfdfdfd");
			$.ajax({
				url : "${pageContext.request.contextPath}/members/page/myforum",
				type : "POST",
				dataType : "json",
				data:{member_id:$("#memberId").val()},
				async : true,
				success : function(data) {
					var names = JSON.parse(JSON.stringify(data).split(","));
					var txt = "";
					for (i in names) {
						txt+=
							"<div class=contain_myforum>"
								+"<div class=contain_myforum_Info>"
									+"<div width=100%>"
										+"<a href=${pageContext.request.contextPath}/forum/pick?harticle_id="+names[i].harticle_id+"&article_id="+names[i].article_id+" class=contain_mytrack_title>"+"["+names[i].category+"] "+names[i].title+"</a>"
									+"</div>"	
								+"<div class=contain_myforum_time>發文時間: "+formatDate(names[i].editTime)+"</div>"
								+"</div>"
								+"<hr style=clear: both;border-style: dashed;>"
							+"</div>"
						console.log(names[i].title);
					};
//						$("#forum_num").html(names.length)
					$("#user_contain").html(txt);
				},
				error : function(data, textStatus, errorThrown) {
					console.log("error: "+data);
				},
			});
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
	});
	
	function trackMe(){
		if($("#userId").val().trim()!=""){
			$.ajax({ 
				url : "${pageContext.request.contextPath}/members/page/track",
				type : "GET",
				dataType : "json",
				data:{member_id:$("#memberId").val()},
				async : true,
				success : function(data) {
					var names = JSON.parse(JSON.stringify(data).split(","));
					var txt = "";			
					
					txt+="<input type='button' id='trackCancel' name='trackCancel' value='取消追蹤' onclick='trackCancel()';/>"
					$("#trackbutton").html(txt);
					
					$("#tracked_num").html(names.length);
				},
				error : function(data, textStatus, errorThrown) {
					console.log("error: "+data);
				},
			});
		}else{
			$("#trackMe_nologin").click();	
		}
	};			
	
	function trackCancel(){
		if($("#userId").val().trim()!=""){
			$.ajax({ 
				url : "${pageContext.request.contextPath}/members/page/TrackCancel",
				type : "GET",
				dataType : "json",
				data:{member_id:$("#memberId").val()},
				async : true,
				success : function(data) {
					var names = JSON.parse(JSON.stringify(data).split(","));
					var txt = "";
					txt+="<input type='button' id='trackMe' name='trackMe' value='加入追蹤' onclick='trackMe()';/>"
						$("#trackbutton").html(txt);
						
						$("#tracked_num").html(names.length);
				},
				error : function(data, textStatus, errorThrown) {
					console.log("error: "+data);
				},
			});
		}
	};		
	function formatDate(longDate){
	    var date = new Date(longDate);
	    var yyyy = date.getFullYear();
	    var mm = date.getMonth() + 1;
	    if (mm < 10) {
	        mm = "0" + mm;
	    }
	    var dd = date.getDate();
	    if (dd < 10) {
	        dd = "0" + dd;
	    }
	    var HH = date.getHours();
	    if (HH < 10) {
	        HH = "0" + HH;
	    }
	    var min = date.getMinutes();
	    if (min < 10) {
	        min = "0" + min;
	    }
	    var sec = date.getSeconds();
	    if (sec < 10) {
	    	sec = "0" + sec;
	    }
	    return yyyy + "-" + mm + "-" + dd+" , "+HH+":"+min+":"+sec;
	}

	 
</script>

<style>
.member_photo {
	width: 175px;
	height: 175px;
	border-radius: 50%;
	border: 2px solid black;
}

.member_info {
	width: 20%;
	height: 350px;
	float: left;
	background: #398235; /* Old browsers */
	background: -moz-linear-gradient(left, #398235 1%, #8ab66b 78%, #c9de96 96%, #c9de96 96%); /* FF3.6-15 */
	background: -webkit-linear-gradient(left, #398235 1%,#8ab66b 78%,#c9de96 96%,#c9de96 96%); /* Chrome10-25,Safari5.1-6 */
	background: linear-gradient(to right, #398235 1%,#8ab66b 78%,#c9de96 96%,#c9de96 96%); /* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#398235', endColorstr='#c9de96',GradientType=1 ); /* IE6-9 */
}

.member_summary{
	margin_top: 30px;
	margin_left: 30px;
	margin_right: 30px;
	text-align: center;
	background-color: rgb(242, 255, 213,1);
    border: 2px dashed black;
    border-radius: 10px;
/* 	height: 40%; */
}
.member_cover_img{
	height: 350px ;
	width: 933px ;
 	float: left;   
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
.contain_myforum_Info {
	height: 100px;
	width: 100%;
	margin-left: 20px;
}

.contain_myforum_time { 
	width:100%;
	color:gray;
	margin-top:50px;
	vertical-align:bottom;
	text-align:right;
	font-family: 'Noto Sans TC', sans-serif;
	float: right;
}
/* ------------------------------------------------------------------------------------------ */

td {
	margin: 3px;
}

section {
	border: 1px solid rgb(220, 220, 220);
	border-top: 0px
}
</style>

</head>
<body style="background-color: #55a237">
<input id="memberId" name="memberId" type="hidden" value="${member.member_id}"/>
	<input id="userId" name="userId" type="hidden" value="${pageContext.request.userPrincipal.name}"/>
	<div class="main">
		<!--==============================header=================================-->
		<header>
			<div class="zerogrid">
			<!-- 修改會員資料-----------------------------------------------------------------------	 -->
				<div class="col-full">
					<div class="wrap-col">
						<h1>
							<a  style="height:200px" href="${pageContext.request.contextPath}/index2"><img src="${pageContext.request.contextPath}/images/logo.png" style="width: 200px ;right: 200px ;border-radius: 50%;" alt="EXTERIOR"></a>
						</h1>

						<div class="menu_block">
							<nav>
								<ul class="sf-menu"  style="padding-top:55px">
									<li><a href="${pageContext.request.contextPath}/index2">ICook</a></li>
									<li><a href="${pageContext.request.contextPath}/icookAboutUS">關於我們</a>
										<ul>
											<li><a href="${pageContext.request.contextPath}/icookContact">聯繫我們</a></li>
										</ul></li>
									<li><a href="${pageContext.request.contextPath}/icookMenu">查看食譜</a>
										<ul>
											<li><a href="#">cat1</a></li>
											<li><a href="#">cat2</a></li>
											<li><a href="#">cat3</a></li>
										</ul></li>
									<li><a href="${pageContext.request.contextPath}/icookLife">生活誌</a></li>
									<li><a href="${pageContext.request.contextPath}/forum/overview">討論區</a></li>
									<li><a href="${pageContext.request.contextPath}/A_articlemainpage">文章區</a>
										<ul>
											<li><a href="${pageContext.request.contextPath}/A_article">test</a></li>

										</ul></li>


									<li><a href="${pageContext.request.contextPath}/products">市集</a>
										<ul>

											<li><a href="${pageContext.request.contextPath}/cartPage">購物車</a></li>
										</ul></li>

									<li><a href="${pageContext.request.contextPath}/user">會員專區 </a>
										<ul>
											<sec:authorize access="!isAuthenticated()">
												<li><a href="${pageContext.request.contextPath}/icookLogin">會員登入</a></li>
												<li><a href="${pageContext.request.contextPath}/icookRegister">會員註冊</a></li>
											</sec:authorize>
											<sec:authorize access="isAuthenticated()">
												<li><a href="${pageContext.request.contextPath}/index2" data-toggle="modal"
													data-target="#logout">會員登出</a></li>
											</sec:authorize>
											<li><a href="${pageContext.request.contextPath}/checkOrders">查看訂單</a></li>
											<li><a href="${pageContext.request.contextPath}/icookAddRecipe">新增食譜</a></li>
											<sec:authorize access="hasRole('ADMIN')">
												<li><a href="${pageContext.request.contextPath}/productTable">後台</a></li>
											</sec:authorize>
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
<!-- 確認登出 -->

	<div class="modal fade" id="logout" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-header" style="border-bottom: 1px solid; ">
	        		<h4 class="modal-title" id="myModalLabel" style="float: left">您即將登出享食天堂</h4>
	                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
	            </div>
	            <div class="modal-body" style="width: 100%">
					<form method="post" action="${pageContext.request.contextPath}/perform_logout">
				        <button type="submit">確定登出</button>
				    </form>
	            </div>
	            <div class="modal-footer">
	                <button type="button" class="btn btn-primary" data-dismiss="modal">取消</button>
	            </div>
	        </div>
	    </div>
	</div>
		<!--=======content================================-->
		<div style="text-align: center;">
			<div class="member_info" style="margin-left:300px;">
				<div style="text-align: center;" >
					<label>
						<img class="profile-image img-responsive pull-left member_photo"
							id="member_photo_image"
							style="background-color: white; margin: 20px"
							src="<c:url value='/getMemberPhoto/${member.member_id}' />" />
					</label>
				</div>
				<div class="member_summary">
					<h1 id="member_nickname">${member.nickname}</h1>
					<h2 id="member_resume" class="desc" style="font-size: 10px">${member.resume}</h2>
				</div>
			</div>
<%-- 			<div class="member_cover_img" style="background-image:url('getCoverPhoto/${member.member_id}');background-size:100% 100%;" ></div> --%>
			<div class="member_cover_img" style="background-image:url('<c:url value='/getCoverPhoto/${member.member_id}' />');background-size:100% 100%;">
<!-- 				<img class="profile-image img-responsive pull-left" -->
<!-- 					style="height: 100%; width: 80%" id="cover_photo" -->
<%-- 					src="<c:url value='/getCoverPhoto/${member.member_id}' />" /> --%>
			</div>
		</div>

		<div style="clear: both;">
			<div id="trackbutton"></div>

			<div style="display: none">
				<form method="POST"
					action="${pageContext.request.contextPath}/members/page/track?member_id=${member.member_id}">
					<button id=trackMe_nologin type="submit">加入追蹤</button>
				</form>
			</div>


			<div class="content" style="margin-top: 50px;">
				<div style="width: 100%;">
					<div class="container sections-wrapper"
						style="background-color: white; border: 1px, solid, #c7c7c7">
						<div class="row">
							<div class="primary col-md-8 col-sm-12 col-xs-12"
								style="float: left; border: 1px, solid, #c7c7c7; box-shadow: 4px 4px 3px 4px rgba(20%, 20%, 40%, 0.5);">
								<ul id="myTab" class="nav nav-tabs">
									<li class="active"><a href="user_myrecipe"
										data-toggle="tab">我的食譜</a></li>
									<li><a href="user_mycollectrecipe" data-toggle="tab">我的收藏</a>
									</li>
									<!-- 								<li><a id="user_mytrack" data-toggle="tab">我的追蹤</a></li> -->
									<li><a href="" id="user_myforum" data-toggle="tab">我的文章</a></li>
								</ul>

								<section class="about section">
									<div class="section-inner">
										<div id="myTabContent" class="tab-content">
											<div id="user_contain"></div>
										</div>
									</div>
									<!--//section-inner-->
								</section>
								<!--//section-->
							</div>
							<!--//primary-->
							<div class="secondary col-md-4 col-sm-12 col-xs-12"
								style="float: right; height: 155px; border: 1px, solid, #dcdcdc; box-shadow: 4px 4px 3px 4px rgba(20%, 20%, 40%, 0.5);">
								<aside class="info aside section">
									<div class="section-inner">
										<h2 class="heading sr-only">Basic Information</h2>
										<div class="content">
											<table width="100%" style="margin-top: 40px">
												<tr>
													<th class="items">食譜數量</th>
													<th class="items">被追蹤數</th>
													<th class="items">文章總數</th>
												</tr>
												<tr>
													<th id="recipe_num" class="items">${member.recipe_num }</th>
													<th id="tracked_num" class="items">${member.tracked_num }</th>
													<th id="forum_num" class="items">${member.forum_num }</th>
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
				</div>
			</div>
		</div>

		<!--==============================footer=================================-->
		<div style="background-color: #55a237">
			<footer>
				<div class="zerogrid">
					<div class="col-full">
		<!-- 				<div class="wrap-col"> -->
		<!-- 					&copy; Copyright &copy; 2013.Company name All rights reserved.<a -->
		<!-- 						target="_blank" href="http://sc.chinaz.com/moban/">&#x7F51;&#x9875;&#x6A21;&#x677F;</a> -->
		<!-- 				</div> -->
					</div>
				</div>
			</footer>
		</div>
		<div style="display: none">
			<script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540'
				language='JavaScript' charset='gb2312'></script>
		</div>
</div>
</body>
</html>