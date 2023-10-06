<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>    
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>ID찾기</title>
	
<style type="text/css">
html, body, div, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote,
pre, a, abbr, address, big, cite, code, del, dfn, em, font, img, ins, q,
s, samp, small, strike, strong, sub, sup, tt, var, b, u, i, ul, ol, li,
dl, dt, dd, table, caption, tbody, tfoot, thead, tr, th, td, fieldset,
form, label, legend, input, button, textarea, select {
	margin: 0;
	padding: 0;
}
html, body {
  height: 100%;
  margin: 0;
  padding: 0;
}
form{
	margin-top: 200px;
}
body {
  display: flex;
  /* align-items: center; */
  justify-content: center;
  text-align: center;
}
div {
	display: block;
	align-items: center;
}
#findIdText{
	margin-top: 30px;
	text-align: left;
	color: #FFC4A3;
}
.inputTagWrap > #inputEmail, #inputPhone{
	height: 40px;
	width: 300px;
	margin-top: 3px;
}
#findIdBtn > button{
	height: 40px;
	width: 300px;
	margin-top: 40px;
	border: none;
	background-color: #FFC4A3;
	float: left;
	cursor: pointer; 
}
#warning{
	font-size: 5px;
	color: red;
	text-align: left;
}
#findIdResult{
	margin-top: 30px;
	height: 30px;
	font-weight: bold;
	font-size: 20px;
}
</style>
<script type="text/javascript" src="/DEMO_Project/resources/js/jquery-3.7.1.js">
</script>
</head>

<body>
	
	<form action="login.do" method="get">
		<div>
			<h1 style="text-align: center; color: #FFC4A3; cursor: pointer;"
				onclick="location.href='/DEMO_Project/auth/login.do'">DAENGDAENG</h1>
			<div id="findIdText">ID 찾기 결과</div>
				<div id="findIdResult">
					회원님의 ID는 <span id="visibleId">${member.getMemberId().substring(0, 3)}</span> 입니다
				</div>
							
			<div id="findIdBtn">
				<button type="submit">로그인 하러가기</button>
			</div>
		</div>
	</form>
	
</body>
	
<script type="text/javascript">
	
	document.addEventListener('DOMContentLoaded', function() {
	    var visibleId = document.getElementById('visibleId');
	    var hiddenPart = '*'.repeat(${fn:length(member.memberId) - 3});
	    visibleId.innerHTML += hiddenPart;
	});
	
</script>

</html>
