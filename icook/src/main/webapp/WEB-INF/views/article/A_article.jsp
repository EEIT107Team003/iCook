<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--     秉諺 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.bootcss.com/jquery/3.4.1/jquery.min.js"></script>

<script src="https://cdn.bootcss.com/web-socket-js/1.0.0/web_socket.js"></script>


<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">












</head>
<body>
	<h1 style="text-align: center">MVC Exercise</h1>
	<hr>
	<table border="1" style="margin: 0px auto;">

		<tr height="52" bgcolor="lightblue" align="center">
			<td width="350"><p align="left" /> <a href='A_insert'>新增文章</a><BR>
			</td>
			<td width="350"><a href='A_delete'>刪除文章</a><BR> <BR></td>
		</tr>
		<tr height="52" bgcolor="lightblue" align="center">
			<td width="350"><p align="left" /> <a href='A_update'>修改文章</a><BR>
			</td>
			<td width="350"><a href='A_select'>查尋文章</a><BR> <BR></td>
		</tr>
		<tr height="52" bgcolor="lightblue" align="center">
			<td width="350"><p align="left" /> <a href='A_findAll'>瀏覽所有文章</a><BR>
			</td>

		</tr>
	</table>

	<marquee direction="left" height="30" scrollamount="8" behavior="alternate" 
	id="ArcBroadcast" style="color:green;"></marquee>

		<div>
			
<!-- 				<input id="messageField" type="text" >  -->
				<input onclick="sendMsg();" value="send" type="button" >
			

			<div id="msg-box"
				style="width: 500px; height: 400px; background: #eee; overflow: auto;" ></div>
	</div>


		<input id="seachA" type="button" value="seachA">boo <input
			value="send" type="button">
<!-- 		<button class="btn btn-primary">按了產生通知</button> -->

		<script>
		var webSocket = new WebSocket("ws:/localhost:8080/icook/hello");
// 		var msgField = document.getElementById("messageField");
// 		var divMsg = document.getElementById("msg-box");
// 		var Broadcast = document.getElementById("ArcBroadcast");
		var newnew="有一則新消息"
		function sendMsg() {
			var msgToSend = newnew.value;
			webSocket.send(msgToSend);
// 			msgField.value = "";
		}

		webSocket.onmessage = function(message) {
			$.notify({
				title : '<strong>好標題</strong>',
				icon : 'glyphicon glyphicon-star',
				message : "飛進來了!"
			}, {
				type : 'info',
				animate : {
					enter : 'animated fadeInUp',
					exit : 'animated fadeOutRight'
				},
				placement : {
					from : "bottom",
					align : "right"
				},
				offset : 20,
				spacing : 10,
				z_index : 1031,
			});
			
		}

// 			webSocket.onmessage = function() {
// 				divMsg.innerHTML += "<marquee direction='right' height='30' scrollamount='8' behavior='alternate'>"
// 						+ message.data + "</marquee>";
// 				divtoday.innerHTML += message.data;
// 			}

		
// 			webSocket.onmessage = $(function() {
// 				$(".btn").on("click", function() {
// 					$.notify({
// 						title : '<strong>好標題</strong>',
// 						icon : 'glyphicon glyphicon-star',
// 						message : "飛進來了!"
// 					}, {
// 						type : 'info',
// 						animate : {
// 							enter : 'animated fadeInUp',
// 							exit : 'animated fadeOutRight'
// 						},
// 						placement : {
// 							from : "bottom",
// 							align : "right"
// 						},
// 						offset : 20,
// 						spacing : 10,
// 						z_index : 1031,
// 					});
// 				});
// 			});
			
			

			webSocket.onopen = function() {
				console.log("connection opened");
			};

			webSocket.onclose = function() {
				console.log("connection closed");
			};

			webSocket.onerror = function wserror(message) {
				console.log("error: " + message);
			}
		</script>

		

		<script type="text/javascript">
			$(function() {
				$(".btn").on("click", function() {
					$.notify({
						title : '<strong>好標題</strong>',
						icon : 'glyphicon glyphicon-star',
						message : "飛進來了!"
					}, {
						type : 'info',
						animate : {
							enter : 'animated fadeInUp',
							exit : 'animated fadeOutRight'
						},
						placement : {
							from : "bottom",
							align : "right"
						},
						offset : 20,
						spacing : 10,
						z_index : 1031,
					});
				});
			});
		</script>




	





















	<!-- 		第三個範例 -->


	
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"
		integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"
		integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k"
		crossorigin="anonymous"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/article/bootstrap-notify-master/bootstrap-notify.min.js"></script>



</body>
</html>