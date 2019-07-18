<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!--     秉諺 -->
<html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
<style>
form {
	margin: 0 auto;
	width: 600px;
}

.span {
	font-size: 20px;
	color: red;
}
</style>


</head>
<body bgcolor='black'>
	<form:form method="POST" modelAttribute="ArticlebeanUpdate"
		class='form-horizontal' enctype="multipart/form-data" >
		<table border="3px" bgcolor='#CCEEFF'>
			<thead>
				<tr>
					<th height="60" colspan="3" align="center">修改一篇文章</th>
				</tr>
			</thead>
			<tbody>


				<tr>
					<td width="120" height="40">文章編號</td>
					<td width="600" height="40" align="left"><form:input
							path="article_num" type="text" size="14" 
							class='form:input-large' />
				</tr>
			
				<tr>
					<td height="50" colspan="3" align="center"><input
						type="submit" value="查一篇文章" name="submit" id="submit" 
						/>
						
						</td>
				</tr>

			</tbody>
		</table>
	</form:form>


</body>


</html>