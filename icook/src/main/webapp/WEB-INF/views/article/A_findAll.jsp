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
<style>
.useful {
	margin: 5px;
}
</style>

</head>
<body>


	<div class="useful">
		<c:forEach var='Article' items='${Articles}'>
			<div class="useful" style="width: 360px; height: 70%;border:3px black groove " >
				<div class="useful" style="width: 320px; height: 10px;border:3px orange groove">

					<div class="useful" align="center" style="border:3px blue groove;height: 100% " >
					<div style="width:300 ;height:300"><img style="border:3px red solid; width:200 ;height:200" align="top" 
							src="<c:url value='/getartPicture/${Article.article_num}'/>" /> </div>
						
						<p>${Article.article_num}</p>
						<p>${Article.article_title}</p>
						<p>${Article.article_author}</p>
						<p>${Article.article_date}</p>
						<p>${Article.article_status}</p>
						<p>${Article.article_catergoary}</p>
						<p>${Article.coverImage}</p>
						<div style="width:500 ;height:500">
						<article>${Article.article_content}</article>
						</div>
						<br>
					</div><br>

				</div><br>
			</div><br>
		</c:forEach><br>
	</div>

</body>
</html>
