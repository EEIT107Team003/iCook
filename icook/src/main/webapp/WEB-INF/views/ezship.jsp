<!DOCTYPE html>
<%@ page contentType="text/html;charset=utf-8"  language="java"
	import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


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
<html>
<head>
<title>電子地圖連接模擬</title>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel='stylesheet'
	href='${pageContext.request.contextPath}/css/fontawesome-free/css/all.min.css'
	type="text/css" />
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<style>
.outer {
	margin: 50px 20%;
}

.btnSeperate1 {
	
}

.btnSeperate2 {
	float: right;
}

#info {
	margin: auto;
	line-height: 200%
}
</style>
<script type="text/javascript">
	$('.popover-dismiss').popover({
		trigger : 'focus'
	});
</script>
</head>

<body>
	<p align="center">
		<b>電子地圖連接模擬</b>
	</p>
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
	<hr>
	<table width="70%" border="0" cellspacing="3" cellpadding="3"
		align=center>
		<tr>
			<td>
				<table width="100%" border="0" cellspacing="0" cellpadding="0"
					style="border-collapse: collapse">
					<tr>
						<td align="center">
							<!-- 用 URL 轉頁至電子地圖 //--> <a class="btn btn-info btn-lg"
							href="https://map.ezship.com.tw/ezship_map_web.jsp?suID=buyer@myweb.com.tw&processID=155922&stCate=<%=s_stCate%>&stCode=<%=s_stCode%>&rtURL=http://localhost:8080/icookProject/check">---請先選擇收貨門市---</a>
							<%--                 <a href="https://map.ezship.com.tw/ezship_map_web.jsp?suID=buyer@myweb.com.tw&processID=155922&stCate=<%=s_stCate%>&stCode=<%=s_stCode%>&rtURL=https://www.ezship.com.tw/emap/ezship_simulation_mappg_hy.jsp&webPara=simulationpage">選擇門市</a> --%>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	<hr>
		<div class="progress">
		<div class="progress-bar progress-bar-striped bg-info"
			role="progressbar" style="width: 50%" aria-valuenow="50"
			aria-valuemin="0" aria-valuemax="100"></div>
	</div>
	<form action="<c:url value='/toEZship'/>" method="POST">
		<div class="outer">
			<div class="form-group col-md-6">
			</div>
			<br>
<!-- 			<div class="form-row"> -->

<!-- 				<div class="form-group col-md-6"> -->
<!-- 					<label for="lastName">姓 </label> <input type="text" -->
<!-- 						class="form-control" id='lastName' disabled="disabled" -->
<!-- 						name="lastName" value='' placeholder="lastName"> -->

<!-- 				</div> -->
<!-- 				<div class="form-group col-md-6"> -->
<!-- 					<label for="FirstName">名</label> <input type="text" -->
<!-- 						class="form-control" id='FirstName' disabled="disabled" -->
<!-- 						name="FirstName" value='' placeholder="FirstName"> -->
<!-- 				</div> -->

<!-- 								email type會自動檢查email格式 -->
<!-- 				<div class="form-group col-md-6"> -->
<!-- 					<label for="inputEmail4">Email</label> <input type="text" -->
<!-- 						class="form-control" id='inputEmail4' disabled="disabled" -->
<!-- 						name="inputEmail4" value='' placeholder="Email"> -->
<!-- 				</div> -->
<!-- 				<div class="form-group col-md-6"> -->
<!-- 					<label for="tel">手機</label> <input type="tel" disabled="disabled" -->
<!-- 						class="form-control" id='tel' name="tel" value='' -->
<!-- 						placeholder="tel"> -->
<!-- 				</div> -->
<!-- 			</div> -->

			<div class="form-group" id='info'>
				<!-- 					<label for="inputAddress">取貨資訊</label> <input type="text" -->
				<!-- 						disabled="disabled" class="form-control" name="shippingAddress" -->
				<%-- 						value='<c:out value="${address_string}"/>'> --%>
<!-- 				<ul> -->
<%-- 					<li>訂單編號:<c:out value="${s_processID}" /></li> --%>
<%-- 					<li>取件門市類別:<c:out value="${s_stCate}" /></li> --%>
<%-- 					<li>取件門市代號:<c:out value="${s_stCode}" /></li> --%>
<%-- 					<li>取件門市名稱:<c:out value="${s_stName}" /></li> --%>
<%-- 					<li>取件門市地址:<c:out value="${s_stAddr}" /></li> --%>
<%-- 					<li>取件門市電話:<c:out value="${s_stTel}" /></li> --%>
<!-- 				</ul> -->
			</div>

			<div align="center">
				<input type="hidden" name="finalDecision" value="">
				<button type="button"
					onclick="{if(confirm('確定離開嗎?\r\n資料將不會記住喔'))location.href='/icookProject/cartPage'}"
					class="btn btn-outline-info btn-lg btnSeperate1">回購物車</button>

			</div>
		</div>
	</form>
</body>
</html>
