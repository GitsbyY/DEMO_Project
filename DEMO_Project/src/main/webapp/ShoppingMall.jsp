<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/DEMO_Project/resources/css/main.css">
<style type="text/css">

#input{
	float: right;	
	margin-top: 10px;
	height: 25px;
	width: 220px;
	border-radius: 5px;
	padding-left: 20px;
	vertical-align: middle; 
}

#select{
	float: right;
	margin-right: 10px;
	margin-top: 18px;
	height: 20px;
	width: 100px;
	border-radius: 5px;
	font-size: 12px;
	font-weight: bold;
	background-color: #D3D3D3;
}

.optionTag{
	text-align: center;	
}
#btnDiv{
	clear: right;
	float: right;
	position: absolute;
	bottom: 10px;
	right: 5px;
}
#divContainer{
	position: relative;
}
.btnClass{
	width: 50px;
	height: 30px;
	margin-left: 10px;
}


</style>
<meta charset="UTF-8">
<title>쇼핑몰 메인</title>
<!-- <link rel="stylesheet" type="text/css" href="css/mystyles.css"> -->
<!-- <script src="js/myscript.js"></script> -->
</head>
<body>
	<jsp:include page="/WEB-INF/views/Header.jsp"/>
	
	<jsp:include page="/WEB-INF/views/asideShop.jsp"/>
	
	<div id='divContainer'>
		<input id="input" type="text" name="serch" placeholder="검색어 입력창">
		<select id="select">
			<option class="optionTag" value="lowPrice">낮은가격순</option>
			<option class="optionTag" value="highPrice">높은가격순</option>
		</select>
		<div id="btnDiv">
			<input class="btnClass" type="button" value="전체">
			<input class="btnClass" type="button" value="추가">
			<input class="btnClass" type="button" value="삭제">
		</div>
	</div>
	
	

	
	<jsp:include page="/WEB-INF/views/Footer.jsp"/>
</body>
</html>