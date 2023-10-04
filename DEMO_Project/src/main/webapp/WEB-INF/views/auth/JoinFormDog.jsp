<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="/DEMO_Project/resources/css/JoinFormDog.css">
</head>

<body>
<div>
	<h1 style="text-align: left; color: #FFC4A3; margin-top: 50px; margin-bottom: 30px;"
		onclick="location.href='/DEMO_Project/auth/login.do'">DAENGDAENG</h1>
	<div class="formContainerDog">
		<form action="addpCtr.do" method="post">
			<div class="joinWrapDog">

				<!-- 		강아지 이름div		 -->
				<div class="joinDog">
					<div class="inputLabelDog">
						<label for="userJoinDogName">반려견 이름</label>
					</div>
					<div class="inputWithButtonDog">
						<input type="text" class="inputDog" id="userJoinDogName"
							name="petName" placeholder="1자 이상 최대 10자"
							value="${userJoinDogName}" oninput="validateDogName()" />
						<button type="button" class="btnDel" onclick="clearDogName();"></button>
					</div>
					<select id="dogSexSelect" name="petGender">
						<option value="M">남</option>
						<option value="W">여</option>
					</select>
				</div>
				<div class="txtErrorArea" style="">
					<p class="errTxtRed" id="userJoinMessageDogName"
						aria-live="assertive"></p>
				</div>


				<!-- 		견종선택 div		 -->
				<div class="joinDog">
					<div class="inputLabelDog">
						<label for="dogTypeSelect">견종 선택</label>
					</div>
					<div class="selectDogType">
						<select id="dogTypeSelect" name="petBreed">
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
				<div class="txtErrorArea" style="">
						<p class="errTxtRed" id="userJoinMessageDogBreed"
							aria-live="assertive"></p>
				</div>

				<!-- 		무게div		 -->
				<div class="joinDog">
					<div class="inputLabelDog">
						<label for="userJoinDogWeight">반려견무게</label>
					</div>
					<div class="inputWithButtonDog">
						<input type="text" class="inputDog" id="userJoinDogWeight"
							name="petWeight" placeholder="반려견 무게를 써주세요"
							oninput="validateDogWeight()" />
						<button type="button" class="btnDel" onclick="clearDogWeight();"></button>
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
							<input class="inputDog" type="date" name="petAdoptDate"
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
						<select id="dogPillSelect" name="petVac">
							<option value="미정" selected>미정</option>
							<option value="1차">1차</option>
							<option value="2차">2차</option>
							<option value="3차">3차</option>
							<option value="4차">4차</option>
							<option value="5차">5차</option>
							<option value="6차">6차</option>
						</select>
					</div>
				</div>
				<!-- 		예방접종일div		 -->
				<div class="joinDog" id="dogVacDateDiv">
					<div class="inputLabelDog">
						<label for="userJoinDogVacDate">반려견<br/>예방접종일</label>
					</div>
					<div class="inputWithButtonDog">
						<div class="inputWithButtonDog">
							<input class="inputDog" type="date" name="petVacDate"
								id="userJoinDogVacDate" oninput="displaySelectedVacDate()" />
						</div>
					</div>
				</div>
				<!-- 선택된 날짜 표시 -->
				<div>
					<p id="selectedVacDateText" style="color: red; font-size: 12px;"></p>
				</div>
				<div class="txtErrorArea" style="">
					<p class="errTxtRed" id="userJoinMessageDogVacDate"
						aria-live="assertive"></p>
				</div>
			</div>

			<div>
				<!-- 					<div class="changeBtn"> -->
				<!-- 						<button type="button" onclick="toHumanInfoFnc();">회원정보</button> -->
				<!-- 					</div> -->
				<div class="submitBtn">
					<button type="submit">회원가입</button>
				</div>
			</div>
			<input type="hidden" value="${memberDto.memberId}" name="memberId" />
			<input type="hidden" value="${memberDto.memberPassword}"
				name="memberPassword" /> <input type="hidden"
				value="${memberDto.memberName}" name="memberName" />
			<fmt:formatDate value="${memberDto.memberBirthDate}"
				pattern="yyyy-MM-dd" var="formattedDate" />
			<input type="hidden" value="${formattedDate}" name="memberBirthDate" />
			<input type="hidden" value="${memberDto.memberPhone}"
				name="memberPhone" /> <input type="hidden"
				value="${memberDto.memberEmail}" name="memberEmail" /> <input
				type="hidden" value="${memberDto.memberNickName}"
				name="memberNickName" /> <input type="hidden"
				value="${memberDto.memberAddress}" name="memberAddress" />

		</form>
	</div>
</div>

