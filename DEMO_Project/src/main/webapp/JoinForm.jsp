<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>회원가입</title>

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
/* 	display : block; */
/*     width: 100%; */
/*     height: 100%; */
/*     position: relative; */
/* 	위에는 원래 내가 했던 것 */
	display: flex;
    justify-content: center;
    align-items: center;
/*      height: 100vh; */ /*->뷰포트의 100% 높이를 사용하여 요소를 화면 높이의 100% 만큼 표시 */
    margin: 0;
}
.formContainer{
	width: 600px;
	background-color: grey;
	display: flex;
    justify-content: center;
    align-items: center;
}
button {
		cursor: pointer;
}
p {
	font-size: 9px;
}

.joinWrap{
	width: 400px;
	background-color : none;
	display: block;
	align-items: center; /* 아이템들을 수평 중앙 정렬 */
}
.inputLabel {
	margin-top: 7px;
	margin-bottom: 3px;
	font-size: 11px;
}
.inputUser {
	position: relative;
	height: 25px;
	display: inline-block;
	border: 2px solid #d9d9d9;
	border-radius: 2px;
	box-sizing: border-box;
	width: 80%;
	font-size: 12px;
}

.inputWithButton > .btnDel {
  /* button 스타일 */
  position: absolute;
  right: 5px;
  border: 1px solid purple;
  background-color: black;
  background: url('/DEMO_Project/src/main/webapp/resources/img/deleteBtn.png') no-repeat;
  background-size: 20px 20px;
  width: 25px;
  height: 25px;
  cursor: pointer;
}
#verifyBtn{
	text-align: right;
}


</style>

<script type="text/javascript">
	
</script>
</head>

