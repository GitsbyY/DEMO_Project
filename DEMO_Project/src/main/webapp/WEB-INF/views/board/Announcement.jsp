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
   border-bottom:thick;
   table-layout: fixed;   
   font-size: 30px;
   margin-bottom: 10px;
   width: 100%;   
}
#firstDiv{
   border-bottom: 2px solid black;
   width: 130px;
   display: block;
   font-weight: bold;     
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
#listColumn1{
   width: 10%;
   background-color: #FFC4A3;
}
#listColumn2{
   width: 60%;
   background-color: #FFC4A3;
}
#listColumn3{
   width: 13%;
   background-color: #FFC4A3;
}
#listColumn4{
   width: 17%;
   background-color: #FFC4A3;
}
.tdClass{
   text-align: center;
}
#writeBtnDiv{   
   margin-top: 30px;
   float: right;
}
#writeBtn{
   background-color: red;
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
.underline a {
    text-decoration: underline; /* 밑줄 스타일 적용 */   
}
.titleText {
    text-align: left; /* 텍스트를 왼쪽 정렬 */
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
               <td onmouseover="underlineTitle(this)" 
               		onmouseout="removeUnderlineTitle(this)" class="tdClass">
                     <a href='./listOne.do?no=${noticeDto.NOTICE_NO}'>
                        <p class="titleText">${noticeDto.NOTICE_TITLE}</p>
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
      <c:choose>
          <c:when test="${sessionScope.member.memberNo eq '1'}">
          <div id="writeBtnDiv">
            <input id="writeBtn" type="button" value="글쓰기" 
               onclick="location.href = '/DEMO_Project/board/noticeadd.do'">
            </div>
          </c:when>
          
          <c:otherwise>
              
          </c:otherwise>
      </c:choose>
      
      
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
	function underlineTitle(element) {
	    element.classList.add('underline'); // CSS 클래스 'underline' 추가
	}
	
	function removeUnderlineTitle(element) {
	    element.classList.remove('underline'); // CSS 클래스 'underline' 제거
	}

</script>
</html>