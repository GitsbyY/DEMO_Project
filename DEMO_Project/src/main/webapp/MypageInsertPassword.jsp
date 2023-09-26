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
	border: 1px solid black;
	background-color : #FFC4A3;
	border-collapse: collapse;
	font-size: 24px;
	margin-bottom: 120px;
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
}

#submitButton{
	border: none;
	margin-left : 420px;
	color: black;
	border-radius: 3px;
	background-color: #FFBA69;
}

.errorOutline {
	border: 1px solid red;
}

.focusOutline {
	outline: 2px solid #0080ff;
}

.errTxtRed {
	font-size: 11px;
	margin-top: 1px;
}
</style>
<meta charset="UTF-8">
<title>마이댕댕 메인</title>
<link rel="stylesheet" type="text/css"
	href="/DEMO_Project/resources/css/main.css">
</head>
<body>
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
							type="text" value="" />
						<div class="txtErrorArea" style="">
							<p class="errTxtRed" id="passwordCheckMessage"
								aria-live="assertive"></p>
						</div>
					</div>

					<form action="" method="POST">
						<div id="checkPasswordInfo">
							<input id="submitButton" type="submit" name="deleteMemberInfo" value="확인" />
						</div>
					</form>
				</div>
				
			</div>

		</div>
	</div>


	<jsp:include page="/WEB-INF/views/Footer.jsp" />
</body>
<script type="text/javascript">
	function backToListFnc() {

		var url = './mypageProfile.do';

		location.href = url;
	}

	function showPetInfo(memberNo) {

		var url = './MypageProfileEditPet.do?memberNo=' + memberNo;

		location.href = url;

	}
</script>
</html>