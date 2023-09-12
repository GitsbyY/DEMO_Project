<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>회원가입</title>



<link rel="stylesheet" type="text/css"
	href="./resources/css/JoinForm.css">
</head>

<body>
	<div>
		<h1 style="text-align: left; color: #FFC4A3; margin-top: 10px;">DAENGDAENG</h1>
		<div class="formContainer">
			<form action="join" method="post">
				<div class="joinWrap">

					<!-- 		아이디div		 -->
					<div class="joinId">
						<div class="inputLabel">
							<label for="userJoinId">아이디</label>
						</div>
						<div class="inputWithButton">
							<input type="text" class="inputUser" id="userJoinId"
								name="userId" placeholder="영문 4자 이상, 최대 20자"
								value="${userJoinId}" />
							<button type="button" class="btnDel"></button>
						</div>
					</div>
					<div class="txtErrorArea" style="">
						<p class="errTxtRed" id="userJoinMessageId" aria-live="assertive"></p>
					</div>

					<!-- 		비밀번호div		 -->
					<div class="joinPwd">
						<div class="inputLabel">
							<label for="userJoinPwd">비밀번호</label>
						</div>
						<div class="inputWithButton">
							<input type="password" class="inputUser" id="userJoinPwd"
								name="userPwd" placeholder="숫자, 영문, 특수문자 포함 최소 8자 이상" />
							<button type="button" class="btnDel"></button>
						</div>
					</div>

					<div class="txtErrorArea" style="">
						<p class="errTxtRed" id="userJoinMessagePwd" aria-live="assertive"></p>
					</div>
					<!-- 		비밀번호확인div		 -->
					<div class="joinPwdConfirm">
						<div class="inputLabel">
							<label for="userJoinPwdConfirm">비밀번호 확인</label>
						</div>
						<div class="inputWithButton">
							<input class="inputUser" type="password" name="userPwdConfirm"
								id="userJoinPwdConfirm" placeholder="숫자, 영문, 특수문자 포함 최소 8자 이상" />
							<button type="button" class="btnDel"></button>
						</div>
					</div>
					<div class="txtErrorArea" style="">
						<p class="errTxtRed" id="userJoinMessagePwdConfirm"
							aria-live="assertive"></p>
					</div>
					<!-- 		이름div		 -->
					<div class="joinUserName">
						<div class="inputLabel">
							<label for="userJoinName">이름</label>
						</div>
						<div class="inputWithButton">
							<input class="inputUser" type="text" name="userName"
								id="userJoinName" placeholder="이름 입력" />
							<button type="button" class="btnDel"></button>
						</div>
					</div>
					<div class="txtErrorArea" style="">
						<p class="errTxtRed" id="userJoinMessageName"
							aria-live="assertive"></p>
					</div>
					<!-- 		생년월일div		 -->
					<div class="joinUserBirth">
						<div class="inputLabel">
							<label for="userJoinBirth">생년월일</label>
						</div>
						<div class="inputWithButton">
							<input class="inputUser" type="text" name="userBirth"
								id="userJoinBirth" placeholder="주민등록번호 앞자리 6글자를 입력 해 주세요" />
							<button type="button" class="btnDel"></button>
						</div>
					</div>
					<div class="txtErrorArea" style="">
						<p class="errTxtRed" id="userJoinMessageBirth"
							aria-live="assertive"></p>
					</div>
					<!-- 		휴대폰번호div		 -->
					<div class="joinPhoneNum">
						<div class="inputLabel">
							<label for="userJoinPhoneNum">휴대폰 번호</label>
						</div>
						<div class="inputWithButton">
							<input class="inputUser" type="text" name="phoneNum"
								id="userJoinPhoneNum" placeholder="휴대폰 번호 입력" />
							<button type="button" class="btnDel"></button>
						</div>
					</div>
					<div class="txtErrorArea" style="">
						<p class="errTxtRed" id="userJoinMessagePhoneNum"
							aria-live="assertive"></p>
					</div>

					<!-- 		이메일div		 -->
					<div class="joinEmail">
						<div class="inputLabel">
							<label for="userJoinEmail">이메일 주소</label>
						</div>
						<div class="inputWithButton">
							<input class="inputUser" type="text" name="email"
								id="userJoinEmail" placeholder="이메일 주소 입력" />
							<button type="button" class="btnDel"></button>
						</div>
						<p>아이디나 비밀번호 찾기 시 필요하므로 정확하게 입력해주세요.</p>
					</div>
					<div class="txtErrorArea" style="">
						<p class="errTxtRed" id="userJoinMessageEmail"
							aria-live="assertive"></p>
					</div>
					<!-- 		닉네임div		 -->
					<div class="joinNickname">
						<div class="inputLabel">
							<label for="userJoinNickname">닉네임</label>
						</div>
						<div class="inputWithButton">
							<input class="inputUser" type="text" name="nickName"
								id="userJoinNickname" placeholder="한글 8자, 영문 16자 까지 가능" />
							<button type="button" class="btnDel"></button>
						</div>
					</div>
					<div class="txt_error_area" style="">
						<p class="err_txt" id="userJoinMessageNickname"
							aria-live="assertive"></p>
					</div>
					<!-- 		주소div		 -->
					<div class="joinAddress">
						<div class="inputLabel">
							<label for="userJoinAddress">주소</label>
						</div>
						<div class="inputWithButton">
							<input class="inputUser" type="text" name="address"
								id="userJoinAddress" placeholder="주소" />
							<button type="button" class="btnDel"></button>
						</div>
					</div>
					<div class="txt_error_area" style="">
						<p class="err_txt" id="userJoinMessageAddress"
							aria-live="assertive"></p>
					</div>
					<!-- 	상세주소div		 -->
					<div class="joinDetailAddress">
						<div class="inputLabel">
							<label for="userJoinDetailAddress">상세주소</label>
						</div>
						<div class="inputWithButton">
							<input class="inputUser" type="text" name="detailAddress"
								id="userJoinDetailAddress" placeholder="상세주소를 입력 해 주세요" />
							<button type="button" class="btnDel"></button>
						</div>
					</div>
					<div class="txt_error_area" style="">
						<p class="err_txt" id="userJoinMessageDetailAddress"
							aria-live="assertive"></p>
					</div>
				</div>

				<div>
					<div class="changeBtn">
						<button type="button" onclick="toDogInfoFnc();">댕댕</button>
					</div>
					<div class="submitBtn">
						<button type="submit" disabled="disabled">회원가입</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
