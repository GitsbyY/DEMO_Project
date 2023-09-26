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
	border: 1px 0px solid black;
	text-align: center;
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
		<div id="columnDiv">
		</div>
		
		<div id="productListDiv">
		</div>
		<div id="deleteDiv">
		</div>
		<div id="sumPriceDiv">
		</div>
	</div>

	
	<jsp:include page="/WEB-INF/views/Footer.jsp"/>
</body>
</html>