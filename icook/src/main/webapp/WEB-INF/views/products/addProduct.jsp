
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<!-- 	========================================================== -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" >
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" ></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" ></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>


<style type="text/css">
* {
	padding: 0;
	margin: 0;
}
header{
 margin:auto;
 background-color: #FFC8B4;
}
footer{
 margin:auto;
 background-color: #AAFFEE;
}
body {
	background-color: #CCFF99;
}

fieldset {
/*     padding-left: 5cm; */
	border: 1px solid rgb(255, 232, 57);
	width: 600px;
	margin: auto;
	
}
.left{
float: left;

}
.content{
   overflow: auto;  
   width: 100%;  
   margin-left: 0ch   
}
.formGroup{
  margin-left:20ch;   
  margin-bottom:1ch;
  
}
.des{
   margin-left:22ch;   
}


</style>
<title>Products</title>
<link rel='stylesheet'
	href='${pageContext.request.contextPath}/css/styles.css'
	type="text/css" />
</head>
<body>

	<script>
		$(document).ready(function() {
			
			function catchSelect1(){
				var txt = $("#exampleFormControlSelect1 :selected").text();
				if(txt=='請選擇'){
					var clean=null
					$("#exampleFormControlSelect2").html(clean);
				}
			}	

			$("#exampleFormControlSelect1").change(function() {
				catchSelect1();	 
				var txt = $("#exampleFormControlSelect1 :selected").text();
//	 			console.log('Txt 123: '+txt)
				$("#remark").val(txt);
				$.ajax({                                    
					url : "${pageContext.request.contextPath}/categories/" + txt,
					type : "GET",
					dataType : "json",
					async : true,
					contentType : "application/json",
					success : function(data) {
//	                  console.log('remark :'+$("#remark").val() );
						var names = JSON.parse(JSON.stringify(data).split(","));
			 			console.log(typeof names);
						var txt = "<option value='-1' SELECTED>請選擇</option>";
						for (i in names) {
							console.log(i + ' :' + names[i].name);
							txt += "<option value='"+i+"'>" + names[i].name + "</option>";
						}
						$("#exampleFormControlSelect2").html(txt);
					},
					error : function(data, textStatus, errorThrown) {
						console.log(data);
					},
				});
			})
			
				
		$("#exampleFormControlSelect2").change(function() {
				var txt2= $("#exampleFormControlSelect2 :selected").text();
				console.log('txt2:'+txt2)
				$.ajax({
                    success : function(data) {	
                    console.log(typeof txt2+' ，exampleFormControlSelect1Txt(change) :' + txt2)
                    $("#fileName").val(txt2);
                    console.log('fileName :'+$("#fileName").val() );
					},
					error : function(data, textStatus, errorThrown) {
						console.log(data);
					},
				});
			})
			
		});

		//============================================================================================================
		
				$.ajax({
			url : "${pageContext.request.contextPath}/category",
			type : "POST",
			dataType : "json",
			contentType : "application/json",
			async : true,
			success : function(data) {
				
				var names = JSON.parse(JSON.stringify(data).split(","));
				var txt = "";
	            for (i in names) {
					txt += "<option value='"+i+"'>" + names[i].name + "</option>";
				}
				$("#exampleFormControlSelect1").append(txt);
			},
			error : function(data, textStatus, errorThrown) {
				console.log(data);
			},
		});

				
		$.fn.serializeObject = function() {
			var o = {};
			var a = this.serializeArray();
			$.each(a, function() {
				if (o[this.name]) {
					if (!o[this.name].push) {
						o[this.name] = [ o[this.name] ];
					}
					o[this.name].push(this.value || '');
				} else {
					o[this.name] = this.value || '';
				}
			});
			return JSON.stringify(o);
		};
	</script>
 

	<header>
	<h1>HEADER</h1>
	</header>
	<div class="content">
	<section>

       
		<div class="container">
			<h2 style="text-align: center">
				上架產品資料
			</h2>
			<a href='${pageContext.request.contextPath}/products'>查詢所有產品資料</a>
		</div>	
	</section>
	<hr
		style="height: 1px; border: none; color: #333; background-color: #333;">
	<section >
		<!--       三個地方要完全一樣 -->
		<form:form method='POST' modelAttribute="productBeanObject"
			 enctype="multipart/form-data" >
			<!-- 		                  	enctype="multipart/form-data"一定要加這個屬性才可以使用上傳檔案這個功能 -->
			
			<fieldset class='form-horizontal'>
              <div class="formGroup">
				<form:input id="product_id"  name="product_id" path="product_id"
					type='hidden' />
					  <input type="text" readonly class="form-control-plaintext" 
					  id="staticEmail" value="編號 :${productBeanObject.product_id}">
                </div>
              <div class="formGroup">
					<label for='name'>名稱描述 : </label>
					<form:input id="name" path="name" type='text' />
				</div>

				<div class="formGroup">
					<label for="exampleFormControlSelect1">種類 :</label> <select
						class="form-control" id="exampleFormControlSelect1"
						style="width: 15ch"><option value="0" SELECTED>請選擇</option></select>

					<label for="exampleFormControlSelect2"></label> <select multiple
						class="form-control" id="exampleFormControlSelect2"
						style="width: 30ch"></select> <input id="fileName" name="fileName"
						type="hidden" /> <input id="remark" name="remark" type="hidden" />
				</div>

				<div class="formGroup">
					<label for='unit_size'>單位 : </label>
					<form:input id="unit_size" path="unit_size" type='text' />
				</div>
				<div class="formGroup">
					<label for="price">價格 :  </label>
					<form:input id="price" path="price" type='text' />
				</div>
				<div class="formGroup">
					<label for="color">顏色 : </label>
					<form:input id="color" path="color" type='text' />
				</div>

				<div class="formGroup">
					<label for="stock">庫存 : </label>
					<form:input id="stock" path="stock" type='text' />
				</div>

				<div class="formGroup">
					<label for="productImage">圖片 : </label>
					<form:input id="productImage" path="productImage" type='file'/>
				</div>

					<div class="formGroup">
						<label for="m1"><input type="radio" name="gender" value="1" >   上架   </label>
						<label> <input type="radio" name="gender" value="2">    下架         </label>
					</div>
					
					<div class="formGroup">
						<label for="description">商品描述 :</label>
						<textarea id="" class="form-control" name="description" rows="6"></textarea>
					</div>
				<div class="formGroup">
					<input id="btnAdd" type='submit' class='btn btn-primary'
						value="Submit" />
				</div>
				
			</fieldset>
		</form:form>
	</section>
	</div>
	
	<script>
	//使用ckediror需要加入            replace對應到textarea的id 
	CKEDITOR
			.replace(
					'description',
					{
						extraPlugins : 'easyimage',
						cloudServices_tokenUrl : 'https://40733.cke-cs.com/token/dev/Pno0Ld5ha3oNhABb0mnQBXWdL6FXy03CbisbDkPL9hJoOrvd8p0hpHlka5RA',
						cloudServices_uploadUrl : 'https://40733.cke-cs.com/easyimage/upload/'
					});
</script>
	
	<footer>
		<h1>FOOTER</h1>
	</footer>
</body>
</html>
