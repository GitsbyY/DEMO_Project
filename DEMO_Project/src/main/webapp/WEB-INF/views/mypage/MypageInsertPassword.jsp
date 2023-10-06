<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="/DEMO_Project/resources/css/main.css">
<style type="text/css">
html, body, div, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote,
	pre, a, abbr, address, big, cite, code, del, dfn, em, font, img, ins, q,
	s, samp, small, strike, strong, sub, sup, tt, var, b, u, i, ul, ol, li,
	dl, dt, dd, table, caption, tbody, tfoot, thead, tr, th, td, fieldset,
	form, label, legend, input, button, textarea, select {
	margin: 0;
	padding: 0;
}

tr, td {
	border: 1px solid black;
}

/* 버튼 스타일 */
button {
	cursor: pointer;
}

#firstTitle {
	width: 400px;
	height: 50px;
	font-size: 30px;
	font-weight: bold;
	margin-top: 60px;
	margin-left: 10px;
	margin-bottom: 25px;
	display: flex;
}

.titleContainer {
	height: 70px;
}

#checkContainer {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	width: 800px;
	height: 500px;

}

.passwordCheck {
	width: 600px;
	height: 300px;
	background-color : #FFC4A3;
	border-collapse: collapse;
	font-size: 24px;
	margin-bottom: 283px;
	border: none;
	border-radius: 3px;
}

.passwordCheckValueWrap {
	width: 400px;
	text-align: right;
	margin-right: 10px;
	display: flex;
	flex-direction: column;
	align-items: center;
	margin-left: 90px;
	margin-top: 100px;
	border: none;
	border-radius: 3px;
	padding-top: 91px;
}

.passwordCheckName{
	margin-bottom: 10px;
	font-size: 24px;
	font-weight: bold;
	color: white;
}

.passwordCheckValueInput {
	width: 300px;
	text-align: right;
	font-size: 24px;
	height: 25px;
	border: none;
	border-radius: 3px;
}

#submitButton{
	border: 1px solid white;
	margin-left : 420px;
	color: black;
	font-size : 18px;
	font-weight : bold;
	border-radius: 3px;
	background-color: white;
	margin-right: 161px;
}

.errorOutline {
	border: 1px solid red;
}

.focusOutline {
	outline: 2px solid #0080ff;
}

.errTxtRed {
	font-size: 14px;
	margin-top: 2px;
	font-weight: bold;
	text-align: right;
}
</style>
<meta charset="UTF-8">
<title>마이댕댕 메인</title>
<link rel="stylesheet" type="text/css"
	href="/DEMO_Project/resources/css/main.css">
</head>
<body onload="focusInput()">
	<jsp:include page="/WEB-INF/views/Header.jsp" />

	<jsp:include page="/WEB-INF/views/asideMyPage.jsp" />


	<div id="infoWrap">
		<div class="titleContainer">
			<div id="firstTitle"
				style="color: #FFC4A3; margin-top: 50px; margin-bottom: 30px;">
				DAENGDAENG FAMILY
			</div>
		</div>

		<div id="checkContainer">

			<div id="memberInfoContainer">

				<div class="passwordCheck">
					
					<div class="passwordCheckValueWrap">
						<div class="passwordCheckName">
								<label for="pwdCheck">비밀번호를 입력 해 주세요</label>
						</div>
						<input class="passwordCheckValueInput" id="pwdCheck"
							type="password" value="" />
						<div class="txtErrorArea" style="">
							<p class="errTxtRed" id="passwordCheckMessage"
								aria-live="assertive"></p>
						</div>
						<div id="checkPasswordInfo">
							<input id="submitButton" type="button" name="checkPassword" 
								value="확인" onclick="checkPwdFnc()" />
							<input id="hiddenPwd" type="hidden" value="${sessionScope.member.memberPassword}"/>
							<input id="hiddenMemberNo" type="hidden" value="${sessionScope.member.memberNo}"/>
						</div>
						
					</div>

				</div>
				
			</div>

		</div>
	</div>
	
<script type="text/javascript">
function focusInput() {
	document.getElementById("pwdCheck").style.outline = "none"; 
	document.getElementById("pwdCheck").focus();
}
</script>

	<jsp:include page="/WEB-INF/views/Footer.jsp" />
</body>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript">

	function checkPwdFnc() {
		var password = document.getElementById("hiddenPwd").value;
		var inputPassword = document.getElementById("pwdCheck").value;
		var memberNo = document.getElementById("hiddenMemberNo").value;
		var errTxt = document.getElementById("passwordCheckMessage");
		var url = 'MypageProfileEdit.do?memberNo=' + memberNo;
	
	    
		if(password === inputPassword ){
			location.href= url;
		}else{
			errTxt.style.color = "red";
			errTxt.innerHTML = "비밀번호가 일치하지 않습니다.";
		}
	}

</script>
</html>