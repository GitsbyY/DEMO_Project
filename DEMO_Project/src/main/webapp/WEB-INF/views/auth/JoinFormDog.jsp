<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>회원가입</title>

<style type="text/css">
/* 초기화 스타일 */
html, body, div, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote,
pre, a, abbr, address, big, cite, code, del, dfn, em, font, img, ins, q,
s, samp, small, strike, strong, sub, sup, tt, var, b, u, i, ul, ol, li,
dl, dt, dd, table, caption, tbody, tfoot, thead, tr, th, td, fieldset,
form, label, legend, input, button, textarea, select {
    margin: 0;
    padding: 0;
}

html, body {
    display: flex;
    justify-content: center;
    align-items: center;
    margin: 0;
}

/* 폼 컨테이너 스타일 */
.formContainerDog {
    width: 600px;
    display: flex;
    justify-content: center;
    align-items: center;
}

/* 버튼 스타일 */
button {
    cursor: pointer;
}

/* 문단 스타일 */
p {
    font-size: 9px;
}

/* 회원가입 컨테이너 스타일 */
.joinWrapDog {
    width: 360px;
    background-color: none;
    display: block;
    align-items: center;
}

/* 회원가입 컨테이너 내부 요소 스타일 */
.joinDog {
    display: flex;
}
.inputWithButtonDog {
    position: relative;
    display: inline-block;
    width: auto; /* 더 이상 100%를 사용하지 않음 */
}
.inputDog {
	width : 200px;
    height: 30px;
    border: 2px solid #d9d9d9;
    border-radius: 2px;
    box-sizing: border-box;
    font-size: 12px;
    margin-top: 10px;
    text-align: right;
    padding-right: 30px; /* 입력 필드 오른쪽에 버튼 공간을 확보 */
}
#userJoinDogName{
	width: 160px;
}
#dogSexSelect{
	margin-top: 10px;
	height: 30px; 
	width: 50px;
	margin-left: 10px;
}
/* 라벨 스타일 */
.inputLabelDog {
    display: inline-block;
    margin-top: 15px;
    margin-right: 10px; /* 라벨과 입력 필드 사이의 간격을 조절 */
    font-size: 15px;
    width: 120px;
    text-align: left; /* 라벨을 좌측 정렬로 변경 */
    padding-right: 10px;
}

/* 셀렉트 박스 스타일 */
.selectDogType select,
.selectDogVaccin select {
    display: inline-block;
    height: 25px;
    width: 150px;
    margin-top: 15px;
    margin-left: 100px; /* 입력 필드와 셀렉트 박스를 우측 정렬로 변경 */
}

#userJoinDogWeight
, #userJoinDogDate{
	margin-left: 20px;
}
#otherDogTypeInput{
	margin-left: 50px;
}

.inputWithButtonDog > .btnDel {
    position: absolute;
    top: 50%; /* 버튼을 세로 중앙 정렬 */
    right: 5px; /* 오른쪽 여백 조절 */
    transform: translateY(-50%); /* 세로 중앙 정렬을 위한 이동 */
	border : none;
    background-color: black;
    background: url('./resources/img/deleteBtn.png') no-repeat;
    background-size: 20px 20px;
    width: 20px;
    height: 20px;
    cursor: pointer;
    margin-top: 5px;
}

/* 변경 버튼 스타일 */
.changeBtn > button {
    width: 360px;
    height: 30px;
    color: white;
    background-color: #FFC4A3;
    margin-top: 10px;
    border: none;
}

/* 제출 버튼 스타일 */
.submitBtn > button {
    width: 360px;
    height: 30px;
    color: white;
    background-color: #FFC4A3;
    margin-top: 5px;
    margin-bottom: 10px;
    border: none;
}

/* 오류 테두리 스타일 */
.errorOutline {
    border: 1px solid red;
}

/* 포커스 테두리 스타일 */
.focusOutline {
    outline: 2px solid #0080ff;
}
</style>
</head>

