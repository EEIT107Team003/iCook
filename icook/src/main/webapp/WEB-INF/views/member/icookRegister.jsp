<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Contacts</title>
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
<link rel="stylesheet" href="css/form.css">
<script src="js/jquery.js"></script>
<script src="js/jquery-migrate-1.1.1.js"></script>
<script src="js/superfish.js"></script>
<script src="js/jquery.easing.1.3.js"></script>
<script src="js/sForm.js"></script>
<script src="js/Forms.js"></script>
<script src="js/css3-mediaqueries.js"></script>
<!-- 彈跳視窗 -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"
	integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"
	integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k"
	crossorigin="anonymous"></script>
<!-- 彈跳視窗 -->

<script>
	$(function (){
	    function format_float(num, pos){
	        var size = Math.pow(10, pos);
	        return Math.round(num * size) / size;
	    };
	
		function preview(input) {
	        if (input.files && input.files[0]) {
	            var reader = new FileReader();
	        	reader.onload = function (e) {
	            $('#member_photo_image').attr('src', e.target.result);
	        };
	            reader.readAsDataURL(input.files[0]);
	        };
	    };
		 
	    $("#member_photo_file").change(function (){
	        preview(this);
	    });
	});			
</script>

<style>
	.member_photo {
		width: 175px;
		height: 175px;
		border-radius: 50%;
		border: 2px solid black;
	}
	td{
		vertical-align: middle;
	}

</style>    

</head>
<body style="background-color:#55a237 ">
	<div class="main">
		<!--==============================header=================================-->
		<header>
			<div class="zerogrid">
				<div class="col-full">
					<div class="wrap-col">
						<h1>
							<a  style="height:200px" href="${pageContext.request.contextPath}/index2"><img src="${pageContext.request.contextPath}/images/logo.png" style="width: 200px ;right: 200px ;border-radius: 50%;" alt="EXTERIOR"></a>
						</h1>

						<div class="menu_block">
							<nav>
								<ul class="sf-menu"  style="padding-top:55px">
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
										</ul></li>
									<li><a href="icookLife">生活誌</a></li>
									<li><a href="forum/overview">討論區</a></li>
									<li><a href="A_articlemainpage">文章區</a>
										<ul>
											<li><a href="A_article">test</a></li>

										</ul></li>


									<li><a href="products">市集</a>
										<ul>


											<li><a href="cartPage">購物車</a></li>
										</ul></li>

									<li><a href="user">會員專區</a>
										<ul>
											<c:if test="${pageContext.request.userPrincipal.name==null}">
												<li><a href="icookLogin">會員登入</a></li>
												<li><a href="icookRegister">會員註冊</a></li>
											</c:if>
											<c:if test="${pageContext.request.userPrincipal.name!=null}">
												<li><a href="index2" data-toggle="modal"
													data-target="#logout">會員登出</a></li>
											</c:if>
											<li><a href="checkOrders">查看訂單</a></li>
											<li><a href="icookAddRecipe">新增食譜</a></li>
											<li><a href="backStage">後台</a></li>
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
		<!--=======content================================-->
		<!-- 確認登出 -->
		<div class="modal fade" id="logout" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header" style="border-bottom: 1px solid;">
						<h4 class="modal-title" id="myModalLabel" style="float: left">您即將登出享食天堂</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">×</button>
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

		<div class="content">
			<div class="zerogrid">
				<div class="row">
					<div class="col-1-5">
						<div class="wrap-col">
							<!--empty-->
						</div>
					</div>
					<div class="col-2-5">
						<div class="wrap-col">
							<h2>加入享食客</h2>
									
			<form:form method="POST" modelAttribute="MemberBean"
					enctype="multipart/form-data">
					<fieldset>
						<div>
							<label for="member_photo_file"> 
									<form:input type="file" path="member_photo_tr" name="member_photo_file"
										id="member_photo_file" style="display: none;" /> 
										<img class="profile-image img-responsive pull-left member_photo" 
 										id="member_photo_image" style="background-color:white;margin: 20px;"  
 										src="<c:url value='resources\images\NoImage.png' />" />
 							</label> 	
						</div>	
							<table>
								<tr> 
									<td><label for="nickname">暱稱：</label></td>
									<td>
										<form:input id="nickname" path="nickname" type="text" />
									</td>					 
								</tr>
								<tr>
									<td><label for="username">電子郵件：</label></td>
									<td>
										<form:input id="username" path="username" type="text" />
									</td>
								</tr> 
								<tr>
									<td><label for="password">密碼：</label></td>
									<td>
										<form:input id="password" path="password" type="text" />
									</td>
								</tr> 
							</table>
				
						<div class="clear"></div>
						<input id=submit type="submit" value="送出">
					</fieldset>
				</form:form>
			</div>
		</div>
	</div>

				<div class="row">
					<div class="bottom_block">
						<div class="col-1-2">
							<h3>Follow Us</h3>
							<div class="socials">
								<a href="#"></a> <a href="#"></a> <a href="#"></a>
							</div>
							<nav>
								<ul>
									<li><a href="index.html">Home</a></li>
									<li><a href="index-1.html">About Us</a></li>
									<li><a href="index-2.html">Menu</a></li>
									<li><a href="index-3.html">Portfolio</a></li>
									<li><a href="index-4.html">News </a></li>
									<li class="current"><a href="index-5.html">Contacts</a></li>
								</ul>
							</nav>
						</div>
						<div class="col-1-2">
							<h3>Email Updates</h3>
							<p class="col1">
								Join our digital mailing list and get news<br> deals and be
								first to know about events
							</p>
							<form id="newsletter">
								<div class="success">Your subscribe request has been sent!</div>
								<label class="email"> <input type="email"
									value="Enter e-mail address"> <a href="#" class="btn"
									data-type="submit">subscribe</a> <span class="error">*This
										is not a valid email address.</span>
								</label>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--==============================footer=================================-->

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
	<div style="display: none">
		<script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540'
			language='JavaScript' charset='gb2312'></script>
	</div>
</body>
</html>