<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style type="text/css">
#title{	
	width: 100%;
	height: 700px;
}
#maintitle{
	height: 50px;
	margin-top: 30px;	
	border: 2px solid black;
	border-top: thick;
	border-left:thick;
	border-right:thick;
	font-size: 25px;
	font-weight: bold;
}
#secondTitle, #thirdTitle{
	font-size: 20px;
	font-weight: bold;
	margin-top: 30px;
	margin-bottom: 10px;
}
table, tr, td{
	border: 1px solid gray;
	border-collapse: collapse;	
	border-left:thick;
	border-right:thick;	
}
td{
	height: 35px;
}
#memberInfo{
	width: 100%;
}
#payInfo{
	width: 100%;
	font-weight: bold;
}
table tr td:first-child {
    width: 20%;
	font-weight: bold;
	text-align: right;
	padding-right: 20px;
	background-color: #D9D9D9;	
}
.redText{
	color:red;
}
#pointInput{
	width: 70px;
	height: 25px;
	font-size: 16px;
}
#cancellation{
	margin-top: 60px;
	width: 160px;
	height: 50px;
	border: none;
	font-size: 20px;
	margin-left: 30%;
	float: left;
	cursor: pointer;
}
#payment{
	margin-top: 60px;
	width: 160px;
	height: 50px;
	border: none;
	font-size: 20px;
	margin-right: 30%;
	float: right;
	cursor: pointer;
}
.secondTd{
	padding-left: 20px;
}
#inputMsg{
	height: 25px;
	width: 300px;
	font-size:16px;
}
#chargeBtn{
	width: 70px;
	height: 25px;
	background-color: #DDDDDD;
	font-size: 16px;
	border: 1px solid black;
}
/* 모달 css 시작 */
.modal {
	display: none;
	position: fixed;
	z-index: 1;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgba(0, 0, 0, 0.4);
}

/* 모달 내용 스타일 */
.modal-content {
	background-color: #fefefe;
	margin: 5% auto;
	padding: 50px 20px 20px 20px;
	border: 1px solid #888;
	width: 500px;
	height: 500px;
	position: relative;
	font-size: 28px;
}
.modalTitle{
	width: 100%;
	height: 50px;
	text-align: center;
	font-weight: bold;
}
.modalDiv{
	margin: 20px auto;
	width: 100%;
	height: 50px;
	text-align: center;
	font-weight: bold;
}
.modalBtnDiv{
	position: absolute;
	padding-left: 100px;
	top: 400px;
}
.modalBtn{
	padding: 5px;
	background-color: #DDDDDD;
	border: none;
	font-size: 28px;
	margin: auto 10px;
}
/* 모달 닫기 버튼 스타일 */
.close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
	position: absolute;
	top: -1px;
    right: 10px;
}

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}
</style>
<meta charset="UTF-8">
<title>주문결제</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/Header.jsp"/>

	<div id="mainContainer">
		<form action='./paymentCtr.do' method='POST' id='paymentForm'>
			<input type='hidden' id='productNo' name='productNo' value='${productNo}'>
			<input type='hidden' id='stock' name='productQuantity' value='${productQuantity}'>
			<input type='hidden' id='memberEmoney' value='${sessionScope.member.memberEmoney}'>
			<input type='hidden' id='memberNo' value='${sessionScope.member.memberNo}'>
			<input type='hidden' id='paymentPrice' name='paymentPrice' value=''>
			<div id="title">
				<div>	
					<p id="maintitle">주문/결제</p>	
				</div>
				<div>	
					<p id="secondTitle">구매자 정보</p>	
				</div>
				<div>
					<table id="memberInfo">
						<tr>
							<td>
								<div>
									이름
								</div>
							</td>
							<td>
								<div class="secondTd">
									${sessionScope.member.memberName}
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div>
									배송주소
								</div>
							</td>
							<td>
								<div class="secondTd">
									${sessionScope.member.memberAddress}
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div>
									연락처
								</div>
							</td>
							<td>
								<div class="secondTd">
									${sessionScope.member.memberPhone}
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div>
									배송 요청사항
								</div>
							</td>
							<td>
								<div class="secondTd">
									<input id='inputMsg' type="text" name="orderRequest">
								</div>
							</td>
						</tr>
					</table>
				</div>
				<div>	
					<p id="thirdTitle">결제정보</p>	
				</div>
				<div>
					<table id="payInfo">
						<tr>
							<td>
								<div>
									총상품 가격
								</div>
							</td>
							<td>
								<div>
									<span id="productSumPrice" class="secondTd">
										<fmt:formatNumber value="${sumPrice}" type="number" />
									</span>
									원
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div>
									포인트
								</div>
							</td>
							<td>
								<div class="secondTd">
									<input id="pointInput" type="text">
									<span class="redText">P</span>
								</div>
							</td>
							<td>
								<div>
									잔액:
									<span id="memberPoint">
										<fmt:formatNumber value="${sessionScope.member.memberPoint}" type="number" />
									</span>
									P
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div>
									결제방법
								</div>
							</td>
							<td>
								<div class="secondTd">
									E-money
								</div>
							</td>
							<td>
								<div>
									잔액:
									<span id="memberEmoney">
										<fmt:formatNumber value="${sessionScope.member.memberEmoney}" type="number" />
									</span>
									원
									<button type="button" id="chargeBtn"
										onclick="chargePaymentFnc();">
										충전하기
									</button>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div>
									총 결제금액
								</div>
							</td>
							<td>
								<div class="redText secondTd">
									<span id="paymentSumPrice">
										<fmt:formatNumber value="${sumPrice}" type="number" />
									</span>
									원
								</div>
							</td>
							<td>
								<div>
									포인트 적립 예정
									<span id="earnPoint">
										<fmt:formatNumber value="${sumPrice*0.05}" type="number" />
									</span>
									P
								</div>
							</td>
						</tr>
					</table>
				</div>
				<div>
					<input id="cancellation" type="button" value="취소"
						onclick="cancelFnc(${productNo});">
					<input id="payment" type="button" value="결제"
						onclick="paymentFnc();">
				</div>
			</div>
		</form>
	</div>

	<!-- 이머니부족 모달 -->
	<div id="chargeModal" class="modal">
	    <!-- 모달 내용 -->
	    <div class="modal-content">
	    	<div class='modalTitle'>
	    		결제 실패
	    	</div>
	    	<div class='modalDiv'>
	    		E-money가 부족합니다
	    	</div>
	    	<div class='modalBtnDiv'>
	    		<button type='button' class='modalBtn'
	    			onclick="closeModal()">취소</button>
	    		<button type='button' class='modalBtn'
	    			onclick='chargePaymentFnc();'>충전하러 가기</button>
	    	</div>
	        <span class="close" onclick="closeModal()">&times;</span>
	    </div>
	
	</div>
	
	<!-- 재고부족 모달 -->
	<div id="stockModal" class="modal">
	    <!-- 모달 내용 -->
	    <div class="modal-content">
	    	<div class='modalTitle'>
	    		결제 실패
	    	</div>
	    	<div class='modalDiv'>
	    		남은 재고가 부족합니다
	    	</div>
	    	<div class='modalBtnDiv'>
	    		<button type='button' class='modalBtn'
	    			style='margin-left: 55px;'
	    			onclick='goProductFnc();'>수량 변경하기</button>
	    	</div>
	        <span class="close" onclick="closeModal()">&times;</span>
	    </div>
	
	</div>

	<jsp:include page="/WEB-INF/views/Footer.jsp"/>
