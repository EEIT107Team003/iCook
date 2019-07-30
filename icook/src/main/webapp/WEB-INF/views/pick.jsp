<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<spring:url value="/resources/js/lib/sockjs.min.js" var="sockjs" />
<spring:url value="/resources/js/lib/stomp.min.js" var="stomp" />
<spring:url value="/resources/js/script.js" var="script" />
<spring:url value="/resources/js/lib/bootstrap/css/chat.css"
	var="chatCSS" />
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
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"
	integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
</head>
<div id="fb-root"></div>
<script async defer crossorigin="anonymous"
	src="https://connect.facebook.net/zh_TW/sdk.js#xfbml=1&version=v3.3"></script>
<body>

	<div id="colorlib-page">
		<a href="#" class="js-colorlib-nav-toggle colorlib-nav-toggle"><i></i></a>
		<aside id="colorlib-aside" role="complementary" class="js-fullheight">
			<nav id="colorlib-main-menu" role="navigation"
				style="text-align: justify;">
				<div class="container">
					<div class="row">
						<div class="col-sm-3"></div>
						<div class="col-sm-9">
							<ul>
								<li><h4
										style="margin-bottom: 20px;">
										<span class="fa fa-globe"></span><a
											href="${ pageContext.request.contextPath }">&nbsp;&nbsp;首頁</a>
									</h4></li>
								<li><h4 style="margin-bottom: 20px;">
										<span class="fa fa-pencil"></span><a
											href="${ pageContext.request.contextPath }/forum/newPost">&nbsp;&nbsp;發表文章
										</a>
										</h4></li>
								<li><h4 style="margin-bottom: 20px;">
										<span class="fa fa-list-alt"></span><a
											href="${pageContext.request.contextPath}/recipe/recipeSelect">&nbsp;&nbsp;食譜
										</a>
										</h4></li>
								<li><h4 style="margin-bottom: 20px;">
										<span class="fa fa-camera"></span><a
											href="${ pageContext.request.contextPath }/A_articlemainpage">&nbsp;&nbsp;生活誌</a>
										</h4></li>
								<li class="colorlib-active"><h4 style="margin-bottom: 20px;">
										<span class="fa fa-hand-o-left"></span><a
											href="${ pageContext.request.contextPath }/forum/overview">&nbsp;&nbsp;討論區首頁</a>
										</h4></li>
								<c:if test="${pageContext.request.userPrincipal.name==null}">
									<li><h4 style="margin-bottom: 20px;">
											<span class="fa fa-user"></span><a
												href="${ pageContext.request.contextPath }/icookLogin">&nbsp;&nbsp;會員專區
											</a>
											</h4></li>
								</c:if>
								<c:if test="${pageContext.request.userPrincipal.name!=null}">
									<li><h4 style="margin-bottom: 20px;">
											<span class="fa fa-user"></span><a href="#"
												onclick="logout()">&nbsp;&nbsp;會員登出 </a>
										</h4></li>
									<sec:authorize access="hasRole('ADMIN')">
										<li><h4 style="margin-bottom: 20px;"><span class="fa fa-power-off"></span><a href="${ pageContext.request.contextPath}/backStageDashboard">&nbsp;&nbsp;後台</a></h4></li>
									</sec:authorize>
								</c:if>
								<li style="display: none;" id="showchat"><h4
										style="margin-bottom: 20px;">
										<span class="fa af-bullhorn"></span><a href="#"
											id="chatroom" style="color: red;">&nbsp;&nbsp;聊天室 </a>
										</h4></li>
							</ul>
						</div>
						
					</div>
				</div>
			</nav>
			<script>
				function logout(){
					let logoutConfirm = confirm("確定登出？");
					if(logoutConfirm){
						window.location.replace("${ pageContext.request.contextPath }/perform_logout");
						
					}
				}
			</script>

			<div class="colorlib-footer">

				<h2 id="colorlib-logo" class="mb-4">
					<img src="${logo}" style="width: 90%; height: 90%;">
				</h2>

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
						<div class="col-lg-8 px-md-5 py-5">


							<c:forEach var="post" items="${ posts }" varStatus="floor">

								<div class="row pt-md-4">
									<c:if test="${ post.article_id == post.harticle_id }">
										<div
											style="min-width: 680px; min-height: 60px; text-align: center;">
											<h1 class="mb-3">${ post.title }</h1>
										</div>
									</c:if>

									<div style="min-height: 249px; min-width: 680px;">
										<section>
											<article>${ post.text }</article>
										</section>
									</div>


									<div class="tag-widget post-tag-container mb-5 mt-5">
										<div id="btnrow${post.article_id}" style="text-align: right;">
											<a
												href='${ pageContext.request.contextPath }/forum/reply?harticle_id=${ post.harticle_id }'
												class='btn btn-outline-info btn-sm'>回覆</a>
												<c:if test="${pageContext.request.userPrincipal.name!=null}">
												&nbsp;
											<button type="button" class="btn btn-outline-danger btn-sm"
												data-toggle="modal" data-target="#exampleModal" style="float:right">檢舉</button>
												</c:if>
										</div>
										<div class="fb-share-button"
											data-href="https://github.com/EEIT107Team003/iCook"
											data-layout="button_count" data-size="small">
											<a target="_blank"
												href="https://www.facebook.com/sharer/sharer.php?u=https%3A%2F%2Fforum.gamer.com.tw%2F&amp;src=sdkpreparse"
												class="fb-xfbml-parse-ignore">分享</a>
										</div>
									</div>



									<!--report-->
									<div class="modal fade" id="exampleModal" tabindex="-1"
										role="dialog" aria-labelledby="exampleModalLabel"
										aria-hidden="true">
										<div class="modal-dialog" role="document">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title" id="exampleModalLabel">檢舉</h5>
													<button type="button" class="close" data-dismiss="modal"
														aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
												</div>
												<form:form method='POST' modelAttribute='ReportBean'>
													<div class="modal-body">

														<div class="input-group mb-3">
															<div class="input-group-prepend">
																<button id="reportbtn"
																	class="btn btn-outline-secondary dropdown-toggle"
																	type="button" data-toggle="dropdown"
																	aria-haspopup="true" aria-expanded="false">理由</button>
																<form:input type="hidden" path="reportCategory" value=""
																	id="reportCategory" />
																<input type="hidden" value="${ post.article_id }" name="article_id">
																<div class="dropdown-menu">
																	<a class="dropdown-item" id="1">謾罵</a> <a
																		class="dropdown-item" id="2">洗版</a> <a
																		class="dropdown-item" id="3">限制級文章</a> <a
																		class="dropdown-item" id="4">錯誤分類</a>
																	<div role="separator" class="dropdown-divider"></div>
																	<a class="dropdown-item" id="5">其他</a>
																</div>
															</div>
															<form:input type="text" class="form-control"
																aria-label="Text input with dropdown button"
																placeholder="簡單描述......" path="reason" />
														</div>
													</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-secondary"
															data-dismiss="modal">Close</button>
														<input type="submit" class="btn btn-primary"
															>
													</div>
												</form:form>
											</div>
										</div>
									</div>
									<script>
		$("#1").click(function(){var cg = document.getElementById("1").text; $("#reportbtn").attr("value", cg).text(cg); $("#reportCategory").attr("value", cg);})
		$("#2").click(function(){var cg = document.getElementById("2").text; $("#reportbtn").attr("value", cg).text(cg); $("#reportCategory").attr("value", cg);})
		$("#3").click(function(){var cg = document.getElementById("3").text; $("#reportbtn").attr("value", cg).text(cg); $("#reportCategory").attr("value", cg);})
		$("#4").click(function(){var cg = document.getElementById("4").text; $("#reportbtn").attr("value", cg).text(cg); $("#reportCategory").attr("value", cg);})
		$("#5").click(function(){var cg = document.getElementById("5").text; $("#reportbtn").attr("value", cg).text(cg); $("#reportCategory").attr("value", cg);})
		</script>

									<!--report-->


									<div class="about-author d-flex p-4 bg-light">
										<div class="bio mr-5">
											<a
												href="${ pageContext.request.contextPath }/members/page?member_id=${post.memberBean.member_id}"><img
												src="<c:url value='/getMemberPhoto/${post.memberBean.member_id}'/>"
												alt="Image placeholder" class="img-fluid mb-4"></a>
										</div>
										<div class="desc" style="min-width: 510px; min-height: 162px;">
											<h3>${ post.nickname }</h3>
											<p>${ post.memberBean.resume }</p>
											<hr>
											<p>${ post.signature }</p>
											<c:if test="${ post.article_id == post.harticle_id }">
												<br>
												<br>
												<h3 class="mb-5 font-weight-bold">${ post.replies }
													Comments</h3>
											</c:if>
										</div>
									</div>


									<div class="pt-5 mt-5">
										<ul class="comment-list">
											<li class="comment">
												<div class="vcard bio"></div>
												<div class="comment-body">
													<h3></h3>
													<div class="meta"></div>
													<p></p>
													<p></p>
												</div>
											</li>

											<!-- 											
										<!-- END comment-list -->


										</ul>
									</div>

								</div>
								<!-- END-->
								<c:forEach var="user" items="${ LoginOK }">
									<script type="text/javascript">
						var memberId = ${ user.member_id };
						var article_id = ${ post.article_id };
						var username = "${ user.username }";
							$.ajax({
								url: "${ pageContext.request.contextPath }/forum/isLogin?article_id=${ post.article_id }",
								type: "GET",								
								success: function(data){
									console.log(data);
									var AmemberId = data;
									if(memberId==AmemberId ||username == "admin@gmail.com"){										
// 										$("#btnrow${post.article_id}").append(("<a href='${ pageContext.request.contextPath }/forum/reply?harticle_id=${ post.harticle_id }' class='btn btn-outline-info btn-sm'>回覆</a>"))
										$("#btnrow${post.article_id}").append(("<a href='${ pageContext.request.contextPath }/forum/edit?harticle_id=${ post.harticle_id }&article_id=${ post.article_id }'role='button' class='btn btn-outline-info btn-sm'>編輯</a>"))
										$("#btnrow${post.article_id}").append(("<input type='button' class='btn btn-outline-danger btn-sm'  onclick='deleteArticle${ post.article_id }()' style='float:right;'  value='刪除'/>"))										
									} 
									if(memberId != null){
										$("#btnrow${post.article_id}").append(("<button id='likebtn${post.article_id}' class='btn btn-outline-success my-2 my-sm-0 btn-sm' value='${ post.article_id }' style='float: left'>${ post.likes }Like</button>"))
										$("#likebtn${post.article_id}").click(function() {
											$.ajax({
														url : "${ pageContext.request.contextPath }/forum/like?article_id=${post.article_id}",
														type : "GET",
														success : function(data) {
																							var likes = data;
																							var newlikes = likes+ " Like"
																							$("#likebtn${post.article_id}").text(newlikes);}});});
									}
								}
							})
						

						
							
							function deleteArticle${ post.article_id }(){
										let isDelete = confirm("確定刪除？")
										if(isDelete){
											window.location.replace("${ pageContext.request.contextPath }/forum/delete?harticle_id=${ post.harticle_id }&article_id=${ post.article_id }");
										}
							}
							
									
					</script>
								</c:forEach>



							</c:forEach>
						</div>

						<div class="col-lg-4 sidebar ftco-animate bg-light pt-5">
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
									<li><h5><a
										href="${ pageContext.request.contextPath }/forum/overview">全部											
									</a></h5></li>
									<li><h5><a
										href="${ pageContext.request.contextPath }/forum/query?category=問題">問題
											
									</a></h5></li>
									<li><h5><a
										href="${ pageContext.request.contextPath }/forum/query?category=閒聊">閒聊
											
									</a></h5></li>
									<li><h5><a
										href="${ pageContext.request.contextPath }/forum/query?category=心得">心得
											
									</a></h5></li>
									<li><h5><a
										href="${ pageContext.request.contextPath }/forum/query?category=自介">自介
											
									</a></h5></li>
									<li><h5><a
										href="${ pageContext.request.contextPath }/forum/query?category=食材">食材
											
									</a></h5></li>
									<li><h5><a
										href="${ pageContext.request.contextPath }/forum/query?category=器具">器具
											
									</a></h5></li>
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
							</div>







							
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


</body>
</html>

