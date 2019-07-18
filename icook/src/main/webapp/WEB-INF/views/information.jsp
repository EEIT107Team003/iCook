<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
<title>Insert title here</title>
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

h1 {
	margin: 50px 20%;
}

.btnSeperate1 {
	float: left;
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
	window.history.forward(1);

	function reconfirmOrder() {
		if (confirm("確定送出此份訂單 ? ")) {
			// 接收此資料的Servlet會使用 finalDecision 參數的值
			document.forms[0].finalDecision.value = "ORDER";
			document.forms[0].action = "<c:url value='placeOrder' />";
			document.forms[0].method = "POST";
			document.forms[0].submit();
			return;
		} else {
			return;
		}
	}
	$('.popover-dismiss').popover({
		trigger : 'focus'
	});
	function editorId(obj) {
		window.location.href = '/icookProject/product?id=' + obj.id;
	}

	function deleteAll() {
		var msg = "確定要刪除所有嗎?";
		if (confirm(msg) == true) {
			window.location.href = '/icookProject/infomationDeleteAllToMarket';
		}
	}
	function test() {
			window.location.href = '/icookProject/';
		
	}
</script>

</head>

<body>
	<div class="progress">
		<div class="progress-bar progress-bar-striped bg-info"
			role="progressbar" style="width: 75%" aria-valuenow="75"
			aria-valuemin="0" aria-valuemax="100"></div>
	</div>


	<c:out value="登入者${LoginOK.nickname}"></c:out>
	<form action="<c:url value='/placeOrder'/>" method="POST">
		<div class="outer">
			<h1>本次訂購的產品</h1>
			<table id="tfhover" class="table table-striped table-hover">
				<tr>
					<th>產品號</th>
					<th>圖片</th>
					<th>數量</th>
					<th>單價</th>
					<th>小計</th>
					<!-- 					<th></th> -->
					<c:set var="contains" value="no" />
					<c:if test="${empty shoppingCart}">
						<c:set var="contains" value="yes" />
						<script type="text/javascript">
							
						</script>
					</c:if>

					<c:choose>
						<c:when test="${contains=='yes'}">
							<script type="text/javascript">
								
							</script>
							<td></td>
						</c:when>
						<c:otherwise>
							<script type="text/javascript">
								
							</script>
							<th><button type='button' class="btn btn-danger"
									id='${cart.value.productBean.product_id}' onclick='deleteAll()'>
									<i class="fas fa-trash"></i>刪除所有
								</button></th>
						</c:otherwise>
					</c:choose>
					<c:set var="contains" value="no" />

				</tr>
				<c:forEach var='cart' items='${shoppingCart}'>
					<tr>
						<td>${cart.value.productBean.product_id}</td>
						<td><img width='30' height='30'
							src="<c:url value='/getPicture/${cart.value.productBean.product_id}' />" /></td>
						<td>${cart.value.quantity}</td>
						<td>${cart.value.productBean.price}</td>
						<td>${cart.value.subtotal}</td>
						<!-- 						<td><button type='button' class="btn btn-primary" -->
						<%-- 								id='${cart.value.productBean.product_id}' --%>
						<!-- 								onclick='editorId(this)'> -->
						<!-- 								<i class="fas fa-edit"></i>確認修改(改下拉) -->
						<!-- 							</button></td> -->
						<td><button type='button' class="btn btn-danger"
								id='${cart.value.productBean.product_id}' onclick='deleId(this)'>
								<i class="fas fa-trash"></i>刪除
							</button></td>
					</tr>
					<c:set value="${sum + cart.value.subtotal}" var='sum' />
				</c:forEach>
				<tr>
					<th></th>
					<th></th>
					<th></th>
					<th></th>
					<th><h5>
							合計:
							<c:out value="${sum}" />
						</h5></th>
					<th></th>
					<th></th>
				</tr>
			</table>
			<h1>請輸入收件人資訊</h1>

			<!-- 			<select class="custom-select custom-select-lg mb-3"> -->
			<!-- 				<option selected>Open this select menu</option> -->
			<!-- 				<option value="1">One</option> -->
			<!-- 				<option value="2">Two</option> -->
			<!-- 				<option value="3">Three</option> -->
			<!-- 			</select> -->
			<div class="form-group col-md-6"></div>
			<br>

			<div class="form-row">

				<div class="form-group col-md-6">
					<label for="lastName">姓 </label> <input type="text"
						class="form-control" id='lastName' name="lastName" value=''
						placeholder="lastName" required="required">

				</div>
				<div class="form-group col-md-6">
					<label for="FirstName">名</label> <input type="text"
						class="form-control" id='FirstName' name="FirstName" value=''
						placeholder="FirstName" required="required">
				</div>

				<!-- 				email type會自動檢查email格式 -->
				<div class="form-group col-md-6">
					<label for="inputEmail4">Email</label> <input type="email"
						class="form-control" id='inputEmail4' name="inputEmail4" value=''
						placeholder="Email" required="required">
				</div>
				<div class="form-group col-md-6">
					<label for="tel">手機</label> <input type="tel" class="form-control"
						id='tel' name="tel" value='' placeholder="tel" required="required">
				</div>
				<div class="form-group col-md-6">
					<label for="tel">發票抬頭</label> <input type="text"
						class="form-control" id='invoiceTitle' name="invoiceTitle"
						value='' placeholder="(optional)">
				</div>
				<div>
					<hr>
				</div>
				<div class="form-group" id='info'>
					<label for="inputAddress">超商資訊</label>
					<!-- 					 <input type="text" -->
					<!-- 						disabled="disabled" class="form-control" name="shippingAddress"/> -->
					<%-- 						value='<c:out value="${address_string}"/>'> --%>
					<ul>
						<%-- 						<li>訂單編號:<c:out value="${s_processID}" /></li> --%>
						<li>取件門市類別:<c:out value="${s_stCate}" /></li>
						<li>取件門市代號:<c:out value="${s_stCode}" /></li>
						<li>取件門市名稱:<c:out value="${s_stName}" /></li>
						<li>取件門市地址:<c:out value="${s_stAddr}" /></li>
						<li>取件門市電話:<c:out value="${s_stTel}" /></li>
					</ul>
					<input type="hidden" name="shippingAddress"
						value="超商:${s_stCate}/超商代碼:${s_stCode}/門市名稱:${s_stName}/門市地址:${s_stAddr}/門市電話:${s_stTel}">
				</div>
			</div>


			<!-- 						class="form-control"> -->
			<!-- 						<option selected value=''>paypal</option> -->
			<!-- 						<option value='payment1'>payment1</option> -->
			<!-- 						<option value='payment2'>payment2</option> -->
			<!-- 						<option value='payment3'>payment2</option> -->
			<!-- 						<option value='payment4'>payment4</option> -->
			<!-- 					</select> -->
			<!-- 				</div> -->
			<!-- 			</div> -->



			<!-- 				<div class="form-group col-md-6"> -->
			<!-- 					<label for="payment">物流選擇</label> <select name="payment" -->
			<!-- 						class="form-control"> -->
			<!-- 						<option selected value=''>超商取貨</option> -->
			<!-- 						<option value='payment1'>shipping1</option> -->
			<!-- 						<option value='payment2'>payment2</option> -->
			<!-- 						<option value='payment3'>payment2</option> -->
			<!-- 						<option value='payment4'>payment4</option> -->
			<!-- 					</select> -->
			<!-- 				</div> -->
			<!-- 			</div> -->
			<!-- 			<div class="form-row"> -->

			<!-- 				<div class="form-group col-md-4"> -->
			<!-- 					<label for="inputState">縣市</label> <select name="inputState" -->
			<!-- 						class="form-control"> -->
			<!-- 						<option selected>Choose...</option> -->
			<!-- 						<option value='city1'>city1</option> -->
			<!-- 						<option value='city2'>city2</option> -->
			<!-- 						<option value='city3'>city3</option> -->
			<!-- 						<option value='city4'>city4</option> -->
			<!-- 					</select> -->
			<!-- 				</div> -->
			<!-- 				<div class="form-group col-md-2"> -->
			<!-- 					<label for="inputZip">郵遞區號</label> <input type="number" -->
			<!-- 						class="form-control" name="inputZip" value='' -->
			<!-- 						placeholder='ex:10577'> -->
			<!-- 				</div> -->
			<!-- 								<div class="form-group col-md-6"> -->
			<!-- 									<label for="inputCity">City</label> <input type="text" -->
			<!-- 										class="form-control" id="inputCity"> -->
			<!-- 								</div> -->
			<!-- 			</div> -->
			<!-- 			<div class="form-group"> -->
			<!-- 				<label for="inputAddress">寄送地址</label> <input type="text" -->
			<!-- 					class="form-control" name="shippingAddress" value='' -->
			<!-- 					placeholder="請輸入地址"> -->
			<!-- 			</div> -->
			<!-- 			<div class="form-group"> -->
			<!-- 				<label for="inputAddress">發票抬頭</label> <input type="text" -->
			<!-- 					class="form-control" name="invoiceTitle" value='' -->
			<!-- 					placeholder="請輸入發票抬頭"> -->
			<!-- 			</div> -->
			<!-- 			<div class="form-group"> -->
			<!-- 				<div class="form-check"> -->
			<!-- 					<input class="form-check-input button" type="checkbox" -->
			<!-- 						name="gridCheck"> <label class="form-check-label" -->
			<!-- 						for="gridCheck"> 記得我 </label> -->
			<!-- 				</div> -->
			<!-- 			</div> -->
			<div align="center">
				<input type="hidden" name="finalDecision" value="確定送出">
				<button type="button"
					onclick="{if(confirm('確定離開嗎?\r\n資料將不會記住喔'))location.href='/icookProject/cartPage'}"
					class="btn btn-info btn-lg btnSeperate1">回購物車</button>

				<!-- 				<input type="submit" value="去付款" -->
				<!-- 					class="btn btn-primary btn-lg btnSeperate2" /> -->

				<!-- 				<button type="button"  -->
				<!-- 					onclick="{location.href='/icookProject/OrdersPage'}" -->
				<!-- 					class="btn btn-primary btn-lg btnSeperate2">繼續結帳</button> -->

				<!-- 				 <input type="hidden" name="finalDecision"  value="">    -->
				<!-- 				<button type="button" -->
				<!-- 					onclick="{if(confirm('確定離開嗎?\r\n資料將不會記住喔'))location.href='/icookProject/cartPage'}" -->
				<!-- 					class="btn btn-primary btn-lg btnSeperate1">取消訂單</button> -->

				<c:choose>
					<c:when test="${!empty shoppingCart}">
						<!-- 如果 -->
						<input type="button" name="OrderBtn" value="確定送出"
							class="btn btn-info btn-lg btnSeperate2"
							onclick="reconfirmOrder()">
					</c:when>
										<c:when test="${empty shoppingCart}">
											<button type="button" id='check' disabled onclick='backToshop()'
												class="btn btn-warning btn-lg">您尚未選購</button>
										</c:when>
					<c:otherwise>
						<!-- 否则 -->
					</c:otherwise>
				</c:choose>
				<!-- 				<input type="button" name="OrderBtn" value="確定送出" -->
				<!-- 					class="btn btn-info btn-lg btnSeperate2" onclick="reconfirmOrder()"> -->

<!-- 					<input type="button" name="OrderBtn" value="test infromation" -->
<!-- 									class="btn btn-info btn-lg btnSeperate2"  onclick="test()"> -->
			</div>
		</div>
	</form>
</body>
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
<script type="text/javascript"
	src='${pageContext.request.contextPath}/css/fontawesome-free/js/all.min.js'></script>

</html>