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
   height: 40px;   
}
tr, td{
   border: 1px solid black;
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
   width: 7%;
   background-color: #FFC4A3;
}
#listColumn2{
   width: 63%;
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
#contentTd{
   height: 300px;
   padding-left: 25px;
   padding-top: 20px;
}
#listBtn{
	background-color: #FFC4A3;
	font-weight: bold;
	border: none;
	color: white;
	width: 65px;
	margin-bottom: 30px;
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
   background-color: red;
   border:none;
   color: white;
}
.noticeReplyDiv{
	clear: both;
	width: 100%;
	border: 2px solid #FFC4A3;
	border-radius: 5px;
	height: 80px;		
	flex-direction: column;
	margin-bottom: 10px;
	position: relative;	
}
.replyText{
	width: 70%;
	height: 40px;
	margin: auto;
	display: block;
	margin-bottom: 5px;
	border: none;
	background-color: transparent;
	outline: none;
	resize: none;
	float: left;	
	margin-left: 25px;
	font-size: 16px;
}
#replyText{
	clear: both;
	width: 100%;
	border: 1px solid gray;
	border-radius: 5px;
	height: 80px;		
	flex-direction: column;
	margin-bottom: 10px;
}
.noticeReplyName{
	text-align: left;
	margin-left: 25px;
	margin-top: 5px;
	margin-bottom: 10px;
	font-weight: bold;
	width: 200px;
}
.submit{
	float: right;
	margin-right: 25px;
	background-color: #FFC4A3;
	border: none;
	color: white;
	height: 25px;
	width: 40px;
}
#dateDiv{
	position: absolute;
	margin-left: 870px;	
    top: 0;
        
    
}
#noticeListDiv{
	
}
textarea {
	overflow: hidden;
}
#noticeReplyTitle{
	clear: both;
	font-size: 24px;
	font-weight: bold;
	margin-bottom: 10px;
}
</style>
<meta charset="UTF-8">
<title>공지사항 메인</title>
<link rel="stylesheet" type="text/css" href="/DEMO_Project/resources/css/main.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
   <jsp:include page="/WEB-INF/views/Header.jsp"/>
   
   <jsp:include page="/WEB-INF/views/asideCustomerService.jsp"/>
   
   <div id='divContainer'>
      <div id="titleDiv">         
         <div id="firstDiv">공지사항</div>
         <div id="secondDiv"></div>                           
      </div>
      <form action='./update.do' method='get'>      
      <div id="tableDiv">
         <table>
            <tr>
               <th id="listColumn1" class="listColumn">번호</th>
               <th id="listColumn2" class="listColumn">제목</th>
               <th id="listColumn3" class="listColumn">작성자</th>
               <th id="listColumn4" class="listColumn">작성일</th>            
            </tr>            
            <tr>
               <td id="Rno" class="tdClass">${noticeDto.NOTICE_NO}</td>
               <td>${noticeDto.NOTICE_TITLE}</td>
               <td class="tdClass">${noticeDto.MEMBER_NAME}</td>
               <td class="tdClass">
                  <fmt:formatDate pattern="yyyy-MM-dd" 
                     value="${noticeDto.NOTICE_CRE_DATE}"/>
               </td>            
            </tr>
            <tr>
               <td id="contentTd" colspan="4" valign="top">
                  <pre>${noticeDto.NOTICE_CONTENT}</pre>
               </td>
            </tr>                        
         </table>
      </div>
      <div id="btnDiv">
         <input id="listBtn" type="button" value="목록으로" 
         onclick="goBack();">
         <input type="hidden" name="no" value="${noticeDto.NOTICE_NO}">
         <c:choose>
          <c:when test="${sessionScope.member.memberNo eq '1'}">
          <input class="rightBtn" type="submit" value="수정">
            <input class="rightBtn" type="button" value="삭제" 
               onclick='pageMoveDeleteFnc(${noticeDto.NOTICE_NO});'>
          </c:when>
          
          <c:otherwise>
              
          </c:otherwise>
      </c:choose>
         
      </div>
      </form>
      
      <div id="noticeReplyTitle">댓글</div>
		
      <c:forEach items="${reply}" var="reply" varStatus="loop">
	      <div class="noticeReplyDiv" id="noticeReplyDiv${loop.index}">
	      	<div class="noticeReplyName">
	      		${reply.MEMBER_NAME}
	      	</div>
	      		
	      	<div id="dateDiv">
		      		<fmt:formatDate pattern="yyyy-MM-dd HH:mm" 
	                     value="${reply.NOTICE_REPLY_CRE_DATE}"/>
            </div>  
	      	<div id="noticeListDiv">
	      		<textarea id="textContent1" disabled="disabled" class="replyText" rows="" cols="" name="noticeReplyContent">${reply.NOTICE_REPLY_CONTENT}</textarea>
	      		<input type="hidden" name="noticeReplyContent" value="${reply.NOTICE_REPLY_CONTENT}">
	      		<input id="noticeReplyNo1" type="hidden" name="noticeReplyNo" value="${reply.NOTICE_REPLY_NO}">
	      		                        		      			
	      		<c:choose>
					<c:when test="${sessionScope.member.memberNo eq reply.MEMBER_NO}">
						<input id="firstBtn" class="submit" type="button" value="삭제" onclick="noticeReplyDeleteFnc(${reply.NOTICE_REPLY_NO});" style="display: block;">
	      				<button id="secondBtn" class="submit" type="button" 
	      					style="display: block;" onclick="changeBtnFnc('noticeReplyDiv${loop.index}'); changeDivBorder('noticeReplyDiv${loop.index}'); activateTextarea('noticeReplyDiv${loop.index}');">수정</button>
	      				<button id="thirdBtn" class="submit" type="button" 
	      					style="background-color: red; display: none;" onclick="cancelEdit('noticeReplyDiv${loop.index}'); revertDivBorder('noticeReplyDiv${loop.index}');">취소</button>
	      				<button id="fourthBtn" class="submit" type="button" 
	      					style="background-color: red; display: none;" onclick="editFnc('noticeReplyDiv${loop.index}');">등록</button>							
					</c:when>
					<c:when test="${sessionScope.member.memberNo eq '1'}">
						<input class="submit" type="button" value="삭제" 
	      					onclick="noticeReplyDeleteFnc(${reply.NOTICE_REPLY_NO});">	      										
					</c:when>
					<c:otherwise>		
					</c:otherwise>
				</c:choose>	      			      		
	      	</div>
	      
	      </div>
      </c:forEach>
       
       
		<form action="./noticeReplyWrite.do" method="post" onsubmit="return submitReplyForm();">
		<div id="replyText" class="noticeReplyDiv">
      	<div class="noticeReplyName">
      		${sessionScope.member.memberName}
      	</div>
      	<input type="hidden" name="noticeNo" value="${noticeDto.NOTICE_NO}" id="noticeNo">
        <input type="hidden" name="memberNo" value="${sessionScope.member.memberNo}"> 
      	<textarea id="writenoticeReplyContent" class="replyText" rows="2" cols="20" name="noticeReplyContent"></textarea>
      	<div>
      		<!-- <input class="submit" type="button" value="등록"> -->
      		<button class="submit" type="submit">등록</button>
      	</div>
      
		</div>
		</form>                           
   </div>
  
   <jsp:include page="/WEB-INF/views/Footer.jsp"/>
