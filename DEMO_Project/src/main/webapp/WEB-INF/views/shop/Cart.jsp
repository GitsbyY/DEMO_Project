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
.checkBoxDiv input{
	width:20px;
	height:20px;
}


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
	font-size: 24px;
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
	text-align:left;
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
.productImg{
	width: 160px;
	height: 160px;
}
#deleteDiv{
	height:200px;
	padding:20px;
}
#deleteBtn{
	float:right;
	padding: 3px;
}

#orderSumPriceDiv{
	font-size: 24px;
	font-weight: bold;
	height:100px;
	border: 3px solid black;
	padding: 20px;
	padding-left: 900px;
}

#checkedSumPriceSpan{
	color:red;
}
#shopCtrContainer{
	height:300px;
	padding: 50px;
	padding-left:350px;
}
.shopCtrDiv{
	display:inline-block;
	width: 200px;
	height: 50px;
	margin: 50px;
	padding:20px;
	border: 1px solid black;
	text-align: center;
	vertical-align: middle;
	font-size: 24px;
	line-height: 5vh;
	cursor: pointer;
}
#emptyCartDiv{
	width:100%;
	height:160px;
	text-align:center;
	padding-top: 100px;
}
.empty{
	width: 130px;
	height: 100px;
	display:inline-block;
}
.quantityClass{
	width: 20px;
	height: 20px;
	background-color: #FFFFFF;
	border: 1px solid black;
}
</style>
<meta charset="UTF-8">
<title>장바구니</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/Header.jsp" />

	<div id="mainContainer">
		<form action="/DEMO_Project/paymentCart.do" method="post" id="cartForm">
			<input type="hidden" id="formData" name="formData" value="">
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
							<div class="columnDiv checkBoxDiv">
								<input id="allCheckbox" type="checkbox" name="product"
									onclick="allCheckboxFnc();">
								전체 선택
							</div>
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
								<div class="cartListDiv checkBoxDiv" >
						            <input type="checkbox" name="product" value="${cart.PRODUCT_NO}">
								</div>
							</td>
							<td>
								<div class="cartListDiv imgDiv">
									<img alt="image not found" class="productImg" 
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
									<button class='quantityClass' type="button"
										onclick="plusQuantityFnc(${loop.index});">+</button>
									<button class='quantityClass' type="button"
										onclick="minusQuantityFnc(${loop.index});">-</button>
								</div>
							</td>
						</tr>
						
					</c:forEach>
						<tr class="emptyCartClass">
							<td colspan="6">
								<div id="emptyCartDiv">
									장바구니에 담긴 상품이 없습니다
								</div>
							</td>
						</tr><tr class="emptyCartClass">
							<td colspan="6">
								<div id="emptyCartDiv">
									각 상품을 선택하시고 구매하기 버튼을 눌러보세요<br>
									선택한 상품을 모두 장바구니에 담을수 있습니다
								</div>
							</td>
						</tr>
				</table>
			</div>
	
			<div id="deleteDiv" class="notEmptyCartClass">
				<button id="deleteBtn" class='memberBtnClass' type="button" onclick="deleteFnc();">
					선택 삭제
				</button>
			</div>
			<div id="orderSumPriceDiv" class="notEmptyCartClass">
				총 주문금액
				<span id="checkedSumPriceSpan">0원</span>
				<input type="hidden" id="sumPrice" name="sumPrice" value="">
			</div>
			<div id="shopCtrContainer">
				<div class="emptyCartClass empty">
				</div>
				<div class="shopCtrDiv"
					onclick="location.href='./shop.do'">
					쇼핑계속하기
				</div>
				<div class="shopCtrDiv notEmptyCartClass"
					onclick="paymentFnc();">
					구매하기
				</div>
			</div>
		</form>
	</div>
	
	


	<jsp:include page="/WEB-INF/views/Footer.jsp" />
