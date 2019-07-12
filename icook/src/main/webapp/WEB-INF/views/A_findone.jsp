<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!--     秉諺 -->
<html>
<head>
<meta charset="UTF-8">

<title>所有文章</title>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>


</head>
<body>


	<div style="width: 300; height: 300">
		<img style="border: 3px red solid; width: 200; height: 200"
			align="top" src="<c:url value='/getPicture/${Article.article_num}'/>" />
	</div>

	<div>
		<p>${Article.article_num}</p>
	</div>
	<div>
		<p>${Article.article_title}</p>
	</div>
	<div>
		<p>${Article.article_author}</p>
	</div>
	<div>
		<p>${Article.article_date}</p>
	</div>
	<div>
		<p>${Article.article_status}</p>
	</div>
	<div>
		<p>${Article.article_catergoary}</p>
	</div>
	<div>
		<p>${Article.coverImage}</p>
	</div>
	<div style="width: 500; height: 500">
		<article>${Article.article_content}</article>
	</div>


	<form:form method="POST" modelAttribute="modelMsginsert"
		enctype="multipart/form-data" action="/icook/Msginsert">

		<table>

			<tr>
				<td style="backgroundcolor: pink;" width="720" height="40"
					align="center" colspan="3"><form:textarea rows="10" cols="80"
						path="msgboard_content" id="editor1"></form:textarea></td>

			</tr>
			<tr>
                    <form:hidden path="catchnum" value="${Article.article_num}"></form:hidden>
			</tr>

			<tr>

				<td height="50" colspan="3" align="center"><input type="submit"
					value="送出" name="submit" id="submit"></td>
			</tr>
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
