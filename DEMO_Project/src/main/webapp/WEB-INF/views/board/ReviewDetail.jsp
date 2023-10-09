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
   background-color: #FFC4A3;
   font-weight: bold;
   border: none;
   color: white;
}
#listBtn{
	background-color: #FFC4A3;
	font-weight: bold;
	border: none;
	color: white;
	width: 65px;
	margin-bottom: 30px;
	cursor: pointer;
}
.reviewReplyDiv{
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
.reviewReplyName{
	text-align: left;
	margin-left: 25px;
	margin-top: 5px;
	margin-bottom: 10px;
	font-weight: bold;
	width: 200px;
}
.submit, .edit{
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
#reviewListDiv{
	
}
textarea {
	overflow: hidden;
}
#reviewReplyTitle{
	clear: both;
	font-size: 24px;
	font-weight: bold;
	margin-bottom: 10px;
}
</style>
<meta charset="UTF-8">
<title>후기남겨요 상세페이지</title>
<link rel="stylesheet" type="text/css" href="/DEMO_Project/resources/css/main.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
               <td id="Rno" class="tdClass">${reviewDto.REVIEW_NO}</td>
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
               <input type="hidden" name="reviewContent" value="${reviewDto.REVIEW_CONTENT}">
               </td>
               
            </tr>                        
         </table>
      </div>
      <div id="btnDiv">
         <input id="listBtn" type="button" value="목록으로" 
         onclick="goBack();">
         <c:choose>            
            <c:when test="${sessionScope.member.memberNo eq reviewDto.MEMBER_NO}">
               <input type="hidden" name="no" value="${reviewDto.REVIEW_NO}">
               <input style="cursor: pointer;" class="rightBtn" type="submit" value="수정">
               <input style="cursor: pointer;" class="rightBtn" type="button" value="삭제" 
                  onclick='pageMoveDeleteFnc(${reviewDto.REVIEW_NO});'>
            </c:when>
            <c:when test="${sessionScope.member.memberNo eq '1'}">
               <input type="hidden" name="no" value="${reviewDto.REVIEW_NO}">
               <input type="hidden" name="memberNo" value="${reviewDto.MEMBER_NO}">               
               <input style="cursor: pointer;" class="rightBtn" type="button" value="삭제" 
                  onclick='pageMoveDeleteFnc(${reviewDto.REVIEW_NO});'>
            </c:when>
            <c:otherwise>
               
            </c:otherwise>
         </c:choose>         
      </div>
      </form>

	<div id="reviewReplyTitle">댓글</div>
		
      <c:forEach items="${reply}" var="reply" varStatus="loop">
	      <div class="reviewReplyDiv" id="reviewReplyDiv${loop.index}">
	      	<div class="reviewReplyName">
	      		${reply.MEMBER_NAME}
	      	</div>
	      		
	      	<div id="dateDiv">
		      		<fmt:formatDate pattern="yyyy-MM-dd HH:mm" 
	                     value="${reply.REVIEW_REPLY_CRE_DATE}"/>
            </div>  
	      	<div id="reviewListDiv">
	      		<textarea id="textContent" disabled="disabled" class="replyText" rows="" cols="" name="reviewReplyContent">${reply.REVIEW_REPLY_CONTENT}</textarea>
	      		<input type="hidden" name="reviewReplyContent" value="${reply.REVIEW_REPLY_CONTENT}">
	      		<input id="reviewReplyNo1" type="hidden" name="reviewReplyNo" value="${reply.REVIEW_REPLY_NO}">
	      		                        		      			
	      		<c:choose>
					<c:when test="${sessionScope.member.memberNo eq reply.MEMBER_NO}">
						<input id="firstBtn" class="edit" type="button" value="삭제" 
	      					onclick="reviewReplyDeleteFnc(${reply.REVIEW_REPLY_NO});" 
	      					style="display: block; cursor: pointer;">
	      				<button id="secondBtn" class="edit" type="button" 
	      					style="display: block;" onclick="changeBtnFnc('reviewReplyDiv${loop.index}'); changeDivBorder('reviewReplyDiv${loop.index}'); activateTextarea('reviewReplyDiv${loop.index}');">수정</button>
	      				<button id="thirdBtn" class="submit" type="button" 
	      					style="background-color: red; display: none;" onclick="cancelEdit('reviewReplyDiv${loop.index}'); revertDivBorder('reviewReplyDiv${loop.index}');">취소</button>
	      				<button id="fourthBtn" class="submit" type="button" 
	      					style="background-color: red; display: none;" onclick="editFnc('reviewReplyDiv${loop.index}');">등록</button>							
					</c:when>
					<c:when test="${sessionScope.member.memberNo eq '1'}">
						<input style="cursor: pointer;" class="submit" type="button" value="삭제" 
	      					onclick="reviewReplyDeleteFnc(${reply.REVIEW_REPLY_NO});">	      										
					</c:when>
					<c:otherwise>		
					</c:otherwise>
				</c:choose>	      			      		
	      	</div>
	      
	      </div>
      </c:forEach>
       
       
		<form action="./write.do" method="post" onsubmit="return submitReplyForm();">
		<div id="replyText" class="reviewReplyDiv">
      	<div class="reviewReplyName">
      		${sessionScope.member.memberName}
      	</div>
      	<input type="hidden" name="reviewNo" value="${reviewDto.REVIEW_NO}" id="reviewNo">
        <input type="hidden" name="memberNo" value="${sessionScope.member.memberNo}"> 
      	<textarea id="writeReviewReplyContent" class="replyText" rows="2" cols="20" name="reviewReplyContent"></textarea>
      	<div>
      		<!-- <input class="submit" type="button" value="등록"> -->
      		<button class="edit" type="submit">등록</button>
      	</div>
      
		</div>
		</form>                          
   </div>
  
   <jsp:include page="/WEB-INF/views/Footer.jsp"/>