</body>
<script type="text/javascript">
	//반려견 이름을 지우는 함수
	function clearDogName() {
		var dogName = document.getElementById("userJoinDogName");
		dogName.value = "";
	}

	// 반려견 무게를 지우는 함수
	function clearDogWeight() {
		var dogWeight = document.getElementById("userJoinDogWeight");
		dogWeight.value = "";
	}

	//견종선택
	
	function handleBreedSelection() {
		var dogTypeSelect = document.getElementById("dogTypeSelect");
		var otherdogTypeInput = document.getElementById("otherDogTypeInput");
		var dogBreedErrorMessage = document.getElementById("userJoinMessageDogBreed");
		
		if (dogTypeSelect.value === "other") {
			var inputValue = otherdogTypeInput.value.trim();
			var koreanPattern = /^[가-힣]{1,10}$/;
			otherdogTypeInput.style.display = "block";
			
			if (!koreanPattern.test(inputValue)) {
				
				dogBreedErrorMessage.style.color = "red";
				dogBreedErrorMessage.textContent = "1자~10자의 한글만 가능합니다.";
				
				
			} else {
				dogTypeSelect.value = inputValue; // 선택값을 입력값으로 설정합니다.
				dogBreedInput.classList.remove("errorOutline");
				dogBreedErrorMessage.textContent = "";
			}
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
			dogNameErrorMessage.textContent = "1자~10자의 한글만 가능합니다.";
		} else {
			dogNameInput.classList.remove("errorOutline");
			dogNameErrorMessage.textContent = "";
		}
	}

	// 반려견 무게 유효성 검사 함수
	function validateDogWeight() {
		var dogWeightInput = document.getElementById("userJoinDogWeight");
		var dogWeightErrorMessage = document
				.getElementById("userJoinMessageDogWeight");
		var dogWeight = dogWeightInput.value;

		// 공백을 제거한 무게가 숫자와 최대 1자리의 소수점을 포함하는지 검사
		if (!/^\d+(\.\d{0,1})?$/.test(dogWeight.trim())) {
			dogWeightInput.classList.add("errorOutline");
			dogWeightErrorMessage.style.color = "red";
			dogWeightErrorMessage.textContent = "숫자와 소수점(최대 1자리)만 가능합니다.";
		} else {
			dogWeightInput.classList.remove("errorOutline");
			dogWeightErrorMessage.style.color = "red";
			dogWeightErrorMessage.textContent = "";
		}
	}

	// 날짜 선택시 아래에 표시하는 함수 입양
	function displaySelectedDate() {
		var selectedDateInput = document.getElementById("userJoinDogDate");
		var selectedDateText = document.getElementById("selectedDateText");
		selectedDateText.textContent = "선택된 날짜: " + selectedDateInput.value;
	}

	// 날짜 선택시 아래에 표시하는 함수 백신
	function displaySelectedVacDate() {
		var selectedVacDateInput = document
				.getElementById("userJoinDogVacDate");
		var selectedVacDateText = document
				.getElementById("selectedVacDateText");
		selectedVacDateText.textContent = "선택된 날짜: "
				+ selectedVacDateInput.value;
	}

	// 필수 필드 모두가 채워졌는지 확인하는 함수
	function checkFields() {
		var dogName = document.getElementById("userJoinDogName").value;
		var dogWeight = document.getElementById("userJoinDogWeight").value;
		var adoptionDate = document.getElementById("userJoinDogDate").value;
		var dogBreedSelect = document.getElementById("dogTypeSelect").value;
		var dogPillSelect = document.getElementById("dogPillSelect").value;
		var dogVacDate = document.getElementById("userJoinDogVacDate").value;
	
		// 필수 필드 중 하나라도 비어있으면 false를 반환
		if (dogName === "" || dogWeight === "" || adoptionDate === ""
				|| dogBreedSelect === "none"||(dogPillSelect != "미정" & dogVacDate == "")) {
			return false;
		}
		return true;
	}

	// 회원가입 버튼 스타일을 변경하는 함수
	function updateSubmitButton() {
		var submitButton = document.querySelector(".submitBtn button");

		if (checkFields()) {
			// 필수 필드가 모두 채워졌을 때 버튼의 스타일을 변경
			submitButton.style.backgroundColor = "#FFC4A3"; // 원래 색상으로 변경
			submitButton.style.cursor = "pointer"; // 클릭 가능한 커서로 변경
		} else {
			// 필수 필드 중 하나라도 비어있을 때 버튼의 스타일을 초기화
			submitButton.style.backgroundColor = "gray"; // 회색으로 변경
			submitButton.style.cursor = "not-allowed"; // 클릭 불가능한 커서로 변경
		}
	}

	// 견종 선택이 변경될 때 버튼 스타일 업데이트
	document.getElementById("dogTypeSelect").addEventListener("change",
			updateSubmitButton);

	// 필드 값이 변경될 때마다 버튼 스타일 업데이트
	document.getElementById("userJoinDogName").addEventListener("input",
			updateSubmitButton);
	document.getElementById("userJoinDogWeight").addEventListener("input",
			updateSubmitButton);
	document.getElementById("userJoinDogDate").addEventListener("input",
			updateSubmitButton);
	document.getElementById("dogPillSelect").addEventListener("change",
			changeDogPillSelect);
	document.getElementById("userJoinDogVacDate").addEventListener("input",
			updateSubmitButton);

	// 초기 버튼 스타일 설정
// 	updateSubmitButton();
	
	function changeDogPillSelect() {
		if(document.getElementById("dogPillSelect").value === "미정"){
			$('#dogVacDateDiv').css('display', 'none');
		}else{
			$('#dogVacDateDiv').css('display', 'flex');
		}
		updateSubmitButton();
	}
	
	changeDogPillSelect();
</script>
</html>