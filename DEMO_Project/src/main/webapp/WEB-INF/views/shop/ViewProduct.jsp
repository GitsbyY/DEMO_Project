<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/DEMO_Project/resources/css/main.css">
<style type="text/css">

table tr td{
	margin: 0px 50px;
}

#routeDiv{
	width: 200px;
	padding: 10px;
	font-size: 14px;
}

#routeA{
	text-decoration:none;
	color:black;
}

#bodyContainer{
	display: flex;
	flex-flow: row;
}

#imgContainer{
	margin: 50px 100px;
	text-align: center;
}

#productImgName {
	line-height: 150px;
	width: 300px;
	height: 300px;
}

#productImgContainer{
	width: 300px;
	height: 300px;
	border: 1px solid black;
}

#inputContainer{
	display:inline-block;
}

#type{
	float: right;
	font-size: 20px;
	font-weight: bold;
}
#typeTd{
	width: 250px;
}
select{
	height: 30px;
	width: 250px;
	font-size: 16px;
}
.inputName{
	height: 40px;
	width: 250px;
	font-size: 20px;
}
.btn{
	height: 30px;
	width: 80px;
	font-size: 20px;
	font-weight: bold;
}
#pointAccumulate{	
	border: 1px solid black;
	border-radius: 15px;
	font-size: 15px;
	text-align: center;
	width: 150px;
}
.midTd{
	width: 50px;
}
#price{
	color: red;
}
#inventory{
	font-weight: normal;
	font-size: 15px;
}
.inputTable{
	height: 50px;
}
#totalPrice{
	clear: right;
	float: right;
	margin-top: 100px;		 
}
.totalTd{
	width: 200px;
	text-align: right;
	font-size: 25px;
	font-weight: bold;
}
#totalPriceTd{
	color: red;
}
#controlDiv{
	clear: right;
	float: right;
}
#adminBtn{
	width: 50px;
	height: 30px;
	background-color: red;
	border: none;
	color: white;
}
#productDetailText{
	text-align:center;
	font-size: 32px;
}

#productDetailDivCtr{
	width: 700px;
	height: 50px;
	margin: 0px auto;
	border: 1px solid black;
	text-align: center;
}

#productDetailDiv{
	width: 700px;
	height: 700px;
	margin: 0px auto;
	border: 1px solid black;
}

#goReview{
	clear: right;
	text-align: center;
	font-size: 25px;
}
#reviewSpan{
	color: blue;
}
#sumContainer{
	width: 500px;
	height: 100px;
}
</style>
<script type="text/javascript" src="/DEMO_Project/resources/js/jquery-3.7.1.js">
</script>

