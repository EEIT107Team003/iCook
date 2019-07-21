<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${info}</title>
</head>
<body>
<center>
<h1>${info}</h1>
<!-- <form method = "GET"  action = "aioCheckOut/aioCheckOutALL"> -->
<!-- 	<table> -->
<!-- 		<tr> -->
<!-- 			<td> -->
<!-- 				<input type = "submit" value = "不指定付款方式"/> -->
<!-- 			</td> -->
<!-- 		</tr> -->
<!-- 	</table> -->
<!-- </form> -->
<!-- <form method = "GET"  action = "aioCheckOut/aioCheckOutATM"> -->
<!-- 	<table> -->
<!-- 		<tr> -->
<!-- 			<td> -->
<!-- 				<input type = "submit" value = "自動櫃員機"/> -->
<!-- 			</td> -->
<!-- 		</tr> -->
<!-- 	</table> -->
<!-- </form> -->
<form method = "GET"  action = "frontEnd/aioCheckOut/aioCheckOutBARCODE">
	<table>
		<tr>
			<td>
				<input type = "submit" value = "超商條碼"/>
			</td>
		</tr>
	</table>
</form>
<!-- <form method = "GET"  action = "aioCheckOut/aioCheckOutCVS"> -->
<!-- 	<table> -->
<!-- 		<tr> -->
<!-- 			<td> -->
<!-- 				<input type = "submit" value = "超商代碼"/> -->
<!-- 			</td> -->
<!-- 		</tr> -->
<!-- 	</table> -->
<!-- </form> -->
<!-- <form method = "GET"  action = "aioCheckOut/aioCheckOutDevide"> -->
<!-- 	<table> -->
<!-- 		<tr> -->
<!-- 			<td> -->
<!-- 				<input type = "submit" value = "信用卡分期"/> -->
<!-- 			</td> -->
<!-- 		</tr> -->
<!-- 	</table> -->
<!-- </form> -->
<!-- <form method = "GET"  action = "aioCheckOut/aioCheckOutOneTime"> -->
<!-- 	<table> -->
<!-- 		<tr> -->
<!-- 			<td> -->
<!-- 				<input type = "submit" value = "信用卡一次付清"/> -->
<!-- 			</td> -->
<!-- 		</tr> -->
<!-- 	</table> -->
<!-- </form> -->
<!-- <form method = "GET"  action = "aioCheckOut/aioCheckOutPeriod"> -->
<!-- 	<table> -->
<!-- 		<tr> -->
<!-- 			<td> -->
<!-- 				<input type = "submit" value = "信用卡定期定額"/> -->
<!-- 			</td> -->
<!-- 		</tr> -->
<!-- 	</table> -->
<!-- </form> -->
<!-- <form method = "GET"  action = "aioCheckOut/aioCheckOutWebATM"> -->
<!-- 	<table> -->
<!-- 		<tr> -->
<!-- 			<td> -->
<!-- 				<input type = "submit" value = "網路ATM"/> -->
<!-- 			</td> -->
<!-- 		</tr> -->
<!-- 	</table> -->
<!-- </form> -->
<%-- <form method = "GET"  action = "<%=request.getContextPath()%>/index2"> --%>
<!-- 	<table> -->
<!-- 		<tr> -->
<!-- 			<td> -->
<!-- 				<input type = "submit" value = "back to Home"/> -->
<!-- 			</td> -->
<!-- 		</tr> -->
<!-- 	</table> -->
<!-- </form> -->
</center>
</body>
</html>