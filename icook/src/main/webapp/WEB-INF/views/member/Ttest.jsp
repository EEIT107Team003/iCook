<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form:form method="POST" modelAttribute="TestBean">
		<div>
			<label for="id">欄位一</label>
			<form:input id="id" path="tid" type="text" />
		</div>
		<div>
			<label for="t1">欄位一</label>
			<form:input id="t1" path="t1" type="text" />
		</div>
		<div>
			<label for="t2">欄位二</label>
			<form:input id="t2" path="t2" type="text" />
		</div>
		<div>
			<label for="t3">欄位三</label>
			<form:input id="t3" path="t3" type="text" />
		</div>
		<div>
			<input id="button" type="submit" value="送出" />
		</div>
	</form:form>
</body>
</html>