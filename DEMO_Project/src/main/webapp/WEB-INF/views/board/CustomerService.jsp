<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
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
   width: 180px;
   display: block;     
}
#secondTh{      
}

#tableDiv{
	margin-top: 60px;
	clear: right;
	width: 100%;
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
#listColumn1{
	width: 7%;
	background-color: #D3D3D3;
}
#listColumn2{
	width: 10%;
	background-color: #D3D3D3;
}
#listColumn3{
	width: 50%;
	background-color: #D3D3D3;
}
#listColumn4{
	width: 10%;
	background-color: #D3D3D3;
}
#listColumn5{
	width: 10%;
	background-color: #D3D3D3;
}
#listColumn6{
	width: 10%;
	background-color: #D3D3D3;
}
.tdClass{
	text-align: center;
}
#pageDiv{
   margin-top: 30px;
}
</style>
<meta charset="UTF-8">
<title>공지사항 메인</title>
<link rel="stylesheet" type="text/css" href="/DEMO_Project/resources/css/main.css">
</head>
<body>
   <jsp:include page="/WEB-INF/views/Header.jsp"/>
   
   <jsp:include page="/WEB-INF/views/asideCustomerService.jsp"/>
   
	<div id='divContainer'>
		<div id="titleDiv">			
			<div id="firstDiv">1:1 상담문의</div>
			<div id="secondDiv"></div>      			            
		</div>		
		<div id="tableDiv">
			<table>
				<tr>
					<th id="listColumn1" class="listColumn">번호</th>
					<th id="listColumn2" class="listColumn">질문유형</th>
					<th id="listColumn3" class="listColumn">제목</th>
					<th id="listColumn4" class="listColumn">작성자</th>
					<th id="listColumn5" class="listColumn">날짜</th>
					<th id="listColumn6" class="listColumn">상태</th>				
				</tr>
				
				<c:forEach var="inquiryDto" items="${inquiryDtoList}">
				<tr>
					<td class="tdClass">${inquiryDto.INQUIRY_NO}</td>
					<td class="tdClass">${inquiryDto.INQUIRY_TYPE}</td>
					<td>${inquiryDto.INQUIRY_TITLE}</td>
					<td class="tdClass">${inquiryDto.MEMBER_NAME}</td>
					<td class="tdClass">
						<fmt:formatDate pattern="yyyy-MM-dd" 
							value="${inquiryDto.INQUIRY_CRE_DATE}"/>
					</td>
					<td class="tdClass">${inquiryDto.INQUIRY_IS_REPLY}</td>				
				</tr>				
				</c:forEach>
			</table>
		</div>
		<div id="pageDiv">
	      <jsp:include page="/WEB-INF/views/common/BoardPaging.jsp">
	      <jsp:param value="${pagingMap}" name="pagingMap"/>
	      </jsp:include>
   
	      <form action="./customerService.do" id='pagingForm' method="post">
	      <input type="hidden" id='curPage' name='curPage' 
	         value="${pagingMap.boardPaging.curPage}">
	      </form>
      	</div>	
						
	</div>
	
				
      
  
   <jsp:include page="/WEB-INF/views/Footer.jsp"/>
</body>
</html>