<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
</head>
<body>
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
					formaction="${ pageContext.request.contextPath }/forum/search?title=${ param.title }">Search</button>
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
		<div class="panel-heading">
			<a href="${ pageContext.request.contextPath }/forum/overview">文章總覽</a>
		</div>
		<div class="panel-body">
			<a class="navbar-brand"
				href="${ pageContext.request.contextPath }/forum/newPost">發表文章</a>
			<div class="row">
				<div class="col"></div>
				<div class="col-8 table-responsive">
					<c:forEach var="post" items="${ posts }" varStatus="floor">

						<div class="row" style="min-height: 415px; margin-bottom: 10px;">
							<div class="col">
								<img alt="" id="avatar_fpath50034"
									src="https://avatar2.bahamut.com.tw/avataruserpic/w/i/wise0701/wise0701.png">
							</div>
							<div class="col-8">
								<c:if test="${ post.article_id == post.harticle_id }">
									<div style="min-height: 41.5px;">
										<h5>${ post.title }</h5>
										<hr>
									</div>
								</c:if>
								<div style="min-height: 62.25px;">
									<span><small>${ floor.count }樓</small></span>&nbsp;&nbsp;<span><strong>${ post.nickname }</strong></span>&nbsp;&nbsp;<span><small>${ post.username }</small></span>
									<br> <span><small>${ post.editTime }</small></span>
								</div>
								<div style="min-height: 249px;">
									<section>
										<article>${ post.text }</article>
									</section>
								</div>
								<hr>
								<div style="min-height: 70px">${ post.signature }</div>
								<div style="min-height: 62.25px; text-align: right" id="btnrow${post.article_id}">
									<a href='${ pageContext.request.contextPath }/forum/reply?harticle_id=${ post.harticle_id }' class='btn btn-outline-info btn-sm'>回覆</a>
								</div>
								<hr>
							</div>
							<div class="col"></div>
						</div>
						<c:forEach var="user" items="${ LoginOK }" >
						<script type="text/javascript">
						var memberId = ${ user.member_id };
						var article_id = ${ post.article_id };
							$.ajax({
								url: "${ pageContext.request.contextPath }/forum/isLogin?article_id=${ post.article_id }",
								type: "GET",								
								success: function(data){
									console.log(data);
									var AmemberId = data;
									if(memberId==AmemberId){										
// 										$("#btnrow${post.article_id}").append(("<a href='${ pageContext.request.contextPath }/forum/reply?harticle_id=${ post.harticle_id }' class='btn btn-outline-info btn-sm'>回覆</a>"))
										$("#btnrow${post.article_id}").append(("<a href='${ pageContext.request.contextPath }/forum/edit?harticle_id=${ post.harticle_id }&article_id=${ post.article_id }'role='button' class='btn btn-outline-info btn-sm'>編輯</a>"))
										$("#btnrow${post.article_id}").append(("<input type='button' class='btn btn-outline-danger btn-sm'  onclick='deleteArticle()'  value='刪除'/>"))
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
						

						
							
							function deleteArticle(){
										let isDelete = confirm("確定刪除？")
										if(isDelete){
											window.location.replace("${ pageContext.request.contextPath }/forum/delete?harticle_id=${ post.harticle_id }&article_id=${ post.article_id }");
										}
							}
							
									
					</script>
					</c:forEach>
					</c:forEach>

				</div>
				<div class="col"></div>
			</div>
		</div>
		<div class="container"></div>
	</div>
</body>
</html>

