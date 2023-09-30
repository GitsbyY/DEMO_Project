<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>축하드립니다</title>
	
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

  text-align: center;
}
div {
	display: block;
	align-items: center;
}

.boxSnsJoin{
	clear: both; /* clear:both 추가 */
	margin-top: 440px;
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
		<p><span>로그인 화면으로 돌아갑니다!</span></p>
		</div>
	</div>
	
</body>
	
<script type="text/javascript">
// 3초(3000ms) 뒤에 다른 페이지로 이동
setTimeout(function () {
	// 다른 페이지로 이동할 URL을 설정
	window.location.href = './login.do';
}, 2000); // 3초
	
</script>

</html>
