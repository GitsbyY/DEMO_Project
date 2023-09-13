<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">

#totalDiv{
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

#route{
	width: 200px;
}
#firstroute, #thirdroute, #lastroute{
	width: 60px;
	font-size: 14px;
	text-align: center;	
}
#secondroute, #fourthroute{
	width: 10px;
	font-size: 14px;
	text-align: center;	
}
#type{
	float: right;
	
	font-size: 20px;
	font-weight: bold;
}
#typeTd{
	width: 220px;
}
select{
	height: 30px;
	width: 400px;
	font-size: 16px;
}
.inputname{
	height: 40px;
	width: 300px;
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
#adminBtn{
	margin-top: 100px;
	clear: right;
	float: right;
}
.adminBtn{
	width: 50px;
	height: 30px;
	background-color: red;
	border: none;
	color: white;
}
#goReview{
	clear: right;
	text-align: center;
	font-size: 25px;
}
#reviewSpan{
	color: blue;
}
</style>
<meta charset="UTF-8">
<title>상품추가</title>
<!-- <link rel="stylesheet" type="text/css" href="css/mystyles.css"> -->
<!-- <script src="js/myscript.js"></script> -->
</head>
<body>
	<jsp:include page="/WEB-INF/views/Header.jsp"/>
	
	<div id="totalDiv">		
		<div>
			<table id="route">
			<tr>
				<td id="firstroute">댕댕홈</td>
				<td id="secondroute">></td>
				<td id="thirdroute">쇼핑몰</td>
				<td id="fourthroute">></td>
				<td id="lastroute">물품등록</td>
			</tr>			
			</table>
		</div>
		
		<div>
			<table id="type">
				<tr class="inputTable">
					<td id="typeTd">상품 유형</td>
					<td class="midTd"></td>
					<td>
						<select>
							<option>상품 유형을 선택해주세요
							<option>사료
							<option>간식
							<option>영양제
							<option>미용/목욕용품
							<option>장난감
							<option>기타
						</select>
					</td>
				</tr>
				<tr class="inputTable">
					<td>
						상품명을 등록해주세요
					</td>
					<td class="midTd"></td>
					<td>
						<input class="inputname" type="text" placeholder="상품명을 입력해주세요">
						<input class="btn" type="button" value="확인">
					</td>				
				</tr>
				<tr>
					<td id="price">
						0원
					</td>
					<td class="midTd"></td>
					<td rowspan="2">
						<input class="inputname" type="text" placeholder="가격을 입력해주세요">
						<input class="btn" type="button" value="확인">
					</td>				
				</tr>
				<tr>
					<td id="pointAccumulate">
						최대 0P 적립
					</td>
					<td class="midTd"></td>
				</tr>
				<tr class="inputTable">
					<td id="inventory">
						상품재고: 0개
					</td>
					<td class="midTd"></td>
					<td>
						<input class="inputname" type="text" placeholder="수량을 입력해주세요">
						<input class="btn" type="button" value="확인">
					</td>				
				</tr>				
			</table>
			<table id="totalPrice">
				<tr>
					<td id="totalPriceTd" class="totalTd">
						총 상품금액
					</td>
					<td class="totalTd">
						0원
					</td>
				</tr>			
			</table>
			<div id="adminBtn">
				<input class="adminBtn" type="button" value="수정">
				<input class="adminBtn" type="button" value="삭제">
				<input class="adminBtn" type="button" value="등록">
			</div>
		</div>
		<div id="goReview">
			<span>해당상품 후기 </span>
			<span id="reviewSpan">보러가기</span>
			
		</div>
		
			
	</div>
	
	
	
	<jsp:include page="/WEB-INF/views/Footer.jsp"/>
</body>
</html>