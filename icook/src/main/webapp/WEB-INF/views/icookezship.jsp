<%@ page contentType="text/html;charset=utf-8" language="java"
	import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<!DOCTYPE html>

<%
	// === 接收電子地圖回傳值 ===
	String s_processID = request.getParameter("processID") == null ? "" : request.getParameter("processID");
	String s_stCate = request.getParameter("stCate") == null ? "" : request.getParameter("stCate");
	String s_stCode = request.getParameter("stCode") == null ? "" : request.getParameter("stCode");
	String s_stName = request.getParameter("stName") == null ? "" : request.getParameter("stName");
	String s_stAddr = request.getParameter("stAddr") == null ? "" : request.getParameter("stAddr");
	String s_stTel = request.getParameter("stTel") == null ? "" : request.getParameter("stTel");
	String s_webPara = request.getParameter("webPara") == null ? "" : request.getParameter("webPara");

	// 	s_stName = new String(s_stName.getBytes("ISO8859_1"), "UTF-8");
	// 	s_stAddr = new String(s_stAddr.getBytes("ISO8859_1"), "UTF-8");
%>
<html lang="en">
<head>
<title>購物車</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="X-UA-Compatible" content="ie=edge">

<!-- 	bootstrap -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
<!-- 	bootstrap -->
<!-- fontawesome-free -->
<script type="text/javascript"
	src='${pageContext.request.contextPath}/css/fontawesome-free/js/all.min.js'></script>
<!-- fontawesome-free -->
<link rel="icon" href="images/favicon.ico">
<link rel="shortcut icon" href="images/favicon.ico" />
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/zerogrid.css" type="text/css"
	media="screen">
<link rel="stylesheet" href="css/responsive.css" type="text/css"
	media="screen">
<link rel="stylesheet" href="css/prettyPhoto.css">
<script src="js/jquery.js"></script>
<script src="js/jquery-migrate-1.1.1.js"></script>
<script src="js/superfish.js"></script>
<script src="js/jquery.easing.1.3.js"></script>
<script src="js/sForm.js"></script>
<script src="js/jquery.prettyPhoto.js"></script>
<script src="js/css3-mediaqueries.js"></script>
<!-- 彈跳視窗 -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"
	integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"
	integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k"
	crossorigin="anonymous"></script>
<!-- 彈跳視窗 -->
<!--[if lt IE 8]>
       <div style=' clear: both; text-align:center; position: relative;'>
         <a href="http://windows.microsoft.com/en-US/internet-explorer/products/ie/home?ocid=ie6_countdown_bannercode">
           <img src="http://storage.ie6countdown.com/assets/100/images/banners/warning_bar_0000_us.jpg" border="0" height="42" width="820" alt="You are using an outdated browser. For a faster, safer browsing experience, upgrade for free today." />
         </a>
      </div>
    <![endif]-->
<!--[if lt IE 9]>
      <script src="js/html5shiv.js"></script>
      <link rel="stylesheet" media="screen" href="css/ie.css">
    <![endif]-->
