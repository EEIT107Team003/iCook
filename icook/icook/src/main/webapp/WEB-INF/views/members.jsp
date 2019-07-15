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
<body>
	<h1>其他會員 登入者:${username}</h1>
	<a href="/icook/user">回到會員頁</a>
	<a href="/icook/home">回到首頁</a>
	<p>會員連結</p>
	<div>
		<c:forEach var="member" items="${members}">
			<div>
				<table border="1">
					<tr>
						<td>
							<img width='80' height='80' src="<c:url value='/getMemberPhoto/${member.member_id}' />" />
						</td>
						<td><a href="members/page?member_id=${member.member_id}">${member.nickname}</a></td>
					</tr>
				</table>
				<hr>
			</div>
		</c:forEach>
	</div>
</body>
</html>