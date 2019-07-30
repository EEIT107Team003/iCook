<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<spring:url value="/resources/js/lib/sockjs.min.js" var="sockjs" />
<spring:url value="/resources/js/lib/stomp.min.js" var="stomp" />
<spring:url value="/resources/js/script.js" var="script" />
<spring:url value="/resources/js/lib/bootstrap/css/chat.css"
	var="chatCSS" />
<spring:url value="/resources/css/chat.css" var="chatroomCSS" />
<spring:url value="/images/logo.png" var="logo" />
<spring:url value="/resources/css/table.css" var="table" />
<spring:url value="/resources/css/open-iconic-bootstrap.min.css"
	var="oicbCSS" />
<spring:url value="/resources/css/animate.css" var="animateCSS" />
<spring:url value="/resources/css/owl.carousel.min.css" var="ocCSS" />
<spring:url value="/resources/css/owl.theme.default.min.css"
	var="otdCSS" />
<spring:url value="/resources/css/magnific-popup.css" var="mpCSS" />
<spring:url value="/resources/css/aos.css" var="aosCSS" />
<spring:url value="/resources/css/ionicons.min.css" var="ioniconsCSS" />
<spring:url value="/resources/css/bootstrap-datepicker.css" var="bdCSS" />
<spring:url value="/resources/css/jquery.timepicker.css" var="jtCSS" />
<spring:url value="/resources/css/flaticon.css" var="flaticonCSS" />
<spring:url value="/resources/css/icomoon.css" var="icomoonCSS" />
<spring:url value="/resources/css/style.css" var="styleRCSS" />
<!DOCTYPE html>
<html lang="en">
<head>
<title>享食天堂</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Abril+Fatface&display=swap"
	rel="stylesheet">

<link rel="stylesheet" href=" ${oicbCSS}">
<link rel="stylesheet" href="${animateCSS}">
<link rel="stylesheet" href="${ocCSS}">
<link rel="stylesheet" href="${otdCSS}">
<link rel="stylesheet" href="${mpCSS}">
<link rel="stylesheet" href="${aosCSS}">
<link rel="stylesheet" href="${ioniconsCSS}">
<link rel="stylesheet" href="${bdCSS}">
<link rel="stylesheet" href="${jtCSS}">
<link rel="stylesheet" href="${flaticonCSS}">
<link rel="stylesheet" href="${icomoonCSS}">
<link rel="stylesheet" href="${styleRCSS}">


<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<style>
.fixed {
	position: fixed;
	bottom: 0;
	right: 0;;
	background-color: white;
	text-align: right;
}

.incoming_msg_img {
	display: inline-block;
	width: 10%;
}

.received {
	display: inline-block;
	padding: 0 0 0 10px;
	vertical-align: top;
	width: 92%;
}

.receivedmsg p {
	background: #73bf00;
	border-radius: 3px;
	color: #646464;
	font-size: 14px;
	margin: 0;
	padding: 5px 10px 5px 12px;
	width: 100%;
}

.time_date {
	color: #747474;
	display: block;
	font-size: 12px;
	margin: 8px 0 0;
}

.receivedmsg {
	width: 57%;
}

.mesgs {
	float: left;
	padding: 30px 15px 0 25px;
	width: 60%;
}

.sent_msg p {
	background: #05728f none repeat scroll 0 0;
	border-radius: 3px;
	font-size: 14px;
	margin: 0;
	color: #fff;
	padding: 5px 10px 5px 12px;
	width: 100%;
	display: block;
}

.outgoing_msg {
	/* 	overflow: hidden; */
	min-width: 250px;
	min-height: 35px;
	margin: 26px 0 26px;
	clear: both;
}

.sent_msg {
	/* 	float: right; */
	max-width: 250px;
}

.input_msg_write input {
	background: rgba(0, 0, 0, 0) none repeat scroll 0 0;
	border: medium none;
	color: #4c4c4c;
	font-size: 15px;
	min-height: 48px;
	width: 100%;
}
</style>

