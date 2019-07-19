<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<spring:url value="/resources/js/lib/sockjs.min.js" var="sockjs" />
<spring:url value="/resources/js/lib/stomp.min.js" var="stomp" />
<spring:url value="/resources/js/script.js" var="script" />
<spring:url value="/resources/js/lib/bootstrap/css/chat.css" var="chatCSS"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BootStrap練習</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
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
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
<link rel="stylesheet" href=" ${ chatCSS } " >
</head>
<body>
<!-- chat Script -->
<script src="https://www.gstatic.com/firebasejs/4.13.0/firebase.js"></script>
<script>
  // Initialize Firebase
  var config = {
    apiKey: "AIzaSyB-CfYZb2rJeeycqL8F5Lo2zmCQAu1A0Sc",
    authDomain: "soft1-6305e.firebaseapp.com",
    databaseURL: "https://soft1-6305e.firebaseio.com",
    projectId: "soft1-6305e",
    storageBucket: "soft1-6305e.appspot.com",
    messagingSenderId: "592333250349"
  };
  firebase.initializeApp(config);
  //VARIABLE CON ACCESO A DATOS

  Var TableDeDatos=firebase.database().ref('soft1-6305e');
</script>
<!-- chat Script -->
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="${ pageContext.request.contextPath }">iCook</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<form class="form-inline my-2 my-lg-0">
				<input class="form-control mr-sm-2" type="search"
					placeholder="Search" aria-label="Search" name="title">
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit"
					formaction="${ pageContext.request.contextPath }/forum/search?title=${ param.title } ">Search</button>
			</form>
			<ul class="navbar-nav ml-auto ">
				<li class="nav-item active"><a class="nav-link" href="#">註冊
						<span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item"><a class="nav-link" href="#">登入</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> Dropdown </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="#">Action</a> <a
							class="dropdown-item" href="#">Another action</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">Something else here</a>
					</div></li>
				<li class="nav-item"><a class="nav-link disabled" href="#"
					tabindex="-1" aria-disabled="true">市集</a></li>
				<li class="nav-item"><a class="nav-link disabled" href="#"
					tabindex="-1" aria-disabled="true">購物車</a></li>
			</ul>
		</div>
	</nav>
	<div class="panel panel-success container-fluid">
		<div class="panel-heading">文章總覽</div>
		<div class="panel-body">
			<a class="navbar-brand"
				href="${ pageContext.request.contextPath }/forum/newPost">發表文章</a>
			<div class="row">
				<div class="col"></div>
				<div class="col-8 table-responsive">
					<nav aria-label="breadcrumb">
						<div aria-label="Basic example" style="float: left;">
							<a class="btn btn-success"
								href="${ pageContext.request.contextPath }/forum/overview">全部</a>
							<a class="btn btn-success"
								href="${ pageContext.request.contextPath }/forum/query?category=問題">問題</a>
							<a class="btn btn-success"
								href="${ pageContext.request.contextPath }/forum/query?category=閒聊">閒聊</a>
							<a class="btn btn-success"
								href="${ pageContext.request.contextPath }/forum/query?category=心得">心得</a>
							<a class="btn btn-success"
								href="${ pageContext.request.contextPath }/forum/query?category=自介">自介</a>
							<a class="btn btn-success"
								href="${ pageContext.request.contextPath }/forum/query?category=食材">食材</a>
							<a class="btn btn-success"
								href="${ pageContext.request.contextPath }/forum/query?category=器具">器具</a>
						</div>
					</nav>
					<table class="table table-bordered table-hover">
						<th class="table-success"
							style="text-align: center; width: 100px;">喜歡</th>
						<th class="table-success"
							style="text-align: center; width: 800px;">標題</th>
						<th class="table-success"
							style="text-align: center; width: 100px;">人氣/回應</th>
						<th class="table-success" style="text-align: center;">最後編輯時間</th>
						<c:forEach var="post" items="${ posts }">

							<tr>
								<td style="vertical-align: middle;"><p
										style="text-align: center;">
										<span><small>${ post.category }</small></span><br> <small>${ post.likes }</small>
									</p></td>
								<td style="vertical-align: middle;"><p
										style="text-align: center;">
										<a style="color: black;"
											href="${ pageContext.request.contextPath }/forum/pick?harticle_id=${ post.harticle_id }&article_id=${ post.article_id }">${ post.title }</a>
									</p></td>
								<td style="vertical-align: middle;"><p
										style="text-align: center;">
										<span><small>${ post.username }</small></span><br> <small>${ post.clicks }/${ post.replies }</small>
									</p></td>
								<td style="vertical-align: middle;"><p
										style="text-align: center;">${ post.editTime }</p></td>
							</tr>

						</c:forEach>
					</table>
				</div>
				<!--webchat -->
				<div class="col-3" style="text-align:center">
					<br>

					<div aria-live="polite" aria-atomic="true"
						style="position: relative; min-height: 200px;"
						data-autohide="false">
						<!-- Position it -->
						<div style="text-align:center" id="response">
<!-- <div style="position: absolute; top: 0; right: 0;" id="response"> -->
							<!-- Then put toasts within -->
<!-- 							<div class="toast" role="alert" aria-live="assertive" -->
<!-- 								aria-atomic="true" data-autohide="false"> -->
<!-- 								<div class="toast-header"> -->
<!-- 									<img src="..." class="rounded mr-2" alt="..."> <strong -->
<!-- 										class="mr-auto">Bootstrap</strong> <small class="text-muted">just -->
<!-- 										now</small> -->
<!-- 									<button type="button" class="ml-2 mb-1 close" -->
<!-- 										data-dismiss="toast" aria-label="Close"> -->
<!-- 										<span aria-hidden="true">&times;</span> -->
<!-- 									</button> -->
<!-- 								</div> -->
<!-- 								<div class="toast-body">See? Just like this.</div> -->
<!-- 							</div> -->

<!-- 							<div class="toast" role="alert" aria-live="assertive" -->
<!-- 								aria-atomic="true" data-autohide="false"> -->
<!-- 								<div class="toast-header"> -->
<!-- 									<img src="..." class="rounded mr-2" alt="..."> <strong -->
<!-- 										class="mr-auto">Bootstrap</strong> <small class="text-muted">2 -->
<!-- 										seconds ago</small> -->
<!-- 									<button type="button" class="ml-2 mb-1 close" -->
<!-- 										data-dismiss="toast" aria-label="Close"> -->
<!-- 										<span aria-hidden="true">&times;</span> -->
<!-- 									</button> -->
<!-- 								</div> -->
<!-- 								<div class="toast-body">Heads up, toasts will stack -->
<!-- 									automatically</div> -->
<!-- 							</div> -->
							<div style="text-align: center">
								<input type="text" id="text" placeholder="type something......" />
								<button id="sendMessage" onclick="sendMessage();">Send</button>
							</div>
						</div>
					</div>
<!-- 					<div style="text-align: center"> -->
<!-- 						<input type="text" id="text" placeholder="type something......" /> -->
<!-- 						<button id="sendMessage" onclick="sendMessage()">Send</button> -->
<!-- 					</div> -->

				</div>
				<!-- webcahr-->
			</div>
		</div>
		<div class="container"></div>
	</div>
	<script>
		$(document).ready(function() {
			$('.toast').toast('show');
		});
	</script>
	<script src="${sockjs}"></script>
	<script src="${stomp}"></script>
	<c:forEach var="user" items="${ LoginOK }">
		<input type="hidden" id="from" value=" ${user.username}" />
		<script src="${script}"></script>
	</c:forEach>
</body>
</html>