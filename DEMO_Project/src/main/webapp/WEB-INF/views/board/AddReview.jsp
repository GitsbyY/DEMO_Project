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
   border-bottom:thick;  
   table-layout: fixed;
   font-size: 30px;
   margin-bottom: 10px;
   width: 100%;   
}
#firstDiv{
   border-bottom: 2px solid black;
   width: 150px;
   display: block;
   font-weight: bold;     
}
#secondTh{      
}

#tableDiv{
   margin-top: 60px;
   clear: right;
   width: 100%;   
   height: 500px;
}
th{      
   height: 30px;   
}
tr, td{
   border: 1px solid black;   
   height: 40px;   
}
table{
   width: 100%;   
   border-left: none;   
   border-collapse: collapse;
   font-size: 16px;
}
.firstTd{
   width: 12%;   
   text-align: center;
   font-weight: bold;
   border-right: 1px solid black;
   background-color: #FFC4A3;
}
#fourthTr{
   height: 400px;
}
td input{
    padding-left: 10px; /* 원하는 만큼의 여백 크기를 지정합니다. */    
}
#titleInputTd{
   padding-left: 10px;
   width: 40%;   
}
#titleInput{
   height: 30px;
   width: 90%;
}
#typeSelect{
   height: 30px;
   width: 80px;
   font-size: 16px;
   font-weight: bold;
   text-align: center;
}
#nameTd{
   padding-left: 15px;
   font-weight: bold;
}
#contentInput{   
   width: 90%;
   height: 350px;
   padding-left: 10px;
   padding-top: 10px;
}
#contentInputTd{
   padding-left: 10px;
   padding-top: 10px;
   padding-bottom: 10px;   
}
#btnDiv{   
   margin-top: 30px;
   float: right;
}
#registrationBtn, #cancellationBtn{
   background-color: #FFC4A3;
   border: none;
   color: white;
   width: 60px;
   height: 30px;
   font-size: 16px;
   cursor: pointer;   
}
#petBreed{
   padding-left: 10px;
}
select{
	height: 30px;
	font-size: 16px;
	cursor: pointer;
}
</style>
<meta charset="UTF-8">
<title>공지사항 메인</title>
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
      <form id="formId" action='./reviewaddCtr.do' method='post' enctype="multipart/form-data">
         <div id="tableDiv">
            <table>                       
               <tr id="firstTr">
                  <td id="firstTd" class="firstTd">상품명</td>   
                  <td id="titleInputTd">
                  	<select id="productSelect" name="productNo">
                  		<option>상품을 선택해주세요
                  		<c:forEach items="${memberInfoList}" var="memberInfoList">
                  			<option value="${memberInfoList.PRODUCT_NO}"
                  			<c:if test="${productName eq memberInfoList.PRODUCT_NAME}">
                  				selected
                  			</c:if>
                  			>${memberInfoList.PRODUCT_NAME}                  			                 			
                  		</c:forEach>                  		                  	
                  	</select>
                     <%-- ${memberInfo.PRODUCT_NAME} --%>
                  </td>
                  <td class="firstTd">견종</td>
                  <td id="petBreed">
                     ${memberInfoList[0].PET_BREED}
                  </td>      
               </tr>
               <tr id="secondTr">
                  <td id="secondTd" class="firstTd">제목</td>   
                  <td id="titleInputTd" colspan="3">
                     <input id="titleInput" type="text" name="reviewTitle">
                  </td>      
               </tr>                           
               <tr id="thirdTr">
                  <td id="thirdTd" class="firstTd">작성자</td>   
                  <td id="nameTd" colspan="3">${sessionScope.member.memberName}</td>                        
               </tr>
               <tr id=fourthTr">
                  <td id="fourthTd" class="firstTd">내용</td>   
                  <td id="contentInputTd" colspan="3">
                     <textarea id="contentInput" name="reviewContent"></textarea>
                     <%-- <input type="hidden" name="reviewContent" value="${memberInfo.REVIEW_CONTENT}"> --%>
                     <input type="hidden" name="memberNo" value="${sessionScope.member.memberNo}">
                     
                  </td>
               </tr>            
            </table>
         </div>
         <div id="btnDiv">
            <input id="registrationBtn" type="button" value="등록" onclick="submitForm();">
            <input id="cancellationBtn" type="button" value="취소" 
               onclick="location.href = 'javascript:window.history.back();'">   
         </div>
      </form>         
                  
   </div>
 
   <jsp:include page="/WEB-INF/views/Footer.jsp"/>
</body>
<script type="text/javascript">

	function submitForm() {
	   var selectedProduct = document.getElementById("productSelect").value;
	   var titleInput = document.getElementById("titleInput").value;
	   var contentInput = document.getElementById("contentInput").value;
	
	   if(selectedProduct === "상품을 선택해주세요" || titleInput === "" || contentInput === "") {
		      alert("상품, 제목, 내용을 모두 입력해주세요!");
		   } else {
		      document.getElementById("formId").submit();
		   }    	   
	}
	
</script>
</html>