<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>
	</script>
	<c:out value="登入者${LoginOK.member_id}"></c:out>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="/icook">ICook!</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarTogglerDemo02"
			aria-controls="navbarTogglerDemo02" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarTogglerDemo02">
			<ul class="navbar-nav mr-auto mt-2 mt-lg-0">
				<li class="nav-item"><a class="nav-link" href='products'>市集</a>
				</li>
				<li class="nav-item"><a class="nav-link"
					href="icookCartPage">(測試)畫面購物車</a></li>
				<li class="nav-item"><a class="nav-link"
					href="icookezship">(測試)畫面選店</a></li>

				<li class="nav-item"><a class="nav-link" href="toAIOcheck">(測試)ecpay</a>
				</li>
				<li><span><a class="nav-link" href="index2">去畫面首頁</a></span></li>
					<span style='border: solid 1px black'> </span> <span><a
			class="nav-link" href="finishOrderPage">測試finishOrderPage</a></span> <span><a
			class="nav-link" href="icookFinishOrderPage">(測試)畫面感謝頁</a></span> <span><a
			class="nav-link" href="information">(測試)information</a></span> <span>
				<a href="#" class="btn btn-primary btn-lg btn-block"
					onclick="window.open(' /icook/toAIOcheck', 'Paypal', config='height=500,width=500');">去印超商取貨條碼!</a>

			</ul>
			<form class="form-inline my-2 my-lg-0">
				<input class="form-control mr-sm-2" type="search" placeholder="查詢商品">
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
			</form>
		</div>
	</nav>
	<div align="center">
		<h1>這裡是首頁 登入者:${user}</h1>
		<a href="login_page">會員登入</a>
		<hr>
		<a href="logout_page">會員登出</a>
		<hr>
		<a href="addMember">新增會員</a> <a href="user">會員首頁</a>
		<hr>
		<p>其他會員</p>
		<a href="members">會員首頁</a>
		<%-- 	<a href="member?member_id=${member_id}">會員首頁</a> --%>
		<a href="A_articlemainpage">文章首頁</a>
	</div>

	<label for='show'> 種類</label>
	<div>
		<select id="show" name="show"><option value="0" SELECTED>請選擇</option></select>
	</div>
	<hr>
	<a href="insert">新增食譜</a>
	<a href="recipe">所有食譜</a>
	<hr>

	<table border="1" style="margin: 0px auto;">
		<tr height="52" bgcolor="lightblue" align="center">
			<td width="350"><p align="left" /> <a href='products'>查詢所有產品資料</a><BR>
			</td>
			<td width="350"><p align="left" /> <a href='backStage'>後台</a><BR>
		</tr>
	</table>
	<div>
		<p>---------------------------------------------------------------------</p>

	
		<p>---------------------------------------------------------------------</p>
	</div>
</body>
</html>