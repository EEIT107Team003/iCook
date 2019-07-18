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
    <!-- Meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Responsive HTML5 Website landing Page for Developers">
    <meta name="author" content="3rd Wave Media">    
    <link rel="shortcut icon" href="favicon.ico">  
    <link href='http://fonts.googleapis.com/css?family=Lato:300,400,300italic,400italic' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'> 
    <!-- Global CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/bootstrap/css/bootstrap.min.css">   
    <!-- Plugins CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/font-awesome/css/font-awesome.css">
    <!-- github acitivity css -->
    <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/octicons/2.0.2/octicons.min.css">
    <link rel="stylesheet" href="http://caseyscarborough.github.io/github-activity/github-activity-0.1.0.min.css">
    
    <!-- Theme CSS -->  
    <link id="theme-style" rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/styles.css">
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
<script>
	$(document).ready(function() {
		$("#member_photo_file").click(function(){
			$.ajax({
				url : "${pageContext.request.contextPath}/updateMemberPhotos",
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
				url : "${pageContext.request.contextPath}/updateCoverPhotos",
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
    	border-radius: 20px;
    	text-align:center;

    }
    .change_cover{
     	float: right; 
      	background-color: #D8D8D8; 
      	color:black; 
      	border: 1px solid black; 
      	border-radius: 5px; 
/*      	letter-spacing: 5px; */
/*  		text-align: left; */
    }
    
    .items{
	    padding-top:5px ;
	    padding-bottom:5px ;
	    text-align:center;
	   	width:33.3%;
    }
    
    section{
		border: 1px solid rgb(220,220,220);
		border-top: 0px
    }
</style>    
</head> 
<body>
	<a href="logout_page" class="alert alert-dark" role="alert">會員登出</a>
	<a href="home" class="alert alert-dark" role="alert">回到首頁</a>
    <!-- ******HEADER****** --> 
    <header class="header" style="background-image:url('getCoverPhoto/${member_id}');background-size:100% 100%">
        <div class="container" >
				<form:form method="POST" action="updateMemberPhoto"
					modelAttribute="MemberBean" enctype="multipart/form-data">
					<label for="member_photo_file" style="float: left"> 
					<form:input type="file" path="member_photo_tr" name="member_photo_file"
							id="member_photo_file" style="display: none;" /> 
							<img class="profile-image img-responsive pull-left member_photo"
						id="member_photo_image"
						src="<c:url value='/getMemberPhoto/${member_id}' />" />
					</label>
					<input id=submit1 type="submit" value="送出" style="display: none;">
				</form:form>
				
				<div class="profile-content pull-left member_info">
					<h1 class="name">${member.nickname}</h1>
					<h2 class="desc" style="font-size: 10px">${member.resume}</h2>
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
				<div class="change_cover">
					<form:form method="POST" action="updateCoverPhoto" modelAttribute="MemberBean" enctype="multipart/form-data">
							<label for="cover_photo_file"> 
								<form:input type="file" path="cover_photo_tr" name="cover_photo_file" id="cover_photo_file" style="display: none;" /> 
								<p id="cover_photo_image"> 更改圖片 </p>
							</label>					
							<input id=submit2 type="submit" value="送出" style="display: none;">
					</form:form>
				</div>
				
	<div class="container sections-wrapper">
        <div class="row">
            <div class="primary col-md-8 col-sm-12 col-xs-12">
				<ul id="myTab" class="nav nav-tabs" >
					<li class="active">
						<a href="member_group" data-toggle="tab">我的食譜</a>
					</li>
					<li>
						<a href="member_group" data-toggle="tab">我的收藏</a>
					</li>
					<li>
						<a href="member_group" data-toggle="tab">我的追蹤</a>
					</li>
					<li>
						<a href="member_group" data-toggle="tab">我的文章</a>
					</li>
				</ul>

				<section class="about section">
					<div class="section-inner">
						<div id="myTabContent" class="tab-content">
<!-- 							<div class="tab-pane fade in active" id="home"> -->
<!--                 				<iframe src="hw1.html" frameborder="0" class="HWView" id="aa">dsdsds</iframe> -->
<!--             				</div> -->
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
    <script type="text/javascript" src="assets/plugins/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="assets/plugins/jquery-migrate-1.2.1.min.js"></script>
    <script type="text/javascript" src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>    
    <script type="text/javascript" src="assets/plugins/jquery-rss/dist/jquery.rss.min.js"></script> 
    <!-- github activity plugin -->
    <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/mustache.js/0.7.2/mustache.min.js"></script>
    <script type="text/javascript" src="http://caseyscarborough.github.io/github-activity/github-activity-0.1.0.min.js"></script>
    <!-- custom js -->
    <script type="text/javascript" src="assets/js/main.js"></script>            
</body>
</html> 
