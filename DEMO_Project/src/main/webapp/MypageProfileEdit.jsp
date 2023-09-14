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
   width: 100%;   
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
     
}

</style>
<meta charset="UTF-8">
<title>회원정보 수정 페이지</title>
<link rel="stylesheet" type="text/css" href="/DEMO_Project/resources/css/main.css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/Header.jsp"/>
	
	<jsp:include page="/WEB-INF/views/asideMyPage.jsp"/>

	<div id='divContainer'>
		<table id="titleTable">
	      <tr>
	         <th id="firstTh">회원정보 수정</th>
	         <th id="secondTh"></th>      
	      </tr>            
		</table>
	</div>
	
	<jsp:include page="/WEB-INF/views/Footer.jsp"/>
</body>
</html>