</body>
<script type="text/javascript">
	
	const checkboxForm = document.getElementById('cartForm');

	checkboxForm.addEventListener('change', updateSumPrice);
	
	function allCheckboxFnc() {
	    const checkboxObj = document.getElementById('allCheckbox');
	    
	    // 모든 제품 체크박스에 대한 jQuery 객체
	    const productCheckboxes = $('input[name="product"]');
	    
	    if (checkboxObj.checked) {
	        // 전체 체크박스가 체크되었을 때, 모든 제품 체크박스를 선택
	        productCheckboxes.prop('checked', true);
	    } else {
	        // 전체 체크박스가 해제되었을 때, 모든 제품 체크박스를 해제
	        productCheckboxes.prop('checked', false);
	    }
	}
	
	function updateSumPrice() {
        // checkboxForm 내의 모든 체크박스 요소를 가져옴
        let sumPrice = 0;
        let countingBox = 0;
            $('input[name="product"]:checked').each(function () {
                const index = $(this).closest('tr').index() - 1; // 헤더 행을 제외하기 위해 -1
                if(index != -1){
	                const productPrice = parseInt($('#priceId' + index).val());
	                const productQuantity = parseInt($('#quantityId' + index).text());
	                sumPrice += productPrice * productQuantity;
	                countingBox += 1;
                }
            });

            // 계산된 총 주문금액을 span에 넣기

            $('#checkedSumPriceSpan').text(
            		new Intl.NumberFormat().format(sumPrice) + "원");
            
            $('#countingSpan').text(countingBox);
            
    }
	
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
		updateSumPrice();
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
			updateSumPrice();
		}
	}
	
	function deleteFnc() {
		var checkboxes = document.querySelectorAll('input[name="product"]:not(#allCheckbox)');

        // 체크된 체크박스의 개수를 셉니다.
        var checkedCount = 0;
        checkboxes.forEach(function(checkbox) {
            if (checkbox.checked) {
                checkedCount++;
            }
        });

		if(checkedCount == 0){
			alert('선택한 상품이 없습니다.');
			return ;
		}
		if(confirm("선택한 상품을 장바구니에서 제외하시겠습니까?")){
			var checkedProductNos = $('input[name="product"]:checked:not(#allCheckbox)').map(function () {
		        return this.value;
		    }).get();
			console.log(checkedProductNos);
		    // 배열을 JSON 문자열로 변환
		    var jsonString = JSON.stringify({ productNos: checkedProductNos });
			
		    location.href="/DEMO_Project/cart/delete.do?formData=" + jsonString;
		}
	}
	
	function paymentFnc() {
	    var checkedProductNos = $('input[name="product"]:checked:not(#allCheckbox)').map(function () {
	        return this.value;
	    }).get();
	    var checkboxes = document.querySelectorAll('input[name="product"]:not(#allCheckbox)');

        // 체크된 체크박스의 개수를 셉니다.
        var checkedCount = 0;
        checkboxes.forEach(function(checkbox) {
            if (checkbox.checked) {
                checkedCount++;
            }
        });

		if(checkedCount == 0){
			alert('선택한 상품이 없습니다.');
			return ;
		}
		
		console.log(checkedProductNos);
	    // 배열을 JSON 문자열로 변환
	    var jsonString = JSON.stringify({ productNos: checkedProductNos });

	    // 숨은 필드에 JSON 데이터 설정
	    document.getElementById("formData").value = jsonString;
	    console.log(document.getElementById("formData").value);
	    
	    var sumPrice =
	    	document.getElementById("checkedSumPriceSpan").innerText.replace(/[^0-9]/g, '');
	    document.getElementById("sumPrice").value = sumPrice;
	    // 폼 제출
	    document.getElementById('cartForm').submit();
	}
	
	document.addEventListener('DOMContentLoaded', function () {
	       var table = document.getElementById('productTable');
	
	       //장바구니에 담긴 것이 없을때
	       if (table.rows.length === 3) {
	           console.log('Table has only three row.');
	   		var notEmptyCartClassArray = Array.from(document.querySelectorAll(".notEmptyCartClass"));
	
	   		for (var element of notEmptyCartClassArray) {
	   		    element.style.display = "none";
	   		}
	       } else {
	       	var emptyCartClassArray = Array.from(document.querySelectorAll(".emptyCartClass"));
	
	   		for (var element of emptyCartClassArray) {
	   		    element.style.display = "none";
	   		}
	       }
	   });
	
</script>
</html>