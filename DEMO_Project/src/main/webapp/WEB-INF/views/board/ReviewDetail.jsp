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
   width: 150px;
   display: block;     
}
#secondTh{      
}
#tableDiv{
   clear: right;
   width: 100%;
   margin-top: 60px;
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
   font-size: 16px;
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
#contentTd{
   height: 300px;
   padding-left: 25px;
   padding-top: 20px;
}
#listBtn{
   float: left;
   height: 30px;
}
#btnDiv{
   margin-top: 10px;
}
.rightBtn{
   float: right;
   margin-left: 10px;
   height: 30px;
   width: 50px;
}
</style>
<meta charset="UTF-8">
<title>후기남겨요 상세페이지</title>
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
      <form action='./reviewupdate.do' method='get'>      
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
            <tr>
               <td class="tdClass">${reviewDto.REVIEW_NO}</td>
               <td class="tdClass">${reviewDto.PRODUCT_NAME}</td>
               <td>${reviewDto.REVIEW_TITLE}</td>
               <td class="tdClass">${reviewDto.MEMBER_NAME}</td>
               <td class="tdClass">${reviewDto.PET_BREED}</td>
               <td class="tdClass">
                  <fmt:formatDate pattern="yyyy-MM-dd" 
                     value="${reviewDto.REVIEW_CRE_DATE}"/>
               </td>            
            </tr>
            <tr>
               <td id="contentTd" colspan="6" valign="top" name="reviewContent">
                  <pre>${reviewDto.REVIEW_CONTENT}</pre>
               </td>
               <input type="hidden" name="reviewContent" value="${reviewDto.REVIEW_CONTENT}">
            </tr>                        
         </table>
      </div>
      <div id="btnDiv">
         <input id="listBtn" type="button" value="뒤로가기" 
         onclick="goBack();">
         <input type="hidden" name="no" value="${reviewDto.REVIEW_NO}">
         <input class="rightBtn" type="submit" value="수정">
         <input class="rightBtn" type="button" value="삭제" 
            onclick='pageMoveDeleteFnc(${reviewDto.REVIEW_NO});'>
      </div>
      </form>                           
   </div>
  
   <jsp:include page="/WEB-INF/views/Footer.jsp"/>
</body>
<script type="text/javascript">
   function goBack() {
      window.history.back();
   }
   
   function pageMoveDeleteFnc(no) {
      
      var url = './reviewdelete.do?no=' + no;
         
      location.href = url;
   }
</script>
</html>