<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>News</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="icon" href="images/favicon.ico">
<link rel="shortcut icon" href="images/favicon.ico" />
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/zerogrid.css" type="text/css"
	media="screen">
<link rel="stylesheet" href="css/responsive.css" type="text/css"
	media="screen">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">	
<script src="js/jquery.js"></script>
<script src="js/jquery-migrate-1.1.1.js"></script>
<script src="js/superfish.js"></script>
<script src="js/jquery.easing.1.3.js"></script>
<script src="js/sForm.js"></script>
<script src="js/css3-mediaqueries.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Responsive HTML5 Website landing Page for Developers">
    <meta name="author" content="3rd Wave Media">    
    <link rel="shortcut icon" href="favicon.ico">   
    <link href='http://fonts.googleapis.com/css?family=Lato:300,400,300italic,400italic' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'> 
<%--     <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/bootstrap/css/bootstrap.min.css">    --%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/font-awesome/css/font-awesome.css">
    <link id="theme-style" rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/styles.css">
	<link href="https://fonts.googleapis.com/css?family=Noto+Sans+TC&display=swap" rel="stylesheet">


<style>
.member_photo {
	width: 175px;
	height: 175px;
	border-radius: 50%;
	border: 2px solid black;
/* 	margin-top: 10px; */
/* 	float: right; */
/* 	float: left; */

}

