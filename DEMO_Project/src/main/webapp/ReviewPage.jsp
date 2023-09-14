<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
#input{
	float: right;
	margin-right: 15.5%;
	margin-top: 10px;
	height: 25px;
	width: 220px;
	border-radius: 5px;
	padding-left: 20px;
	vertical-align: middle;
	margin-bottom: 10px; 
}

#select{
	float: right;
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
td{
	font-size: 12px;
	text-align: center;
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
   font-size: 30px;
   margin-bottom: 10px;   
}

#firstTh{
   border-bottom: 2px solid black;
   width: 150px;
   display: block;     
}

#secondTh{
   width: 900px;   
}

#mainTable{	
	width: 760px;
	border: 1px solid gray;
	border-left:thick;
	border-right:thick;
	border-collapse: collapse;	
}

#mainFirstTh{
	width: 60px;
}
#mainSecondTh{
	width: 100px;
}
#mainThirdTh{
	width: 300px;
	text-align: left;
}
#mainFourthTh{
	width: 100px;
}
#mainFifthTh{
	width: 100px;
}
#mainSixthTh{
	width: 100px;
}
#titleTd{	
	text-align: left;
}

</style>
<meta charset="UTF-8">
<title>후기남겨요 메인</title>
<!-- <link rel="stylesheet" type="text/css" href="css/mystyles.css"> -->
<!-- <script src="js/myscript.js"></script> -->
</head>
<body>
	<jsp:include page="/WEB-INF/views/Header.jsp"/>
	
	<jsp:include page="/WEB-INF/views/asideShop.jsp"/>
	
	<div id='divContainer'
		style='width: 700px; height: 780px; background-color: pink;'>
		<table id="titleTable">
			<tr>
				<th id="firstTh">후기남겨요</th>
				<th id="secondTh"></th>      
			</tr>            
		</table>
		
		<input id="input" type="text" name="serch" placeholder="검색어 입력창">
		<select id="select">
			<option class="optionTag" value="product">상품</option>
			<option class="optionTag" value="kind">견종</option>
			<option class="optionTag" value="title">제목</option>
		</select>
	   
		<table id="mainTable">
			<tr class="mainTr">
				<th id="mainFirstTh" class="mainTh">번호</th>
				<th id="mainSecondTh" class="mainTh">상품</th>
				<th id="mainThirdTh" class="mainTh">제목</th>
				<th id="mainFourthTh" class="mainTh">견종</th>
				<th id="mainFifthTh" class="mainTh">작성자</th>
				<th id="mainSixthTh" class="mainTh">작성일</th>              
			</tr>
			<tr>
				<td>1</td>
				<td>맛있는 사료</td>
				<td id="titleTd">맛있는 사료 너무 맛있어요.</td>
				<td>보더콜리</td>
				<td>보더콜리맘</td>
				<td>2023-08-28</td>
			</tr>   	
	   
		</table>
	</div>

	
	<jsp:include page="/WEB-INF/views/Footer.jsp"/>
</body>
</html>