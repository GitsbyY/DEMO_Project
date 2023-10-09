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

.memberInfoValueWrap {
	width: 250px;
	text-align: right;
	margin-right: 10px;
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
	background-color: #FFC4A3;
	width: 200px;
	height: 50px;
	float: left;
	text-align: center;
	color: white;
	font-size: 24px;
}

.memberOrPetP {
	background-color: #F0E1D9;
	width: 200px;
	height: 50px;
	float: left;
	text-align: center;
	color: white;
	font-size: 24px;
}


#buttonContainer {
	display: flex;
	margin-top: 20px;
	margin-left: 610px;
}

#updateInfo {
	margin-right: 10px;
	margin-left: 10px;
}

#updateInfo>input {
	background-color: grey;
	color: white;
	font-size: 18px;
	font-weight: bold;
	border: none;
	border-radius: 3px;
	cursor: pointer;
}

#deleteInfo>input {
	background-color: #FFC4A3;
	color: white;
	font-size: 18px;
	font-weight: bold;
	border: none;
	border-radius: 3px;
	cursor: pointer;
}
#backToInfo>input{
	background-color: #FFC4A3;
	color: white;
	font-size: 18px;
	font-weight: bold;
	border: none;
	border-radius: 3px;
	cursor: pointer;
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

	<fmt:formatDate value="${memberDto.MEMBER_BIRTH_DATE}"
		pattern="yyyy/MM/dd" var="formattedBirthDate" />


	<div id="infoWrap">
		<div class="titleContainer">
			<div id="firstTitle"
				style="color: #FFC4A3; margin-top: 50px; margin-bottom: 30px;">DAENGDAENG
				FAMILY</div>
		</div>

		<div id="infoContainer">
			<div id="memberOrPetContainer">
				<button class="memberOrPetM" style="border-right: 1px solid white;">회원</button>
				<button class="memberOrPetP"
					onclick="showPetInfo('${memberDto.MEMBER_NO}')">반려견</button>
			</div>
			<form action="./MypageProfileEditUpdateCtr.do" method="POST" id="memberUpdateForm">
				<div id="memberInfoContainer">
					<input type="hidden" value="${memberDto.MEMBER_NO}" name="memberNo"/>
					<div class="memberInfo">
						<div class="memberInfoName">아이디</div>
						<div class="memberInfoValue">${memberDto.MEMBER_ID}</div>
					</div>

					<div class="memberInfo">
						<div class="memberInfoName">이름</div>
						<div class="memberInfoValue">${memberDto.MEMBER_NAME}</div>
					</div>

					<div class="memberInfo">
						<div class="memberInfoName">생년월일</div>
						<div class="memberInfoValue">${formattedBirthDate}</div>
					</div>

					<div class="memberInfo">
						<div class="memberInfoName">닉네임</div>
						<div class="memberInfoValueWrap">
							<input class="memberInfoValueInput" id="memberNickName"
								type="text" value="${memberDto.MEMBER_NICKNAME}" name="memberNickName"/>
							<div class="txtErrorArea" style="">
								<p class="errTxtRed" id="userUpdateMessageNickName"
									aria-live="assertive"></p>
							</div>
						</div>

					</div>

					<div class="memberInfo">
						<div class="memberInfoName">휴대폰 번호</div>
						<div class="memberInfoValueWrap">
							<input class="memberInfoValueInput" id="memberPhoneNum"
								type="text" value="${memberDto.MEMBER_PHONE}" name="memberPhone"/>
							<div class="txtErrorArea" style="">
								<p class="errTxtRed" id="userUpdateMessagePhone"
									aria-live="assertive"></p>
							</div>
						</div>

					</div>

					<div class="memberInfo">
						<div class="memberInfoName">이메일</div>
						<div class="memberInfoValueWrap">
							<input class="memberInfoValueInput" id="memberEmail" type="text"
								value="${memberDto.MEMBER_EMAIL}" name="memberEmail"/>
							<div class="txtErrorArea" style="">
								<p class="errTxtRed" id="userUpdateMessageEmail"
									aria-live="assertive"></p>
							</div>
						</div>
					</div>

					<div class="memberInfo">
						<div class="memberInfoName">주소</div>
						<div class="memberInfoValueWrap">
							<input class="memberInfoValueInput" id="memberAddress"
								type="text" value="${memberDto.MEMBER_ADDRESS}" name="memberAddress"/>
							<div class="txtErrorArea" style="">
								<p class="errTxtRed" id="userUpdateMessageAddress"
									aria-live="assertive"></p>
							</div>
						</div>
					</div>

				</div>
			</form>

			<div id="buttonContainer">
				<c:if test="${sessionScope.member.memberNo == 1}">
					<div id="backToInfo">
							<input type="button" id="backButton" value="목록"
								onclick="backToListFnc()" />
					</div>
				</c:if>
				<div id="updateInfo">
					<input type="submit" name="updateMemberInfo" id="updateButton"
						disabled="disabled" value="수정" />
				</div>

				<form action="./MypageProfileEditDeleteCtr.do" method="POST" id="memberDeleteForm">
					<div id="deleteInfo">
					<input type="hidden" value="${memberDto.MEMBER_NO}" name="memberNo" id="deleteMemberNo"/>
						<input type="submit" name="deleteMemberInfo" value="탈퇴" onclick="return confirmDelete();" />
					</div>
				</form>
			</div>

		</div>
	</div>


	<jsp:include page="/WEB-INF/views/Footer.jsp" />
