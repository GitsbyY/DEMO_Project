<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
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
#midDiv{	
	float: right;
}
#tableDiv{
	clear: right;
	width: 100%;
	margin-top: 100px;
}
th{
   border: 2px solid black;
   border-left:thick;
   border-right:thick;
   border-bottom:thick;
   height: 30px;   
}
tr, td{
   border: 1px solid black;
   border-left:thick;
   border-right:thick;
   height: 30px;   
}
table{
   width: 100%;
   border-left: none;
   border-collapse: collapse;
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
#listColumn1{
   width: 7%;
   background-color: #D3D3D3;
}
#listColumn2{
   width: 15%;
   background-color: #D3D3D3;
}
#listColumn3{
   width: 40%;
   background-color: #D3D3D3;
}
#listColumn4{
   width: 13%;
   background-color: #D3D3D3;
}
#listColumn5{
   width: 15%;
   background-color: #D3D3D3;
}
#listColumn6{
   width: 10%;
   background-color: #D3D3D3;
}
.tdClass{
   text-align: center;
}
a{
	text-decoration-line: none;
	color: black;
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
		<div id="tableDiv">
         <table>
            <tr>
               <th id="listColumn1" class="listColumn">번호</th>
               <th id="listColumn2" class="listColumn">상품</th>
               <th id="listColumn3" class="listColumn">제목</th>
               <th id="listColumn4" class="listColumn">작성자</th>
               <th id="listColumn5" class="listColumn">견종</th>
               <th id="listColumn6" class="listColumn">작성일</th>            
            </tr>
            
            <c:forEach var="reviewDto" items="${reviewDtoList}">
            <tr>
               <td class="tdClass">${reviewDto.REVIEW_NO}</td>
               <td class="tdClass">${reviewDto.PRODUCT_NAME}</td>
               <td>
                     <a href='./listOne3.do?no=${reviewDto.REVIEW_NO}'>
                        ${reviewDto.REVIEW_TITLE}
                     </a>
               </td>
               <td class="tdClass">${reviewDto.MEMBER_NAME}</td>
               <td class="tdClass">${reviewDto.PET_BREED}</td>
               <td class="tdClass">
                  <fmt:formatDate pattern="yyyy-MM-dd" 
                     value="${reviewDto.REVIEW_CRE_DATE}"/>
               </td>            
            </tr>            
            </c:forEach>
         </table>
      </div>
	</div>				   
	
	
	<jsp:include page="/WEB-INF/views/Footer.jsp"/>
</body>
</html>