<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
aside{
	/* background-color: #E0EEEE; */
	float: left;
	width: 180px;
	height: 600px;
	margin-left: 17%;
	
}
.aTag{
	margin-left: 35px;
	line-height: 2;
	font-weight: bold;
}

.H1tag{
	margin-left: 10px;
	line-height: 2.5;		
}

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

#titleDiv{
	border: 2px solid black;
	border-left:thick;
	border-right:thick;
	border-top:thick;
	float: right;
	margin-top: 10px;
	width: 130px;
	font-size: 30px;
	font-weight: bold;
	
}

#titleSideDiv{
	float: right;
	width: 670px;
	border: 1px solid gray;
	margin-top: 10px;
	margin-right: 245px;
	height: 40px;
	border-left:thick;
	border-right:thick;
	border-top:thick;
}

</style>
<meta charset="UTF-8">
<title>마이댕댕 메인</title>
<!-- <link rel="stylesheet" type="text/css" href="css/mystyles.css"> -->
<!-- <script src="js/myscript.js"></script> -->
</head>
<body>
	<jsp:include page="/WEB-INF/views/Header.jsp"/>
	
	<aside>
		<h1 class="H1tag">댕댕 쇼핑</h1>
		<a class="aTag">주문목록</a><br>
		<a class="aTag">취소내역</a><br>
		<a class="aTag">쇼핑몰 결제관리</a><br><br>		
		<h1 class="H1tag">댕댕 프로필</h1>
		<a class="aTag">개인정보확인/수정</a><br>
		<a class="aTag">결제관리</a><br>	
	</aside>
	<div>
		<div id="titleSideDiv">
		</div>
		<div id="titleDiv">
			주문목록
		</div>
		
	
	</div>
	

	
	<jsp:include page="/WEB-INF/views/Foot.jsp"/>
</body>
</html>