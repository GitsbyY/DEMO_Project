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

#infoContainer {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	width: 800px;
	height: 500px;
}

.memberInfo {
	width: 400px;
	height: 50px;
	border: 1px solid black;
	border-collapse: collapse;
	font-size: 24px;
	display: flex;
	justify-content: space-between;
}

.memberInfoName {
	width: 150px;
	text-align: left;
	margin-left: 10px;
	margin-top: 10px;
}

.memberInfoValue {
	width: 250px;
	text-align: right;
	margin-right: 10px;
	margin-top: 10px;
}

.memberInfoValueInput {
	width: 200px;
	text-align: right;
	font-size: 24px;
	height: 25px;
}

#memberOrPetContainer {
	margin-bottom: 5px;
	width: 400px;
	height: 50px;
}

.memberOrPetM {
	background-color: #F0E1D9;
	width: 200px;
	height: 50px;
	float: left;
	text-align: center;
	color: white;
	font-size: 24px;
}

.memberOrPetP {
	background-color: #FFC4A3; 
	width: 200px;
	height: 50px;
	float: left;
	text-align: center;
	color: white;
	font-size: 24px;
}

.petInfo {
	width: 400px;
	height: 50px;
	border: 1px solid black;
	border-collapse: collapse;
	font-size: 24px;
	display: flex;
	justify-content: space-between;
}

.petInfoName {
	width: 180px;
	text-align: left;
	margin-left: 10px;
	margin-top: 10px;
}

.petInfoValue {
	width: 220px;
	text-align: right;
	margin-right: 10px;
	margin-top: 10px;
}

.petInfoValueInput {
	width: 150px;
	text-align: right;
	font-size: 24px;
	height: 25px;
}

#buttonContainer {
	display: flex;
	margin-top: 20px;
	margin-left: 610px;
}

#updateInfo {
	margin-right: 20px;
}

#updateInfo>button {
	background-color: #FFC4A3;
	color: white;
	font-size: 18px;
	font-weight: bold;
	border: none;
	border-radius: 3px;
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

	<fmt:formatDate value="${petDto.PET_ADOPTION_DATE}"
		pattern="yyyy/MM/dd" var="formattedAdoptionDate" />

	<div id="infoWrap">
		<div class="titleContainer">
			<div id="firstTitle"
				style="color: #FFC4A3; margin-top: 50px; margin-bottom: 30px;">
				DAENGDAENG FAMILY
			</div>
		</div>

		<div id="infoContainer">
			<div id="memberOrPetContainer">
				<button class="memberOrPetM" style="border-right: 1px solid white;"
					onclick="showMemberInfo('${petDto.MEMBER_NO}')">회원</button>
				<button class="memberOrPetP"
					onclick="showPetInfo('${petDto.MEMBER_NO}')">반려견</button>
			</div>
			<form action="./MypageProfileEditPetUpdateCtr.do" method="post"
				id="petUpdateForm">
				<input type="hidden" value="${petDto.PET_NO}" name="petNo"/>
				<input type="hidden" value="${petDto.MEMBER_NO}" name="memberNo"/>
				<div id="petInfoContainer">
					<div class="petInfo">
						<div class="petInfoName">이름</div>
						<div class="petInfoValue">
							<input class="petInfoValueInput" type="text"
								value="${petDto.PET_NAME}" name="petName" id="petNameInput"/>
							<div class="txtErrorArea" style="">
								<p class="errTxtRed" id="petNameErrMsg"
									aria-live="assertive"></p>
							</div>	
						</div>
					</div>
					<div class="petInfo">
						<div class="petInfoName">반려견 종</div>
						<div class="petInfoValue">${petDto.PET_BREED}</div>
					</div>
					<div class="petInfo">
						<div class="petInfoName">무게</div>
						<div class="petInfoValue">
							<input class="petInfoValueInput" type="text" 
								value="${petDto.PET_WEIGHT}" name="petWeight" id="petWeightInput"/>
							<label class="petInfoValueInput">Kg</label>
							<div class="txtErrorArea" style="">
								<p class="errTxtRed" id="petWeightErrMsg"
									aria-live="assertive"></p>
							</div>	
						</div>
					</div>
					<div class="petInfo">
						<div class="petInfoName">입양일</div>
						<div class="petInfoValue">${formattedAdoptionDate}</div>
					</div>
					<div class="petInfo">
						<div class="petInfoName">예방접종차시</div>
						<div class="petInfoValue">${petDto.PET_VACCINATION}</div>
					</div>
				</div>
			</form>
			<div id="buttonContainer">
				<div id="updateInfo">
					<button type="submit" id="updateButton">수정</button>
				</div>
			</div>
		</div>
	</div>


	<jsp:include page="/WEB-INF/views/Footer.jsp" />
