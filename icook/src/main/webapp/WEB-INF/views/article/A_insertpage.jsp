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
<script type="text/javascript"
	src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
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
	<form:form method="POST" modelAttribute="Articlebean"
		class='form-horizontal' enctype="multipart/form-data" ">
		<table border="3px" bgcolor='#CCEEFF'>
			<thead>
				<tr>
					<th height="60" colspan="3" align="center">新增一篇文章</th>
				</tr>
			</thead>
			<tbody>


				<tr>
					<td width="120" height="40">日期</td>
					<td width="600" height="40" align="left"><form:input
							path="article_date" type="text" size="14" placeholder="西元年-月份-日期"
							class='form:input-large' />
				</tr>
				<tr>
					<td width="120" height="40">title</td>
					<td width="600" height="40" align="left"><form:input
							path="article_title" type="text" size="14"
							class='form:input-large' />
				</tr>
				<tr>
					<td width="120" height="40">作者</td>
					<td width="600" height="40" align="left"><form:input
							type="text" path="article_author" class='form:input-large' />
				</tr>
				<tr>
					<td width="120" height="40">是否隱藏</td>
					<td width="600" height="40" align="left"><form:select
							path="article_status" >
							<option value="1">公開</option>
							<option value="2">隱藏</option>
							<option value="3">不開放留言</option>
							<option value="4">限定會員</option>
						</form:select>
				</tr>
				<tr>
					<td width="120" height="40">類別</td>
					<td width="600" height="40" align="left"><form:select
							path="article_catergoary">
							<option value="食安新聞">食安新聞</option>
							<option value="廚具新聞">廚具新聞</option>
							<option value="最新消息">最新消息</option>
							<option value="其他">其他</option>
						</form:select>
				</tr>

				<tr>
					<td width="120" height="40">上傳</td>

					<td width="600" height="40" align="left"><form:input
							type="file" size="14" path="ArticleImage"
							class='form:input-large' />
				</tr>

				<tr>
					<td width="720" height="40" align="center" colspan="3"><form:textarea
							rows="100%" cols="100%" name="editor1" path="article_content"
							id="editor1" /></td>

				</tr>

				<tr>
					<td height="50" colspan="3" align="center"><input
						type="submit" value="新增" name="submit" id="submit"></td>
				</tr>

			</tbody>
		</table>
	</form:form>


</body>



<script>
CKEDITOR
.replace(
		'editor1',
		{
			extraPlugins : 'easyimage',
			cloudServices_tokenUrl : 'https://40733.cke-cs.com/token/dev/Pno0Ld5ha3oNhABb0mnQBXWdL6FXy03CbisbDkPL9hJoOrvd8p0hpHlka5RA',
			cloudServices_uploadUrl : 'https://40733.cke-cs.com/easyimage/upload/'
		});
</script>
</html>