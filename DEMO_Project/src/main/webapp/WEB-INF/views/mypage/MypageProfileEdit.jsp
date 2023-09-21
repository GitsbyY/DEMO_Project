<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
#infoWrap{
	display: flex;
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


#infoContainer {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    width: 400px;
    height: 700px;
    margin-top: 20px; /* 위 여백 추가 */
}

.memberInfo{
	width: 400px;
	height: 50px;
	border: 1px solid black;
	border-collapse: collapse;
}

#memberOrPetContainer{
	margin-bottom: 5px; 
	width: 400px; 
	height: 50px;"
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
			<div class="title">
				<div id="firstTitle" style="color: #FFC4A3; margin-top: 50px; margin-bottom: 30px;">DAENGDAENG FAMILY</div>
			</div>
			
			<div id="infoContainer">
				<div id="memberOrPetContainer">
					<button class="memberOrPet" style="border-right: 1px solid white;" onclick="showMemberInfo()">회원</button>
					<button class="memberOrPet" onclick="showPetInfo()">반려견</button>
				</div>
				<div id="memberInfoContainer">
					<div class="memberInfo">${memberDto.MEMBER_ID}</div>
					<div class="memberInfo">비밀번호 확인? 비밀번호 변경?</div>
					<div class="memberInfo">${memberDto.MEMBER_NAME}</div>
					<div class="memberInfo">${memberDto.MEMBER_BIRTH_DATE}</div>
					<div class="memberInfo">${memberDto.MEMBER_PHONE}</div>
					<div class="memberInfo">${memberDto.MEMBER_EMAIL}</div>
					<div class="memberInfo">${memberDto.MEMBER_ADDRESS}</div>
				</div>
				<div id="petInfoContainer">
					<div class="petInfo">${petDto.PET_NAME}</div>
					<div class="petInfo">${petDto.PET_BREED}</div>
					<div class="petInfo">${petDto.PET_WEIGHT}</div>
					<div class="petInfo">${petDto.PET_ADOPTION_DATE}</div>
					<div class="petInfo">${petDto.PET_VACCINATION}</div>
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