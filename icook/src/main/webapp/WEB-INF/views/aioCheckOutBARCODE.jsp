<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>建立交易訂單(模擬客戶購物結帳)，BARCODE付款方式</title>
</head>
<body>
	<div align="center">
		<p>注意: 以下欄位都是從使用者而來的參數，其他參數應從商家系統DB撈出</p>
		<form:form action="" method="POST" id="aio">
			備註
			<form:input type="text" path="Remark" name="備註"/>
			<br>
			<input type="submit" value="Submit"/>
			<br>
		</form:form>
		<form method = "GET"  action = "<%=request.getContextPath()%>">
	<table>
		<tr>
			<td>
				<input type = "submit" value = "back to Home"/>
			</td>
		</tr>
	</table>
</form>
	</div>
</body>
</html>