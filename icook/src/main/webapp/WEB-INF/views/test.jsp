<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<spring:url value="/resources/js/lib/bootstrap/css/chat.css"
	var="chatCSS" />
<!------ Include the above in your HEAD tag ---------->

<!DOCTYPE HTML>
<html>
<head>
<!-- Scripts jQuery, bootstrap -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"
	integrity="sha512-K1qjQ+NcF2TYO/eI3M6v8EiNYZfA95pQumfvcVrTHtwQVDG+aHRqLi/ETn2uB+1JqwYqVG3LIvdm9lj6imS/pQ=="
	crossorigin="anonymous"></script>

<!-- Estilos  bootstrap, chat-->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" href=" ${ chatCSS } ">

<!-- área de código Firebase y lectura de Mensajes-->

<script src="https://www.gstatic.com/firebasejs/4.13.0/firebase.js"></script>
<script>
	// Initialize Firebase
	var config = {
		apiKey : "AIzaSyB-CfYZb2rJeeycqL8F5Lo2zmCQAu1A0Sc",
		authDomain : "soft1-6305e.firebaseapp.com",
		databaseURL : "https://soft1-6305e.firebaseio.com",
		projectId : "soft1-6305e",
		storageBucket : "soft1-6305e.appspot.com",
		messagingSenderId : "592333250349"
	};
	firebase.initializeApp(config);
	//VARIABLE CON ACCESO A DATOS

	Var
	TableDeDatos = firebase.database().ref('soft1-6305e');
</script>

</head>
<body>

	<div class="container">
		<div class="row">
			<!-- inicio de la caja de chat con bootstrap -->
			<div class="col-md-6 col-md-offset-3">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<span class="glyphicon glyphicon-comment"></span> Chat
						<div class="btn-group pull-right">
							<button type="button"
								class="btn btn-default btn-xs dropdown-toggle"
								data-toggle="dropdown">
								<span class="glyphicon glyphicon-chevron-down"></span>
							</button>
							<ul class="dropdown-menu slidedown">
								<li><a href="http://develoteca.com"><span
										class="glyphicon glyphicon-refresh"> </span>Develoteca</a></li>
								<li><a href="https://www.youtube.com/user/dimit28"><span
										class="glyphicon glyphicon-ok-sign"> </span>Youtube</a></li>

							</ul>
						</div>
					</div>
					<div class="panel-body">
						<ul class="chat">
						</ul>
					</div>
					<div class="panel-footer">
						<div class="input-group">
							<input id="Mensaje" type="text" class="form-control input-sm"
								placeholder="Escribe un mensaje..." /> <span
								class="input-group-btn">
								<button class="btn btn-warning btn-sm" id="btnEnviar">
									Enviar</button>
							</span>
						</div>
					</div>
				</div>
			</div>
			<!--  Fin de la caja de chat con bootstrap -->
		</div>
	</div>
	<!-- template del item del chat (Oculto: para agarrar un clon y llenarlo e insertar en el chat)-->
	<li style="display: none" id="plantilla" class="left clearfix"><span
		class="chat-img pull-left"> <img
			src="http://placehold.it/50/55C1E7/fff&text=U" class="img-circle" />
	</span>
		<div class="chat-body clearfix">
			<div class="header">
				<strong class="primary-font Nombre">Jack Sparrow</strong> <small
					class="pull-right text-muted"><span
					class="glyphicon glyphicon-asterisk Tiempo"></span> 12/02/2015 </small>
			</div>
			<p class="Mensaje">Mensaje</p>
		</div></li>


	<!-- Scripts de acción al botón -->
	<script>
		var Nombre = prompt("Nombre:");

		$('#btnEnviar').click(function() {
			var formatofecha = new date();
			var d = formatofecha.getUTCDate();
			var m = formatofecha.getMonth() + 1;
			var y = formatofecga.getFullYear();
			var h = formatofecha.getHours();
			var min = formatofecha.getMinutes();

			Fecha = d + "/" + m + "/" + y + "  " + h + ":"
			min;

			TabladeBaseDatos.push({
				Nombre : Nombre,
				Mensaje : $("#Mensaje").val(),
				Fecha : Fecha
			});
		});
	</script>
</body>
</html>