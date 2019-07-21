<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->  
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->  
<!--[if !IE]><!--> <html lang="en"> <!--<![endif]-->  
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
    <title>Responsive HTML5 Website Template for Developers | 3rd Wave Media</title>
<!--     Meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Responsive HTML5 Website landing Page for Developers">
    <meta name="author" content="3rd Wave Media">    
    <link rel="shortcut icon" href="favicon.ico">  
    <link href='http://fonts.googleapis.com/css?family=Lato:300,400,300italic,400italic' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'> 
<!--     Global CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/bootstrap/css/bootstrap.min.css">   
<!--     Plugins CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/font-awesome/css/font-awesome.css">
<!--     github acitivity css -->
<!--     <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/octicons/2.0.2/octicons.min.css"> -->
<!--     <link rel="stylesheet" href="http://caseyscarborough.github.io/github-activity/github-activity-0.1.0.min.css"> -->
<!--     Theme CSS   -->
    <link id="theme-style" rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/styles.css">
<!--     HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--     [if lt IE 9]>
<!--       <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script> -->
<!--       <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script> -->
<!--     <![endif]--> 
<!-- <!--     CSS字型 --> 
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+TC&display=swap" rel="stylesheet">
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
//	 					txt+=names[i].trackedId.nickname+"<br>"
// 					alert(data);
					$("#member_resume").html(resume);
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
</script>
    
<style>
    .member_photo{
    	width: 175px;
    	height: 175px;
		border-radius: 50%;
		border: 2px solid black;
		margin-left: 0px;
    }
    .member_info{
    	padding-left:15px;
    	width:300px;
    	height:100%;
   		background-color: rgb(242, 255, 213,1);
    	border: 2px dashed black;
    	border-radius: 10px;
    	text-align:center;

    }
    .change_cover{
     	float: right; 
      	background-color: #D8D8D8; 
      	color:black; 
      	border: 1px solid black; 
      	border-radius: 5px; 
    }
    
    .items{
	    padding-top:5px ;
	    padding-bottom:5px ;
	    text-align:center;
	   	width:33.3%;
    }
    
    .contain_mytrack{
    	border:1px solid black;
    	width:100%;
    	height: 130px;
    	margin-bottom: 10px;
    	padding-left: 10px;
    }
    
    .contain_mytrack_photo{
    	border-radius: 50%;
    	border:1px solid black;
     	width:100px;
		height:100px;
		margin-top:15px;
 		margin-right:20px;
		float:left;
    }
    
    .contain_mytrack_Info{
    	 height:130px;
		 width:80%; 
		 margin-left: 20px;
    }
    
    .contain_mytrack_title{
    	color:black;
    	margin-top:5px;
 		height:30px; 
 		font-size: 25px;
 		font-family:'Noto Sans TC', sans-serif;;
 		font-weight: 900;
 	}
 	
 	.contain_mytrack_summary{ 
 	 	height:70%;
 	 	font-family:'Noto Sans TC', sans-serif;
 	}
    
    section{
		border: 1px solid rgb(220,220,220);
		border-top: 0px
    }
    
    .user_control{
    	float: right;
    	margin-right: 10px;
    }
    
    .user_control_title{
		width:140px
    }
    
   td{
   	margin: 3px;
   }
    
</style>    
</head> 
<body>
	<a href="logout_page" class="alert alert-dark" role="alert">會員登出</a>
	<a href="${pageContext.request.contextPath}/home" class="alert alert-dark" role="alert">回到首頁</a>
    <!-- ******HEADER****** --> 
    <header class="header" style="background-color:white; background-image:url('getCoverPhoto/${member.member_id}');background-size:100% 100%">
        <div class="container" >
				<form:form method="POST" action="user/updateMemberPhoto"
					modelAttribute="MemberBean" enctype="multipart/form-data">
					<label for="member_photo_file" style="float: left"> 
					<form:input type="file" path="member_photo_tr" name="member_photo_file"
							id="member_photo_file" style="display: none;" /> 
							<img class="profile-image img-responsive pull-left member_photo"
						id="member_photo_image"
						src="<c:url value='/getMemberPhoto/${member.member_id}' />" />
					</label>
					<input id=submit1 type="submit" value="送出" style="display: none;">
				</form:form>
<%-- 				<form id=updateMemberPhoto method="POST" enctype="multipart/form-data"> --%>
<!-- 					<label id="member_photo_label" for="member_photo_tr" style="float: left">  -->
<!-- 						<input type="file" name="member_photo_tr" id="member_photo_tr" style="display: none;" />  -->
<!-- 						<img class="profile-image img-responsive pull-left member_photo" -->
<!-- 							id="member_photo_image" -->
<%-- 							src="<c:url value='/getMemberPhoto/${member.member_id}' />" /> --%>
<!-- 					</label> -->
<%-- 				</form> --%>

				<div class="profile-content pull-left member_info">
					<h1 id="member_nickname">${member.nickname}</h1>
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
				<!--//profile-->
        </div><!--//container-->
    </header><!--//header-->
    
<!-- 修改會員資料-----------------------------------------------------------------------	 -->
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
								<td><input id="change_username" name="username" type="text" disabled="disabled" value="${member.username}" /></td>
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
				            	<td><textarea id="change_reaume" name="resume" style="min-height: 40px; max-height: 200px; min-width:80%; max-width:80%">${member.resume}</textarea></td>
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
<!-- -----------------------------------------------------------------------	 -->

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
    
    <!-- ******FOOTER****** --> 
    <footer class="footer">
        <div class="container text-center">
                <small class="copyright">Designed with <i class="fa fa-heart"></i> by <a href="http://themes.3rdwavemedia.com" target="_blank">3rd Wave Media</a> for developers</small>
        </div><!--//container-->
    </footer><!--//footer-->
 
    <!-- Javascript -->          
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/plugins/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/plugins/jquery-migrate-1.2.1.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/plugins/bootstrap/js/bootstrap.min.js"></script>    
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/plugins/jquery-rss/dist/jquery.rss.min.js"></script> 
    <!-- github activity plugin -->
    <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/mustache.js/0.7.2/mustache.min.js"></script>
    <script type="text/javascript" src="http://caseyscarborough.github.io/github-activity/github-activity-0.1.0.min.js"></script>
    <!-- custom js -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/main.js"></script>            
</body>
</html> 

