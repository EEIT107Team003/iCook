<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>購物車</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<!-- 	JQuery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 	JQuery -->
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

<script type="text/javascript">
	// 	let countIngredients = 1;//食譜食材
	// 	let countUnit = 1;//食譜步驟

	// 	function alertTest(){
	// 	alert("hello world");
	// }

	
// 	$(document).ready(function(){
		
// 		for(let i=0;i<IngradientFirstRow;i++){
			
			
// 		}
// 	})
	
	
	
	
	let count = 2;
	function addCurrentRow1() {

		//新增一列
		// 		countIngredients++;
		let trcomp = "";
		// 		trcomp +="<button>請按</button>";
		trcomp += "<div id='addDiv";
		trcomp +=count;
		trcomp +="' class='form-row '>";
		trcomp += "<div class='form-group col-md-6'>";
		trcomp += count;
		trcomp += "<label for='inputCity'>食材名稱</label>";
		trcomp += "<input type='text' class='form-control' id='inputCity'>";
		trcomp += "</div>";
		trcomp += "<div class='form-group col-md-4'>";
		trcomp += "份量 <input type='text' class='form-control' id='inputEmail4' placeholder='''> <label for='inputState'></label>";
		trcomp += "</div>";
		trcomp += "<button style='margin-left: 20px; margin-top: 17px; width: 70px; height: 40px; font-size: 20px' type='submit' class='btn btn-danger' onclick='deleteRow(this)'>刪除</button>";
		// 		trcomp +="<button style='margin-left: 20px; margin-top: 17px; width: 70px; height: 40px; font-size: 20px' type='submit' class='btn btn-primary'>新增步驟</button>";
		trcomp += "</div>";
		$("#IngradientFirstRow").append(trcomp);
		count++;
	}

	function deleteRow(obj) {
		let divId = obj.parentNode.id;
// 		let ParentOfRemoveElement=obj.parentNode.parentNode;
		let el = document.getElementById(divId);
		el.parentNode.removeChild( el );
// 		ParentOfRemoveElement.remove(divId);
	}

	// 	function deleteCurrentRow2(obj) {
	// 		//刪除一列
	// 		if (1 == countUnit) {
	// 			//資料筆數不可為0
	// 			return;
	// 		}
	// 		let isDelete = confirm("確定要刪除嗎？");
	// 		if (isDelete) {
	// 			countUnit = countUnit - 1;
	// 			let tr = obj.parentNode.parentNode;
	// 			let tbody = tr.parentNode;
	// 			tbody.removeChild(tr);
	// 		}
	// 	}

	//      翔宇原版
	// 		let trcomp = "<tr align='center'>";
	// 		trcomp += "<td><input type='text' name='ingredients2' /></td>";
	// 		trcomp += "<td><input type='text' name='quantity2'></input></td>";
	// 		trcomp += "<td>";
	// 		trcomp += "<button type='button' onclick='deleteCurrentRow1(this)'>";
	// 		trcomp += "<font color='red'>刪除</font>";
	// 		trcomp += "</button>";
	// 		trcomp += "</td>";
	// 		trcomp += "</tr>";
	// 		$("#recipe_ingredients tbody tr:last-child").after(trcomp);
	//jQuery 裡面 $("#aa") 指的是 id="aa" 的元素
