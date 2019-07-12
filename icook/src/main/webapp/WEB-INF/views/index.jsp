<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
	
	$(document).ready(function(){
		
		$.ajax({
			url : "${pageContext.request.contextPath}/category",
			type : "POST",
			dataType : "json",
			contentType : "application/json",
			async : true,
			success : function(data) {
					alert(data)
			},
		});
		
	});
	</script>
</head>
<body>
	<h1>這裡是首頁 登入者:${user}</h1>
	<a href="login_page">會員登入</a>
	<hr>
	<a href="logout_page">會員登出</a>
	<hr>
	<a href="addMember">新增會員</a>
	<a href="user">會員首頁</a>
	<hr>
	<p>其他會員</p>
	<a href="members">會員首頁</a>

	
	<label for='show'> 種類</label>
	<div>
		<select id="show" name="show"><option value="0" SELECTED>請選擇</option></select>

	</div>

</body>
</html>