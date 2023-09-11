<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">

#title{
	height: 50px;
	margin-top: 30px;
	margin-left: 16%;
	margin-right: 16%;
	border: 2px solid black;
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
<!-- <link rel="stylesheet" type="text/css" href="css/mystyles.css"> -->
<!-- <script src="js/myscript.js"></script> -->
</head>
<body>
	<jsp:include page="/WEB-INF/views/Header.jsp"/>
	
	<div id="title">	
		<p id="maintitle">주문/결제</p>	
	</div>
	<div>	
		<p id="maintitle">결제정보</p>	
	</div>

	
	<jsp:include page="/WEB-INF/views/Foot.jsp"/>
</body>
</html>