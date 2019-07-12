<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>顯示單筆</title>
</head>
<body>
<h1>顯示單筆</h1>
	<form:form method="POST" modelAttribute="MemberBean"
		enctype="multipart/form-data">

		<div>
			<label for="nickname">暱稱:</label>
			<form:input id="nickname" path="nickname" type="text" />
		</div>
		<div>
			<input id=submit type="submit" value="送出">
		</div>
	</form:form>
</body>
</html>