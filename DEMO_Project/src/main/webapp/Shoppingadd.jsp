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
			
		</div>
		
			
	</div>
	
	
	
	<jsp:include page="/WEB-INF/views/Foot.jsp"/>
</body>
</html>