<meta charset="UTF-8">
<title>상품추가</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/Header.jsp"/>
	
	<div id="mainContainer">		
		<form id="productForm" action="./updateCtr.do" method="post">
			<input type="hidden" id="productNo" name="productNo"
				value="${productDto.PRODUCT_NO}">
			<input type="hidden" name="productDetailNo"
				value="${productDto.PRODUCT_DETAIL_NO}">
			<div id='routeDiv'>
				<a id='routeA'>댕댕홈</a>
				<a id='routeA'> > </a>
				<a id='routeA'>쇼핑몰</a>
				<a id='routeA'> > </a>
				<a id='routeA' style='color:blue;'>물품등록</a>
			</div>
				
			<div id='bodyContainer'>
				<div id='imgContainer'>
					<div id='productImgContainer'>
						<img id="productImgName" alt="이미지를 첨부해주세요"
			        		src="<c:url value='/image/Product/${productDto.STORED_FILE_NAME}'/>">
					</div>
					<br/>
					<input type="file" name="file" id="fileInput" style="display:none"
						onchange="fileSelected()">
					<label for="fileInput" class="updateClass" style="background-color: white;
						border:2px solid black;">
						이미지 첨부
					</label>
					
				</div>
				
				<div id='inputContainer'>
					<table id="type">
						<tr class="inputTable">
							<td id="typeTd">상품 유형</td>
							<td>
								<select id="productCategory" class="updateClass"
									name="productCategory" disabled>
									<option value="0">상품 유형을 선택해주세요</option>
									<option value="10"
										<c:if test="${productDto.PRODUCT_CATEGORY eq 10}">
											selected
										</c:if>
										>사료</option>
									<option value="20"
										<c:if test="${productDto.PRODUCT_CATEGORY eq 20}">
											selected
										</c:if>
										>간식</option>
									<option value="30"
										<c:if test="${productDto.PRODUCT_CATEGORY eq 30}">
											selected
										</c:if>
										>영양제</option>
									<option value="40"
										<c:if test="${productDto.PRODUCT_CATEGORY eq 40}">
											selected
										</c:if>
										>미용/목욕용품</option>
									<option value="50"
										<c:if test="${productDto.PRODUCT_CATEGORY eq 50}">
											selected
										</c:if>
										>장난감</option>
									<option value="60"
										<c:if test="${productDto.PRODUCT_CATEGORY eq 60}">
											selected
										</c:if>
										>기타</option>
								</select>
							</td>
						</tr>
						<tr class="inputTable">
							<td >
								${productDto.PRODUCT_NAME}
							</td>
							<td>
								<input class="inputName updateClass" name="productName" id="productName"
									type="text" placeholder="상품명을 입력해주세요" style="display:none;"
									value="${productDto.PRODUCT_NAME}">
							</td>			
						</tr>
						<tr>
							<td>
								<div id="price">
									${productDto.PRODUCT_PRICE}
								</div>
								<div id="pointAccumulate">
									1234
								</div>
							</td>
							<td>
								<input class="inputName updateClass" name="productPrice" id="productPrice"
									type="text" placeholder="가격을 입력해주세요" style="display:none;"
									value="${productDto.PRODUCT_PRICE}">
							</td>				
						</tr>
						<tr class="inputTable">
							<td>
								${productDto.PRODUCT_STOCK}
							</td>
							<td>
								<input class="inputName updateClass" name="productStock" id="productStock"
									type="text" placeholder="수량을 입력해주세요" style="display:none;"
									value="${productDto.PRODUCT_STOCK}">
							</td>				
						</tr>				
					</table>
					<input id="imgName" name="pImgName" type="hidden" value="사진이름들어갈곳">
					<div id="sumContainer">
						<div class="memberDiv">
						</div>
					</div>
					<div id="controlDiv">
						<input id="adminBtn" class="adminClass viewClass" type="button" value="뒤로가기">
						<input id="adminBtn" class="adminClass viewClass" type="button" value="수정"
							onclick="updateProductFnc();">
						<input id="adminBtn" class="adminClass updateClass" 
							style="display:none;" type="button" value="취소">
						<input id="adminBtn" class="adminClass updateClass"
							style="display:none;" type="button" value="등록"	onclick="submitForm();">
					</div>
				</div>
			</div>
			<div id="goReview">
				<span>해당상품 후기 </span>
				<span id="reviewSpan">보러가기</span>
			</div>
			<div id="productDetailText">상품 상세 설명</div>
			<div id="productDetailDivCtr" class="adminClass updateClass">
				<button id="registBtn" type="button"
					onclick="registDetailFnc();">수정</button>
			</div>
			<input type="hidden" name="productDetailContent" id="productDetailInput">
			<div id="productDetailDiv" contenteditable="false">
				${productDto.PRODUCT_DETAIL_CONTENT}
			</div>
		</form>
	</div>
	
	
	<jsp:include page="/WEB-INF/views/Footer.jsp"/>
</body>