</body>
<script type="text/javascript">
	function submitReplyForm() {
	    var noticeReplyContent = document.getElementById('writenoticeReplyContent').value;
	
	    // 댓글 내용이 공백인지 확인
	    if (noticeReplyContent.trim() === "") {
	        alert("댓글을 입력하지 않았습니다.");
	        return false; // 폼 제출을 막습니다.
	    }
	
	    return true; // 폼 제출을 허용합니다.
	}

	var originalTextareaValue; // 전역 변수로 원래의 textarea 값 저장
	
	function revertDivBorder(divId) {
	    var targetDiv = document.getElementById(divId);
	    targetDiv.style.border = "2px solid #FFC4A3";
	}
	
	function changeDivBorder(divId) {
	    var targetDiv = document.getElementById(divId);
	    targetDiv.style.border = "2px solid blue";
	}
	
	function activateTextarea(divId) {
	    var noticeListDiv = document.getElementById(divId);
	    var textarea = noticeListDiv.querySelector('textarea');
	
	 	// 원래의 textarea 값을 저장
	    originalTextareaValue = textarea.value;
	    
	    // textarea를 활성화합니다.
	    textarea.disabled = false;
	}
	
	function cancelEdit(div) {
	    var noticeListDiv = document.getElementById(div);
	    var textarea = noticeListDiv.querySelector('textarea');
	
	    // 원래의 textarea 값을 복원
	    textarea.value = originalTextareaValue;
	
	    // textarea를 비활성화합니다.
	    textarea.disabled = true;
	    
		var findDiv = document.getElementById(div);
		
		var firstBtn = findDiv.querySelector('#firstBtn');
		var secondBtn = findDiv.querySelector('#secondBtn');
		var thirdBtn = findDiv.querySelector('#thirdBtn');
		var fourthBtn = findDiv.querySelector('#fourthBtn');
		
		firstBtn.style.display = 'block';
		secondBtn.style.display = 'block';
		thirdBtn.style.display = 'none';
		fourthBtn.style.display = 'none';
	}
	
	function changeBtnFnc(div) {
		var findDiv = document.getElementById(div);
		
		var firstBtn = findDiv.querySelector('#firstBtn');
		var secondBtn = findDiv.querySelector('#secondBtn');
		var thirdBtn = findDiv.querySelector('#thirdBtn');
		var fourthBtn = findDiv.querySelector('#fourthBtn');
		
		firstBtn.style.display = 'none';
		secondBtn.style.display = 'none';
		thirdBtn.style.display = 'block';
		fourthBtn.style.display = 'block';
		
	}
	
	function goBack() {
		window.history.back();
	}
	
	function pageMoveDeleteFnc(no) {
	  
		var url = './noticedelete.do?no=' + no;
	     
		location.href = url;
	}
	
	function noticeReplyDeleteFnc(no) {
		var noticeNo = document.getElementById('noticeNo').value;
		
		var url = './noticeReplydelete.do?no=' + no +'&noticeNo=' + noticeNo;
	    
		location.href = url;
	}
			
	function editFnc(div) {
		var findDiv = document.getElementById(div);		
		var noticeReplyContent = findDiv.querySelector('#textContent1').value;
		var noticeReplyNo = findDiv.querySelector('#noticeReplyNo1').value;
		var Rno = ${noticeDto.NOTICE_NO};
		
		if (noticeReplyContent.trim() == "") {
			alert("댓글을 입력하지 않았습니다");
			event.preventDefault();
		}else {
			$.ajax({
				url : "/DEMO_Project/board/editNoticeReply.do",
				method : "POST",
				data : {noticeReplyContent : noticeReplyContent, 
					noticeReplyNo : noticeReplyNo}, 
				
				
				
				success: function() {
					// 요청이 성공하면 결과를 화면에 표시
					/* alert('댓글 수정 완료'); */
					/* location.href = "listOne3.do?no=" + Rno; */
					
					var noticeListDiv = document.getElementById(div);
				    var textarea = noticeListDiv.querySelector('textarea');
			
				    // 원래의 textarea 값을 복원
				    textarea.value = noticeReplyContent;
			
				    // textarea를 비활성화합니다.
				    textarea.disabled = true;
				    
					var findDiv = document.getElementById(div);
					
					var firstBtn = findDiv.querySelector('#firstBtn');
					var secondBtn = findDiv.querySelector('#secondBtn');
					var thirdBtn = findDiv.querySelector('#thirdBtn');
					var fourthBtn = findDiv.querySelector('#fourthBtn');
					
					firstBtn.style.display = 'block';
					secondBtn.style.display = 'block';
					thirdBtn.style.display = 'none';
					fourthBtn.style.display = 'none';
					
					var targetDiv = document.getElementById(div);
				    targetDiv.style.border = "2px solid #FFC4A3";
					
					console.log(Rno);
					
				},
				error: function() {
					alert('실패');
		         }
			});
			
		}	
	} 
</script>
</html>