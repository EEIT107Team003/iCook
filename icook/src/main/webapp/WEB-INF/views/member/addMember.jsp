<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新增會員</title>
</head>
<body>
	<h1>新增會員</h1>
	<form:form method="POST" modelAttribute="MemberBean"
		enctype="multipart/form-data">
		<div>
			<div>
				<form:input id="member_photo_tr" path="member_photo_tr" type='file' />
			</div>
		</div>
		<div>
			<label for="nickname">暱稱:</label>
			<form:input id="nickname" path="nickname" type="text" />
		</div>
		<div>
			<label for="username">電子郵件:</label>
			<form:input id="username" path="username" type="text" />
		</div>
		<div>
			<label for="password">密碼:</label>
			<form:input id="password" path="password" type="text" />
		</div>
<%-- 			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> --%>
		<div>
			<input id=submit type="submit" value="送出">
		</div>
	</form:form>
	<a href="home">回到首頁</a>
</body>
</html>