<body>
	<div>
		<h1 style="text-align: left; color: #FFC4A3; margin-top: 10px;">DAENGDAENG</h1>
		<div class="formContainerDog">
			<form action="join" method="post">
				<div class="joinWrapDog">

					<!-- 		강아지 이름div		 -->
					<div class="joinDog">
						<div class="inputLabelDog">
							<label for="userJoinDogName">반려견 이름</label>
						</div>
						<div class="inputWithButtonDog">
							<input type="text" class="inputDog" id="userJoinDogName"
								name="name" placeholder="1자 이상 최대 10자"
								value="${userJoinDogName}" oninput="validateDogName()" />
							<button type="button" class="btnDel"></button>
						</div>
						<select id="dogSexSelect">
							<option value="male">남</option>
							<option value="female">여</option>
						</select>
					</div>
					<div class="txtErrorArea" style="">
						<p class="errTxtRed" id="userJoinMessageDogName"
							aria-live="assertive"></p>
					</div>

					<!-- 		견종선택 div		 -->
					<div class="joinDog">
						<div class="inputLabelDog">
							<label for="dogTypeSelect" >견종 선택</label>
						</div>
						<div class="selectDogType">
							<select id="dogTypeSelect" name="breed">
								<option value="poodle">푸들</option>
								<option value="maltese">말티즈</option>
								<option value="bulldog">불독</option>
								<option value="dachshund">닥스훈트</option>
								<option value="jindo">진돗개</option>
								<option value="spitz">스피츠</option>
								<option value="yorkshireterrier">요크셔 테리어</option>
								<option value="shihTzu">시츄</option>
								<option value="chihuahua">치와와</option>
								<option value="pomeranian">포메라니안</option>
								<option value="shibaInu">시바 이누</option>
								<option value="bully">불리</option>
								<option value="cockerSpaniel">코커 스패니얼</option>
								<option value="japaneseSpitz">일본 스피츠</option>
								<option value="schnauzer">슈나우저</option>
								<option value="goldenRetriever">골든 리트리버</option>
								<option value="labrador">래브라도 리트리버</option>
								<option value="beagle">비글</option>
								<option value="pug">퍼그</option>
								<option value="boxer">복서</option>
								<option value="doberman">도베르만 핀셔</option>
								<option value="samoyed">사모예드</option>
								<option value="cockerspaniel">잉글리시 코커 스패니얼</option>
								<option value="siberianHusky">시베리안 허스키</option>
								<option value="whippet">위펫</option>
								<option value="akita">아키타</option>
								<option value="chowChow">차우차우</option>
								<option value="borderCollie">보더 콜리</option>
								<option value="berneseMountainDog">버니즈 마운틴 독</option>
								<option value="newfoundland">뉴펀들랜드</option>
								<option value="other">기타</option>
							</select>
							<!-- 기타 견종을 입력할 수 있는 input 태그 -->
							<input type="text" id="otherDogTypeInput" class="inputDog"
								placeholder="기타 견종 입력" style="display: none;">
						</div>
					</div>

					<!-- 		무게div		 -->
					<div class="joinDog">
						<div class="inputLabelDog">
							<label for="userJoinDogWeight">반려견무게</label>
						</div>
						<div class="inputWithButtonDog">
							<input type="text" class="inputDog" id="userJoinDogWeight"
								name="weight" placeholder="반려견 무게를 써주세요"
								oninput="validateDogWeight()" />
							<button type="button" class="btnDel"></button>
						</div>
					</div>

					<div class="txtErrorArea" style="">
						<p class="errTxtRed" id="userJoinMessageDogWeight"
							aria-live="assertive"></p>
					</div>

					<!-- 		입양일div		 -->
					<div class="joinDog">
						<div class="inputLabelDog">
							<label for="userJoinDogDate">반려견 입양일</label>
						</div>
						<div class="inputWithButtonDog">
							<div class="inputWithButtonDog">
								<input class="inputDog" type="date" name="adoptDate"
									id="userJoinDogDate" placeholder="입양날짜를 선택해 주세요"
									oninput="displaySelectedDate()" />
							</div>
						</div>
					</div>
					<!-- 선택된 날짜 표시 -->
					<div>
						<p id="selectedDateText" style="color: red; font-size: 12px;"></p>
					</div>
					<div class="txtErrorArea" style="">
						<p class="errTxtRed" id="userJoinMessageDogDate"
							aria-live="assertive"></p>
					</div>
					<!-- 		예방접종이력 div		 -->
					<div class="joinDog">
						<div class="inputLabelDog">
							<label for="dogPillSelect">예방접종이력</label>
						</div>
						<div class="selectDogVaccin">
							<select id="dogPillSelect" name="vac">
								<option value="Vaccin1">1차</option>
								<option value="Vaccin2">2차</option>
								<option value="Vaccin3">3차</option>
								<option value="Vaccin4">4차</option>
								<option value="Vaccin5">5차</option>
								<option value="Vaccin6">6차</option>
								<option value="VaccinNone">미정</option>
							</select>
						</div>
					</div>

				</div>

				<div>