</body>
<script type="text/javascript">

function showMemberInfo(memberNo) {
	
	var url = 'MypageProfileEdit.do?memberNo=' + memberNo;
	
    location.href= url;
	
}


//공백이 존재하면 안 된다. /^.*\S.*$/
var blankCheck = /^.*\S.*$/;
//5글자 이상이어야한다
var textCheck = /^.{5,}$/;
// 0부터 99까지 소수점 첫자리만 가능
var weightCheck = /^(0(\.[5-9])?|([1-9][0-9]?(\.[0-9])?))$/;

// 공통 유효성 검사 함수
function handleBlurEvent(inputElement, errMsgElement, checkFunction, errorMessage) {
    inputElement.classList.remove("focusOutline");

    if (inputElement.value.length === 0) {
        inputElement.classList.add("errorOutline");
        errMsgElement.style.color = "red";
        errMsgElement.textContent = errorMessage.empty;
        return false;
    }

    if (!blankCheck.test(inputElement.value)) {
        inputElement.classList.add("errorOutline");
        errMsgElement.style.color = "red";
        errMsgElement.textContent = errorMessage.noSpace;
        return false;
    }

    if (!checkFunction(inputElement.value)) {
        inputElement.classList.add("errorOutline");
        errMsgElement.style.color = "red";
        errMsgElement.textContent = errorMessage.invalid;
        return false;
    }

    inputElement.classList.remove("errorOutline");
    errMsgElement.style.color = "";
    errMsgElement.textContent = "";
    return true;
}

// 공통 포커스 이벤트 핸들러
function handleFocusEvent(inputElement) {
    inputElement.classList.add("focusOutline");
    inputElement.classList.remove("errorOutline");
}

// 입력 필드와 오류 메시지 엘리먼트를 정의합니다.
const fields = {
	petName: {
        input: document.getElementById("petNameInput"),
        errMsg: document.getElementById("petNameErrMsg"),
        check: function (value) {
            const petNameCheck = /^[가-힣]{1,10}$/;
            return petNameCheck.test(value);
        },
        errorMessage: {
            empty: "닉네임을 입력 해 주세요.",
            noSpace: "공백은 사용할 수 없습니다.",
            invalid: "1자 이상 10자 이하의 한글만 입력 가능합니다.",
        },
    },
    petWeight: {
        input: document.getElementById("petWeightInput"),
        errMsg: document.getElementById("petWeightErrMsg"),
        check: function (value) {
            const petWeightCheck = /^(0(\.[5-9])?|([1-9][0-9]?(\.[0-9])?))$/;
            return petWeightCheck.test(value);
        },
        errorMessage: {
            empty: "무게를를 입력해주세요.",
            noSpace: "공백은 사용할 수 없습니다.",
            invalid: "무게는 두 자리 수, 소수점 한 자리 수",
        },
    },
};

// 모든 입력 필드에 대한 이벤트 리스너를 추가합니다.
for (const fieldName in fields) {
    const field = fields[fieldName];
    field.input.addEventListener("blur", () => handleBlurEvent(field.input, field.errMsg, field.check, field.errorMessage));
    field.input.addEventListener("focus", () => handleFocusEvent(field.input));
    field.input.addEventListener("input", () => updateButtonState());
}

// 버튼 엘리먼트를 가져옵니다.
const updateBtn = document.getElementById("updateButton");

// 입력 필드에 변화가 있을 때 버튼 상태를 업데이트합니다.
function updateButtonState() {
    for (const fieldName in fields) {
        if (!handleBlurEvent(fields[fieldName].input, fields[fieldName].errMsg, fields[fieldName].check, fields[fieldName].errorMessage)) {
        	updateBtn.disabled = true;
        	updateBtn.style.backgroundColor = "gray";
            return;
        }
    }
    updateButton.disabled = false;
    updateButton.style.backgroundColor = "#FFC4A3";
}

// "수정" 버튼 클릭 시 폼을 서버로 제출하여 업데이트 수행
document.getElementById("updateButton").addEventListener("click", function (event) {
    // 폼을 서버로 제출하기 전에 유효성 검사를 한번 더 수행 (보안을 위해)
    if (updateBtn.disabled == false) {
        // 폼을 서버로 제출
    	document.getElementById("petUpdateForm").submit();
        alert("수정이 완료되었습니다");
    } else {
        // 유효성 검사를 통과하지 못한 경우 제출을 막습니다.
        event.preventDefault();
        alert("실패");
    }
});
</script>
</html>