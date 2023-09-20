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
#midDiv{
   float: right;
}
#tableDiv{
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
   width: 10%;
   background-color: #D3D3D3;
}
#listColumn2{
   width: 60%;
   background-color: #D3D3D3;
}
#listColumn3{
   width: 13%;
   background-color: #D3D3D3;
}
#listColumn4{
   width: 17%;
   background-color: #D3D3D3;
}
.tdClass{
   text-align: center;
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
}
#pageDiv{
   margin-top: 30px;
   clear: right;
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
         <div id="firstDiv">공지사항</div>
         <div id="secondDiv"></div>                           
      </div>
      <div id="midDiv">
         <select id="select">
            <option class="optionTag" value="title">제목</option>
            <option class="optionTag" value="">제목2</option>
            <option class="optionTag" value="">제목3</option>
         </select>         
         <input id="input" type="text" name="serch" placeholder="검색어 입력창">      
      </div>
      <div id="tableDiv">
         <table>
            <tr>
               <th id="listColumn1" class="listColumn">번호</th>
               <th id="listColumn2" class="listColumn">제목</th>
               <th id="listColumn3" class="listColumn">작성자</th>
               <th id="listColumn4" class="listColumn">작성일</th>            
            </tr>
            
            <c:forEach var="noticeDto" items="${noticeDtoList}">
            <tr>
               <td class="tdClass">${noticeDto.NOTICE_NO}</td>
               <td>
                     <a href='./listOne.do?no=${noticeDto.NOTICE_NO}'>
                        ${noticeDto.NOTICE_TITLE}
                     </a>
               </td>
               <td class="tdClass">${noticeDto.MEMBER_NAME}</td>
               <td class="tdClass">
                  <fmt:formatDate pattern="yyyy-MM-dd" 
                     value="${noticeDto.NOTICE_CRE_DATE}"/>
               </td>            
            </tr>            
            </c:forEach>
         </table>
      </div>
      <div id="writeBtnDiv">
         <input id="writeBtn" type="button" value="글쓰기" 
            onclick="location.href = '/DEMO_Project/board/noticeadd.do'">
      </div>
      <div id="pageDiv">
      <jsp:include page="/WEB-INF/views/common/BoardPaging.jsp">
      <jsp:param value="${pagingMap}" name="pagingMap"/>
      </jsp:include>
   
      <form action="./announcement.do" id='pagingForm' method="post">
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