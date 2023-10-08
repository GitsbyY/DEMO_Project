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
.secondTd{
	padding-left: 20px;
}
#completeDiv{
	width:100%;
	padding:30px;
	text-align: center;
	font-size: 24px;
	border-bottom: 1px solid #333333;
}
#productDiv{
	width:100%;
	height:200px;
	padding:20px;
	border: 1px solid #999999;
}
#productInfoDiv{
	height:150px;
	font-size:20px;
}
#productImg{
	width:150px;
	height:150px;
	float:left;
	margin: auto 50px;
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
</style>
<meta charset="UTF-8">
<title>주문결제</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/Header.jsp"/>

	<div id="mainContainer">
		<div id="title">
			<div>	
				<p id="maintitle">주문 완료</p>	
			</div>
			<div id='completeDiv'>
				주문이 완료되었습니다. 감사합니다!
			</div>
			<div>
				<p id="secondTitle">주문 상품 정보</p>
			</div>
			<div id='productDiv'>
				<img id="productImg" alt="이미지가 없습니다."
		        		src="<c:url value='/image/Product/${productDto.STORED_FILE_NAME}'/>">
        		<div id='productInfoDiv'>
        			${productDto.PRODUCT_NAME}<br>
        			<br>
        			<fmt:formatNumber value="${productDto.PRODUCT_PRICE}" type="number" />원<br>
        			수량: <fmt:formatNumber value="${orderDto.productQuantity}" type="number" />개<br>
        		</div>
        		<c:if test="${productCount > 0}">
        			<div style='font-size:20px; margin-left: 50px;'>
        				외 ${productCount}개
        			</div>
        		</c:if>
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
								${orderDto.orderRequest}
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
									<fmt:formatNumber value="${productDto.PRODUCT_PRICE * orderDto.productQuantity}" type="number" />
								</span>
								원
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
									<fmt:formatNumber value="${paymentPrice}" type="number" />
								</span>
								원
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div>
								남은 이머니
							</div>
						</td>
						<td>
							<div class="secondTd">
									<fmt:formatNumber value="${sessionScope.member.memberEmoney}" type="number" />
								원
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div>
								남은 포인트
							</div>
						</td>
						<td>
							<div class="secondTd">
								<fmt:formatNumber value="${sessionScope.member.memberPoint}" type="number" />
								P
							</div>
						</td>
					</tr>
				</table>
			</div>
			<div id="shopCtrContainer">
				<div class="emptyCartClass empty">
				</div>
				<div class="shopCtrDiv"
					onclick="location.href='./shop.do'">
					주문내역
				</div>
				<div class="shopCtrDiv notEmptyCartClass"
					onclick="location.href='./shop.do'">
					쇼핑계속하기
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/Footer.jsp"/>
</body>
<script>
</script>
</html>