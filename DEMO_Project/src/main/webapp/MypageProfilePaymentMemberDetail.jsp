<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
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
   width: 150px;
   display: block;     
}

#secondTh{
   width: 900px;   
}

#memberInfo, .infoTr, .infoTd, .infoTd2{
	border: 1px solid #C0C0C0;
	border-collapse: collapse;
	margin-top: 80px;
	padding-left: 20px;
	font-size: 20px;
	font-weight: bold;
}
.infoTd, .infoTd2{
	width: 150px;
}
.infoTd{
	background-color: #DCDCDC;
}
#infoTd{
	width: 250px;
}
.inputEdit{
	width: 50px;
	height: 30px;
	font-size: 16px;
	font-weight: bold;
	float: right;
	margin-right: 30px;
}
.infoTr{
	height: 50px;
}
</style>
<meta charset="UTF-8">
<title>회원 결제관리 상세페이지</title>
<!-- <link rel="stylesheet" type="text/css" href="css/mystyles.css"> -->
<!-- <script src="js/myscript.js"></script> -->
</head>
<body>
	<jsp:include page="/WEB-INF/views/Header.jsp"/>
	
	<jsp:include page="/WEB-INF/views/asideMyPage.jsp"/>
	
	<div id='divContainer'
		style='width: 700px; height: 780px; background-color: pink;'>
		<table id="titleTable">
			<tr>
				<th id="firstTh">결제관리</th>
				<th id="secondTh"></th>      
			</tr>            
		</table>
		<div>
			<table id="memberInfo">
				<tr class="infoTr">
					<td class="infoTd">
						회원 번호
					</td>
					<td class="infoTd2" id="infoTd">
						회원 번호
					</td>
				</tr>
				<tr class="infoTr">
					<td class="infoTd">
						회원 아이디
					</td>
					<td class="infoTd2">
						회원 아이디
					</td>
				</tr>
				<tr class="infoTr">
					<td class="infoTd">
						회원 이름
					</td>
					<td class="infoTd2">
						회원 이름
					</td>
				</tr>
				<tr class="infoTr">
					<td class="infoTd">
						가입일
					</td>
					<td class="infoTd2">
						가입일
					</td>
				</tr>
				<tr class="infoTr">
					<td class="infoTd">
						주문 건수
					</td>
					<td class="infoTd2">
						2건
					</td>
				</tr>
				<tr class="infoTr">
					<td class="infoTd">
						포인트
					</td>
					<td class="infoTd2">
						1,000P
						<input class="inputEdit" type="button" value="수정">
					</td>
				</tr>
				<tr class="infoTr">
					<td class="infoTd">
						이머니
					</td> 
					<td class="infoTd2">
						100,000원
						<input class="inputEdit" type="button" value="수정">
					</td>
				</tr>
			</table>
	   
		</div>
	</div>
   
	

	
	<jsp:include page="/WEB-INF/views/Footer.jsp"/>
</body>
</html>