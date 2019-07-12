<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>這裡是首頁 登入者:${user}</h1>
	<a href="login_page">會員登入</a><hr>
	<a href="logout_page">會員登出</a><hr>
	<a href="addMember">新增會員</a>
	<a href="user">會員首頁</a>
	<hr>
	<p>其他會員</p>
	<a href="members">會員首頁</a>
<%-- 	<a href="member?member_id=${member_id}">會員首頁</a> --%>
</body>
</html>