<!-- 					<div class="changeBtn"> -->
<!-- 						<button type="button" onclick="toHumanInfoFnc();">회원정보</button> -->
<!-- 					</div> -->
					<div class="submitBtn">
						<button type="submit" disabled="disabled">회원가입</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
<script type="text/javascript">
	
	//반려견 이름과 딜리트 버튼
	var dogName = document.getElementById("userJoinDogName");
	var dogNameDeleteButton = document.querySelector(".joinDog .btnDel");
	dogNameDeleteButton.addEventListener("click", function() {
		dogName.value = ""; 
	});
	

	//반려견 무게와 딜리트 버튼
	var dogWeight = document.getElementById("userJoinDogWeight");
	var dogWeightDeleteButton = document.querySelector(".joinDog .btnDel");
	dogWeightDeleteButton.addEventListener("click", function() {
		dogWeight.value = ""; 
	});
	
	function toHumanInfoFnc() {

		window.location.href = './addm.do';
	}

	function handleBreedSelection() {
		var dogTypeSelect = document.getElementById("dogTypeSelect");
		var otherdogTypeInput = document.getElementById("otherDogTypeInput");

		if (dogTypeSelect.value === "other") {
			otherdogTypeInput.style.display = "block";
		} else {
			otherdogTypeInput.style.display = "none";
		}
	}

	var dogTypeSelect = document.getElementById("dogTypeSelect");
	dogTypeSelect.addEventListener("change", handleBreedSelection);

	// 반려견 이름 유효성 검사 함수
	function validateDogName() {
		var dogNameInput = document.getElementById("userJoinDogName");
		var dogNameErrorMessage = document
				.getElementById("userJoinMessageDogName");
		var dogName = dogNameInput.value;

		// 공백을 제거한 이름이 1자 이상 10자 이하의 한글인지 검사
		if (!/^[가-힣]{1,10}$/.test(dogName.trim())) {
			dogNameInput.classList.add("errorOutline");
			dogNameErrorMessage.style.color = "red";
			dogNameErrorMessage.textContent = "1자 이상 10자 이하의 한글만 입력 가능하며, 공백은 허용되지 않습니다.";
		} else {
			dogNameInput.classList.remove("errorOutline");
			dogNameErrorMessage.textContent = "";
		}
	}

	// 반려견 무게 유효성 검사 함수
	function validateDogWeight() {
	    var dogWeightInput = document.getElementById("userJoinDogWeight");
	    var dogWeightErrorMessage = document.getElementById("userJoinMessageDogWeight");
	    var dogWeight = dogWeightInput.value;

	    // 공백을 제거한 무게가 숫자와 최대 1자리의 소수점을 포함하는지 검사
	    if (!/^\d+(\.\d{0,1})?$/.test(dogWeight.trim())) {
	        dogWeightInput.classList.add("errorOutline");
	        dogWeightErrorMessage.style.color = "red";
	        dogWeightErrorMessage.textContent = "숫자와 소수점(최대 1자리)만 입력 가능하며, 공백은 허용되지 않습니다.";
	    } else {
	        dogWeightInput.classList.remove("errorOutline");
	        dogWeightErrorMessage.style.color = "red";
	        dogWeightErrorMessage.textContent = "";
	    }
	}
	

	// 날짜 선택시 아래에 표시하는 함수
	function displaySelectedDate() {
		var selectedDateInput = document.getElementById("userJoinDogDate");
		var selectedDateText = document.getElementById("selectedDateText");
		selectedDateText.textContent = "선택된 날짜: " + selectedDateInput.value;
	}
</script>

</html>