</body>
<script type="text/javascript">
	//목록으로 돌아간다
	function backToListFnc() {
		
		var url = './mypageProfile.do';
		
	    location.href= url;
	}
	//반려견 정보를 띄우는 페이지
	function showPetInfo(memberNo) {
		
		var url = './MypageProfileEditPet.do?memberNo=' + memberNo;
		
	    location.href= url;
		
	}
	//삭제 전에 한 번 더 확인
	function confirmDelete() {
	   
	    const memberNo = document.getElementById("deleteMemberNo").value;

	    
	    if (memberNo === "1") {
	    	 var resultAdmin = confirm("정말로 탈퇴시키겠습니까?");
	    	 if (resultAdmin) {
	 	        document.getElementById("memberDeleteForm").submit();
	 	    }
	    	 return false;
	    }else {
	    	 var result = confirm("정말로 탈퇴하시겠습니까?");
	    	 if (result) {
	 	        document.getElementById("memberDeleteForm").submit();
	 	    }
	    	 return false;
	    }

	    
	}
	
	//email 정규식
	var emailCheck = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
	//닉네임 정규식
	var nickNameCheck = /^([ㄱ-ㅎ|ㅏ-ㅣ|가-힣]{2,8}|.{4,16})$/;
	//핸드폰정규식
	var mobileCheck = /^010|011|017\d{3,4}\d{4}$/;
	//공백이 존재하면 안 된다.
	var blankCheck = /^\S*$/;
	//5글자 이상이어야한다
	var textCheck = /^.{5,}$/;
	
	// 공통 유효성 검사 함수
	function handleBlurEvent(inputElement, errMsgElement, checkFunction, errorMessage) {
	    inputElement.classList.remove("focusOutline");

	    if (inputElement.value.length === 0) {
	        inputElement.classList.add("errorOutline");
	        errMsgElement.style.color = "red";
	        errMsgElement.textContent = errorMessage.empty;
	        return false;
	    }

	    // 주소 필드에 대해서만 공백 체크를 무시
	    if (inputElement.id !== "memberAddress" && !blankCheck.test(inputElement.value)) {
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
	    nickName: {
	        input: document.getElementById("memberNickName"),
	        errMsg: document.getElementById("userUpdateMessageNickName"),
	        check: function (value) {
	            const nickNameCheck = /^([ㄱ-ㅎ|ㅏ-ㅣ|가-힣]{2,8}|.{4,16})$/;
	            return nickNameCheck.test(value);
	        },
	        errorMessage: {
	            empty: "닉네임을 입력 해 주세요.",
	            noSpace: "공백은 사용할 수 없습니다.",
	            invalid: "너무 짧습니다. 최소 4자(한글 2자) 이상 입력하세요.",
	        },
	    },
	    mobile: {
	        input: document.getElementById("memberPhoneNum"),
	        errMsg: document.getElementById("userUpdateMessagePhone"),
	        check: function (value) {
	            const mobileCheck = /^010|011|017\d{3,4}\d{4}$/;
	            return mobileCheck.test(value);
	        },
	        errorMessage: {
	            empty: "번호를 입력해주세요.",
	            noSpace: "공백은 사용할 수 없습니다.",
	            invalid: "번호 형식을 지켜주세요. 010/011/017만 지원합니다.",
	        },
	    },
	    email: {
	        input: document.getElementById("memberEmail"),
	        errMsg: document.getElementById("userUpdateMessageEmail"),
	        check: function (value) {
	            const emailCheck = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
	            return emailCheck.test(value);
	        },
	        errorMessage: {
	            empty: "이메일을 입력해 주세요.",
	            noSpace: "공백은 사용할 수 없습니다.",
	            invalid: "이메일 형식을 확인해 주세요.",
	        },
	    },
	    address: {
	        input: document.getElementById("memberAddress"),
	        errMsg: document.getElementById("userUpdateMessageAddress"),
	        check: function (value) {
	            const textCheck = /^.{5,}$/;
	            return textCheck.test(value);
	        },
	        errorMessage: {
	            empty: "주소를 입력 해 주세요.",
	            noSpace: "공백은 사용할 수 없습니다.",
	            invalid: "주소를 확인 해 주세요.",
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
	const updateButton = document.getElementById("updateButton");

	// 입력 필드에 변화가 있을 때 버튼 상태를 업데이트합니다.
	function updateButtonState() {
	    for (const fieldName in fields) {
	        if (!handleBlurEvent(fields[fieldName].input, fields[fieldName].errMsg, fields[fieldName].check, fields[fieldName].errorMessage)) {
	        	updateButton.disabled = true;
	        	updateButton.style.backgroundColor = "gray";
	            return;
	        }
	    }
	    updateButton.disabled = false;
	    updateButton.style.backgroundColor = "#FFC4A3";
	}
	
	// "수정" 버튼 클릭 시 폼을 서버로 제출하여 업데이트 수행
	document.getElementById("updateButton").addEventListener("click", function (event) {
	    // 폼을 서버로 제출하기 전에 유효성 검사를 한번 더 수행 (보안을 위해)
	    if (updateButton.disabled == false) {
	        // 폼을 서버로 제출
	    	document.getElementById("memberUpdateForm").submit();
	    	alert("수정이 완료되었습니다.");
	    } else {
	        // 유효성 검사를 통과하지 못한 경우 제출을 막습니다.
	        event.preventDefault();
	        alert("실패");
	    }
	});
</script>
</html>