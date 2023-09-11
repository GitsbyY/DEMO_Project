<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
#loginText{
	margin-top: 30px;
	text-align: left;
	color: #FFC4A3;
}
.inputTagWrap > #inputId, #inputPassword{
	height: 30px;
	width: 240px;
	margin-top: 3px;
}
#loginBtn > button{
	height: 30px;
	width: 240px;
	margin-top: 40px;
	border: none;
	background-color: #FFC4A3; 
}
.DaengBtn{
	float: left;
	border: none;
	background-color: window;
	font-size: 8px;
	margin-right: 5px;
	margin-top: 2px;
}
.boxSnsJoin{
	clear: both; /* clear:both 추가 */
	margin-top: 40px;
}

#DaengNaverLoginBtn > button{	
	background-color: #1EC800;
	height: 30px;
	width: 240px;
	border: none; 
}
#DaengKakaoLoginBtn > button{	
	background-color: #FEF01B;
	height: 30px;
	width: 240px;
	border: none; 
	margin-top: 5px;
}
</style>
	
	<script type="text/javascript">
	
	</script>
</head>

<body>
	
	<div>
		<div>
			<h1 style="text-align: left; color: #FFC4A3;">DAENGDAENG</h1>
			<div id="loginText">Login</div>
			<div class="inputTagWrap">
				<div id="inputIdDiv" class="inputTagWrap">
					<input id="inputId" type="text" placeholder="아이디를 입력해주세요."> 
				</div>
				<div id="inputPasswordDiv" class="inputTagWrap">
					<input id="inputPassword" type="password" placeholder="비밀번호를 입력해주세요.">
				</div>
			</div>
			<div id="loginBtn">
				<button type="submit">DAENGDAENG 로그인</button>
			</div>
			<div class="DaengBtnWrap">
				<div>
					<button type="button" id="DaengJoinBtn" class="DaengBtn">회원가입</button>
				</div>
				<div>
					<button type="button" id="DaengIdFindBtn" class="DaengBtn">ID 찾기</button>
				</div>
				<div>
					<button type="button" id="DaengPwFindBtn" class="DaengBtn">비밀번호 찾기</button>
				</div>
			</div>
			
			<div class="boxSnsJoin">
				<div class="boxSnsLink" id="DaengNaverLoginBtn">
					<button type="button">Naver 로그인</button>
				</div>
				<div class="boxSnsLink" id="DaengKakaoLoginBtn">
					<button type="button">Kakao 로그인</button>
				</div>
			</div>
		</div>
	</div>
	
</body>

</html>
