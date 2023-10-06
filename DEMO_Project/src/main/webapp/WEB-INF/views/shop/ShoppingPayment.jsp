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
</style>
<meta charset="UTF-8">
<title>주문결제</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/Header.jsp"/>

	<div id="mainContainer">
		<form action='./paymentCtr.do' method='POST' id='paymentForm'>
			<input type='hidden' name='productNo' value='${productNo}'>
			<input type='hidden' name='productQuantity' value='${productQuantity}'>
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
									<button type="button" id="chargeBtn">
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
						onclick="submitFnc();">
				</div>
			</div>
		</form>
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
		var productSumPriceNum = productSumPriceObj.replace(/[^0-9]/g, '');
		
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
	
	function submitFnc() {
		$('#paymentForm').submit();
	}
</script>
</html>