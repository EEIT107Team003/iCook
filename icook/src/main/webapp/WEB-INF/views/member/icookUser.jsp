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
<meta http-equiv="X-UA-Compatible" content="IE=edge"/> 
<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
<meta name="description" content="Responsive HTML5 Website landing Page for Developers"> 
<meta name="author" content="3rd Wave Media">     
<link rel="shortcut icon" href="favicon.ico">   
<link href='http://fonts.googleapis.com/css?family=Lato:300,400,300italic,400italic' rel='stylesheet' type='text/css'> 
<link href='http://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>  
<%--     <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/bootstrap/css/bootstrap.min.css">    --%> 
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/font-awesome/css/font-awesome.css"> 
<link id="theme-style" rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/styles.css"> 

<!-- 	<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css"> -->
<!-- 	<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script> -->
<!-- 	<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script> -->

<link href="https://fonts.googleapis.com/css?family=Noto+Sans+TC&display=swap" rel="stylesheet">


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
/* contain ------------------------------------------------------------------------------------------ */
.contain_mytrack {
	border: 1px solid #c7c7c7;
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
	font-family: 'Noto Sans TC', sans-serif;
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
.contain_items{
	margin-top: 10px;
	margin-left: 10px;
	margin-right: 10px;
	padding-bottom:3px;
}

a{
	font-family: 'Noto Sans TC', sans-serif;
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
			$("#tag_myRecipe").css({"border-bottom": "3px solid green"});
			$("#tag_myCollectRecipe").css({"border-bottom": "none"});
			$("#tag_myTrack").css({"border-bottom": "none"});
			$("#tag_myForum").css({"border-bottom": "none"});
			$.ajax({
				url : "${pageContext.request.contextPath}/user/myrecipe",
				type : "POST",
				dataType : "json",
				async : true,
				success : function(data) {
					var names = JSON.parse(JSON.stringify(data).split(","));
					var txt = "";
					console.log(data);
					
					for (i in names) {
						txt+=
							"<div class=contain_mytrack>"
								+"<div width=100%>"
								+"<div>"
									+"<img class=contain_mytrack_photo src=<c:url value='/getRecipePicture/"+names[i].pk_recipe_id+"' /> />"
								+"</div>"
									+"<a href='${pageContext.request.contextPath}/recipe/recipeSuccessPage/two/"+names[i].pk_recipe_id+"' class='contain_mytrack_title'>"+names[i].recipe_name+"</a>"
								+"</div>"
									+"<div class=contain_mytrack_summary>食譜簡介："+names[i].recipe_summary+"</div>"
								+"</div>"
							+"</div>";
					};
					
					$("#user_contain").html(txt);
				},
				error : function(data, textStatus, errorThrown) {
					console.log("error: "+data);
				},
			});

		$("#member_photo_file").click(function(){
			$("#member_photo_file").change(function(){
				$("#submit1").click();
			});
		});	
	
		$("#cover_photo_image").click(function(){
			$("#cover_photo_file").change(function(){
				$("#submit2").click();
			});
		});
		
		$("#user_myrecipe").click(function(){
			$("#tag_myRecipe").css({"border-bottom": "3px solid green"});
			$("#tag_myCollectRecipe").css({"border-bottom": "none"});
			$("#tag_myTrack").css({"border-bottom": "none"});
			$("#tag_myForum").css({"border-bottom": "none"});
			$.ajax({
				url : "${pageContext.request.contextPath}/user/myrecipe",
				type : "POST",
				dataType : "json",
				async : true,
				success : function(data) {
					var names = JSON.parse(JSON.stringify(data).split(","));
					var txt = "";
					console.log(data);
					
					for (i in names) {
						txt+=
							"<div class=contain_mytrack>"
								+"<div width=100%>"
								+"<div>"
									+"<img class=contain_mytrack_photo src=<c:url value='/getRecipePicture/"+names[i].pk_recipe_id+"' /> />"
								+"</div>"
									+"<a href='${pageContext.request.contextPath}/recipe/recipeSuccessPage/two/"+names[i].pk_recipe_id+"' class='contain_mytrack_title'>"+names[i].recipe_name+"</a>"
								+"</div>"
								+"<div class=contain_mytrack_summary>食譜簡介："+names[i].recipe_summary+"</div>"
								+"</div>"
							+"</div>";
					};
					$("#recipe_num").html(names.length)
					$("#user_contain").html(txt);
				},
				error : function(data, textStatus, errorThrown) {
					console.log("error: "+data);
				},
			});
		});
		
		$("#user_mycollectrecipe").click(function(){
			$("#tag_myRecipe").css({"border-bottom": "none"});
			$("#tag_myCollectRecipe").css({"border-bottom": "3px solid green"});
			$("#tag_myTrack").css({"border-bottom": "none"});
			$("#tag_myForum").css({"border-bottom": "none"});
			$.ajax({
				url : "${pageContext.request.contextPath}/user/mycollectrecipe",
				type : "POST",
				dataType : "json",
				contentType : "application/json",
				async : true,
				success : function(data) {
					var names = JSON.parse(JSON.stringify(data).split(","));
					var txt = "";
					console.log(data);
					for (i in names) {
						txt+=
							"<div class=contain_mytrack>"
							+"<div width=100%>"
							+"<div>"
								+"<img class=contain_mytrack_photo src=<c:url value='/getRecipePicture/"+names[i].recipeBean_id+"' /> />"
							+"</div>"
								+"<a href='${pageContext.request.contextPath}/recipe/recipeSuccessPage/two/"+names[i].recipeBean_id+"' class='contain_mytrack_title'>"+names[i].recipeBean_name+"</a>"
							+"</div>"
							+"<div class=contain_mytrack_summary>食譜簡介："+names[i].recipeBean_summary+"</div>"
							+"</div>"
						+"</div>";
					};
					$("#user_contain").html(txt);
				},
				error : function(data, textStatus, errorThrown) {
					console.log("error: "+data);
				},
			});
		});
		
		$("#user_mytrack").click(function(){
			$("#tag_myRecipe").css({"border-bottom": "none"});
			$("#tag_myCollectRecipe").css({"border-bottom": "none"});
			$("#tag_myTrack").css({"border-bottom": "3px solid green"});
			$("#tag_myForum").css({"border-bottom": "none"});
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
						txt+=
							"<div class=contain_mytrack>"
								+"<div>"
									+"<img class=contain_mytrack_photo src=<c:url value='/getMemberPhoto/"+names[i].trackedBean_id+"' /> />"
								+"</div>"
								+"<div class=contain_mytrack_Info style="+"height:175px;"+">"
									+"<div width=100%>"
									+"<a href=members/page?member_id="+names[i].trackedBean_id+" class=contain_mytrack_title>"+ names[i].trackedBean_nickname+"</a>"
									+"</div>"		
									+"<div class=contain_mytrack_summary>個人簡介:"+names[i].trackedBean_resume+"</div>"
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
			$("#tag_myRecipe").css({"border-bottom": "none"});
			$("#tag_myCollectRecipe").css({"border-bottom": "none"});
			$("#tag_myTrack").css({"border-bottom": "none"});
			$("#tag_myForum").css({"border-bottom": "3px solid green"});
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
							"<div class=contain_mytrack>"
									+"<div width=100%>"
										+"<a href=${pageContext.request.contextPath}/forum/pick?harticle_id="+names[i].harticle_id+"&article_id="+names[i].article_id+" class=contain_mytrack_title>"+"["+names[i].category+"] "+names[i].title+"</a>"
									+"</div>"	
								+"<div class=contain_myforum_time>發文時間: "+formatDate(names[i].editTime)+"</div>"
								+"</div>"
								+"<hr style=clear: both;border-style: dashed;>"
							+"</div>"
						console.log(names[i].title);
					};
					$("#forum_num").html(names.length)
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
					$("#ss").html(c_nickname);
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
<body style="background-color: #55a237">
	<div class="main">
		<!--==============================header=================================-->
		<header>
			<sec:authorize access="isAuthenticated()">
				<div class="btn btn-success" onclick="javascript:location.href='user'" style="float:right;margin-right:50px;padding-left:35px;min-width:200px ">
					<img id="member_photo_image"
						 style="float:left;width:100px;height: 100px;border-radius: 50%; border: 1px solid black;background-color: white;"
						 src="<c:url value='/getMemberPhoto/${member.member_id}' />" />
					<div id="ss" style=" font-size:60px;float: left;margin-left: 30px;">${member.nickname}</div>
				</div>
			</sec:authorize>
			<div class="zerogrid">
			<!-- 修改會員資料-----------------------------------------------------------------------	 -->
				<div class="col-full">
					<div class="wrap-col">
						<h1>
							<a  style="height:200px" href="${pageContext.request.contextPath}/index2"><img src="${pageContext.request.contextPath}/images/logo.png" style="width: 200px ;right: 200px ;border-radius: 50%;" alt="EXTERIOR"></a>
						</h1>

						<div class="menu_block" style="float:left;">
							<nav>
								<ul class="sf-menu" style="padding-top: 55px" >
									<li><a href="${pageContext.request.contextPath}/index2">ICook</a></li>
									<li>
										<a href="<c:url value='recipe/recipeSelect' />">食譜專區</a>
										<ul>
											<li>
											<a href="<c:url value='user/recipe/recipeInsert' />">新增食譜</a>
											</li>
											<li>
											<a href="<c:url value='recipe/recipeSelect' />">查看食譜</a>
											</li>
											<!--<li><a href="#">cat3</a></li>-->
										</ul>
									</li>
									<li><a href="${pageContext.request.contextPath}/forum/overview">討論區</a></li>
									<li><a href="${pageContext.request.contextPath}/A_articlemainpage">生活誌</a></li>
									<li><a href="${pageContext.request.contextPath}/products">市集</a>
										<ul>
											<li><a href="${pageContext.request.contextPath}/cartPage">購物車</a></li>
										</ul></li>
									<%-- </c:if><c:if test="${pageContext.request.userPrincipal.name==null}"> --%>
									<li><a href="${pageContext.request.contextPath}/user">會員專區 </a>
										<ul>
											<sec:authorize access="!isAuthenticated()">
												<li><a href="${pageContext.request.contextPath}/icookLogin">會員登入</a></li>
												<li><a href="${pageContext.request.contextPath}/icookRegister">會員註冊</a></li>
											</sec:authorize>
											<c:if test="${pageContext.request.userPrincipal.name!=null}">
												<li><a href="${pageContext.request.contextPath}/index2" data-toggle="modal"
													data-target="#logout">會員登出</a></li>
											</c:if>
											<li><a href="${pageContext.request.contextPath}/checkOrders">查看訂單</a></li>
											<sec:authorize access="hasRole('ADMIN')">
												<li><a href="${pageContext.request.contextPath}/backStageDashboard">後台</a></li>
											</sec:authorize>
										</ul></li>
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

		
				<div style="text-align: center;">
					<div class="member_info" style="margin-left:380px;">
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
							<h1 id="member_nickname" style="color:black">${member.nickname}</h1>
							<h2 id="member_resume" class="desc" style="font-size: 15px ;color:black">${member.resume}</h2>
						</div>	
					</div>
					<div class="member_cover_img" style="background-image:url('getCoverPhoto/${member.member_id}');background-size:100% 100%;" ></div>
				</div>
<!-- 				style="height: 100%;width: 100%" -->

				<!-- 控制項-------------------------------------------				 -->
			<div style="clear: both;margin-right: 370px ">
				<div class="user_control">
					<p class="btn btn-primary btn-lg user_control_title" data-toggle="modal" data-target="#myModal_changeInfo">編輯會員資料</p>
					<div class="modal fade" id="myModal_changeInfo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					    <div class="modal-dialog">
					        <div class="modal-content">
					            <div class="modal-header">
					                <h4 class="modal-title" id="myModalLabel_changeInfo" style="float: left">編輯會員資料</h4>
					                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
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
					                <h4 class="modal-title" id="myModalLabel" style="float: right">編輯個人簡介</h4>
					                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
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
	<div class="content" style="margin-top: 50px ; ">
			<div style="width: 100%; ">
				<div class="container sections-wrapper"
					style="background-color: white; border: 1px, solid, #c7c7c7">
					<div class="row">
						<div class="primary col-md-8 col-sm-12 col-xs-12"
							style="float: left; border: 1px, solid, #c7c7c7; box-shadow: 4px 4px 3px 4px rgba(20%, 20%, 40%, 0.5);">
							<ul id="myTab" class="nav nav-tabs">
								<li><div id="tag_myRecipe" class="contain_items" style="border-bottom: 3px solid green"><a id="user_myrecipe" data-toggle="tab">我的食譜</a></div></li>
								<li><div id="tag_myCollectRecipe" class="contain_items"><a id="user_mycollectrecipe" data-toggle="tab">我的收藏</a></div></li>
								<li><div id="tag_myTrack" class="contain_items"><a  id="user_mytrack" data-toggle="tab">我的追蹤</a></div></li>
								<li><div id="tag_myForum" class="contain_items"><a  id="user_myforum" data-toggle="tab">我的文章</a></div></li>
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
						<div class="secondary col-md-4 col-sm-12 col-xs-12"
							style="float: right; height: 155px; border: 1px, solid, #dcdcdc; box-shadow: 4px 4px 3px 4px rgba(20%, 20%, 40%, 0.5);">
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
		<div>
	<div >
		<br>
		
				
			</div>
		</div>
		</div>

	<!--==============================footer=================================-->

	<footer style="background-color: #55a237">
		<div class="zerogrid">
			<div class="col-full">
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