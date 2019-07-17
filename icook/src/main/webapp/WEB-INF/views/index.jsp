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
</head>
<body>
<script>
	
	$(document).ready(function(){
		$.ajax({
			url : "${pageContext.request.contextPath}/category",
			type : "GET",
			dataType : "json",
			contentType : "application/json",
			async : true,
			success : function(data) {
				var names = JSON.parse(JSON.stringify(data).split(","));
				var txt = "";
				console.log(names);
	            for (i in names) {
					txt += "<option value='"+i+"'>" + names[i].nickname + "</option>";
				}
				$("#show").append(txt);
			},
			error : function(data, textStatus, errorThrown) {
				console.log(data);
			},
		});
		
	});
	</script>
<c:out value="登入者${LoginOK.member_id}"></c:out>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="/icookProject">ICook!</a>
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
				<li class="nav-item"><a class="nav-link" href="#">食譜</a></li>
				<li class="nav-item"><a class="nav-link" href="#">(修改商品)</a></li>
				<li class="nav-item"><a class="nav-link" href='products/add'>(新增商品)</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="products/upd">(更新產品)</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="collections">查詢收藏</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="cartPage">購物車</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="checkOrders">檢視訂單(會員用)</a>
				</li>
				<li class="nav-item"><a class="nav-link"
					href="adminCheckOrders">查看訂單(僅限admin的URL)</a></li>

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
		<a href="addMember">新增會員</a>
		 <a href="user">會員首頁</a>
		<hr>
		<p>其他會員</p>
		<a href="members">會員首頁</a>
		<%-- 	<a href="member?member_id=${member_id}">會員首頁</a> --%>
		<a href="A_article">文章首頁</a>
	</div>
	
		<label for='show'> 種類</label>
	<div>
		<select id="show" name="show"><option value="0" SELECTED>請選擇</option></select>
	</div>
		<hr>
		<a href="insert">新增食譜</a>
		<a href="recipe">所有食譜</a>
<hr>
點擊圖片並上傳 測試一
   <label for="image">
      <input type="file" name="image" id="image" style="display:none;"/>
      <img src="http://upload.wikimedia.org/wikipedia/commons/c/ca/Button-Lightblue.svg" width="30px"/>
   </label>
<hr>
點擊圖片並上傳 測試二
<input type="image" src="http://upload.wikimedia.org/wikipedia/commons/c/ca/Button-Lightblue.svg" width="30px"/>
<input type="file" id="my_file" style="display: none;" />
<script>
$("input[type='image']").click(function() {
    $("input[id='my_file']").click();
});
</script>
	<table border="1" style="margin: 0px auto;">
		<tr height="52" bgcolor="lightblue" align="center">
			<td width="350"><p align="left" /> <a href='products'>查詢所有產品資料</a><BR>
			</td>
		</tr>
	</table>
	<div>
		<p>---------------------------------------------------------------------</p>

		<span style='border: solid 1px black'> </span> <span><a
			class="nav-link" href="login">顧客登入</a></span>
		<ul>
			<li class="nav-item"><a class="nav-link" href='products'>市集</a>
			</li>
			<li class="nav-item"><a class="nav-link" href="cartPage">購物車</a>
			</li>
			<li class="nav-item"><a class="nav-link" href="checkOrders">檢視訂單(會員用)</a>
			</li>
			<li class="nav-item"><a class="nav-link" href="adminCheckOrders">查看訂單(僅限admin的URL)</a>
			</li>
		</ul>
		<span><a class="nav-link" href="login">admin登入</a></span> <span><a
			class="nav-link" href="logout">Logout登出</a></span> <span><a
			class="nav-link" href="payment">payment page</a></span> <span><a
			class="nav-link" href="testEL1">測試testEL1</a></span> <span><a
			class="nav-link" href="ezship">測試ezship</a></span> <span><a
			class="nav-link" href="ezship2">測試ezship收到參數編碼</a></span> <span><a
			class="nav-link" href="finishOrderPage">測試finishOrderPage</a></span> <span><a
			class="nav-link" href="information">測試information</a></span> <span><a
			class="nav-link" href="toAIOcheck">aioCheckOutOneTime</a></span> <span><a
			class="nav-link" href="frontEnd/aioCheckOut/aioCheckOutALL">aioCheckOut</a></span>
		<p>---------------------------------------------------------------------</p>
	</div>
</body>
</html>