<script>
	function updateProductFnc(){
		var updateClassArray = Array.from(document.querySelectorAll(".updateClass"));

		for (var element of updateClassArray) {
		    element.style.display = "inline-block";
		}
		document.getElementById("mySelect").removeAttribute("disabled");
	}
	
	var namePattern = /^.{1,30}$/;
	var pricePattern = /^[0-9]{1,8}$/;
	var stockPattern = /^[0-9]{1,5}$/;
	var detailPattern = /^.{1,3000}$/;
	
	function fileSelected() {
		var imgSrc = document.getElementById('productImgName').getAttribute('src');
		var productNo = document.getElementById('productNo').value;
		var parts = imgSrc.split('/');
		var storedFileName = parts[parts.length - 1];
		var fileInputObj = document.getElementById("fileInput");
		var file = fileInput.files[0];
        var formData = new FormData();
        formData.append('file', file);
        formData.append('storedFileName', storedFileName);
        formData.append('productNo', productNo)
		$.ajax({
			url : "/DEMO_Project/shop/imgUpdate.do",
			method : "POST",
			data : formData,
			processData: false,
            contentType: false,
			
			success: function(fileList) {
				// 요청이 성공하면 결과를 화면에 표시
				alert('이미지 업로드 성공');
				console.log(fileList);
				var file = fileList[0].stored_file_name;
		        var productImgContainer = document.getElementById("productImgContainer");

		        productImgContainer.innerHTML =
			        '<img id="productImgName" alt="이미지를 첨부해주세요" ' +
			        'src=\'<c:url value="/image/Product/' + file + '"/>\'>';
			   
// 			    var imgNameInput = document.getElementById("imgName");
// 			    imgNameInput.value = file;
			},
			error: function() {
				alert('이미지 업로드 실패');
             }
		});
	}
	
	function registDetailFnc(){
		var registBtnObj = document.getElementById("registBtn");
		var productDetailDivObj = document.getElementById("productDetailDiv");
		
		if(productDetailDivObj.contentEditable == "true"){
			productDetailDivObj.contentEditable = "false";
			registBtnObj.innerHTML = "수정"
		}else {
			productDetailDivObj.contentEditable = "true"
			registBtnObj.innerHTML = "등록"
		}
	}
	
	function submitForm() {
	    // <div>의 내용을 가져와서 숨겨진 필드에 설정합니다
	    var divContentObj = document.getElementById("productDetailDiv").innerHTML.trim();
	    document.getElementById("productDetailInput").value = divContentObj;
	    // 상품카테고리
	    var productCategoryObj = document.getElementById("productCategory");
	    // 상품이름
	    var productNameObj = document.getElementById("productName");
	    // 상품가격
	    var productPriceObj = document.getElementById("productPrice");
	    // 상품재고
	    var productStockObj = document.getElementById("productStock");
	    // 상품이미지
	    var imgSrcObj = document.getElementById('productImgName').getAttribute('src');
	    // 상품 상세 설명 버튼
	    var registBtnObj = document.getElementById("registBtn");
	    
	    var parts = imgSrcObj.split('/');
		var storedFileName = parts[parts.length - 1];
	    var imgNameInput = document.getElementById("imgName");
	    imgNameInput.value = storedFileName;
	    
	    if(productCategoryObj.value == "0"){
	    	alert('상품 유형을 선택해주세요.');
	    	return ;
	    }
	    if(productNameObj.value.trim().length == 0){
	    	alert('상품 이름을 입력해주세요.');
	    	return ;
	    }
	    if(!namePattern.test(productNameObj.value)){
	    	alert('상품 이름은 30자 까지만 가능합니다.');
	    	return ;
	    }
	    
	    if(productPriceObj.value.length == 0){
	    	alert('상품 가격을 입력해주세요.');
	    	return ;
	    }
	    if(!pricePattern.test(productPrice.value)){
	    	alert('1억 미만의 숫자만 가능합니다.');
	    	return ;
	    }
	    if(productStockObj.value.length == 0){
	    	alert('상품 재고를 입력해주세요.');
	    	return ;
	    }
	    if(!stockPattern.test(productStockObj.value)){
	    	alert('재고는 10만개 미만 가능합니다.');
	    	return ;
	    }
	    if(imgSrcObj === ""){
	    	alert('이미지를 등록해주세요.');
	    	return ;
	    }
	    
	    if(registBtnObj.innerHTML == "등록"){
	    	alert('상품 상세 설명을 등록해주세요.');
	    	return ;
	    }
	    if(!detailPattern.test(divContentObj)){
	    	alert('상품 상세 설명은 3000자까지만 가능합니다.');
	    	return ;
	    }
	    
	    // 폼 제출
	    document.getElementById("productForm").submit();
	}
</script>
</html>