</script>
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
<style>
.form {
	/*  	margin:20%; */
	margin-left: 20%;
	margin-right: 20%;
	margin-top: 100px;
}
</style>
</head>
<body>
	<div class="main">
		<!--==============================header=================================-->
		<header>
			<div class="zerogrid">
				<div class="col-full">
					<div class="wrap-col">
						<h1>
							<a href="index2"><img src="images/logo.png" height='200px'
								width='80%' alt="EXTERIOR"></a>
						</h1>

						<div class="menu_block">
							<nav>
								<ul class="sf-menu">
									<li><a href="index2">ICook</a></li>
									<li><a href="icookAboutUS">關於我們</a>
										<ul>
											<li><a href="icookContact">聯繫我們</a></li>
										</ul></li>
									<li><a href=icookCRecipe>查看食譜</a>
										<ul>

											<li><a href="#">cat1</a></li>
											<li><a href="#">cat2</a></li>
											<li><a href="#">cat3</a></li>
										</ul>
									<li><a href="icookLife">生活誌</a></li>
									<li><a href="icookVideo">討論區</a></li>
									<li><a href="icookProducts">市集</a>
										<ul>
											<li><a href="cartPage">購物車</a></li>
										</ul></li>

									<li class="with_ul current"><a href="icookLogin">會員專區</a>
										<ul>
											<li><a href="icookLogin">會員登入</a></li>
											<li><a href="checkOrders">查看訂單</a></li>
											<li><a href="#">會員登出</a></li>
											<li><a href="#">新增食譜</a></li>
										</ul></li>
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
			<div class='form'>
				<form>
					<div class="form-row">
						<div class="form-group col-md-6">
							<label for="inputEmail4">食譜名稱</label> <input type="text"
								class="form-control" id="inputEmail4" placeholder="ex:蔥爆牛肉">
						</div>
					</div>
					<div class="form-row">
						<div class="form-group col-md-6">
							<label for="inputEmail4">食譜封面照片</label> <input type="text"
								class="form-control" id="inputEmail4" placeholder="">
						</div>

						<form>
							<div class="form-group">
								<!-- 								<label for="exampleFormControlFile1">Example file input</label> -->
								<input style="margin-top: 19px" type="file"
									class="form-control-file" id="exampleFormControlFile1">
							</div>
						</form>

					</div>
					<div class="form-row">
						<div class="form-group col-md-6">
							<label for="inputEmail4">烹飪時間</label> <input type="text"
								class="form-control" id="inputEmail4" placeholder="(單位:小時)">
						</div>
					</div>
					<div class="form-row">
						<div class="form-group col-md-6">
							<label for="inputEmail4">食譜份量</label> <input type="text"
								class="form-control" id="inputEmail4" placeholder="(單位:克)">
						</div>
					</div>
					<div class="form-row">
						<div class="form-group col-md-6">
							<label for="inputEmail4">食譜簡介</label> <input type="text"
								class="form-control" id="inputEmail4" placeholder="">
						</div>
					</div>

					<!-- 					新增的區域 -->
					<!-- 					新增的區域 -->
					<!-- 					新增的區域 -->
					<!-- 					新增的區域 -->
					<!-- 					新增的區域 -->
					<div class="form-row IngradientFirstRow" id='IngradientFirstRow'>
						<div class="form-group col-md-6">
							<label for="inputCity">食材名稱</label> <input type="text"
								class="form-control" id="inputCity">
						</div>
						<div class="form-group col-md-4">
							份量 <input type="text" class="form-control" id="inputEmail4"
								placeholder=""> <label for="inputState"></label>
						</div>
						<!-- 						<button onclick="addCurrentRow1()">請按</button> -->
						<button
							style="margin-left: 20px; margin-top: 17px; width: 70px; height: 40px; font-size: 20px"
							class="btn btn-danger">刪除</button>
						<button onclick='addCurrentRow1()'
							style="margin-left: 20px; margin-top: 17px; width: 70px; height: 40px; font-size: 20px"
							type="submit" class="btn btn-primary">新增步驟</button>
					</div>
					<!-- 					新增的區域 -->
					<!-- 					新增的區域 -->
					<!-- 					新增的區域 -->
					<!-- 					新增的區域 -->
					<!-- 					新增的區域 -->
					<div class="form-row">
						<div class="form-group col-md-6">
							<label for="inputCity">食材名稱</label> <input type="text"
								class="form-control" id="inputCity">
						</div>
						<div class="form-group col-md-4">
							<label for="inputState">份量</label> <select id="inputState"
								class="form-control">
								<option selected>Choose...</option>
								<option>...</option>
							</select>
						</div>
						<button
							style="margin-left: 20px; margin-top: 17px; width: 70px; height: 40px; font-size: 20px"
							type="submit" class="btn btn-danger">刪除</button>
						<!-- 						<span style="visibility:hidden; background-color:Blue">隐藏区域</span> -->
						<button
							style="margin-left: 20px; margin-top: 17px; width: 70px; height: 40px; font-size: 20px"
							type="submit" class="btn btn-primary">新增步驟</button>
					</div>
					<div class="form-row">
						<div class="form-group col-md-6">
							<label for="inputCity">步驟說明</label> <input type="text"
								class="form-control" id="inputCity">
						</div>
						<!-- 						<div class="form-group col-md-4" style="visibility: hidden"> -->
						<div class="form-group col-md-4" style="display: none">
							<label for="inputState">步驟圖片</label> <select id="inputState"
								class="form-control">
								<option selected>Choose...</option>
								<option>...</option>
							</select>
							<form>
								<div class="form-group">
									<!-- 								<label for="exampleFormControlFile1">Example file input</label> -->
									<input style="margin-top: 19px" type="file"
										class="form-control-file" id="exampleFormControlFile1">
								</div>
							</form>

						</div>
						<div class="form-group col-md-4">
							<form>
								<div class="form-group">
									<!-- 								<label for="exampleFormControlFile1">Example file input</label> -->
									<input style="margin-top: 25px" type="file"
										class="form-control-file" id="exampleFormControlFile1">
								</div>
							</form>
						</div>
						<button
							style="margin-left: 20px; margin-top: 17px; width: 70px; height: 40px; font-size: 20px"
							type="submit" class="btn btn-danger">刪除</button>
						<!-- 						<span style="visibility:hidden; background-color:Blue">隐藏区域</span> -->
						<button
							style="margin-left: 20px; margin-top: 17px; width: 70px; height: 40px; font-size: 20px"
							type="submit" class="btn btn-primary">新增步驟</button>
					</div>
					<div style="visibility: hidden">區塊中的內容</div>
					<div style="visibility: hidden">區塊中的內容</div>
					<div style="visibility: hidden">區塊中的內容</div>
					<div align="center">
						<button align='center' type="submit" class="btn btn-primary">確認新增</button>
					</div>
				</form>
			</div>

		</div>
		<!--==============================footer=================================-->

		<footer>
			<div class="zerogrid">
				<div class="col-full">
					<div class="wrap-col">
						&copy; Copyright &copy; 2013.Company name All rights reserved.<a
							target="_blank" href="http://sc.chinaz.com/moban/">&#x7F51;&#x9875;&#x6A21;&#x677F;</a>
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