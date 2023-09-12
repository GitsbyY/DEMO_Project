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

#titleTag{
	color: blue;
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
	
	<aside>
		<h1 class="H1tag">댕댕 쇼핑몰</h1>
		<a class="aTag">전체</a><br>
		<a class="aTag">사료</a><br>
		<a class="aTag">간식</a><br>
		<a class="aTag">영양제</a><br>
		<a class="aTag">미용/목욕용품</a><br>
		<a class="aTag">장난감</a><br>
		<a class="aTag">기타</a><br><br>
		<h1 class="H1tag">댕댕 게시판</h1>
		<a id="titleTag" class="aTag">후기남겨요</a><br>	
	</aside>
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
	

	
	<jsp:include page="/WEB-INF/views/Foot.jsp"/>
</body>
</html>