</head>
<body>

	<div id="colorlib-page">
		<a href="#" class="js-colorlib-nav-toggle colorlib-nav-toggle"><i></i></a>
		<aside id="colorlib-aside" role="complementary" class="js-fullheight">
			<nav id="colorlib-main-menu" role="navigation"
				style="text-align: justify;">
				<div class="container">
					<div class="row">
						<div class="col-sm-1"></div>
						<div class="col-sm-3">
							<ul>
								<li class="colorlib-active"><h3
										style="margin-bottom: 20px;">
										<span class="glyphicon glyphicon-globe"></span><a
											href="${ pageContext.request.contextPath }">&nbsp;&nbsp;首頁</a>
									</h3></li>
								<li><h3 style="margin-bottom: 20px;">
										<span class="glyphicon glyphicon-pencil"></span><a
											href="${ pageContext.request.contextPath }/forum/newPost">&nbsp;&nbsp;發表文章
										</a>
									</h3></li>
								<li><h3 style="margin-bottom: 20px;">
										<span class="glyphicon glyphicon-list-alt"></span><a
											href="${pageContext.request.contextPath}/recipe/recipeSelect">&nbsp;&nbsp;食譜
										</a>
									</h3></li>
								<li><h3 style="margin-bottom: 20px;">
										<span class="glyphicon glyphicon-camera"></span><a
											href="${ pageContext.request.contextPath }/A_articlemainpage">&nbsp;&nbsp;生活誌</a>
									</h3></li>

								<c:if test="${pageContext.request.userPrincipal.name==null}">
									<li><h3 style="margin-bottom: 20px;">
											<span class="glyphicon glyphicon-user"></span><a
												href="${ pageContext.request.contextPath }/icookLogin">&nbsp;&nbsp;會員登入
											</a>
										</h3></li>
								</c:if>
								<c:if test="${pageContext.request.userPrincipal.name!=null}">
									<li><h3 style="margin-bottom: 20px;">
											<span class="glyphicon glyphicon-user"></span><a href="#"
												onclick="logout()">&nbsp;&nbsp;會員登出 </a>
										</h3></li>
									<sec:authorize access="hasRole('ADMIN')">
										<li><h3 style="margin-bottom: 20px;"><span class="glyphicon glyphicon-off"></span><a href="${ pageContext.request.contextPath}/backStageDashboard">&nbsp;&nbsp;後台</a></h3></li>
									</sec:authorize>
								</c:if>
								
								<li style="display: none;" id="showchat"><h3
										style="margin-bottom: 20px;">
										<span class="glyphicon glyphicon-bullhorn"></span><a href="#"
											id="chatroom" style="color: red;">&nbsp;&nbsp;聊天室 </a>
									</h3></li>
							</ul>
						</div>
						<div class="col-sm-4"></div>
						<div class="col-sm-4"></div>
					</div>
				</div>
			</nav>
			<script>
				function logout() {
					let logoutConfirm = confirm("確定登出？");
					if (logoutConfirm) {
						window.location
								.replace("${ pageContext.request.contextPath }/perform_logout");

					}
				}
			</script>




			<div class="colorlib-footer">
				<h2 id="colorlib-logo" class="mb-4">
					<img src="${logo}" style="width: 90%; height: 90%;">
				</h2>
				<div class="mb-4">

					<form action="#" class="colorlib-subscribe-form">
						<div class="form-group d-flex"></div>
					</form>
				</div>
				<p class="pfooter">
					<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					Copyright &copy;
					<script>
						document.write(new Date().getFullYear());
					</script>
					All rights reserved | iCook
					<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
				</p>
			</div>
		</aside>
		<!-- END COLORLIB-ASIDE -->
		<div id="colorlib-main">
			<section class="ftco-section ftco-no-pt ftco-no-pb">
				<div class="container">
					<div class="row d-flex">
						<div class="col-xl-8 py-5 px-md-5">
							<div class="row pt-md-4">

								<c:forEach var="post" items="${ posts }">
									<div class="col-md-12"
										style="max-width: 700px; max-height: 310px; word-break: break-all; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; display: block;">
										<div class="blog-entry ftco-animate d-md-flex">
											<a
												href="${ pageContext.request.contextPath }/forum/pick?harticle_id=${ post.harticle_id }&article_id=${ post.article_id }"
												class="img img-2"
												style="background-image: url(<c:url value='/getMemberPhoto/${post.memberBean.member_id}'/>);"></a>
											<div class="text text-2 pl-md-4">
												<h3 class="mb-2">
													<a
														href="${ pageContext.request.contextPath }/forum/pick?harticle_id=${ post.harticle_id }&article_id=${ post.article_id }">${ post.title }</a>
												</h3>
												<div class="meta-wrap">
													<p class="meta">
														<span><i class="icon-calendar mr-2"></i>${ post.editTime }</span>
														<span><a
															href="${ pageContext.request.contextPath }/forum/query?category=${ post.category }"><i
																class="icon-folder-o mr-2"></i>${ post.category }</a></span> <span><i
															class="icon-comment2 mr-2"></i>${ post.replies } 回應</span>
													</p>
												</div>
												<p class="mb-4"
													style="width: 490px; max-width: 490px; max-height: 55px; word-break: break-all; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; display: block;">${ post.text }</p>
												
												
												<p>
													<a
														href="${ pageContext.request.contextPath }/forum/pick?harticle_id=${ post.harticle_id }&article_id=${ post.article_id }"
														class="btn-custom">閱讀文章 <span
														class="ion-ios-arrow-forward"></span></a>
												</p>
												
											</div>
										</div>
									</div>
									<hr>
									
									
								</c:forEach>


							</div>

							<!-- END-->
							<div class="row">
								<div class="col">
									<div class="block-27">
										<ul>
											<!-- 			                <li><a href="#">&lt;</a></li> -->
											<!-- 			                <li class="active"><span>1</span></li> -->
											<!-- 			                <li><a href="#">2</a></li> -->
											<!-- 			                <li><a href="#">3</a></li> -->
											<!-- 			                <li><a href="#">4</a></li> -->
											<!-- 			                <li><a href="#">5</a></li> -->
											<!-- 			                <li><a href="#">&gt;</a></li> -->
										</ul>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-4 sidebar ftco-animate bg-light pt-5">
						<sec:authorize access="isAuthenticated()">
							<c:forEach var="user" items="${ LoginOK }">
								<div class="sidebar-box pt-md-4" onclick="javascript:location.href='${ pageContext.request.contextPath }/user'" style="vertical-align:middle; height:50px; line-height:50px;">
									<img id="member_photo_image"
				 					style="float:left;width:50px;height: 50px;border-radius: 50%; border: 1px solid black;vertical-align:middle;"
				 					src="<c:url value='/getMemberPhoto/${user.member_id}' />" />
									<div style=" font-size:20px;float: left;margin-left: 20px; ">歡迎光臨，${user.nickname}！</div>
								</div>
							</c:forEach>	
						</sec:authorize>
							<div class="sidebar-box pt-md-4">							
								<form
									action="${ pageContext.request.contextPath }/forum/search?title=${ param.title }"
									class="search-form">
									<div class="form-group">
										<span class="icon icon-search"></span> <input type="text"
											name="title" class="form-control" placeholder="依標題關鍵字搜尋文章">
									</div>
								</form>
							</div>
							<div class="sidebar-box ftco-animate">
								<h3 class="sidebar-heading">文章分類</h3>
								<ul class="categories">
									<li><h4>
											<a href="${ pageContext.request.contextPath }/forum/overview">全部
											</a>
										</h4></li>
									<li><h4>
											<a
												href="${ pageContext.request.contextPath }/forum/query?category=問題">問題

											</a>
										</h4></li>
									<li><h4>
											<a
												href="${ pageContext.request.contextPath }/forum/query?category=閒聊">閒聊

											</a>
										</h4></li>
									<li><h4>
											<a
												href="${ pageContext.request.contextPath }/forum/query?category=心得">心得

											</a>
										</h4></li>
									<li><h4>
											<a
												href="${ pageContext.request.contextPath }/forum/query?category=自介">自介

											</a>
										</h4></li>
									<li><h4>
											<a
												href="${ pageContext.request.contextPath }/forum/query?category=食材">食材

											</a>
										</h4></li>
									<li><h4>
											<a
												href="${ pageContext.request.contextPath }/forum/query?category=器具">器具

											</a>
										</h4></li>
								</ul>
							</div>

							<div class="sidebar-box ftco-animate">
								<h3 class="sidebar-heading">熱門文章</h3>
								<c:forEach var="pop" items="${ populars }">
									<div class="block-21 mb-4 d-flex">
										<a class="blog-img mr-4"
											style="background-image: url(<c:url value='/getMemberPhoto/${pop.memberBean.member_id}'/>);"></a>
										<div class="text">
											<h3 class="heading">
												<a
													href="${ pageContext.request.contextPath }/forum/pick?harticle_id=${ pop.harticle_id }&article_id=${ pop.article_id }">${ pop.title }</a>
											</h3>
											<div class="meta">
												<div>
													<span class="icon-calendar"></span> ${ pop.postTime }
												</div>
												<div>
													<span class="icon-person"></span> ${ pop.nickname }
												</div>
												<div>
													<span class="icon-chat"></span> ${ pop.replies }
												</div>
											</div>
										</div>
									</div>
								</c:forEach>








								<!-- 	            chat -->
								<div class="fixed" id="chat">
									<div class="col-md-9 col-md-offset-3"
										style="width: 547.5px; height: 400px;">
										<div class="panel panel-primary"
											style="width: 300px; height: 400px;">
											<div class="panel-heading">
												<span class="glyphicon glyphicon-remove"
													style="float: left;" id="close"></span><span
													class="glyphicon glyphicon-comment" id="showEmoji"></span>
												廣場尬聊

											</div>
											<!--emoji-->
											<div class="panel-body"
												style="min-height: 280px; max-height: 280px; text-align: right; overflow-y: scroll;"
												id="response">

												<ul class="chat">
												</ul>
											</div>
											<div class="panel-footer">
												<div class="input-group">
													<input id="text" type="text" class="form-control input-sm"
														placeholder="說點什麼......" /><span class="input-group-btn">
														<button class="btn btn-warning btn-sm" id="sendMessage"
															onclick="sendMessage();">送出</button>
													</span>
												</div>
											</div>
										</div>
									</div>
								</div>
								<script>
									$("#close").click(function() {
										$("#chat").hide();
										$("#showchat").show();
									})
									$("#chatroom").click(function() {
										$("#chat").show();
										$("#showchat").hide();
									})
								</script>
								<!--         chat -->


							</div>
							<!-- END COL -->
						</div>
					</div>
			</section>
		</div>
		<!-- END COLORLIB-MAIN -->
	</div>
	<!-- END COLORLIB-PAGE -->

	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
	</div>


	<script src=<spring:url value="/resources/js/jquery.min.js"/>></script>
	<script
		src=<spring:url value="/resources/js/jquery-migrate-3.0.1.min.js"/>></script>
	<script src=<spring:url value="/resources/js/popper.min.js"/>></script>
	<script src=<spring:url value="/resources/js/bootstrap.min.js"/>></script>
	<script src=<spring:url value="/resources/js/jquery.easing.1.3.js"/>></script>
	<script src=<spring:url value="/resources/js/jquery.waypoints.min.js"/>></script>
	<script src=<spring:url value="/resources/js/jquery.stellar.min.js"/>></script>
	<script src=<spring:url value="/resources/js/owl.carousel.min.js" />></script>
	<script
		src=<spring:url value="/resources/js/jquery.magnific-popup.min.js"/>></script>
	<script src=<spring:url value="/resources/js/aos.js"/>></script>
	<script
		src=<spring:url value="/resources/js/jquery.animateNumber.min.js"/>></script>
	<script src=<spring:url value="/resources/js/scrollax.min.js"/>></script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src=<spring:url value="/resources/js/google-map.js"/>></script>
	<script src=<spring:url value="/resources/js/main.js"/>></script>
	<script src=<spring:url value="/resources/js/chat.js" />></script>
	<script src="${sockjs}"></script>
	<script src="${stomp}"></script>

	<c:if test="${ LoginOK.isEmpty()}">
		<script>
			$(document).ready(function checkConn() {
				var p = document.createElement('p');
				p.style.wordWrap = 'break-word';
				p.style.textAlign = "center";
				p.style.color = "red";
				p.appendChild(document.createTextNode("請登入以啟用聊天室功能"));
				document.getElementById('response').appendChild(p);
			}

			)
		</script>
	</c:if>

	<c:forEach var="user" items="${ LoginOK }">
		<input type="hidden" id="from" value="${user.nickname}" />
		<script>
			var stompClient = null;

			$(document).ready(

					function connect() {
						var socket = new SockJS('/icook/forum/overview/chat');
						stompClient = Stomp.over(socket);

						stompClient.connect({}, function(frame) {

							console.log('Connected: ' + frame);
							
							var dice = Math.floor(Math.random()*5 + 1);
							
							if(dice == 1){
								serviceMessage('跳進了伺服器。 他是袋鼠！！');
							} else if (dice == 2){
								serviceMessage('來只為了嚼口香糖跟打爆人。現在 ${user.nickname} 嚼完口香糖了。');
							} else if (dice == 3){
								serviceMessage('出現了。 給他一罐啤酒。');
							} else if (dice == 4 ){
								serviceMessage('剛剛滑入了伺服器中。');
							} else if (dice == 5){
								serviceMessage('來了，請把您的武器留在門口那邊。');
							}
								

							stompClient.subscribe(
									'/forum/overview/topic/messages', function(
											messageOutput) {
										showMessageOutput(JSON
												.parse(messageOutput.body));
									});
						});
					})

			function sendMessage() {
				var from = document.getElementById('from').value;
				var text = document.getElementById('text').value;
				if (text.trim().length > 0 && text != null) {
					stompClient.send("/forum/overview/app/chat", {}, JSON
							.stringify({
								'from' : from,
								'text' : text
							}));
					$("#text").val("");
				}

			}

			function serviceMessage(hint) {
				var from = document.getElementById('from').value;
				from = (from.length > 0 && from != null) ? from : 'anonimus';
				if(from != "admin"){
					
					
				stompClient.send("/forum/overview/app/chat", {}, JSON
						.stringify({
							'from' : "管理員",
							'text' : from + " " + hint
						}));
				
				} else{
					
					hint = "進來了，似乎太OP，請NERF一下";
					stompClient.send("/forum/overview/app/chat", {}, JSON
							.stringify({
								'from' : "管理員",
								'text' : from + " " + hint
							}));
					
				}
			}

			function showMessageOutput(messageOutput) {
				//製造回應元素
				var response = document.getElementById('response');
				var p = document.createElement('p');
				if (messageOutput.from != document.getElementById('from').value) {
					var div1 = document.createElement('div');
					var div2 = document.createElement('div');
					var p1 = document.createElement('p');
					p1.appendChild(document.createTextNode(messageOutput.from
							+ "：\r" + messageOutput.text));
					var span1 = document.createElement('span');
					span1.appendChild(document
							.createTextNode(messageOutput.time));

				} else {
					var div4 = document.createElement('div');
					var div5 = document.createElement('div');
					var p2 = document.createElement('p');
					p2.appendChild(document.createTextNode(messageOutput.text));
					var span2 = document.createElement('span');
					span2.appendChild(document
							.createTextNode(messageOutput.time));
				}

				//塞入回應元素
				var user = document.getElementById('from').value;
				if (messageOutput.from != user) {
					$("#response").append(div1);
					div1.appendChild(div2);
					div2.appendChild(p1);
					div2.appendChild(span1);
					div1.id = 'div1';
					div2.id = 'div2';
					span1.id = 'span1';
					$("div#div1").attr("class", "outgoing_msg");
					$("div#div1").css("text-align", "left");
					$("div#div2").attr("class", "sent_msg");
					$("div#div2").css("float", "left");
					$("div#div2").css("word-break", "break-all")
					$("span#span1").attr("class", "time_date");
					$("span#span1").css("display", "block");

				} else {
					$("#response").append(div4);
					div4.appendChild(div5);
					div5.appendChild(p2);
					div5.appendChild(span2);
					div4.id = 'div4';
					div5.id = 'div5';
					span2.id = 'span2';
					$("div#div4").attr("class", "outgoing_msg");
					$("div#div5").attr("class", "sent_msg");
					$("div#div5").css("float", "right");
					$("div#div5").css("text-align", "left");
					$("div#div5").css("word-break", "break-all")
					$("p#p2").css("word-break", "break-all")
					$("span#span2").attr("class", "time_date");
					$("span#span2").css("text-align", "right");
					$("span#span2").css("display", "block");
					//  				$("div#div5").append("<br>");
				}

				if (messageOutput.users.length > 0) {
					var $ul = $('#user-list');
					$ul.empty();

					$.each(messageOutput.users, function(index, value) {
						$ul.append('<li>' + value.id + '</li>');
					});
				}
			}
		</script>
	</c:forEach>

</body>
</html>