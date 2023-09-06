<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원 등록</title>
	<script type="text/javascript" src="/SpringHome/resources/js/MemberForm.js">
// src="/SpringHome/resources/js/MemberForm.js"
	</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/Header.jsp"/>
	
	<h1>회원등록</h1>						
					<!-- 	메서드는 무조건 post(용량이슈) 인크립트타입 -> 캡슐 -->
	<form action='./addCtr.do' method='post' enctype="multipart/form-data">
		이름: <input type='text' name='name'><br> 
		이메일: <input type='text' name='email'><br> 
		암호: <input type='password' 	name='password'><br>
				<!-- 	파일첨부를 명시한다 -->
		파일: <input type="file" name="file"><br>
			<input type='submit' value='추가'>
			<input type='button' value='뒤로가기' onclick="pageMoveListFnc();">
	</form>
	
	<jsp:include page="/WEB-INF/views/Tail.jsp"/>
</body>
</html>