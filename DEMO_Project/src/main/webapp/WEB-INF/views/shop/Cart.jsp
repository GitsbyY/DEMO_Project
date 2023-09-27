<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="/DEMO_Project/resources/css/main.css">
<style type="text/css">
#mainImg {
	height: 30px;
	width: 30px;
	vertical-align: bottom;
}

#basket {
	height: 50px;
	margin-top: 30px;
}

#maintitle {
	font-size: 25px;
	font-weight: bold;
}

#countingDiv {
	border-top: 1px solid black;
	border-bottom: 1px solid black;
	text-align: center;
	padding: 20px;
}

table {
	width: 100%;
	border-collapse: collapse;
}

table tr td {
	padding: 20px;
	border-bottom: 1px solid black;
	border-collapse: collapse;
}

#columnTr {
	border-bottom: 1px solid black;
	height: 50px;
}

#productListDiv {
	display: flex;
	flex-direction: column; /* 수직 방향으로 정렬하려면 column으로 설정 */
    align-items: center;
}

table tr td div {
	flex-direction: row;
	text-align: center;
}

.columnDiv {
	height: 20px;
}

.cartListDiv{
	height: 100px;
	padding-top: 60px;
}
.cartListDiv.imgDiv{
	height: 170px;
	padding: 30px;
}
.cartListdiv img{
	width: 150px;
	height: 150px;
}
.checkBoxDiv{
	width: 100px;
}

.imgDiv {
	width: 250px;
}

.productDiv {
	width: 400px;
	text-align: left;
}

.productSumPriceDiv {
	width: 200px;
}

.productQuantityDiv {
	width: 100px;
}
.productQuantityCtrDiv{
	width: 70px;
	text-align:left;
}
</style>
<meta charset="UTF-8">
<title>장바구니</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/Header.jsp" />

	<div id="mainContainer">
		<div id="basket" style="width: 100%;">
			<img id="mainImg" alt="장바구니"
				src="./resources/img/imgHeader/basket.jpg">
			<span id="maintitle">장바구니</span>
		</div>
		<div id="countingDiv">
			구매(<span id="countingSpan">0</span>)
		</div>
		<div id="productListDiv">
			<table id="productTable">
				<tr id="columnTr">
					<td>
						<div class="columnDiv checkBoxDiv">전체 선택</div>
					</td>
					<td>
						<div class="columnDiv imgDiv"></div>
					</td>
					<td>
						<div class="columnDiv productDiv">상품 정보</div>
					</td>
					<td>
						<div class="columnDiv productSumpriceDiv">총 상품금액</div>
					</td>
					<td>
						<div class="columnDiv productQuantityDiv">상품 수량</div>
					</td>
					<td>
						<div class="columnDiv productQuantityCtrDiv"></div>
					</td>
				</tr>
				<c:forEach var="cart" items="${cartList}" varStatus="loop">
					<tr>
						<td>
							<input type="hidden" id="memberNoId${loop.index}" value="${cart.MEMBER_NO}">
							<input type="hidden" id="productNoId${loop.index}" value="${cart.PRODUCT_NO}">
							<div class="cartListDiv checkBoxDiv">
								체크박스
							</div>
						</td>
						<td>
							<div class="cartListDiv imgDiv">
								<img alt="image not found" id="productImg" 
									src="<c:url value='/image/Product/${cart.STORED_FILE_NAME}'/>">
							</div>
						</td>
						<td>
							<div class="cartListDiv productDiv" >
								${cart.PRODUCT_NAME}, 상세페이지 참조<br/>
								<fmt:formatNumber value="${cart.PRODUCT_PRICE}" type="number" />원
							</div>
						</td>
						<td>
							<input type="hidden" value="${cart.PRODUCT_PRICE}" id="priceId${loop.index}">
							<div class="cartListDiv productSumpriceDiv" id="sumPriceId${loop.index}">
								<fmt:formatNumber value="${cart.PRODUCT_PRICE * cart.PRODUCT_QUANTITY}" type="number" />
							</div>
						</td>
						<td>
							<div class="cartListDiv productQuantityDiv" id="quantityId${loop.index}">
								${cart.PRODUCT_QUANTITY}
							</div>
						</td>
						<td>
							<div class="cartListDiv productQuantityCtrDiv">
								<button type="button" onclick="plusQuantityFnc(${loop.index});">+</button>
								<button type="button" onclick="minusQuantityFnc(${loop.index});">-</button>
							</div>
						</td>
					</tr>
					
				</c:forEach>
							
			</table>
		</div>

		<div id="deleteDiv"></div>
		<div id="orderSumPriceDiv"></div>
	</div>


	<jsp:include page="/WEB-INF/views/Footer.jsp" />
</body>
<script type="text/javascript">
	function plusQuantityFnc(num) {
		
		var priceDiv = document.getElementById('priceId' + num);
		var sumPriceDiv = document.getElementById('sumPriceId' + num);
		var quantityDiv = document.getElementById('quantityId' + num);
		console.log(priceDiv.innerText);
		
		var priceStr = priceDiv.value;
		var quantityStr = quantityDiv.innerText;
		
		var quantityNum = parseInt(quantityStr) + 1;
		var sumPriceNum = parseInt(priceStr) * quantityNum;
		
		updateProductQuantity(num, quantityNum);
		
		sumPriceDiv.innerHTML = new Intl.NumberFormat().format(sumPriceNum) + "원";
		quantityDiv.innerHTML = quantityNum;
	}
	
	function updateProductQuantity(num, quantityNum) {
		var memberNo = document.getElementById('memberNoId' + num).value;
		var productNo = document.getElementById('productNoId' + num).value;
		console.log("num: " + num);
		console.log("quantityNum: " + quantityNum);
		console.log("memberNo: " + memberNo);
		console.log("productNo: " + productNo);
		$.ajax({
			url : "/DEMO_Project/cart/updateCartQuantity.do",
			method : "POST",
			data : {memberNo: memberNo,
					productNo: productNo,
					quantity: quantityNum},
			
			success: function() {
				// 요청이 성공하면 결과를 화면에 표시
				alert('수량 변경 성공');
			},
			error: function() {
				alert('수량 변경 실패');
             }
		});
	}
	
	function minusQuantityFnc(num) {
		var priceDiv = document.getElementById('priceId' + num);
		var sumPriceDiv = document.getElementById('sumPriceId' + num);
		var quantityDiv = document.getElementById('quantityId' + num);
		console.log(priceDiv.innerText);

		var priceStr = priceDiv.value;
		var quantityStr = quantityDiv.innerText;
			
		var quantityNum = parseInt(quantityStr) - 1;
		var sumPriceNum = parseInt(priceStr) * quantityNum;

		if(quantityNum > 0){
			
			updateProductQuantity(num, quantityNum);
			
			sumPriceDiv.innerHTML = new Intl.NumberFormat().format(sumPriceNum) + "원";
			quantityDiv.innerHTML = quantityNum;
		}
	}
	
</script>
</html>