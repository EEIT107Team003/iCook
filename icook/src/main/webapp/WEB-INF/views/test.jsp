<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-TW">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
	<title>Document</title>
	<link rel="stylesheet" href=<spring:url value="/resources/css/rolling.css"/>>
	<link rel="stylesheet" href=<spring:url value="/resources/css/chatstyle.css"/>>
	<script src=<spring:url value="/resources/js/rolling.js"/>></script>
	<script src=<spring:url value="/resources/js/Public.js"/>></script>
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
<body class="room">
	<div class="scrollbar-macosx">
		<div class="header">
			<div class="toptext">
				<a href="index.html">
					<span class="glyphicon glyphicon-arrow-left"></span> 返回大厅
				</a>
			</div>
			<ul class="topnavlist">
				<li class="userlist">
					<a><span class="glyphicon glyphicon-th-list"></span>用户列表</a>
					<div class="popover fade bottom in">
						<div class="arrow"></div>
						<h3 class="popover-title">在线用户18人</h3>
						<div class="popover-content scrollbar-macosx">
							<ul>
								<li>
									<img src="images/user/12.png" alt="portrait_1">
									<b>美国队长</b>
								</li>
								<li>
									<img src="images/user/12.png" alt="portrait_1">
									<b>美国队长</b>
								</li>
								<li>
									<img src="images/user/12.png" alt="portrait_1">
									<b>美国队长</b>
								</li>
								<li>
									<img src="images/user/12.png" alt="portrait_1">
									<b>美国队长</b>
								</li>
								<li>
									<img src="images/user/12.png" alt="portrait_1">
									<b>美国队长</b>
								</li>
								<li>
									<img src="images/user/12.png" alt="portrait_1">
									<b>美国队长</b>
								</li>
								<li>
									<img src="images/user/12.png" alt="portrait_1">
									<b>美国队长</b>
								</li>
								<li>
									<img src="images/user/12.png" alt="portrait_1">
									<b>美国队长</b>
								</li>
								<li>
									<img src="images/user/12.png" alt="portrait_1">
									<b>美国队长</b>
								</li>
								<li>
									<img src="images/user/12.png" alt="portrait_1">
									<b>美国队长</b>
								</li>
								<li>
									<img src="images/user/12.png" alt="portrait_1">
									<b>美国队长</b>
								</li>
								<li>
									<img src="images/user/12.png" alt="portrait_1">
									<b>美国队长</b>
								</li>
								<li>
									<img src="images/user/12.png" alt="portrait_1">
									<b>美国队长</b>
								</li>
								<li>
									<img src="images/user/12.png" alt="portrait_1">
									<b>美国队长</b>
								</li>
								<li>
									<img src="images/user/12.png" alt="portrait_1">
									<b>美国队长</b>
								</li>
								<li>
									<img src="images/user/12.png" alt="portrait_1">
									<b>美国队长</b>
								</li>
								<li>
									<img src="images/user/12.png" alt="portrait_1">
									<b>美国队长</b>
								</li>
								<li>
									<img src="images/user/12.png" alt="portrait_1">
									<b>美国队长</b>
								</li>
							</ul>
						</div>
					</div>
				</li>
			</ul>
			<div class="clapboard hidden"></div>
		</div>
		<div class="main container">
			<div class="col-md-12">
				<ul class="chat_info">
					<li class="left">
						<img src="images/user/12.png" alt="">
						<b>美国队长</b>
						<i>09:14</i>
						<div>怎么没人聊天的</div>
					</li>
					<li class="systeminfo">
						<span>【绿巨人】加入了房间</span>
					</li>
					<li class="left">
						<img src="images/user/12.png" alt="">
						<b>美国队长</b>
						<i>09:15</i>
						<div>嗨起来！！！</div>
					</li>
				</ul>
			</div>
		</div>
		<div class="input">
			<div class="center">
				<div class="tools">

					<span class="glyphicon glyphicon-heart face_btn"></span>
					<span class="glyphicon glyphicon-picture imgFileico"></span>

					<input type="file" class="imgFileBtn hidden" accept="image/*">
					<div class="faces popover fade top in">
						<div class="arrow"></div>
						<h3 class="popover-title">表情包</h3>
						<div class="popover-content scrollbar-macosx">
							<img src="images/face/1.gif" alt="1">
							<img src="images/face/2.gif" alt="2">
							<img src="images/face/3.gif" alt="3">
							<img src="images/face/4.gif" alt="4">
							<img src="images/face/5.gif" alt="5">
							<img src="images/face/6.gif" alt="6">
							<img src="images/face/7.gif" alt="7">
							<img src="images/face/8.gif" alt="8">
							<img src="images/face/9.gif" alt="9">
							<img src="images/face/10.gif" alt="10">
							<img src="images/face/11.gif" alt="11">
							<img src="images/face/12.gif" alt="">
							<img src="images/face/13.gif" alt="">
							<img src="images/face/14.gif" alt="">
							<img src="images/face/15.gif" alt="">
							<img src="images/face/16.gif" alt="">
							<img src="images/face/17.gif" alt="">
							<img src="images/face/18.gif" alt="">
							<img src="images/face/19.gif" alt="">
							<img src="images/face/20.gif" alt="">
							<img src="images/face/21.gif" alt="">
							<img src="images/face/22.gif" alt="">
							<img src="images/face/23.gif" alt="">
							<img src="images/face/24.gif" alt="">
							<img src="images/face/25.gif" alt="">
							<img src="images/face/26.gif" alt="">
							<img src="images/face/27.gif" alt="">
							<img src="images/face/28.gif" alt="">
							<img src="images/face/29.gif" alt="">
							<img src="images/face/30.gif" alt="">
							<img src="images/face/31.gif" alt="">
							<img src="images/face/32.gif" alt="">
							<img src="images/face/33.gif" alt="">
							<img src="images/face/34.gif" alt="">
							<img src="images/face/35.gif" alt="">
							<img src="images/face/36.gif" alt="">
							<img src="images/face/37.gif" alt="">
							<img src="images/face/38.gif" alt="">
							<img src="images/face/39.gif" alt="">
							<img src="images/face/40.gif" alt="">
							<img src="images/face/41.gif" alt="">
							<img src="images/face/42.gif" alt="">
							<img src="images/face/43.gif" alt="">
							<img src="images/face/44.gif" alt="">
							<img src="images/face/45.gif" alt="">
							<img src="images/face/46.gif" alt="">
							<img src="images/face/47.gif" alt="">
							<img src="images/face/48.gif" alt="">
							<img src="images/face/49.gif" alt="">
							<img src="images/face/50.gif" alt="">
							<img src="images/face/51.gif" alt="">
							<img src="images/face/52.gif" alt="">
							<img src="images/face/53.gif" alt="">
							<img src="images/face/54.gif" alt="">
							<img src="images/face/55.gif" alt="">
							<img src="images/face/56.gif" alt="">
							<img src="images/face/57.gif" alt="">
							<img src="images/face/58.gif" alt="">
							<img src="images/face/59.gif" alt="">
							<img src="images/face/60.gif" alt="">
							<img src="images/face/61.gif" alt="">
							<img src="images/face/62.gif" alt="">
							<img src="images/face/63.gif" alt="">
							<img src="images/face/64.gif" alt="">
							<img src="images/face/65.gif" alt="">
							<img src="images/face/66.gif" alt="">
							<img src="images/face/67.gif" alt="">
							<img src="images/face/68.gif" alt="">
							<img src="images/face/69.gif" alt="">
							<img src="images/face/70.gif" alt="">
							<img src="images/face/71.gif" alt="">
							<img src="images/face/72.gif" alt="">
							<img src="images/face/73.gif" alt="">
							<img src="images/face/74.gif" alt="">
							<img src="images/face/75.gif" alt="">
						</div>
					</div>
				</div>
				<div class="text">
					<div class="col-xs-10 col-sm-11">
						<input type="text" class="form-control" placeholder="输入聊天信息...">
					</div>
					<div class="col-xs-2 col-sm-1">
						<a id="subxx" role="button"><span class="glyphicon glyphicon-share-alt"></span></a>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>