<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">

#title{
	margin-left: 16%;
	margin-right: 16%;
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
#memberInfo{
	width: 100%;
}
.detail{
	width: 20%;
	font-weight: bold;
	text-align: right;
	background-color: #D3D3D3;	
}
.midTd{
	width: 2%;
	background-color: #D3D3D3;
}
.nextTd{
	width: 2%;
}
#cancellation{
	margin-top: 30px;
	width: 160px;
	height: 50px;
	border: none;
	font-size: 20px;
	margin-left: 30%;
	float: left;
}
#payment{
	margin-top: 30px;
	width: 160px;
	height: 50px;
	border: none;
	font-size: 20px;
	margin-right: 30%;
	float: right;
}
#price, #method, #balance, #balance2{
	font-weight: bold;
}
#balance{
	color: red;
}
#pointInput{
	width: 70px;
}
#point{
	font-weight: bold;
	color: red;
}
.nextTd2{
	width: 10%;	
}
.lastTd{
	font-weight: bold;
}
</style>
<meta charset="UTF-8">
<title>주문결제</title>
<!-- <link rel="stylesheet" type="text/css" href="css/mystyles.css"> -->
<!-- <script src="js/myscript.js"></script> -->
</head>
<body>
	<jsp:include page="/WEB-INF/views/Header.jsp"/>
	
	<div id="title">
		<div>	
			<p id="maintitle">주문완료</p>	
		</div>
		<div>	
			<p id="secondTitle">받는사람 정보</p>	
		</div>
		<div>
			<table id="memberInfo">
			<tr>
				<td class="detail">이름</td>
				<td class="midTd"></td>
				<td class="nextTd"></td>
				<td>회원 이름</td>
			</tr>
			<tr>
				<td class="detail">배송주소</td>
				<td class="midTd"></td>
				<td class="nextTd"></td>
				<td>회원 주소</td>
			</tr>
			<tr>
				<td class="detail">연락처</td>
				<td class="midTd"></td>
				<td class="nextTd"></td>
				<td>회원 연락처</td>
			</tr>
			<tr>
				<td class="detail">배송 요청사항</td>
				<td class="midTd"></td>
				<td class="nextTd"></td>
				<td>문 앞에 두시고 문자 주세요</td>
			</tr>
			</table>
		</div>
		<div>	
			<p id="thirdTitle">결제정보</p>	
		</div>
		<div>
			<table id="memberInfo">
			<tr>
				<td class="detail">총상품 가격</td>
				<td class="midTd"></td>
				<td class="nextTd"></td>
				<td id="price">33,500원</td>
			</tr>
			<tr>
				<td class="detail">포인트</td>
				<td class="midTd"></td>
				<td class="nextTd"></td>
				<td id="point" class="nextTd2">
					10,000P
				</td>
				<td class="lastTd">잔액:5,000P</td>
			</tr>
			<tr>
				<td class="detail">결제방법</td>
				<td class="midTd"></td>
				<td class="nextTd"></td>
				<td id="method" class="nextTd2">E-money</td>
				<td class="lastTd">잔액:76,500원</td>
			</tr>
			<tr>
				<td class="detail">총 결제금액</td>
				<td class="midTd"></td>
				<td class="nextTd"></td>
				<td id="balance" class="nextTd2">23,500원</td>
				<td class="lastTd">포인트 적립 예정 1,175p</td>
			</tr>
			<tr>
				<td class="detail">결제 후 잔액</td>
				<td class="midTd"></td>
				<td class="nextTd"></td>
				<td id="balance2">76,500원</td>
			</tr>
			</table>
		</div>
		<div>
			<input id="cancellation" type="button" value="내 장바구니">
			<input id="payment" type="button" value="쇼핑계속하기">
		</div>
			
	</div>
	
	
	
	<jsp:include page="/WEB-INF/views/Footer.jsp"/>
</body>
</html>