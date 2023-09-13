<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/DEMO_Project/resources/css/main.css">
<style type="text/css">

#input{
	float: right;
	margin-right: 16%;
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
}

.optionTag{
	text-align: center;	
}

#titleTag{
	color: blue;
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
	
	<div id='divContainer'
		style='width: 700px; height:700px'>
		<input id="input" type="text" name="serch" placeholder="검색어 입력창">
		<select id="select">
			<option class="optionTag" value="lowPrice">낮은가격순</option>
			<option class="optionTag" value="highPrice">높은가격순</option>
		</select>
	</div>

	
	<jsp:include page="/WEB-INF/views/Footer.jsp"/>
</body>
</html>