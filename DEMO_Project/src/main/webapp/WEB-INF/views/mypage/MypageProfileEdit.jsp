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

tr, td{
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
.titleContainer{
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

.memberInfo{
	width: 400px;
	height: 50px;
	border: 1px solid black;
	border-collapse: collapse;
	font-size: 24px;
	display: flex;
	justify-content: space-between;
}
.memberInfoName{
	width: 150px;
	text-align: left;
	margin-left: 10px;
	margin-top: 10px;

}
.memberInfoValue{
	width: 250px;
	text-align: right;
	margin-right: 10px;
	margin-top: 10px;

}

.memberInfoValueInput{
	width: 200px;
	text-align: right;
	font-size: 24px;
	height: 25px;
}

#memberOrPetContainer{
	margin-bottom: 5px; 
	width: 400px; 
	height: 50px;
}

.memberOrPet{
	background-color: #FFC4A3;
	width: 200px;
	height: 50px;
	float: left;
	text-align: center;
	color: white;
	font-size: 24px;
}
.petInfo{
	width: 400px;
	height: 50px;
	border: 1px solid black;
	border-collapse: collapse;
	font-size: 24px;
	display: flex;
	justify-content: space-between;
}
.petInfoName{
	width: 180px;
	text-align: left;
	margin-left: 10px;
	margin-top: 10px;
}
.petInfoValue{
	width: 220px;
	text-align: right;
	margin-right: 10px;
	margin-top: 10px;
}
.petInfoValueInput{
	width: 150px;
	text-align: right;
	font-size: 24px;
	height: 25px;
}
#buttonContainer{
	display: flex;
	margin-top: 20px;
	margin-left: 610px;
}
#updateInfo{
	margin-right: 20px;
}
#updateInfo > button{
	background-color: #FFC4A3;
	color: white;
	font-size: 18px;
	font-weight: bold;
	border: none;
	border-radius: 3px;
}
#deleteInfo > button{
	background-color: #FFC4A3;
	color: white;
	font-size: 18px;
	font-weight: bold;
	border: none;
	border-radius: 3px;
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

	<fmt:formatDate value="${memberDto.MEMBER_BIRTH_DATE}" pattern="yyyy/MM/dd" var="formattedBirthDate" />
	<fmt:formatDate value="${petDto.PET_ADOPTION_DATE}" pattern="yyyy/MM/dd" var="formattedAdoptionDate" />

		<div id="infoWrap">
			<div class="titleContainer">
				<div id="firstTitle" style="color: #FFC4A3; margin-top: 50px; margin-bottom: 30px;">DAENGDAENG FAMILY</div>
			</div>
			
			<div id="infoContainer">
				<div id="memberOrPetContainer">
					<button class="memberOrPet" style="border-right: 1px solid white;" onclick="showMemberInfo()">회원</button>
					<button class="memberOrPet" onclick="showPetInfo()">반려견</button>
				</div>
				<div id="memberInfoContainer">
				
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
						<div class="memberInfoName">휴대폰 번호</div>
						<div class="memberInfoValue">${memberDto.MEMBER_PHONE}</div>
					</div>
					
					<div class="memberInfo">
						<div class="memberInfoName">이메일</div>
						<div class="memberInfoValue">
							<input class="memberInfoValueInput" type="text" value="${memberDto.MEMBER_EMAIL}"/>
						</div>
					</div>
					
					<div class="memberInfo">
						<div class="memberInfoName">주소</div>
						<div class="memberInfoValue">
							<input class="memberInfoValueInput" type="text" value="${memberDto.MEMBER_ADDRESS}"/>
						</div>
					</div>
					
				</div>
				
				<div id="petInfoContainer">
					<div class="petInfo">
						<div class="petInfoName">이름</div>
						<div class="petInfoValue">
							<input class="petInfoValueInput" type="text" value="${petDto.PET_NAME}"/>
						</div>
					</div>
					<div class="petInfo">
						<div class="petInfoName">반려견 종</div>
						<div class="petInfoValue">${petDto.PET_BREED}</div>
					</div>
					<div class="petInfo">
						<div class="petInfoName">무게</div>
						<div class="petInfoValue">
							<input class="petInfoValueInput" type="text" value="${petDto.PET_WEIGHT}&nbsp;Kg"/>
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
				
				<div id="buttonContainer">
					<div id="updateInfo">
						<button type="button">수정</button>
					</div>
					<div id="deleteInfo">
						<button type="button">탈퇴</button>
					</div>
				</div>
			</div>
		</div>


	<jsp:include page="/WEB-INF/views/Footer.jsp" />
</body>
<script type="text/javascript">
function showMemberInfo() {
    // 회원 정보 표시
    document.getElementById("memberInfoContainer").style.display = "block";
    // 반려견 정보 숨김
    document.getElementById("petInfoContainer").style.display = "none";
}

function showPetInfo() {
    // 회원 정보 숨김
    document.getElementById("memberInfoContainer").style.display = "none";
    // 반려견 정보 표시
    document.getElementById("petInfoContainer").style.display = "block";
}

// 페이지 로드 시 자동으로 회원 정보 표시
window.onload = showMemberInfo;

</script>
</html>