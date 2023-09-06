<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>	
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원정보 수정</title>
	
<script type="text/javascript" src="/SpringHome/resources/js/jquery-3.7.1.js">
</script>
<script type="text/javascript">
// document on load -> 이미 다 존재하는 상태에서 실행한다.
$(document).ready(function(){
	//a 태그 중에서 시작하는 글자가 delete라는 걸 다 찾아라
	//.on은 이벤트 시작하는 것 function의 e는 event
	$("a[id^='delete']").on("click", function(e){
		e.preventDefault();
		//$(this) -> java의 this를 jQuery화 시켜서 사용 할 수 있게 만든다.
		deleteFile($(this));
	});
});

//pageMoveDeleteFnc
function deleteFile(obj){
	obj.parent().remove();
}

function addFileFnc(){
	var obj = $('#fileContent');
	var htmlStr = "";
	
	htmlStr += '<div>';
	htmlStr += '<input type="hidden" id="fileIdx" name="fileIdx" value="">';
	htmlStr += '<input type="file" id="file0" name="file0" value="">';
	htmlStr += '<a href="#this" id="delete0" onclick="addFileFnc();">삭제</a><br>';
	htmlStr += '</div>';
	
	
	obj.html(htmlStr);
	//이벤트 리스너처럼 만들어서 내부적으로 만들 수 있다.
	//기존에 있는 delete 파일을 재활용한다
	$('a[id^="delete"]').on('click', function(e){
		e.preventDefault();
		deleteFile($(this));
	});
	
}
	

function pageMoveListFnc() {
	location.href = "./list.do";
}

function pageMoveDeleteFnc(no) {
	var url = './delete.do?no=' + no;
	
	location.href = url;
}
	
</script>
</head>
<body>

	<jsp:include page="/WEB-INF/views/Header.jsp"/>
	<h1>회원정보 수정</h1>
<!-- 	조건을 만들어서 전송을하게 만들어야한다. 지금 시점은 모든 정보가 옮겨진다. -->
<!-- 	조건을 설정해서 필요한 정보만 나타나게 해야한다. -->
	<form action='./updateCtr.do' method='post' enctype="multipart/form-data">
		<input type='hidden' name='no' value='${memberDto.no}' readonly>
		이름: <input type='text' name='name' value='${memberDto.name}'><br>
		이메일: <input type='text' name='email' value='${memberDto.email}'><br>
		비밀번호: <input type="password" name="password" value=""
			required="required"><br>
			
		첨부파일:
      <div id='fileContent'>
         <div>
         <c:choose>
            <c:when test="${empty fileList}">
               <input type="hidden" id="fileIdx" name="fileIdx" value=""> 
               <input type="file" id="file0" name="file0" value=""> 
               <a href="#this" id="delete0" onclick="addFileFnc();">삭제</a><br>
            </c:when>
            <c:otherwise>
               <c:forEach var="row" items="${fileList}" varStatus="obj">
				<!-- 이 값이 있는 건 기존에 있던 것이고 없는 것은 새로 추가 된 것이다 -->
                  <input type="hidden" id="fileIdx_${obj.index}" 
                     name="fileIdx" value ="${row.IDX}">
                   <img alt="image not found" 
                   	src="<c:url value='/img/${row.STORED_FILE_NAME}'/>"><br>
                   ${row.ORIGINAL_FILE_NAME}
                   <input type="file" id="file_${obj.index}"
                      name="file_${obj.index}">
                   (${row.FILE_SIZE}kb)
                   <a href="#this" id="delete_${obj.index}">삭제</a><br>
               </c:forEach><!-- 지연로딩이다. -->
            </c:otherwise>
         </c:choose>
         </div>
      </div>
			
		가입일: <fmt:formatDate value="${requestScope.memberDto.createDate}" 
			pattern="yyyy년 mm월 dd일 hh:mm:ss" /><br/>
		
		<input type='button' value='파일추가' onclick='addFileFnc();'>	
		<input type='submit' value='저장하기'>
		<input type='button' value='삭제하기' onclick='pageMoveDeleteFnc(${memberDto.no});'>
		<input type='button' value='뒤로가기구현해보자'>	
		<input type='button' value='회원목록으로' onclick='pageMoveListFnc();'>
	</form>
	
	<jsp:include page="/WEB-INF/views/Tail.jsp"/>
</body>
</html>
