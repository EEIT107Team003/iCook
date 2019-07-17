<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.memberImg {
	height: 500;
	float: left;
	padding-right: 20px;
	padding-bottom: 60px
}

.coverImg {
	width: 1024;
	height: 500;
}
</style>

</head>
<body>

	<script >
		var currentUrl = this.location.href
		console.log(currentUrl);
	</script>

	<h1>會員首頁 登入者:${username}</h1>
	<a href="${pageContext.request.contextPath}/logout_page" class="alert alert-dark" role="alert">會員登出</a>
	<a href="${pageContext.request.contextPath}/home" class="alert alert-dark" role="alert">回到首頁</a>
	<div class=memberImg>
		<p>大頭貼</p>
		<img width='200' height='200'
			src="<c:url value='/getMemberPhoto/${member_id}' />" />
		<form method="POST" action="page/track?member_id=${member_id}">
			<button id=trackMe type="submit">加入追蹤</button>
		</form>
	</div>
	<div class=coverImg>
		<p>封面圖片</p>
		<img width='1024' height='300'
			src="<c:url value='/getCoverPhoto/${member_id}' />" />
	</div>
	<hr>
	<div>
		<span>被追蹤數: ${tracked_num} | 分享食譜數量: ${recipe_num} | 分享文章數量:
			${forum_num}</span>
	</div>

</body>
</html>