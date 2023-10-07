<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
#titleDiv {
   margin-top: 30px;
   border: 1px solid gray;
   border-collapse: collapse;
   border-top: thick;
   border-left: thick;
   border-right: thick;
   border-bottom: thick;
   table-layout: fixed;
   font-size: 30px;
   margin-bottom: 10px;
   width: 100%;
}

#firstDiv {
   border-bottom: 2px solid black;
   width: 180px;
   display: block;
   font-weight: bold;
}

#secondTh {
   
}

#tableDiv {
   margin-top: 60px;
   clear: right;
   width: 100%;
}
#tableDiv2{
   margin-top: 10px;
   clear: right;
   width: 100%;
}

th {
   border: 2px solid black;
   border-left: thick;
   border-right: thick;
   border-bottom: thick;
   height: 40px;
}

tr, td {
   border: 1px solid black;
   border-left: thick;
   border-right: thick;
   height: 40px;
}

table {
   width: 100%;
   border-left: none;
   border-collapse: collapse;
   font-size: 16px;
}

#listColumn1 {
   width: 7%;
   background-color: #FFC4A3;
}

#listColumn2 {
   width: 10%;
   background-color: #FFC4A3;
}

#listColumn3 {
   width: 40%;
   background-color: #FFC4A3;
}

#listColumn4 {
   width: 10%;
   background-color: #FFC4A3;
}

#listColumn5 {
   width: 20%;
   background-color: #FFC4A3;
}

#listColumn6 {
   width: 10%;
   background-color: #FFC4A3;
}

.tdClass {
   text-align: center;
}

#contentTd {
   height: 300px;
   padding-left: 25px;
   padding-top: 20px;
}

#listBtn {
   float: left;
   height: 30px;
}

#btnDiv {
   margin-top: 10px;
   clear: right;
}

.rightBtn {
   float: right;
   margin-left: 10px;
   height: 30px;
   width: 50px;
   background-color: #FFC4A3;
   color: white;
   font-weight: bold;
   border: none;
   cursor: pointer;
}
#listBtn{
	background-color: #FFC4A3;
	color: white;
	font-weight: bold;
	border: none;
	width: 65px;
	cursor: pointer;
}

#replyTableDiv {
   margin-top: 60px;
   width: 1020px;
   height: 620px;
   float: right;
}

.firstTd {
   width: 12%;
   text-align: center;
   font-weight: bold;
   border-right: 1px solid black;
   background-color: #D3D3D3;
}

#thirdTr {
   height: 400px;
}

td input {
   padding-left: 10px; /* 원하는 만큼의 여백 크기를 지정합니다. */
}

#titleInputTd {
   padding-left: 10px;  
}

#titleInput {
   height: 30px;
   width: 90%;
}

#nameTd {
   padding-left: 15px;
   font-weight: bold;
}

#contentInput {
   width: 90%;
   height: 370px;
   padding-left: 10px;
   padding-top: 10px;
}

#contentInputTd {
   padding-left: 10px;
}

.replyTableRow, .firstTd, .secondTd {
   height: 40px;
}

#replyMidDiv {
   font-size: 30px;
}

#replyTable {
   border: 1px solid black;
}
#replyDiv{
   margin-top: 50px;
   font-size: 30px;
}
</style>
<meta charset="UTF-8">
<title>공지사항 메인</title>
<link rel="stylesheet" type="text/css"
   href="/DEMO_Project/resources/css/main.css">
</head>
<body>
   <jsp:include page="/WEB-INF/views/Header.jsp" />

   <jsp:include page="/WEB-INF/views/asideCustomerService.jsp" />

   <div id='divContainer'>
      <div id="titleDiv">
         <div id="firstDiv">1:1 상담문의</div>
         <div id="secondDiv"></div>
      </div>
      <form action='./inquiryupdate.do' method='get'>
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
               <tr>
                  <td class="tdClass">${inquiryDto.INQUIRY_NO}</td>
                  <td class="tdClass">${inquiryDto.INQUIRY_TYPE}</td>
                  <td>${inquiryDto.INQUIRY_TITLE}</td>
                  <td class="tdClass">${inquiryDto.MEMBER_NAME}</td>
                  <td class="tdClass"><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss"
                        value="${inquiryDto.INQUIRY_CRE_DATE}" /></td>
                  <td class="tdClass">
                  <c:choose>
                      <c:when test="${inquiryDto.INQUIRY_IS_REPLY eq 'N'}">
                          답변 대기중
                      </c:when>
                      <c:when test="${inquiryDto.INQUIRY_IS_REPLY eq 'Y'}">
                          답변 완료
                      </c:when>
                      <c:otherwise>
                          
                      </c:otherwise>
                  </c:choose>
                  </td>
               </tr>
               <tr>
                  <td id="contentTd" colspan="6" valign="top"><pre>${inquiryDto.INQUIRY_CONTENT}</pre>
                  </td>
               </tr>
            </table>
         </div>
      
      <c:choose>
         <c:when test="${inquiryDto.INQUIRY_IS_REPLY eq 'Y'}">
         <div id="replyDiv">답변</div>
         <div id="tableDiv2">
            <table>
               <tr>
                  <th id="listColumn1" class="listColumn">번호</th>
                  <th id="listColumn2" class="listColumn">질문유형</th>
                  <th id="listColumn3" class="listColumn">제목</th>
                  <th id="listColumn4" class="listColumn">작성자</th>
                  <th id="listColumn5" class="listColumn">답변날짜</th>
                  
               </tr>
               <tr>
                  <td class="tdClass">${inquiryDto.INQUIRY_NO}</td>
                  <td class="tdClass">${inquiryDto.INQUIRY_TYPE}</td>
                  <td>[RE] : ${replyDto.REPLY_TITLE}</td>
                  <td class="tdClass">관리자</td>
                  <td class="tdClass"><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss"
                        value="${replyDto.REPLY_CRE_DATE}" /></td>                  
               </tr>
               <tr>
                  <td id="contentTd" colspan="6" valign="top"><pre>${replyDto.REPLY_CONTENT}</pre>
                  </td>
               </tr>
            </table>
         </div>
            </c:when>
       </c:choose>
               
         
         <div id="btnDiv">
             <input id="listBtn" type="button" value="목록으로" onclick="goBack();">
             <input type="hidden" name="no" value="${inquiryDto.INQUIRY_NO}">
             <input type="hidden" id="inquiryNo" name="inquiryNo" value="${inquiryDto.INQUIRY_NO}">
             
             <c:choose>
                 <c:when test="${sessionScope.member.memberNo eq inquiryDto.MEMBER_NO}">
                 <c:choose>
                        <c:when test="${inquiryDto.INQUIRY_IS_REPLY eq 'N'}">
                            <input class="rightBtn" type="submit" value="수정">
                           <input class="rightBtn" type="button" value="삭제" onclick='pageMoveDeleteFnc(${inquiryDto.INQUIRY_NO});'>                            
                        </c:when>
                        <c:otherwise>
                            
                        </c:otherwise>
                    </c:choose>
                        
                 </c:when>
                 <c:otherwise>
                     
                 </c:otherwise>
             </c:choose>
             
             <c:choose>
                <c:when test="${sessionScope.member.memberNo eq '1'}">
                    <c:choose>
                        <c:when test="${inquiryDto.INQUIRY_IS_REPLY eq 'N'}">
                            
                            <input style="background-color: red; color: white; border: none;" 
                            	class="rightBtn" type="button" value="답변" onclick="showReplyForm();">
                        </c:when>
                        <c:otherwise>
                            
                        </c:otherwise>
                    </c:choose>
                </c:when>
                <c:otherwise>
                    
                </c:otherwise>
            </c:choose>         
         </div>
      </form>
   </div>
   





   <jsp:include page="/WEB-INF/views/Footer.jsp" />
