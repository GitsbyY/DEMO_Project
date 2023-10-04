<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
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
}
#warning{
	font-size: 5px;
	color: red;
	text-align: left;
}
</style>

</head>

<body>
	
	<form action="findIdCtr.do" method="post">
		<div>
			<h1 style="text-align: center; color: #FFC4A3;"
				onclick="location.href='/DEMO_Project/auth/login.do'">DAENGDAENG</h1>
			<div id="findIdText">ID 찾기</div>
			<div class="inputTagWrap">
				<div id="inputEmailDiv" class="inputTagWrap">
					<input id="inputEmail" name="memberEmail" type="text" 
						placeholder="이메일을 입력해주세요."> 
				</div>
				<div id="inputPasswordDiv" class="inputTagWrap">
					<input id="inputPhone" name="memberPhone" 
						type="text" placeholder="전화번호를 입력해주세요.">
				</div>
			<c:if test="${not empty findFail}">
				<div id="warning">
					정보가 일치하지 않습니다.
				</div>
			</c:if>
			<div id="findIdBtn">
				<button type="submit">확인</button>
			</div>
		</div>
	</form>
	
</body>
	
<script type="text/javascript">
	

	
</script>

</html>
