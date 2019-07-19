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
<script type="text/javascript"
	src="${pageContext.request.contextPath}/ckeditor/ckeditor.js">
</script>
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
			<a class="navbar-brand" href="${ pageContext.request.contextPath }/forum/newPost">發表文章</a>
			<div class="row">
				<div class="col"></div>
				<div class="col-8 table-responsive">
				
				
					<div class="row" style="min-height: 800px; margin-bottom: 10px;">
						<div class="col"></div>
						<div class="col-8" style="border: 2px groove #4dffff">
							<form:form method='POST' modelAttribute='ForumMainBean'>
							<c:forEach var="post" items="${ posts }">							
								<div class="form-group" style="min-height: 80px;">
									<label for="exampleFormControlInput1"></label>
									<div><span style="color:red">${ errors.category }</span></div>
									<div class="input-group-prepend">										
										<button class="btn btn-outline-secondary dropdown-toggle"
											type="button" data-toggle="dropdown" aria-haspopup="true"
											aria-expanded="false" id="category"  value="0" >${ post.category }</button>
											<form:input type="hidden"  id="category2" name="category" value="${ post.category }" path="category"/>
										<input type="text" class="form-control"
											aria-label="Text input with dropdown button"
											id="exampleFormControlInput1" placeholder="name@example.com"
											name="title" value="${ post.title }"> <span style="color:red">${ errors.title }</span>
										<div class="dropdown-menu">
											<a class="dropdown-item" id="1" >問題</a>
											<a class="dropdown-item" id="2" >閒聊</a>
											<a class="dropdown-item" id="3" >心得</a>
											<a class="dropdown-item" id="4">食材</a>
											<a class="dropdown-item" id="5">器具</a>
											<a class="dropdown-item" id="6" >自介</a>
										</div>
									</div>
								</div>
								<hr>
								<div style="min-height: 0px;"></div>
								<!--    000 -->
								<div class="form-group" style="min-height: 600px;">
									<section>
										<label for="exampleFormControlTextarea1">內文</label>&nbsp;&nbsp;<p style="color:red">${ errors.text }</p>
										<textarea class="form-control"
											id="maintext" rows="3"
											style="min-height: 400px" name="text">${ post.text }</textarea>
										<hr>
										<label for="exampleFormControlTextarea1"></label>
										<textarea class="form-control"
											id="signaturetext" rows="3"
											style="min-height: 80px" name="signature">${ post.signature }</textarea>
									</section>
								</div>
								<hr>
								<div style="min-height: 120px; text-align: center">
									<input class="btn btn-outline-success my-2 my-sm-0 " id="submit"
										name="buttons" type="submit" value="送出"> <input
										class="btn btn-outline-danger my-2 my-sm-0 " id="reset"
										name="buttons" type="reset" value="清除">
								</div>
								</c:forEach>
							</form:form>
						</div>
						<div class="col"></div>						
					</div>
				

				</div>
				
				<div class="col"></div>
			</div>
		</div>
		<div class="container"></div>
	</div>
	<script>
		$("#1").click(function(){var cg = document.getElementById("1").text; $("#category").attr("value", cg).text(cg); $("#category2").attr("value", cg);})
		$("#2").click(function(){var cg = document.getElementById("2").text; $("#category").attr("value", cg).text(cg); $("#category2").attr("value", cg);})
		$("#3").click(function(){var cg = document.getElementById("3").text; $("#category").attr("value", cg).text(cg); $("#category2").attr("value", cg);})
		$("#4").click(function(){var cg = document.getElementById("4").text; $("#category").attr("value", cg).text(cg); $("#category2").attr("value", cg);})
		$("#5").click(function(){var cg = document.getElementById("5").text; $("#category").attr("value", cg).text(cg); $("#category2").attr("value", cg);})
		$("#6").click(function(){var cg = document.getElementById("6").text; $("#category").attr("value", cg).text(cg); $("#category2").attr("value", cg);})
		CKEDITOR
		.replace(
		'maintext',
		{
			extraPlugins : 'easyimage',
			cloudServices_tokenUrl : 'https://40733.cke-cs.com/token/dev/Pno0Ld5ha3oNhABb0mnQBXWdL6FXy03CbisbDkPL9hJoOrvd8p0hpHlka5RA',
			cloudServices_uploadUrl : 'https://40733.cke-cs.com/easyimage/upload/'
		});
		CKEDITOR
		.replace(
				'signaturetext',
				{
					extraPlugins : 'easyimage',
					cloudServices_tokenUrl : 'https://40733.cke-cs.com/token/dev/Pno0Ld5ha3oNhABb0mnQBXWdL6FXy03CbisbDkPL9hJoOrvd8p0hpHlka5RA',
					cloudServices_uploadUrl : 'https://40733.cke-cs.com/easyimage/upload/'
				});
	</script>
</body>
</html>

