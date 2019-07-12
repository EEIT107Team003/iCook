<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>顯示結果</title>
</head>
<body>
	<h1>顯示結果</h1>
	<a href="/icook/user">回到會員頁</a>
	<a href="/icook/home">回到首頁</a>
	<div>
		<c:forEach var="member" items="${members}"> 
			<div>
				<img width='100' height='200'
					src="<c:url value='/getMemberPhoto/${member.member_id}' />" /><br>
					<img width='100' height='200'
					src="<c:url value='/getCoverPhoto/${member.member_id}' />" /><br>
				<table border="1">
					<tr>
						<td>會員ID</td>
						<td>${member.member_id}</td>
					</tr>
					<tr>
						<td>會員暱稱</td>
						<td>${member.nickname}</td>
					</tr>
					<tr>
						<td>電子郵件</td>
						<td>${member.username}</td>
					</tr>
					<tr>
						<td>被追蹤數</td>
						<td>${member.tracked_num}</td>
					</tr>
					<tr>
						<td>食譜數量</td>
						<td>${member.recipe_num}</td>
					</tr>
					<tr>
						<td>發文數量</td>
						<td>${member.forum_num}</td>
					</tr>
					<tr>
						<td>註冊時間</td>
						<td>${member.register_date}</td>
					</tr>
					<tr>
						<td>是否水桶</td>
						<td>${member.enabled}</td>
					</tr>

				</table>
				<hr>
			</div>
		</c:forEach>
	</div>
</body>
</html>