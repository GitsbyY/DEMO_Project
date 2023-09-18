<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
#input{	
	margin-top: 10px;
	height: 25px;
	width: 220px;
	border-radius: 5px;
	padding-left: 20px;
	vertical-align: middle;
	margin-bottom: 10px; 
}
#select{
	margin-right: 10px;
	margin-top: 18px;
	height: 20px;
	width: 70px;
	border-radius: 5px;
	font-size: 12px;
	font-weight: bold;
}
.optionTag{
	text-align: center;	
}
.mainTh, .mainTr{
	border: 1px solid black;
	border-left:thick;
	border-right:thick;
	font-size: 14px;	
}
#titleDiv{
   margin-top: 30px;
   border: 1px solid gray;
   border-collapse: collapse;
   border-top: thick;
   border-left:thick;
   border-right:thick;  
   table-layout: fixed;
   font-size: 30px;
   margin-bottom: 10px;
   width: 100%;   
}
#firstDiv{
   border-bottom: 2px solid black;
   width: 150px;
   display: block;     
}

#secondDiv{
      
}
#midDiv{
	float: right;
}

</style>
<meta charset="UTF-8">
<title>후기남겨요 메인</title>
<link rel="stylesheet" type="text/css" href="/DEMO_Project/resources/css/main.css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/Header.jsp"/>
	
	<jsp:include page="/WEB-INF/views/asideShop.jsp"/>
	
	<div id='divContainer'>
		<div id="titleDiv">			
			<div id="firstDiv">후기남겨요</div>
			<div id="secondDiv"></div>      			            
		</div>		
		<div id="midDiv">
			<select id="select">
				<option class="optionTag" value="product">상품</option>
				<option class="optionTag" value="kind">견종</option>
				<option class="optionTag" value="title">제목</option>
			</select>			
			<input id="input" type="text" name="serch" placeholder="검색어 입력창">		
		</div>
	</div>				   
	
	
	<jsp:include page="/WEB-INF/views/Footer.jsp"/>
</body>
</html>