</body>
<script type="text/javascript">
	function submitReplyForm() {
	    var reviewReplyContent = document.getElementById('writeReviewReplyContent').value;
	
	    // 댓글 내용이 공백인지 확인
	    if (reviewReplyContent.trim() === "") {
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
	    var reviewListDiv = document.getElementById(divId);
	    var textarea = reviewListDiv.querySelector('textarea');

	 	// 원래의 textarea 값을 저장
	    originalTextareaValue = textarea.value;
	    
	    // textarea를 활성화합니다.
	    textarea.disabled = false;
	}
	
	function cancelEdit(div) {
	    var reviewListDiv = document.getElementById(div);
	    var textarea = reviewListDiv.querySelector('textarea');

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
		
		var editButtons = document.querySelectorAll('.edit'); // 클래스가 'edit 모든 요소를 선택합니다.

	    editButtons.forEach(function(button) {
	        button.disabled = false; 
	    });
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
		
		var editButtons = document.querySelectorAll('.edit'); // 클래스가 'edit 모든 요소를 선택합니다.

	    editButtons.forEach(function(button) {
	        button.disabled = true; 
	    });
	    
		
	}

	function goBack() {
		location.href='/DEMO_Project/board/review.do';
	}
   
	function pageMoveDeleteFnc(no) {
      
		var reviewNo = document.getElementById('reviewNo').value;
		
		if (confirm("정말로 삭제 하시겠습니까?")) {        
			var url = './reviewdelete.do?no=' + no;
	         
			location.href = url;
	    }
		
		
	}
   
	function reviewReplyDeleteFnc(no) {		
						
		var reviewNo = document.getElementById('reviewNo').value;
	    
	    if (confirm("정말로 삭제 하시겠습니까?")) {        
	        var url = './reviewReplydelete.do?no=' + no +'&reviewNo=' + reviewNo;
	        location.href = url;
	    }  		
		
	}
	
	function editFnc(div) {
		var findDiv = document.getElementById(div);
		textContent
		var reviewReplyContent = findDiv.querySelector('#textContent').value;
		var reviewReplyNo = findDiv.querySelector('#reviewReplyNo1').value;
		var Rno = ${reviewDto.REVIEW_NO};
		
		if (reviewReplyContent.trim() == "") {
			alert("댓글을 입력하지 않았습니다");
			event.preventDefault();
						
		}else {
			$.ajax({
				url : "/DEMO_Project/board/editReviewReply.do",
				method : "POST",
				data : {reviewReplyContent : reviewReplyContent, 
					reviewReplyNo : reviewReplyNo}, 
				
				
				
				success: function() {
					// 요청이 성공하면 결과를 화면에 표시
					
					
					var reviewListDiv = document.getElementById(div);
				    var textarea = reviewListDiv.querySelector('textarea');
			
				    // 원래의 textarea 값을 복원
				    textarea.value = reviewReplyContent;
			
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
					
					var editButtons = document.querySelectorAll('.edit'); // 클래스가 'edit 모든 요소를 선택합니다.

				    editButtons.forEach(function(button) {
				        button.disabled = false; 
				    });
					
				},
				error: function() {
					alert('실패');
	             }
			});
		}				
	}
</script>
</html>