<script type="text/javascript">
	//아이디 인풋과 딜리트 버튼
	var userId = document.getElementById("userJoinId");
	var userIdDeleteButton = document.querySelector(".joinId .btnDel");
	userIdDeleteButton.addEventListener("click", function() {
		userId.value = ""; // 아이디 인풋 값을 비웁니다.
	});

	// 비밀번호 인풋과 딜리트 버튼
	var pwd = document.getElementById("userJoinPwd");
	var pwdDeleteButton = document.querySelector(".joinPwd .btnDel");
	pwdDeleteButton.addEventListener("click", function() {
		pwd.value = ""; // 비밀번호 인풋 값을 비웁니다.
	});

	// 비밀번호 확인 인풋과 딜리트 버튼
	var conPwd = document.getElementById("userJoinPwdConfirm");
	var conPwdDeleteButton = document.querySelector(".joinPwdConfirm .btnDel");
	conPwdDeleteButton.addEventListener("click", function() {
		conPwd.value = ""; // 비밀번호 확인 인풋 값을 비웁니다.
	});

	// 이름 인풋과 딜리트 버튼
	var uName = document.getElementById("userJoinName");
	var uNameDeleteButton = document.querySelector(".joinUserName .btnDel");
	uNameDeleteButton.addEventListener("click", function() {
		uName.value = ""; // 이름 인풋 값을 비웁니다.
	});

	// 생년월일 인풋과 딜리트 버튼
	var birth = document.getElementById("userJoinBirth");
	var birthDeleteButton = document.querySelector(".joinUserBirth .btnDel");
	birthDeleteButton.addEventListener("click", function() {
		birth.value = ""; // 생년월일 인풋 값을 비웁니다.
	});

	// 휴대폰 번호 인풋과 딜리트 버튼
	var mobile = document.getElementById("userJoinPhoneNum");
	var mobileDeleteButton = document.querySelector(".joinPhoneNum .btnDel");
	mobileDeleteButton.addEventListener("click", function() {
		mobile.value = ""; // 휴대폰 번호 인풋 값을 비웁니다.
	});

	// 이메일 인풋과 딜리트 버튼
	var email = document.getElementById("userJoinEmail");
	var emailDeleteButton = document.querySelector(".joinEmail .btnDel");
	emailDeleteButton.addEventListener("click", function() {
		email.value = ""; // 이메일 인풋 값을 비웁니다.
	});

	// 닉네임 인풋과 딜리트 버튼
	var nickName = document.getElementById("userJoinNickname");
	var nickNameDeleteButton = document.querySelector(".joinNickname .btnDel");
	nickNameDeleteButton.addEventListener("click", function() {
		nickName.value = ""; // 닉네임 인풋 값을 비웁니다.
	});

	// 주소 인풋과 딜리트 버튼
	var address = document.getElementById("userJoinAddress");
	var addressDeleteButton = document.querySelector(".joinAddress .btnDel");
	addressDeleteButton.addEventListener("click", function() {
		address.value = ""; // 주소 인풋 값을 비웁니다.
	});

	// 상세주소 인풋과 딜리트 버튼
	var detailAddress = document.getElementById("userJoinDetailAddress");
	var detailAddressDeleteButton = document
			.querySelector(".joinDetailAddress .btnDel");
	detailAddressDeleteButton.addEventListener("click", function() {
		detailAddress.value = ""; // 상세주소 인풋 값을 비웁니다.
	});

	function toDogInfoFnc() {

		window.location.href = 'JoinFormDog.jsp';
	}

	//아이디 div		
	var userId = document.getElementById("userJoinId");
	var errMsgId = document.getElementById("userJoinMessageId");
	//비밀번호 div	
	var pwd = document.getElementById("userJoinPwd");
	var errMsgPwd = document.getElementById("userJoinMessagePwd");
	//비밀번호확인 div	
	var conPwd = document.getElementById("userJoinPwdConfirm");
	var errMsgConPwd = document.getElementById("userJoinMessagePwdConfirm");
	//이름 div	
	var uName = document.getElementById("userJoinName");
	var errMsgUname = document.getElementById("userJoinMessageName");
	//생년월일 div	
	var birth = document.getElementById("userJoinBirth");
	var errMsgbirth = document.getElementById("userJoinMessageBirth");
	//폰번호 div	
	var mobile = document.getElementById("userJoinPhoneNum");
	var errMsgMobile = document.getElementById("userJoinMessagePhoneNum");
	//이메일 div	
	var email = document.getElementById("userJoinEmail");
	var errMsgEmail = document.getElementById("userJoinMessageEmail");
	//별명 div	
	var nickName = document.getElementById("userJoinNickname");
	var errMsgNickName = document.getElementById("userJoinMessageNickname");
	//주소 div	
	var address = document.getElementById("userJoinAddress");
	var errMsgAddress = document.getElementById("userJoinMessageAddress");
	//상세주소 div	
	var detailAddress = document.getElementById("userJoinDetailAddress");
	var errMsgDetailAddress = document
			.getElementById("userJoinMessageDetailAddress");

	// 아이디 div
	userId.addEventListener("blur", handleBlurEventForId);
	userId.addEventListener("focus", handleFocusEventForId);

	// 비밀번호 div
	pwd.addEventListener("blur", handleBlurEventForPwd);
	pwd.addEventListener("focus", handleFocusEventForPwd);

	// 비밀번호 확인 div
	conPwd.addEventListener("blur", handleBlurEventForPwdConfirm);
	conPwd.addEventListener("focus", handleFocusEventForPwdConfirm);

	// 이름 div
	uName.addEventListener("blur", handleBlurEventForuName);
	uName.addEventListener("focus", handleFocusEventForuName);

	// 생년월일 div
	birth.addEventListener("blur", handleBlurEventForBirth);
	birth.addEventListener("focus", handleFocusEventForBirth);

	// 폰번호 div
	mobile.addEventListener("blur", handleBlurEventForMobile);
	mobile.addEventListener("focus", handleFocusEventForMobile);

	// 이메일 div
	email.addEventListener("blur", handleBlurEventForEmail);
	email.addEventListener("focus", handleFocusEventForEmail);

	// 별명 div
	nickName.addEventListener("blur", handleBlurEventForNickName);
	nickName.addEventListener("focus", handleFocusEventForNickName);

	// 	// 주소 div
	// 	address.addEventListener("blur", handleBlurEventForAddress);
	// 	address.addEventListener("focus", handleFocusEventForAddress);

	// 	// 상세주소 div
	// 	detailAddress.addEventListener("blur", handleBlurEventForDetailAddress);
	// 	detailAddress.addEventListener("focus", handleFocusEventForDetailAddress);

	//지역변수 전역변수 확인.
	//영어 정규식 첫글자
	var firstCheck = /^[a-zA-Z].*$/;
	//한글 정규식
	var korCheck = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
	//아이디 영문자 정규식(첫 글자는 영어단어야 한다.)
	//특수문자 반드시 포함
	var idCheck = /[a-zA-Z][a-zA-Z0-9!@#$%^*+=-]{3,19}$/;
	//비밀번호 정규식
	var pwdCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-]).{4,20}$/;
	//email 정규식
	var emailCheck = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
	//닉네임 정규식
	var nickNameCheck = /^([ㄱ-ㅎ|ㅏ-ㅣ|가-힣]{2,8}|.{4,16})$/;
	//이름 정규식
	var nameCheck = /^[가-힣]{2,5}$/;
	//핸드폰정규식
	var mobileCheck = /^010|011|017\d{3,4}\d{4}$/;
	//공백이 존재하면 안 된다.
	var blankCheck = /^\S*$/;
	//생일 정규식 - 6자리
	var birthCheck = /^[0-9]{2}[01][0-9][0-3]$/;
	//생일 정규식 - 숫자
	var numCheck = /^[0-9]+$/

	var isValidId = false;
	var isValidPwd = false;
	var isValidConPwd = false;
	var isValidEmail = false;
	var isValidUName = false;
	var isValidMobile = false;
	var isValidNickName = false;
	var isValidBirth = false;
	// 	아이디
	function handleBlurEventForId() {

		userId.classList.remove("focusOutline");

		if (userId.value.length == 0) {
			userId.classList.add("errorOutline");
			errMsgId.style.color = "red";
			errMsgId.textContent = "아이디를 입력해주세요.";
			return;
		}

		if (!blankCheck.test(userId.value)) {
			alert('1234');
			userId.classList.add("errorOutline");
			errMsgId.style.color = "red";
			errMsgId.textContent = "공백은 사용할 수 없습니다.";
			return;
		}

		if (!firstCheck.test(userId.value)) {
			userId.classList.add("errorOutline");
			errMsgId.style.color = "red";
			errMsgId.textContent = "첫글자는 영문이어야 합니다.";
			return;
		}

		if (korCheck.test(userId.value)) {
			userId.classList.add("errorOutline");
			errMsgId.style.color = "red";
			errMsgId.textContent = "한글이 포함되어 있습니다.";
			return;
		}

		if (!idCheck.test(userId.value)) {
			userId.classList.add("errorOutline");
			errMsgId.style.color = "red";
			errMsgId.textContent = "최소 4자, 최대 20자 입니다.";
			return;
		}

		userId.classList.remove("focusOutline");
		document.querySelector(".existCheck").removeAttribute("disabled");
		document.querySelector(".existCheck").setAttribute("style",
				"background-color : blue;");
		errMsgId.textContent = "중복확인 검사를 해주세요";
		isValidId = true;
		// 		updateButtonState();

	}

	function handleFocusEventForId() {
		userId.classList.add("focusOutline");
		userId.classList.remove("errorOutline");
	}

	// 	비밀번호
	function handleBlurEventForPwd() {

		pwd.classList.remove("focusOutline");

		if (pwd.value.length == 0) {
			pwd.classList.add("errorOutline");
			errMsgPwd.style.color = "red";
			errMsgPwd.textContent = "비밀번호를 입력해주세요.";
			return;
		}

		if (!firstCheck.test(pwd.value)) {
			pwd.classList.add("errorOutline");
			errMsgPwd.style.color = "red";
			errMsgPwd.textContent = "첫글자는 영문이어야 합니다.";
			return;
		}

		if (korCheck.test(pwd.value)) {
			pwd.classList.add("errorOutline");
			errMsgPwd.style.color = "red";
			errMsgPwd.textContent = "한글이 포함되어 있습니다.";
			return;
		}

		if (!pwdCheck.test(pwd.value)) {
			pwd.classList.add("errorOutline");
			errMsgPwd.style.color = "red";
			if (pwd.value.length < 8) {
				errMsgPwd.textContent = "최소 8자 이상이어야 합니다.";
			} else {
				errMsgPwd.textContent = "영문과 숫자와 특수문자를 조합해서 입력해 주세요.";
			}
			return;
		}

		pwd.classList.remove("focusOutline");
		errMsgPwd.style.color = "";
		errMsgPwd.textContent = "";
		isValidPwd = true;
	}

	function handleFocusEventForPwd() {
		pwd.classList.add("focusOutline");
		pwd.classList.remove("errorOutline");
	}

	// 	비밀번호 확인
	function handleBlurEventForPwdConfirm() {

		conPwd.classList.remove("focusOutline");

		if (conPwd.value.length == 0) {
			conPwd.classList.add("errorOutline");
			errMsgConPwd.style.color = "red";
			errMsgConPwd.textContent = "비밀번호를 입력해주세요.";
			return;
		}

		if (conPwd.value != pwd.value) {
			conPwd.classList.add("errorOutline");
			errMsgConPwd.style.color = "red";
			errMsgConPwd.textContent = "비밀번호가 일치하지 않습니다.";
			return;
		}

		conPwd.classList.remove("focusOutline");
		errMsgConPwd.textContent = "";
		isValidConPwd = true;
	}

	function handleFocusEventForPwdConfirm() {
		conPwd.classList.add("focusOutline");
		conPwd.classList.remove("errorOutline");
	}

	//이름 확인

	function handleBlurEventForuName() {

		uName.classList.remove("focusOutline");

		if (uName.value.length == 0) {
			uName.classList.add("errorOutline");
			errMsgUname.style.color = "red";
			errMsgUname.textContent = "이름을 입력 해 주세요.";
			return;
		}

		if (!blankCheck.test(uName.value)) {
			uName.classList.add("errorOutline");
			errMsgUname.style.color = "red";
			errMsgUname.textContent = "공백은 사용할 수 없습니다.";
			return;
		}

		if (!nameCheck.test(uName.value)) {
			uName.classList.add("errorOutline");
			errMsgUname.style.color = "red";
			errMsgUname.textContent = "이름은 한국어만 가능합니다.";
			return;
		}

		uName.classList.remove("errorOutline");
		errMsgUname.style.color = "";
		errMsgUname.textContent = "";
		isValidUName = true;
	}

	function handleFocusEventForuName() {
		uName.classList.add("focusOutline");
		uName.classList.remove("errorOutline");
	}

	//생년월일 birth errMsgbirth
	function handleBlurEventForBirth() {

		birth.classList.remove("focusOutline");

		if (birth.value.length == 0) {
			birth.classList.add("errorOutline");
			errMsgbirth.style.color = "red";
			errMsgbirth.textContent = "번호를 입력해주세요.";
			return;
		}

		if (!blankCheck.test(birth.value)) {
			birth.classList.add("errorOutline");
			errMsgbirth.style.color = "red";
			errMsgbirth.textContent = "공백은 사용할 수 없습니다.";
			return;
		}

		if (!numCheck.test(birth.value)) {
			birth.classList.add("errorOutline");
			errMsgbirth.style.color = "red";
			errMsgbirth.textContent = "숫자만 사용 가능합니다.";
			return;
		}

		if (!birthCheck.test(birth.value)) {
			birth.classList.add("errorOutline");
			errMsgbirth.style.color = "red";
			errMsgbirth.textContent = "생년월일 형식을 지켜주세요 ex)881231";
			return;
		}

		birth.classList.remove("errorOutline");
		errMsgbirth.style.color = "";
		errMsgbirth.textContent = "";
		isValidBirth = true;

	}

	function handleFocusEventForBirth() {
		birth.classList.add("focusOutline");
		birth.classList.remove("errorOutline");
	}

	//핸드폰 확인

	function handleBlurEventForMobile() {

		mobile.classList.remove("focusOutline");

		if (mobile.value.length == 0) {
			mobile.classList.add("errorOutline");
			errMsgMobile.style.color = "red";
			errMsgMobile.textContent = "번호를 입력해주세요.";
			return;
		}

		if (!blankCheck.test(mobile.value)) {
			mobile.classList.add("errorOutline");
			errMsgMobile.style.color = "red";
			errMsgMobile.textContent = "공백은 사용할 수 없습니다.";
			return;
		}

		if (!mobileCheck.test(mobile.value)) {
			mobile.classList.add("errorOutline");
			errMsgMobile.style.color = "red";
			errMsgMobile.textContent = "번호 형식을 지켜주세요. 010/011/017만 지원합니다.";
			return;
		}

		mobile.classList.remove("errorOutline");
		errMsgMobile.style.color = "";
		errMsgMobile.textContent = "";
		isValidMobile = true;

	}

	function handleFocusEventForMobile() {
		mobile.classList.add("focusOutline");
		mobile.classList.remove("errorOutline");
	}

	// 	이메일확인
	function handleBlurEventForEmail() {

		email.classList.remove("focusOutline");
		if (email.value.length == 0) {
			email.classList.add("errorOutline");
			errMsgEmail.style.color = "red";
			errMsgEmail.textContent = "이메일을 입력해 주세요.";
			return;
		}

		if (!emailCheck.test(email.value)) {
			email.classList.add("errorOutline");
			errMsgEmail.style.color = "red";
			errMsgEmail.textContent = "이메일 형식을 확인해 주세요";
			return;
		}

		email.classList.remove("errorOutline");
		errMsgEmail.textContent = "";
		isValidEmail = true;
	}

	function handleFocusEventForEmail() {
		email.classList.add("focusOutline");
		email.classList.remove("errorOutline");
	}

	//별명 확인

	function handleBlurEventForNickName() {

		nickName.classList.remove("focusOutline");

		if (nickName.value.length == 0) {
			nickName.classList.add("errorOutline");
			errMsgNickName.style.color = "red";
			errMsgNickName.textContent = "닉네임을 입력 해 주세요.";
			return;
		}

		if (!blankCheck.test(nickName.value)) {
			nickName.classList.add("errorOutline");
			errMsgNickName.style.color = "red";
			errMsgNickName.textContent = "공백은 사용할 수 없습니다.";
			return;
		}

		if (!nickNameCheck.test(nickName.value)) {
			nickName.classList.add("errorOutline");
			errMsgNickName.style.color = "red";
			errMsgNickName.textContent = "너무 짧습니다. 최소 4자(한글 2자) 이상 입력하세요.";
			return;
		}

		nickName.classList.remove("errorOutline");
		errMsgNickName.style.color = "";
		errMsgNickName.textContent = "";
		isValidNickName = true;

	}

	function handleFocusEventForNickName() {
		nickName.classList.add("focusOutline");
		nickName.classList.remove("errorOutline");
	}

	//주소 & 상세주소?
</script>
</html>
