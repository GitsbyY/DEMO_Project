<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
#search{   
   margin-top: 10px;
   height: 35px;
   width: 220px;
   border-radius: 5px;
   padding-left: 20px;
   vertical-align: middle;
   margin-bottom: 10px;
   font-size: 16px; 
}
#select{
   margin-right: 10px;
   margin-top: 18px;
   height: 35px;
   width: 70px;
   border-radius: 5px;
   font-size: 16px;
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
   height: 40px;   
}
tr, td{
   border: 1px solid gray;
   border-left:thick;
   border-right:thick;
   height: 40px;   
}
table{
   width: 100%;
   border-left: none;
   border-collapse: collapse;
   font-size: 16px;
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
   background-color: #FFC4A3;
}
#listColumn2{
   width: 15%;
   background-color: #FFC4A3;
}
#listColumn3{
   width: 40%;
   background-color: #FFC4A3;
}
#listColumn4{
   width: 13%;
   background-color: #FFC4A3;
}
#listColumn5{
   width: 15%;
   background-color: #FFC4A3;
}
#listColumn6{
   width: 10%;
   background-color: #FFC4A3;
}
.tdClass{
   text-align: center;
}
a{
   text-decoration-line: none;
   color: black;
}
#writeBtnDiv{   
   margin-top: 30px;
   float: right;
}
#writeBtn{
   background-color: #FFC4A3;
   border: none;
   color: white;
   width: 60px;
   height: 30px;
   font-size: 16px;
   cursor: pointer;   
}
#pageDiv{
   margin-top: 30px;
   clear: right;
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
   <form action="./review.do" method="post">
      <div id="titleDiv">         
         <div id="firstDiv">후기남겨요</div>
         <div id="secondDiv"></div>                           
      </div>      
      <div id="midDiv" style="position: relative;">
         <select id="select" name="select">
            <option class="optionTag" value="PRODUCT_NAME">상품</option>
            <option class="optionTag" value="PET_BREED">견종</option>
            <option class="optionTag" value="REVIEW_TITLE">제목</option>
         </select>         
         <input id="search" type="text" name="search" placeholder="검색어 입력창">
         <img src="/DEMO_Project/resources/img/Search.png"
		        	alt="제출" id="searchButton"/ style="position: absolute; 
		        	right: 10px; top: 55%; transform: translateY(-50%); cursor: pointer;">              
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
      </form>
      <div id="writeBtnDiv">
          <c:choose>            
            <c:when test="${sessionScope.member.memberNo ne '1'}">
               <input id="writeBtn" type="button" value="글쓰기" 
                  onclick="location.href = '/DEMO_Project/board/reviewadd.do'">
               <input type="hidden" name="reviewDto" value="${reviewDtoList}"> 
            </c:when>
            <c:otherwise>
               
            </c:otherwise>
         </c:choose>
           
      </div>         
      <div id="pageDiv">
      <jsp:include page="/WEB-INF/views/common/BoardPaging.jsp">
      <jsp:param value="${pagingMap}" name="pagingMap"/>
      </jsp:include>
      <form action="./review.do" id='pagingForm' method="post">
      <input type="hidden" id='curPage' name='curPage' 
         value="${pagingMap.boardPaging.curPage}">
      </form>
      </div>
   </div>               
   
   
   <jsp:include page="/WEB-INF/views/Footer.jsp"/>
</body>
<script type="text/javascript">


</script>
</html>