<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"
	integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"
	integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k"
	crossorigin="anonymous"></script>
<style>
.memberImg {
	height: 500;
	float: left;
	clear: left;
	padding-top: 50px padding-right: 20px;
	padding-bottom: 60px
}

.coverImg {
	width: 1024;
	height: 500;
}

.bread {
	float: left;
}

.link {
	width:auto;
	float: right;
}
</style>

</head>
<body>
	<h1 class="alert alert-dark" role="alert">會員首頁 登入者:${username}</h1>
	<div style="height:100px; position: relative; display:flex ; align-items: center" class="alert alert-dark shadow-none p-3 mb-5 bg-light rounded" role="alert"  >
		<div style="height:auto; position: relative; display:flex ; align-items: center" class="bread">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#">Home</a></li>
				<li class="breadcrumb-item"><a href="#">Library</a></li>
				<li class="breadcrumb-item active" aria-current="page">Data</li>
			</ol>
			<nav aria-label="breadcrumb"></nav>
		</div>
		<div class="link">
			<a href="logout_page" class="alert alert-dark" role="alert">會員登出</a>
			<a href="home" class="alert alert-dark" role="alert">回到首頁</a>
		</div >
	</div>
	<br>
	<div class=memberImg>
		<p>修改大頭貼</p>
		<img width='200' height='200'
			src="<c:url value='/getMemberPhoto/${member_id}' />" />
		<form:form method="POST" action="updateMemberPhoto"
			modelAttribute="MemberBean" enctype="multipart/form-data">
			<div>
				<form:input id="member_photo_tr" path="member_photo_tr" type='file' />
			</div>
			<div>
				<input id=submit type="submit" value="送出">
			</div>
		</form:form>

		<%-- 		<form method="POST" action="trackMe"> --%>
		<!-- 			<button id=trackMe type="submit">加入追蹤</button> -->
		<%-- 		</form> --%>

	</div>
	<div class=coverImg>
		<p>修改封面圖片</p>
		<img width='1024' height='300'
			src="<c:url value='/getCoverPhoto/${member_id}' />" />
		<form:form method="POST" action="updateCoverPhoto"
			modelAttribute="MemberBean" enctype="multipart/form-data">
			<div>
				<form:input id="cover_photo_tr" path="cover_photo_tr" type='file' />
			</div>
			<div>
				<input id=submit type="submit" value="送出">
			</div>
		</form:form>
	</div>
	<hr>
	<div>
		<span>被追蹤數: ${tracked_num} | 分享食譜數量: ${recipe_num} | 分享文章數量:
			${forum_num}</span>
	</div>
	<hr>
	<p>會員功能</p>
	<a href="user/update">修改會員資料</a>
	<br>
	<hr>
	<p>功能測試</p>
	<a href="user/test">取值測試</a>
	<br>
	<a href="user/result">顯示結果</a>
	<br>
	<a href="user/resultOne">顯示單筆</a>
	<br>
	<a href="user/lock">封鎖會員</a>
</body>
</html>