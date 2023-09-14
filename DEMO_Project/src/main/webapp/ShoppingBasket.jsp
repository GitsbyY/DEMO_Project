<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
#mainImg{
	height: 30px;
	width: 30px;
	vertical-align: bottom;
}
#basket{
	height: 50px;
	margin-top: 30px;	
	border: 1px solid black;
	border-top: thick;
	border-left:thick;
	border-right:thick;
}
#maintitle{
	font-size: 25px;
	font-weight: bold;
}

</style>
<meta charset="UTF-8">
<title>장바구니</title>
<link rel="stylesheet" type="text/css" href="/DEMO_Project/resources/css/main.css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/Header.jsp"/>
	
	<div id="mainContainer">
		<div id="basket" style="width: 100%;">
			<img id="mainImg" alt="장바구니" src="./resources/img/imgHeader/basket.jpg">
			<span id="maintitle">장바구니</span>	
		</div>	
	</div>

	
	<jsp:include page="/WEB-INF/views/Footer.jsp"/>
</body>
</html>