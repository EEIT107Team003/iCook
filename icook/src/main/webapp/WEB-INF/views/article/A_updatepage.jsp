<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!--     秉諺 -->

<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>


<!-- 使用ckediror需要加入 -->
<!-- 使用ckediror需要加入 -->
<!-- 使用ckediror需要加入 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
<!-- 使用ckediror需要加入 -->
<!-- 使用ckediror需要加入 -->
<!-- 使用ckediror需要加入 -->


</head>

<body bgcolor='black'>
	<form:form method="POST" modelAttribute="ArticlebeanUpdate"
		action="/icook/A_updateAfterSelete" class='form-horizontal'
		enctype="multipart/form-data">
		<table border="3px" bgcolor='#CCEEFF'>
			<thead>
				<tr>
					<th height="60" colspan="3" align="center">修改一篇文章</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var='Article' items='${Articles}'>
					<tr>
						<td width="120" height="40">編號</td>
						<td width="600" height="40" align="left"><form:input
								path="article_num" type="text" size="14"
								placeholder="${Article.article_num}" class='form:input-large' />
					</tr>

					<tr>
						<td width="120" height="40">日期</td>
						<td width="600" height="40" align="left"><form:input
								path="article_date" type="text" size="14"
								value="${Article.article_date}" class='form:input-large' />
					</tr>
					<tr>
						<td width="120" height="40">title</td>
						<td width="600" height="40" align="left"><form:input
								path="article_title" type="text" size="14"
								class='form:input-large' value="${Article.article_title}" />
					</tr>

					<tr>
						<td width="120" height="40">是否隱藏</td>
						<td width="600" height="40" align="left"><form:select
								path="article_status" value="${Article.article_status}">
								<option value="1">公開</option>
								<option value="2">隱藏</option>
								<option value="3">不開放留言</option>
								<option value="4">限定會員</option>
							</form:select>
					</tr>
					<tr>
						<td width="120" height="40">類別</td>
						<td width="600" height="40" align="left"><form:select
								path="article_catergoary" value="${Article.article_catergoary}">
								<option value="食安新聞">食安新聞</option>
								<option value="廚具新聞">廚具新聞</option>
								<option value="最新消息">最新消息</option>
								<option value="其他">其他</option>
							</form:select>
					</tr>

					<tr>
						<td width="120" height="40">更改圖片</td>

						<td width="600" height="40" align="left"><form:input
								type="file" size="14" path="ArticleImage"
								class='form:input-large' />
					</tr>

					<tr>

						<td width="720" height="40" align="center" colspan="3"><form:textarea
								rows="10" cols="80" path="article_content" id="editor1"
								value="${Article.article_content}"></form:textarea></td>



					</tr>

					<tr>
						<td height="50" colspan="3" align="center"><input
							type="submit" value="送出" name="submit" id="submit"></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</form:form>


</body>
<script>
	//使用ckediror需要加入            replace對應到textarea的id 
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