.member_info {
	width: 20%;
	height: 500px;
	background-color: yellow;
	float: left;
	background: #45484d;
	background: -moz-linear-gradient(left, #45484d 0%, #000000 100%);
	background: -webkit-linear-gradient(left, #45484d 0%,#000000 100%);
	background: linear-gradient(to right, #45484d 0%,#000000 100%);
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#45484d', endColorstr='#000000',GradientType=1 );
}

.member_summary{
	margin: 30px;
	text-align: center;
	height: 40%;
	background-color: rgb(242, 255, 213,1);
    border: 2px dashed black;
    border-radius: 10px;
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
/* contain ------------------------------------------------------------------------------------------ */
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
section {
	border: 1px solid rgb(220, 220, 220);
	border-top: 0px
}

.user_control {
	float: right;
	margin-right: 10px;
}

.user_control_title {
	width: 140px;
 	margin-top:10px;
	font-size: 15px;
}

td {
	margin: 3px;
}
</style>
<script>
	$(document).ready(function() {
		$("#member_photo_file").click(function(){
			$.ajax({
				url : "${pageContext.request.contextPath}/user/updateMemberPhotos",
				type : "GET",
				dataType : "json",
				contentType : "application/json",
				async : true,
				success : function(data) {
					$("#member_photo_file").change(function(){
						var names = JSON.parse(JSON.stringify(data).split(","));
						var txt = "";
						for (i in names) {
// 						$("#member_photo_image").attr("src","<c:url value='/getMemberPhoto/"+names[i].member_id+"' />");
					}
						$("#submit1").click();
					});

				},
				error : function(data, textStatus, errorThrown) {
					console.log("error: "+data);
				},
			});
		});
		
		$("#cover_photo_image").click(function(){
			$.ajax({
				url : "${pageContext.request.contextPath}/user/updateCoverPhotos",
				type : "GET",
				dataType : "json",
				contentType : "application/json",
				async : true,
				success : function(data) {
					$("#cover_photo_file").change(function(){
						var names = JSON.parse(JSON.stringify(data).split(","));
						var txt = "";
						for (i in names) {
					}
						$("#submit2").click();
					});

				},
				error : function(data, textStatus, errorThrown) {
					console.log("error: "+data);
				},
			});
		});
		
		$("#user_mytrack").click(function(){
			$.ajax({
				url : "${pageContext.request.contextPath}/user/mytrack",
				type : "POST",
				dataType : "json",
				contentType : "application/json",
				async : true,
				success : function(data) {
					var names = JSON.parse(JSON.stringify(data).split(","));
					var txt = "";
					for (i in names) {
// 						txt+=names[i].trackedId.nickname+"<br>"
						txt+=
							"<div class=contain_mytrack>"
								+"<div>"
									+"<img class=contain_mytrack_photo src=<c:url value='/getMemberPhoto/"+names[i].trackedId.member_id+"' /> />"
								+"</div>"
								+"<div class=contain_mytrack_Info style="+"height:175px; background-color: yellow;"+">"
									+"<div width=100%>"
									+"<a href=members/page?member_id="+names[i].trackedId.member_id+" class=contain_mytrack_title>"+ names[i].trackedId.nickname+"</a>"
									+"</div>"		
									+"<div class=contain_mytrack_summary>個人簡介:"+names[i].trackedId.resume+"</div>"
									+"</div>"
								+"<hr style=clear: both;border-style: dashed;>"
							+"</div>"
						
						console.log(names[i].trackedId);
					};
					$("#user_contain").html(txt);
				},
				error : function(data, textStatus, errorThrown) {
					console.log("error: "+data);
				},
			});
		});
		$("#user_myforum").click(function(){
			$.ajax({
				url : "${pageContext.request.contextPath}/user/myforum",
				type : "POST",
				dataType : "json",
				contentType : "application/json",
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
// 					$("#forum_num").html(names.length)
					$("#user_contain").html(txt);
				},
				error : function(data, textStatus, errorThrown) {
					console.log("error: "+data);
				},
			});
		});
		
		$("#updateResume_check").click(function(){
			var resume=$("#resume").val();
			$.ajax({
				url : "${pageContext.request.contextPath}/user/updateResume",
				type : "POST",
				dataType : "json",
				data: $("#resume_value").serializeObject(),
				contentType : "application/json",
				async : true,
				success : function(data) {
					$("#member_resume").html(resume);
					$("#change_reaume").val(resume);
					$('#myModal').modal('hide');
					
				},
				error : function(data, textStatus, errorThrown) {
					console.log("error: "+data+"RRRRRRRRRRR");					
				},
			});
		});
		
		$("#updateInfo_check").click(function(){
			var c_nickname=$("#change_nickname").val();
			var c_resume=$("#change_reaume").val();
			$.ajax({
				url : "${pageContext.request.contextPath}/user/update",
				type : "POST",
				dataType : "json",
				data: $("#change_info").serializeObject(),
				contentType : "application/json",
				async : true,
				success : function(data) {
					$("#member_nickname").html(c_nickname);
					$("#member_resume").html(c_resume);
					$("#resume").val(c_resume);					
					$('#myModal_changeInfo').modal('hide');
					
				},
				error : function(data, textStatus, errorThrown) {
					console.log("error: "+data+"RRRRRRRRRRR");					
				},
			});
		});
		
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
	});	

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

</head>
<body style="background-color: white">
	<div class="main">
		<!--==============================header=================================-->
		<header>
			<div class="zerogrid">
			<!-- 修改會員資料-----------------------------------------------------------------------	 -->
				<div class="col-full">
					<div class="wrap-col">
						<h1>
							<a href="index2"><img src="images/logo.png" alt="EXTERIOR" ></a>
						</h1>

						<div class="menu_block">
							<nav>
								<ul class="sf-menu">
									<li><a href="index2">ICook</a></li>
									<li><a href="icookAboutUS">關於我們</a>
										<ul>
											<li><a href="icookContact">聯繫我們</a></li>
										</ul></li>
									<li><a href="icookMenu">查看食譜</a>
										<ul>

											<li><a href="#">cat1</a></li>
											<li><a href="#">cat2</a></li>
											<li><a href="#">cat3</a></li>
										</ul>
									<li  class="with_ul current"><a href="icookLife">生活誌</a></li>
									<li><a href="icookVideo">討論區</a></li>
									<li><a href="icookProducts">市集</a>
									<ul>
											<li><a href="cartPage">購物車</a></li>
										</ul></li>

									<li><a href="icookLogin">會員專區</a>
										<ul>
											<c:if test="${pageContext.request.userPrincipal.name==null}">
												<li><a href="icookLogin">會員登入</a></li>
												<li><a href="icookRegister">會員註冊</a></li>
											</c:if>
											<c:if test="${pageContext.request.userPrincipal.name!=null}">
												<li><a href="index2" data-toggle="modal" data-target="#logout">會員登出</a></li>
											</c:if>
												<li><a href="checkOrders">查看訂單</a></li>
												<li><a href="#">新增食譜</a></li>
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
					<form method="post" action="perform_logout">
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

		
				<div>
					<div class="member_info">
						<div style="text-align: center;">
							<form:form method="POST" action="user/updateMemberPhoto"
								modelAttribute="MemberBean" enctype="multipart/form-data">
								<label for="member_photo_file"> 
								<form:input type="file" path="member_photo_tr" name="member_photo_file"
										id="member_photo_file" style="display: none;" /> 
										<img class="profile-image img-responsive pull-left member_photo" 
									id="member_photo_image" style="background-color:white;margin: 20px;"  
									src="<c:url value='/getMemberPhoto/${member.member_id}' />" />
								</label>
								<input id=submit1 type="submit" value="送出" style="display: none;">
							</form:form>
						</div>
						<div class="member_summary">
							<h1 id="member_nickname">${member.nickname}</h1>
							<h2 id="member_resume" class="desc" style="font-size: 10px">${member.resume}</h2>
						</div>	
					</div>
					<div style="height: 500px ;width: 100%">
						<img class="profile-image img-responsive pull-left" style="height: 100%;width: 80%"
								id="cover_photo"  src="<c:url value='/getCoverPhoto/${member.member_id}' />" />
					</div>
				</div>
				

				<!-- 控制項-------------------------------------------				 -->
			<div style="clear: right ">
				<div class="user_control">
					<p class="btn btn-primary btn-lg user_control_title" data-toggle="modal" data-target="#myModal_changeInfo">編輯會員資料</p>
					<div class="modal fade" id="myModal_changeInfo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					    <div class="modal-dialog">
					        <div class="modal-content">
					            <div class="modal-header">
					                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					                <h4 class="modal-title" id="myModalLabel_changeInfo">修改基本資料</h4>
					            </div>
					            <div class="modal-body">
					            
									<form id="change_info" method="POST">
										<table>
											<tr>
												<td><label for="change_nickname">暱稱: </label></td>
												<td><input id="change_nickname" name="nickname" type="text" value="${member.nickname}" /></td>
											</tr>
											<tr>
												<td><label for="username">電子郵件: </label></td>
												<td><input id="change_username" name="username" type="text" disabled="disabled" value="${member.username}" style="color: gray;"/></td>
											</tr>
											<tr>
												<td><label for="change_member_phone_num">聯絡電話: </label></td>
												<td><input id="change_member_phone_num" name="member_phone_num" type="text" value="${member.member_phone_num}" /></td>
											</tr>
											<tr>
												<td><label for="change_address">收貨地址: </label></td>
												<td><input id="change_address" name="address" type="text" style="width:400px" value="${member.address}" /></td>
											</tr>
											<tr>
												<td><label for="change_reaume">個人簡介: </label></td>
								            	<td><textarea id="change_reaume" name="resume" style="min-height: 40px; max-height: 200px; min-width:80%; max-width:80%;">${member.resume}</textarea></td>
											</tr>
										</table>
									</form>
				
					            </div>
					            <div class="modal-footer">
					                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					                <button type="button" class="btn btn-primary" id=updateInfo_check>確定更改</button>
					            </div>
					        </div>
					    </div>
					</div>
				</div>
				<!-- -----------------------------------------------------------------------	 -->
				<!-- 編輯個人首頁(彈出視窗)-----------------------------------------------------------------------	 -->
				<div class="user_control">
					<p class="btn btn-primary btn-lg user_control_title" data-toggle="modal" data-target="#myModal">編輯個人簡介</p>
					<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					    <div class="modal-dialog">
					        <div class="modal-content">
					            <div class="modal-header">
					                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					                <h4 class="modal-title" id="myModalLabel">編輯個人簡介</h4>
					            </div>
					            <div class="modal-body">
					            	<div>請輸入的你個人簡介:(50字以內)</div><br>
						            <form id="resume_value" method="POST">
										<div>
							            	<textarea id="resume" name="resume" style="min-height: 40px; max-height: 200px; min-width:80%; max-width:80%">${member.resume}</textarea>
										</div>
									</form>
					            </div>
					            <div class="modal-footer">
					                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					                <button type="button" class="btn btn-primary" id=updateResume_check>確定更改</button>
					            </div>
					        </div>
					    </div>
					</div>
				</div>
				
				<!-- -----------------------------------------------------------------------	 -->
				<!-- 更改封面圖片-----------------------------------------------------------------------	 -->
					<div class="user_control">
						<form:form method="POST" action="user/updateCoverPhoto" modelAttribute="MemberBean" enctype="multipart/form-data">
							<label for="cover_photo_file"> 
								<form:input type="file" path="cover_photo_tr" name="cover_photo_file" id="cover_photo_file" style="display: none;" /> 
									<p class="btn btn-primary btn-lg user_control_title" id="cover_photo_image"> 更改封面圖片 </p>
							</label>					
								<input id=submit2 type="submit" value="送出" style="display: none;">
						</form:form>
					</div>
					
	</div>				
<!-- 	<div class="content" style="margin: 50px "> -->
<!-- 			<div class="zerogrid"> -->
<!-- 				<div class="container sections-wrapper" style="background-color: white;border: 1px solid black;"> -->
<!-- 			        <div class="row"> -->
<!-- 			            <div class="primary col-md-8 col-sm-12 col-xs-12" style="float:left;border:1px,solid,#dcdcdc;box-shadow:4px 4px 3px 4px rgba(20%,20%,40%,0.5);"> -->
<!-- 							<ul id="myTab" class="nav nav-tabs" > -->
<!-- 								<li class="active"> -->
<!-- 									<a href="user_myrecipe" data-toggle="tab">我的食譜</a> -->
<!-- 								</li> -->
<!-- 								<li> -->
<!-- 									<a href="user_mycollectrecipe" data-toggle="tab">我的收藏</a> -->
<!-- 								</li> -->
<!-- 								<li> -->
<!-- 									<a id="user_mytrack" data-toggle="tab">我的追蹤</a> -->
<!-- 								</li> -->
<!-- 								<li> -->
<!-- 									<a id="user_myforum" data-toggle="tab">我的文章</a> -->
<!-- 								</li> -->
<!-- 							</ul> -->
			
<!-- 							<section class="about section"> -->
<!-- 								<div class="section-inner"> -->
<!-- 									<div id="myTabContent" class="tab-content"> -->
<!-- 			<!-- 							<div class="tab-pane fade in active" id="user_contain"> --> -->
<!-- 										<div  id="user_contain"> -->
<!-- 			<!--                 				<iframe src="hw1.html" frameborder="0" class="HWView" id="aa">dsdsds</iframe> --> -->
<!-- 			            				</div> -->
<!-- 									</div> -->
<!-- 								</div>//section-inner                  -->
<!-- 							</section>//section -->
<!-- 			            </div>//primary -->
<!-- 			            <div class="secondary col-md-4 col-sm-12 col-xs-12"  style="float:right; height:155px; border:1px,solid,#dcdcdc; box-shadow:4px 4px 3px 4px rgba(20%,20%,40%,0.5);"> -->
<!-- 			                 <aside class="info aside section"> -->
<!-- 			                    <div class="section-inner"> -->
<!-- 			                        <h2 class="heading sr-only">Basic Information</h2> -->
<!-- 			                        <div class="content"> -->
<!-- 			                        	<table width="100%"> -->
<!-- 			                        		<tr> -->
<!-- 			                        			<th class="items">食譜數量</th> -->
<!-- 			                        			<th class="items">被追蹤數</th> -->
<!-- 			                        			<th class="items">文章總數</th> -->
<!-- 			                        		</tr> -->
<!-- 			                        		<tr> -->
<%-- 			                        			<th id="recipe_num" class="items">${member.recipe_num }</th> --%>
<%-- 												<th id="tracked_num" class="items">${member.tracked_num }</th> --%>
<%-- 												<th id="forum_num" class="items">${member.forum_num }</th> --%>
<!-- 			                        		</tr> -->
<!-- 			                        	</table> -->
<!-- 			                        </div>//content   -->
<!-- 			                    </div>//section-inner                  -->
<!-- 			                </aside>//aside -->
<!-- 			            </div>//secondary     -->
<!-- 			        </div>//row -->
<!--   				 </div>//masonry -->


<!-- 				<div class="row"> -->
<!-- 					<div class="bottom_block"> -->
<!-- 						<div class="col-1-2"> -->
<!-- 							<h3>Follow Us</h3> -->
<!-- 							<div class="socials"> -->
<!-- 								<a href="#"></a> <a href="#"></a> <a href="#"></a> -->
<!-- 							</div> -->
<!-- 							<nav> -->
<!-- 								<ul> -->
<!-- 									<li><a href="index.html">Home</a></li> -->
<!-- 									<li><a href="index-1.html">About Us</a></li> -->
<!-- 									<li><a href="index-2.html">Menu</a></li> -->
<!-- 									<li><a href="index-3.html">Portfolio</a></li> -->
<!-- 									<li class="current"><a href="index-4.html">News </a></li> -->
<!-- 									<li><a href="index-5.html">Contacts</a></li> -->
<!-- 								</ul> -->
<!-- 							</nav> -->
<!-- 						</div> -->
<!-- 						<div class="col-1-2"> -->
<!-- 							<h3>Email Updates</h3> -->
<!-- 							<p class="col1"> -->
<!-- 								Join our digital mailing list and get news<br> deals and be -->
<!-- 								first to know about events -->
<!-- 							</p> -->
<%-- 							<form id="newsletter"> --%>
<!-- 								<div class="success">Your subscribe request has been sent!</div> -->
<!-- 								<label class="email"> <input type="email" -->
<!-- 									value="Enter e-mail address"> <a href="#" class="btn" -->
<!-- 									data-type="submit">subscribe</a> <span class="error">*This -->
<!-- 										is not a valid email address.</span> -->
<!-- 								</label> -->
<%-- 							</form> --%>
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	<div class="container sections-wrapper"> -->
<!--         <div class="row"> -->
<!--             <div class="primary col-md-8 col-sm-12 col-xs-12"> -->
<!-- 				<ul id="myTab" class="nav nav-tabs" > -->
<!-- 					<li class="active"> -->
<!-- 						<a href="user_myrecipe" data-toggle="tab">我的食譜</a> -->
<!-- 					</li> -->
<!-- 					<li> -->
<!-- 						<a href="user_mycollectrecipe" data-toggle="tab">我的收藏</a> -->
<!-- 					</li> -->
<!-- 					<li> -->
<!-- 						<a id="user_mytrack" data-toggle="tab">我的追蹤</a> -->
<!-- 					</li> -->
<!-- 					<li> -->
<!-- 						<a href="user_myforum" data-toggle="tab">我的文章</a> -->
<!-- 					</li> -->
<!-- 				</ul> -->

<!-- 				<section class="about section"> -->
<!-- 					<div class="section-inner"> -->
<!-- 						<div id="myTabContent" class="tab-content"> -->
<!-- <!-- 							<div class="tab-pane fade in active" id="user_contain"> --> -->
<!-- 							<div  id="user_contain"> -->
<!-- <!--                 				<iframe src="hw1.html" frameborder="0" class="HWView" id="aa">dsdsds</iframe> --> -->
<!--             				</div> -->
<!-- 						</div> -->
<!-- 					</div>//section-inner                  -->
<!-- 				</section>//section -->
<!--             </div>//primary -->
<!--             <div class="secondary col-md-4 col-sm-12 col-xs-12"> -->
<!--                  <aside class="info aside section"> -->
<!--                     <div class="section-inner"> -->
<!--                         <h2 class="heading sr-only">Basic Information</h2> -->
<!--                         <div class="content"> -->
<!--                         	<table width="100%"> -->
<!--                         		<tr> -->
<!--                         			<th class="items">食譜數量</th> -->
<!--                         			<th class="items">被追蹤數</th> -->
<!--                         			<th class="items">文章總數</th> -->
<!--                         		</tr> -->
<!--                         		<tr> -->
<%--                         			<th class="items">${member.recipe_num }</th> --%>
<%--                         			<th class="items">${member.tracked_num }</th> --%>
<%--                         			<th class="items">${member.forum_num }</th> --%>
<!--                         		</tr> -->
<!--                         	</table> -->
<!--                         </div>//content   -->
<!--                     </div>//section-inner                  -->
<!--                 </aside>//aside -->
<!--             </div>//secondary     -->
<!--         </div>//row -->
<!--     </div>//masonry -->

	<div class="container sections-wrapper">
        <div class="row">
            <div class="primary col-md-8 col-sm-12 col-xs-12">
				<ul id="myTab" class="nav nav-tabs" >
					<li class="active">
						<a href="user_myrecipe" data-toggle="tab">我的食譜</a>
					</li>
					<li>
						<a href="user_mycollectrecipe" data-toggle="tab">我的收藏</a>
					</li>
					<li>
						<a id="user_mytrack" data-toggle="tab">我的追蹤</a>
					</li>
					<li>
						<a href="user_myforum" data-toggle="tab">我的文章</a>
					</li>
				</ul>

				<section class="about section">
					<div class="section-inner">
						<div id="myTabContent" class="tab-content">
<!-- 							<div class="tab-pane fade in active" id="user_contain"> -->
							<div  id="user_contain">
<!--                 				<iframe src="hw1.html" frameborder="0" class="HWView" id="aa">dsdsds</iframe> -->
            				</div>
						</div>
					</div><!--//section-inner-->                 
				</section><!--//section-->
            </div><!--//primary-->
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
                        </div><!--//content-->  
                    </div><!--//section-inner-->                 
                </aside><!--//aside-->
            </div><!--//secondary-->    
        </div><!--//row-->
    </div><!--//masonry-->
	<!--==============================footer=================================-->

	<footer>
		<div class="zerogrid">
			<div class="col-full">
				<div class="wrap-col">
					&copy; Copyright &copy; 2013.Company name All rights reserved.<a
						target="_blank" href="http://sc.chinaz.com/moban/">&#x7F51;&#x9875;&#x6A21;&#x677F;</a>
				</div>
			</div>
		</div>
	</footer>
	</div>
	<div style="display: none">
		<script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540'
			language='JavaScript' charset='gb2312'></script>
	</div>
</body>
</html>