<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改會員</title>
</head>
<body>
	<h1>修改會員</h1>
	<form:form method="POST" modelAttribute="MemberBean"
		enctype="multipart/form-data">
		<div>
			<label for="nickname">暱稱:</label>
			<form:input id="nickname" path="nickname" type="text"
				value="${nickname}" />
		</div>
		<div>
			<label for="username">電子郵件:${username}</label>
<%-- 			<form:input id="username" path="username" type="text" --%>
<%-- 				value="${username}" /> --%>
		</div>
		<div>
			<label for="password">密碼:${password}</label>
<%-- 			<form:input id="password" path="password" type="text" --%>
<%-- 				value="${password}" /> --%>
		</div>
		<div>
			<input id=submit type="submit" value="送出">
		</div>
	</form:form>

</body>
</html>