</head>
<style>
#buttons {
	margin-left: 30%;
	margin-right: 30%;
}
</style>
<body>
	<div class="main">
		<!--==============================header=================================-->
		<header>
			<div class="zerogrid">
				<div class="col-full">
					<div class="wrap-col">
						<h1>
							<a  style="height:200px" href="${pageContext.request.contextPath}/index2"><img src="${pageContext.request.contextPath}/images/logo.png" style="width: 200px ;right: 200px ;border-radius: 50%;" alt="EXTERIOR"></a>
						</h1>

						<div class="menu_block">
							<nav>
								<ul class="sf-menu"  style="padding-top:55px">
									<li><a href="index2">ICook</a></li>
									<li><a href="icookAboutUS">關於我們</a>
										<ul>
											<li><a href="icookContact">聯繫我們</a></li>
										</ul></li>
									<li>
										<a href="recipe/recipeIndex">查看食譜</a>
										<!--<ul>-->
											<!--<li><a href="#">cat1</a></li>-->
											<!--<li><a href="#">cat2</a></li>-->
											<!--<li><a href="#">cat3</a></li>-->
										<!--</ul>-->
									</li>
									<li><a href="icookLife">生活誌</a></li>
									<li><a href="forum/overview">討論區</a></li>
									<li><a href="A_articlemainpage">文章區</a>
										<ul>
											<li><a href="A_article">test</a></li>

										</ul></li>


									<li><a href="products">市集</a>
										<ul>


											<li><a href="cartPage">購物車</a></li>
										</ul></li>

									<li><a href="user">會員專區 </a>
										<ul>
											<c:if test="${pageContext.request.userPrincipal.name==null}">
												<li><a href="icookLogin">會員登入</a></li>
												<li><a href="icookRegister">會員註冊</a></li>
											</c:if>
											<c:if test="${pageContext.request.userPrincipal.name!=null}">
												<li><a href="index2" data-toggle="modal"
													data-target="#logout">會員登出</a></li>
											</c:if>
											<li><a href="checkOrders">查看訂單</a></li>
											<li><a href="icookAddRecipe">新增食譜</a></li>
											<li><a href="backStage">後台</a></li>
										</ul>
									</li>
								</ul>
							</nav>
							<div class="clear"></div>
						</div>
						<div class="clear"></div>
					</div>
				</div>
			</div>
		</header>


		<!--=======content================================-->

		<div class="content">
			<div class="progress">
				<div class="progress-bar progress-bar-striped bg-success"
					role="progressbar" style="width: 50%" aria-valuenow="50"
					aria-valuemin="0" aria-valuemax="100"></div>
			</div>
			<%
				if (!s_processID.equals("")) {
					out.println("<hr>");
					out.println("<<電子地圖回傳資料>><br>");
					out.println("processID = " + s_processID + "<br>");
					out.println("stCate = " + s_stCate + "<br>");
					out.println("stCode = " + s_stCode + "<br>");
					out.println("stName = " + s_stName + "<br>");
					out.println("stAddr = " + s_stAddr + "<br>");
					out.println("stTel = " + s_stTel + "<br>");
					out.println("webPara = " + s_webPara + "<br>");
				}
			%>

		</div>
		<form action="<c:url value='/toEZship'/>" method="POST">
			<div class="outer">
				<div class="form-group col-md-6"></div>
				<div class="form-group" id='info'></div>
				<table width="100%" border="0" cellspacing="0" cellpadding="0"
					style="border-collapse: collapse">
					<tr>
						<!-- 						<td align="center"> -->
						<!-- 																			<a class="btn btn-info btn-lg" <a -->
						<!-- 							align="center" class="btn btn-outline-info btn-lg" -->
						<%-- 							href="https://map.ezship.com.tw/ezship_map_web.jsp?suID=buyer@myweb.com.tw&processID=155922&stCate=<%=s_stCate%>&stCode=<%=s_stCode%>&rtURL=http://localhost:8080/icook/check">---請先選擇收貨門市---</a> --%>
						<%-- 																			                <a href="https://map.ezship.com.tw/ezship_map_web.jsp?suID=buyer@myweb.com.tw&processID=155922&stCate=<%=s_stCate%>&stCode=<%=s_stCode%>&rtURL=https://www.ezship.com.tw/emap/ezship_simulation_mappg_hy.jsp&webPara=simulationpage">選擇門市</a> --%>
						<!-- 						</td> -->
					</tr>
				</table>
				<%-- 				<c:out value="登入者${LoginOK.nickname}"></c:out> --%>
				<div id='buttons'>
					<div style='float: left'>
						<input type="hidden" name="finalDecision" value="">
						<button type="button"
							onclick="{if(confirm('確定離開嗎?\r\n資料將不會記住喔'))location.href='/icook/icookCartPage'}"
							class="btn btn-outline-success btn-lg btnSeperate1">回購物車</button>
						<br>
					</div>
					<div style='float: right'>
						<input type="hidden" name="finalDecision" value="">

						<!-- 						<a -->
						<!-- 							align="center" class="btn btn-outline-info btn-lg" -->
						<%-- 							href="https://map.ezship.com.tw/ezship_map_web.jsp?suID=buyer@myweb.com.tw&processID=155922&stCate=<%=s_stCate%>&stCode=<%=s_stCode%>&rtURL=http://localhost:8080/icook/check">---請先選擇收貨門市---</a> --%>
						<button type="button"
							onclick="{location.href='https://map.ezship.com.tw/ezship_map_web.jsp?suID=buyer@myweb.com.tw&processID=155922&stCate=<%=s_stCate%>&stCode=<%=s_stCode%>&rtURL=http://localhost:8080/icook/check'}"
							class="btn btn-outline-success btn-lg btnSeperate1">選擇門市</button>
					</div>
				</div>
			</div>
		</form>
		<!--==============================footer=================================-->

		<footer>
			<div class="zerogrid">
				<div class="col-full">
					<div class="wrap-col">
						<!-- 						&copy; Copyright &copy; 2013.Company name All rights reserved.<a -->
						<!-- 							target="_blank" href="http://sc.chinaz.com/moban/">&#x7F51;&#x9875;&#x6A21;&#x677F;</a> -->
					</div>
				</div>
			</div>
		</footer>
		<div style="display: none">
			<script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540'
				language='JavaScript' charset='gb2312'></script>
		</div>
	</div>
</body>

</html>