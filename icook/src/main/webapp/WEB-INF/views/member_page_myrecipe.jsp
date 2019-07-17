<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.recipe{
		 height:175px;
		 width:800px;
		 margin-left: 20px;
	}
	.recipe_img{
		 width:280px;
		 height:175px;
		 margin-right: 20px;
		 float:left;
	}
	.recipe_name{
 		height:30px; 
 		font-size: 25px;
	}
	.recipe_summary{
 		height:90px;
	}
	.recipe_date{
		font-size: 10px;
		height:10px;
		text-align: left;
	}
</style>
</head>
<body>

<div>
	<c:forEach var="recipe" items="${recipes}"> 
		<div >
			<img class="recipe_img" src="<c:url value='/getRecipePicture/${recipe.pk_recipe_id}' />" />
		</div>
		<div class="recipe" style=" height:175px; background-color: yellow;">
			<div class="recipe_name">食譜名稱: ${recipe.recipe_name}</div>
			<hr>
			<div class="recipe_summary">食譜簡介: ${recipe.recipe_summary}</div>
			<hr>
			<div class="recipe_date">分享時間: ${recipe.recipe_date}</div>
		</div>	
			<hr style="clear: both;border-style: dashed;">
	</c:forEach>
</div>
		
	
</body>
</html>