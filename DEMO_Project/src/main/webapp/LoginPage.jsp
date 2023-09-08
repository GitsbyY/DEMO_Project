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
.DaengBtn{
	float: left;
}
.boxSnsJoin{
	clear: left;
}
</style>
	
	<script type="text/javascript">
	
	</script>
</head>

<body>
	
	<div>
		<div>
			<h1>DAENGDAENG</h1>
			<div>Login</div>
			<div id="inputTagWarpId" class="inputTagWrap">
				<div id="inputId" class="inputTagWrap">
					<input type="text" placeholder="아이디를 입력해주세요."> 
				</div>
				<div id="inputPassword" class="inputTagWrap">
					<input type="password" placeholder="비밀번호를 입력해주세요.">
				</div>
			</div>
			<div>
				<button type="submit">DAENGDAENG 로그인</button>
			</div>
			<div id="DaengBtnWrap">
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
				<div class="boxSnsLink">
					<button type="button" id="DaengPwFindBtn" class="DaengBtn">Naver 로그인</button>
				</div>
				<div class="boxSnsLink">
					<button type="button" id="DaengPwFindBtn" class="DaengBtn">Kakao 로그인</button>
				</div>
			</div>
		</div>
	</div>
	
</body>

</html>
