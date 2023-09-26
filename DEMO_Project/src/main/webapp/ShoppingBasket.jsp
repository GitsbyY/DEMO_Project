<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/DEMO_Project/resources/css/main.css">
<style type="text/css">
#mainImg{
	height: 30px;
	width: 30px;
	vertical-align: bottom;
}
#basket{
	height: 50px;
	margin-top: 30px;	
}
#maintitle{
	font-size: 25px;
	font-weight: bold;
}

#countingDiv{
	border-top: 1px solid black;
	border-bottom: 1px solid black;
	text-align: center;
	padding: 20px;
}

table {
	width: 100%;
	border-collapse: collapse;
}

table tr td{
	padding:20px;
	border-bottom: 1px solid black;
	border-collapse: collapse;
}

#columnTr{
	border-bottom: 1px solid black;
	height:50px;
}
#productListDiv{
	display:flex;
}
#checkBoxDiv{
	width: 100px;
	flex-direction: row;
}
#imgDiv{
	width: 300px;;
	flex-direction: row;
}
#productDiv{
	width: 350px;;
	flex-direction: row;
}
#productSumPriceDiv{
	width: 200px;
	flex-direction: row;
}
#productQuantityDiv{
	width: 170px;
	flex-direction: row;
}
</style>
<meta charset="UTF-8">
<title>장바구니</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/Header.jsp"/>
	
	<div id="mainContainer">
		<div id="basket" style="width: 100%;">
			<img id="mainImg" alt="장바구니" src="./resources/img/imgHeader/basket.jpg">
			<span id="maintitle">장바구니</span>	
		</div>
		<div id="countingDiv">
			구매(<span id="countingSpan">0</span>)
		</div>
		<div id="productListDiv">
			<table id="productTable">
				<tr id="columnTr">
					<td>
						<div id="checkBoxDiv">
							전체 선택
						</div>
					</td>
					<td>
						<div id="imgDiv">
						</div>
					</td>
					<td>
						<div id="productDiv">
							상품 정보
						</div>
					</td>
					<td>
						<div id="productSumPriceDiv">
							총 상품금액
						</div>
					</td>
					<td>
						<div id="productQuantityDiv">
							상품 수량
						</div>
					</td>
				</tr>
				
			</table>
		</div>
		
		<div id="deleteDiv">
		</div>
		<div id="orderSumPriceDiv">
		</div>
	</div>

	
	<jsp:include page="/WEB-INF/views/Footer.jsp"/>
</body>
</html>