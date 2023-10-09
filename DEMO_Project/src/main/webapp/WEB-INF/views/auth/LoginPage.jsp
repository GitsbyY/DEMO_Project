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
	
}

#fullWrap {
	display: flex;
	align-items: center;
	justify-content: center;
	text-align: center;
	margin-top: 145px;
}

div {
	display: block;
	align-items: center;
}

.loginWrap {
	border: 1px solid grey;
	border-radius: 4px;
	width: 537px;
	height: 250px;
}

.inputTagWrap>#inputId, #inputPassword {
	height: 50px;
	width: 362px;
	margin-top: 3px;
	padding-left: 10px;
}

#loginBtn>button {
	height: 50px;
	width: 375px;
	margin-top: 10px;
	border: none;
	background-color: #FFC4A3;
	font-size: 16px;
	font-weight: bold;
	cursor: pointer;
}

.DaengBtn {
	float: left;
	border: none;
	background-color: window;
	font-size: 12px;
	margin-right: 20px;
	margin-top: 3px;
	font-weight: bold;
}

.boxSnsJoin {
	clear: both; /* clear:both 추가 */
	margin-top: 40px;
}

#DaengNaverLoginBtn>button {
	background-color: #1EC800;
	height: 50px;
	width: 375px;
	border: none;
	font-size: 16px;
	font-weight: bold;
}

#DaengKakaoLoginBtn>button {
	background-color: #FEF01B;
	height: 50px;
	width: 375px;
	border: none;
	margin-top: 5px;
	font-size: 16px;
	font-weight: bold;
}

#warning {
	font-size: 5px;
	color: red;
	text-align: left;
	margin-left: 82px;
}

button.DaengBtn:hover {
	color: #FFAB7C;
	cursor: pointer;
}
</style>

</head>

<body>
	<div id="fullWrap" >
	
		<form action="loginCtr.do" method="post" style="margin-bottom: 350px;">
			<div>
				<p style="font-size : 54px; font-weight:bold; text-align: center; color: #FFC4A3; cursor: pointer; margin-bottom: 30px;"
					onclick="location.href='/DEMO_Project/auth/login.do'">DAENGDAENG</p>
				
				<div class="loginWrap">
				<div class="inputTagWrap" style="margin-top: 20px; margin-bottom: 10px;">
					<div id="inputIdDiv" class="inputTagWrap">
						<input id="inputId" name="memberId" type="text" 
							placeholder="아이디를 입력해주세요." style="margin-bottom: 5px;"> 
					</div>
					<div id="inputPasswordDiv" class="inputTagWrap">
						<input id="inputPassword" name="memberPassword" 
							type="password" placeholder="비밀번호를 입력해주세요.">
					</div>
				<c:if test="${not empty loginFail}">
					<div id="warning">
						정보가 일치하지 않습니다.
					</div>
				</c:if>
				
				
					
				</div>
				<div id="loginBtn">
					<button type="submit">DAENGDAENG 로그인</button>
				</div>
				</div>
				
				<div class="DaengBtnWrap" style="margin-top: 10px; margin-left: 3px;">
					<div>
						<button type="button" id="DaengJoinBtn" class="DaengBtn" 
							onclick="joinFnc();" style="margin-left: 170px;">회원가입</button>
					</div>
					<div>
						<button type="button" id="DaengIdFindBtn" class="DaengBtn" 
							onclick="findId();">ID 찾기</button>
					</div>
					<div>
						<button type="button" id="DaengPwFindBtn" class="DaengBtn" 
							onclick="findPwd();">비밀번호 찾기</button>
					</div>
				</div>
				
	<!-- 			<div class="boxSnsJoin"> -->
	<!-- 				<div class="boxSnsLink" id="DaengNaverLoginBtn"> -->
	<!-- 					<button type="button">Naver 로그인</button> -->
	<!-- 				</div> -->
	<!-- 				<div class="boxSnsLink" id="DaengKakaoLoginBtn"> -->
	<!-- 					<button type="button">Kakao 로그인</button> -->
	<!-- 				</div> -->
			</div>
		</form>
	</div>

</body>
	
<script type="text/javascript">
	function joinFnc() {
		location.href = "./addm.do";
	}
	
	function findId() {
		location.href = "./findId.do";
	}
	
	function findPwd() {
		location.href = "./findPassword.do";
	}

	
</script>

</html>
