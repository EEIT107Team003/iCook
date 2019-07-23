<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--     秉諺 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <script src="https://cdn.bootcss.com/jquery/3.4.1/jquery.min.js"></script> -->
<script src="https://cdn.bootcss.com/web-socket-js/1.0.0/web_socket.js"></script>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
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
			<form>
				<input id="messageField" type="text" > <input
					onclick="sendMsg();" value="send" type="button" >
			</form>

			<div id="msg-box"
				style="width: 500px; height: 400px; background: #eee; overflow: auto;" ></div>


	<script>
					var webSocket = new WebSocket("ws:/localhost:8080/icook/hello");
					var msgField = document.getElementById("messageField");
					var divMsg = document.getElementById("msg-box");
					var Broadcast = document.getElementById("ArcBroadcast");
					function sendMsg() {
						var msgToSend = msgField.value;
						webSocket.send(msgToSend);
						msgField.value = "";
					}

					webSocket.onmessage = function(message) {
						divMsg.innerHTML += "<marquee direction='right' height='30' scrollamount='8' behavior='alternate'>" + message.data+"</marquee>";
						divtoday.innerHTML+=message.data;
					}

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




		</div>






















	<!-- 		第三個範例 -->


	



</body>
</html>