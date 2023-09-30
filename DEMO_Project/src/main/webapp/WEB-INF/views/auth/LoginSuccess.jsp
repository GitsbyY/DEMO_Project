<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>LoginPage</title>
	
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

body {
  display: flex;
  align-items: center;
  justify-content: center;
  text-align: center;
}
div {
	display: block;
	align-items: center;
}

#imgContainer{
	height: 300px;
	width: 300px;
}

#loginBtn > button{
	height: 40px;
	width: 300px;
	margin-top: 40px;
	border: none;
	background-color: #FFC4A3;
	font-size: 16px;
	font-weight: bold; 
}

.boxSnsJoin{
	clear: both; /* clear:both 추가 */
	margin-top: 40px;
}

#DaengNaverLoginBtn > button{	
	background-color: #1EC800;
	height: 40px;
	width: 300px;
	border: none;
	font-size: 16px;
	font-weight: bold;
	margin-top: 5px; 
}
#DaengKakaoLoginBtn > button{	
	background-color: #FEF01B;
	height: 40px;
	width: 300px;
	border: none; 
	margin-top: 5px;
	font-size: 16px;
	font-weight: bold;
}

</style>

</head>

<body>
	
	
			
	<div class="boxSnsJoin">
		<div id="imgContainer">
			<img alt="회원가입축하" src="/DEMO_Project/resources/img/welcomeImg.png">
		</div>
		<div id="loginBtn">
		<p><span>회원가입이 성공하였습니다!</span></p>
		</div>
	</div>

	
</body>
	
<script type="text/javascript">
//3초(3000ms) 뒤에 다른 페이지로 이동
setTimeout(function () {
	// 다른 페이지로 이동할 URL을 설정
	window.location.href = './login.do';
}, 3000); // 3초
	
</script>

</html>
