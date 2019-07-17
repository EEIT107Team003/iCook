<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel='stylesheet'
	href='${pageContext.request.contextPath}/css/fontawesome-free/css/all.min.css'
	type="text/css" />
<meta charset="UTF-8">
<!-- <meta http-equiv="refresh" -->
<!-- 	content="3;url=http://localhost:8080/icookProject/endNavi" /> -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	$(".flip ").click(function() {
		$(".panel ").slideToggle("slow");
	});
</script>
<style type="text/css">
.text {
	margin: 200px 100px 100px 50px;
}

div.panel, p.flip {
	margin: 0px;
	padding: 5px;
	text-align: center;
	background: #e5eecc;
	border: solid 1px #c3c3c3;
}

div.panel {
	height: 120px;
	display: none;
}

.content {
	margin: auto;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<div class="progress">
		<div class="progress-bar progress-bar-striped bg-info"
			role="progressbar" style="width: 100%" aria-valuenow="100"
			aria-valuemin="0" aria-valuemax="100"></div>
	</div>

	<div class='text'>
		<h1>訂單完成! </h1>
		<h1>訂單編號:<c:out value="${orderNo}" /></h1>
				<h3>謝謝老版  Thank you, 已發送訂單確認信</h3>
				<h3>請記得您剛才的訂單編號: <c:out value="${orderNo}"/>號  並在付款時備註讓我們知道喔!</h3>
		<a href="#" class="btn btn-primary btn-lg btn-block"
			onclick="window.open(' /icookProject/realPaypal ', 'Paypal', config='height=500,width=500');">試試用Paypal付款!</a>

		<a href="#" class="btn btn-primary btn-lg btn-block"
			onclick="window.open(' /icookProject/realPaypal ', 'Paypal', config='height=500,width=500');">Paypal SandBox Demo!</a>
		<p class="flip">请点击这里</p>
		<div class="panel">
			<p>W3School - 领先的 Web 技术教程站点</p>
			<p>在 W3School，你可以找到你所需要的所有网站建设教程。</p>
		</div>
		<button type="button" id='home'
			onclick="javascript:location.href='/icookProject/'"
			class="btn btn-primary btn-lg btn-block">回首頁</button>
		<button type="button" id='market'
			onclick="javascript:location.href='/icookProject/products'"
			class="btn btn-primary btn-lg btn-block">去商城再看看</button>
		<button type="button" id='checkMyOrder'
			onclick="javascript:location.href='/icookProject/checkOrders'"
			class="btn btn-primary btn-lg btn-block">查我的看訂單</button>
	</div>
	<div class='content'></div>
</body>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>

<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>

</html>