</body>
<script type="text/javascript">   
   
   function goBack() {
      window.history.back();
   }
   
   function pageMoveDeleteFnc(no) {      
	   var inquiryNo = document.getElementById('inquiryNo').value;
	    
	   if (confirm("정말로 삭제 하시겠습니까?")) {        
		   var url = './inquirydelete.do?no=' + no;
	         
		   location.href = url;
	   }  
	   
      
   }
   
   function showReplyForm() {
       // divContainer 요소 가져오기
       var divContainer = document.getElementById('divContainer');

       // divContainer 내용 변경
       divContainer.innerHTML = `
          
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
                  <tr>
                     <td class="tdClass">${inquiryDto.INQUIRY_NO}</td>
                     <td class="tdClass">${inquiryDto.INQUIRY_TYPE}</td>
                     <td>${inquiryDto.INQUIRY_TITLE}</td>
                     <td class="tdClass">${inquiryDto.MEMBER_NAME}</td>
                     <td class="tdClass"><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss"
                           value="${inquiryDto.INQUIRY_CRE_DATE}" /></td>
                     <td class="tdClass">
                     <c:choose>
                      <c:when test="${inquiryDto.INQUIRY_IS_REPLY eq 'N'}">
                          답변 대기중
                      </c:when>
                      <c:when test="${inquiryDto.INQUIRY_IS_REPLY eq 'Y'}">
                          답변 완료
                      </c:when>
                      <c:otherwise>
                          
                      </c:otherwise>
                  </c:choose>
                     </td>
                  </tr>
                  <tr>
                     <td id="contentTd" colspan="6" valign="top"><pre>${inquiryDto.INQUIRY_CONTENT}</pre>
                     </td>
                  </tr>
               </table>
            </div>
            <form action="./inquiryReplyddCtr.do" method="post" enctype="multipart/form-data">
               <div id="replyTableDiv">
                  <div id="replyMidDiv">답변</div>
                  <table id="replyTable">
                     <tr id="firstTr" class="replyTableRow">
                        <td id="firstTd" class="firstTd" style="background-color: #FFC4A3;">제목</td>
                        <td id="titleInputTd" class="secondTd"><input id="titleInput"
                           type="text" name="replyTitle"></td>
                     </tr>
                     <tr id="secondTr" class="replyTableRow">
                        <td id="secondTd" class="firstTd" style="background-color: #FFC4A3;">작성자</td>
                        <td id="nameTd" class="secondTd">${sessionScope.member.memberName}</td>
                     </tr>
                     <tr id="thirdTr" class="replyTableRow">
                        <td id="thirdTd" class="firstTd" style="background-color: #FFC4A3;">내용</td>
                        <td id="contentInputTd" class="secondTd"><textarea
                              id="contentInput" type="text" name="replyContent"></textarea></td>
                     </tr>
                  </table>
         
                  <div id="btnDiv">
                  
                     <input id="listBtn" type="button" value="목록으로" onclick="goBack();">
                     <input type="hidden" name="inquiryNo" value="${inquiryDto.INQUIRY_NO}">
                     <input type="hidden" name="memberName" value="${inquiryDto.MEMBER_NAME}">
                     <input type="hidden" name="memberNo" value="${inquiryDto.MEMBER_NO}">
                     <input style="background-color: red; color: white; border: none;" 
                     	class="rightBtn" type="submit" value="등록">
                  
                  </div>
               </div>
            </form>   

      
       `;
   }
</script>
</html>