<body>
<div>
	<h1 style="text-align: left; color: #FFC4A3;">DAENGDAENG</h1>
	<div class="formContainer">
		<form action="join" method="post">
			<div class="joinWrap">
				
				<!-- 		아이디div		 -->
				<div class="joinId">
					<div class="inputLabel">
						<label for="UserJoinId">아이디</label>
					</div>
					<div class="inputWithButton">
						<input type="text" class="inputUser" id="UserJoinId" name="userId"
							placeholder="영문 4자 이상, 최대 20자" value="${UserJoinId}" />
						<button type="button" class="btnDel"></button>	
					</div>
				</div>
				<div class="txtErrorArea" style="">
					<p class="errTxtRed" id="UserJoinMessageId" aria-live="assertive"></p>
				</div>

				<!-- 				<div> -->
				<!-- 					<button type="button" style="color: gray;" class="existCheck" -->
				<!-- 						onclick="valideId()" disabled>중복확인</button> -->
				<%-- 					<p>${existId}</p> --%>
				<!-- 				</div> -->
				<!-- 		비밀번호div		 -->
				<div class="joinPwd">
					<div class="inputLabel">
						<label for="UserJoinPwd">비밀번호</label>
					</div>
					<div class="inputWithButton">
						<input type="password" class="inputUser" id="UserJoinPwd"
							name="userPwd" placeholder="숫자, 영문, 특수문자 포함 최소 8자 이상" />
						<button type="button" class="btnDel"></button>
					</div>
				</div>

				<div class="txtErrorArea" style="">
					<p class="errTxtRed" id="UserJoinMessagePwd" aria-live="assertive"></p>
				</div>
				<!-- 		비밀번호확인div		 -->
				<div class="joinPwdConfirm">
					<div class="inputLabel">
						<label for="UserJoinPwdConfim">비밀번호 확인</label>
					</div>
					<div class="inputWithButton">
						<input class="inputUser" type="password" name="UserPwdConfirm"
							id="UserJoinPwdConfim" placeholder="숫자, 영문, 특수문자 포함 최소 8자 이상" />
						<button type="button" class="btnDel"></button>
					</div>
				</div>
				<div class="txtErrorArea" style="">
					<p class="errTxtRed" id="UserJoinMessagePwdConfirm"
						aria-live="assertive"></p>
				</div>
				<!-- 		이름div		 -->
				<div class="joinUserName">
					<div class="inputLabel">
						<label for="UserJoinUserName">이름</label>
					</div>
					<div class="inputWithButton">
						<input class="inputUser" type="text" name="userName"
							id="UserJoinUserName" placeholder="이름 입력" />
						<button type="button" class="btnDel"></button>
					</div>
				</div>
				<div class="txtErrorArea" style="">
					<p class="errTxtRed" id="UserJoinMessageUserName"
						aria-live="assertive"></p>
				</div>
				<!-- 		생년월일div		 -->
				<div class="joinUserBirth">
					<div class="inputLabel">
						<label for="UserJoinUserBirth">생년월일</label>
					</div>
					<div class="inputWithButton">
						<input class="inputUser" type="text" name="userBirth"
							id="UserJoinUserBirth" placeholder="주민등록번호 앞자리 6글자를 입력 해 주세요" />
						<button type="button" class="btnDel"></button>
					</div>
				</div>
				<div class="txtErrorArea" style="">
					<p class="errTxtRed" id="UserJoinMessageUserBirth"
						aria-live="assertive"></p>
				</div>
				<!-- 		휴대폰번호div		 -->
				<div class="joinPhoneNum">
					<div class="inputLabel">
						<label for="UserPhoneNum">휴대폰 번호</label>
					</div>
					<div class="inputWithButton">
						<input class="inputUser" type="text" name="phoneNum"
							id="UserPhoneNum" placeholder="휴대폰 번호 입력" />
						<button type="button" class="btnDel"></button>
					</div>
				</div>
				<div class="txtErrorArea" style="">
					<p class="errTxtRed" id="UserJoinMessageUserPhoneNum"
						aria-live="assertive"></p>
				</div>
				<div id="verifyBtn">
					<button type="button" class="phoneNumVerify"
						onclick="performVerFnc()">본인인증</button>
				</div>
				<!-- 			인증번호와 이름 -> 본인인증이 완료되었습니다. -->
				<div class="joinVerifiedUser">
					<div class="inputLabel">
						<label for="UserPhoneNumVerifiedNum">인증된 번호</label>
					</div>
					<div class="joinPhoneNumVerifiedNum"
						id="joinUserPhoneNumVerifiedNum">
						<input class="inputUser" type="text" name="userName"
							id="UserPhoneNumVerifiedNum" disabled />
					</div>
				</div>
				<!-- 		이메일div		 -->
				<div class="joinEmail">
					<div class="inputLabel">
						<label for="UserJoinEmail">이메일 주소</label>
					</div>
					<div class="inputWithButton">
						<input class="inputUser" type="text" name="email"
							id="UserJoinEmail" placeholder="이메일 주소 입력" />
						<button type="button" class="btnDel"></button>
					</div>
					<p>아이디나 비밀번호 찾기 시 필요하므로 정확하게 입력해주세요.</p>
				</div>
				<div class="txtErrorArea" style="">
					<p class="errTxtRed" id="UserJoinMessageEmail"
						aria-live="assertive"></p>
				</div>
				<!-- 		닉네임div		 -->
				<div class="joinNickname">
					<div class="inputLabel">
						<label for="joinUserNickname">닉네임</label>
					</div>
					<div class="inputWithButton">
						<input class="inputUser" type="text" name="nickName"
							id="joinUserNickname" placeholder="한글 8자, 영문 16자 까지 가능" />
						<button type="button" class="btnDel"></button>
					</div>
				</div>
				<div class="txt_error_area" style="">
					<p class="err_txt" id="UserJoinMessageUserNickname"
						aria-live="assertive"></p>
				</div>
				<!-- 		주소div		 -->
				<div class="joinAddress">
					<div class="inputLabel">
						<label for="joinUserAddress">주소</label>
					</div>
					<div class="inputWithButton">
						<input class="inputUser" type="text" name="address"
							id="joinUserAddress" placeholder="주소" />
						<button type="button" class="btnDel"></button>
					</div>
				</div>
				<div class="txt_error_area" style="">
					<p class="err_txt" id="UserJoinMessageUserAddress"
						aria-live="assertive"></p>
				</div>
				<!-- 	상세주소div		 -->
				<div class="joinDetailAddress">
					<div class="inputLabel">
						<label for="joinUserDetailAddress">상세주소</label>
					</div>
					<div class="inputWithButton">
						<input class="inputUser" type="text" name="detailAddress"
							id="joinUserDetailAddress" placeholder="상세주소를 입력 해 주세요" />
						<button type="button" class="btnDel"></button>
					</div>
				</div>
				<div class="txt_error_area" style="">
					<p class="err_txt" id="UserJoinMessageUserDetailAddress"
						aria-live="assertive"></p>
				</div>
			</div>
		</form>
	</div>
</div>
</body>

</html>