</body>
<script>
	var pointInputObj = document.getElementById('pointInput');
	pointInputObj.addEventListener('change', pointInputFnc);
	
	var numberPattern = /^[0-9]+$/;
	
	function pointInputFnc() {
		var memberPointObj = document.getElementById('memberPoint').innerText;
		var memberPointNum = parseInt(memberPointObj.replace(/[^0-9]/g, ''));
		
		var productSumPriceObj = document.getElementById('productSumPrice').innerText;
		var productSumPriceNum = parseInt(productSumPriceObj.replace(/[^0-9]/g, ''));
		
		
		if(!numberPattern.test(pointInputObj.value)){
	    	alert('숫자만 입력가능합니다.');
	    	pointInputObj.value = 0;
	    }
		if(pointInputObj.value > memberPointNum){
	    	alert('보유한 포인트 이하로 입력해주세요.');
	    	pointInputObj.value = 0;
	    }
		if(productSumPriceNum < pointInputObj.value){
			pointInputObj.value = productSumPriceNum;
	    }
		$('#paymentSumPrice').text(
        		new Intl.NumberFormat().format(productSumPriceNum - pointInputObj.value));
		$('#earnPoint').text(
        		new Intl.NumberFormat().format((productSumPriceNum - pointInputObj.value)*0.05));
	}
	
	function cancelFnc(productNo){
		location.href='/DEMO_Project/shop/viewProduct.do?no=' + productNo;
	}
	
	//모달 열기
	function paymentFnc(){
		var paymentSumPrice
			= parseInt($('#paymentSumPrice').text().replace(/[^0-9]/g, ''));
		if($('#memberEmoney').val() < paymentSumPrice){
			document.getElementById('chargeModal').style.display = 'block';
			return ;
		}
		checkStockFnc();
	}
	function chargePaymentFnc(){
		location.href='/DEMO_Project/mypage/MypageProfilePaymentMemberDetail.do?memberNo=' + $('#memberNo').val();
	}
	//수량변경하러가기
    function goProductFnc() {
    	location.href='/DEMO_Project/shop/viewProduct.do?no=' + $('#productNo').val();
    }
    // 모달 닫기
    function closeModal() {
        document.getElementById('chargeModal').style.display = 'none';
        document.getElementById('stockModal').style.display = 'none';
    	
    }
    
    function checkStockFnc() {
    	
		$.ajax({
			url : "/DEMO_Project/checkStock.do",
			method : "POST",
			data : { stock: $('#stock').val(),
					productNo: $('#productNo').val()},
			
			success: function(result) {
				// 요청이 성공하면 결과를 화면에 표시
				if(result){
					submitFnc();
				}else {
					document.getElementById('stockModal').style.display = 'block';
				}
				
			},
			error: function() {
				alert('결제 오류');
             }
		});
	}
	function submitFnc() {
		var paymentSumPrice
			= parseInt($('#paymentSumPrice').text().replace(/[^0-9]/g, ''));
		$('#paymentPrice').val(paymentSumPrice);
		$('#paymentForm').submit();
	}
</script>
</html>