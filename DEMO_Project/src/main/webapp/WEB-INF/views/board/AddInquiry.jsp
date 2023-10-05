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
      <form id="formId" action='./inquiryaddCtr.do' method='post' enctype="multipart/form-data">      
         <input type="hidden" name="memberNo" value="${sessionScope.member.memberNo}">
         <input type="hidden" name="memberName" value="${sessionScope.member.memberName}">        
         <div id="tableDiv">
            <table>
               <tr id="firstTr">
                  <td id="firstTd" class="firstTd">상담유형</td>   
                  <td id="titleInputTd">
                     <!-- <input id="titleInput" type="text" name="inquiryType"> -->
                     <select id="typeSelect" name="inquiryType">
                        <option>회원
                        <option>상품
                     </select>
                  </td>      
               </tr>
               <tr id="secondTr">
                  <td id="secondTd" class="firstTd">제목</td>   
                  <td id="titleInputTd">
                     <input id="titleInput" type="text" name="inquiryTitle">
                  </td>      
               </tr>                           
               <tr id="thirdTr">
                  <td id="thirdTd" class="firstTd">작성자</td>   
                  <td id="nameTd">${sessionScope.member.memberName}</td>                        
               </tr>
               <tr id="fourthTr">
                  <td id="fourthTd" class="firstTd">내용</td>   
                  <td id="contentInputTd">
                     <textarea id="contentInput" name="inquiryContent"></textarea>
                     <%-- <input type="hidden" name="inquiryContent" value="${inquiryDto.INQUIRY_CONTENT}"> --%>                  
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
	   var titleInput = document.getElementById("titleInput").value;
	   var contentInput = document.getElementById("contentInput").value;
	
	   if(titleInput === "" || contentInput === "") {
		      alert("제목, 내용을 모두 입력해주세요!");
		   } else {
		      document.getElementById("formId").submit();
		   }    	   
	}
</script>

</html>