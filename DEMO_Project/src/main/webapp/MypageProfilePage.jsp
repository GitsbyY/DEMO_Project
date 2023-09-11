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
	margin-right: 100px;
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

#titleTable{
   margin-top: 30px;
   border: 1px solid gray;
   border-collapse: collapse;
   border-top: thick;
   border-left:thick;
   border-right:thick;
   margin-right: 15.5%;
   table-layout: fixed;   
}
th{
   
   font-size: 30px;
}

#firstTh{
   border-bottom: 2px solid black;
   width: 200px;
   display: block;     
}

#secondTh{
   width: 750px;   
}

#titleTag{
	color: blue;
}

</style>
<meta charset="UTF-8">
<title>마이댕댕 회원정보확인</title>
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
		<a id="titleTag" class="aTag">회원정보확인/수정</a><br>
		<a class="aTag">결제관리</a><br>	
	</aside>
	<table id="titleTable">
      <tr>
         <th id="firstTh">회원정보 확인</th>
         <th id="secondTh"></th>      
      </tr>            
   </table>
	

	
	<jsp:include page="/WEB-INF/views/Foot.jsp"/>
</body>
</html>