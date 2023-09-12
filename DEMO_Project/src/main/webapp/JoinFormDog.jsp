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
		<div class="formContainerDog">
			<form action="join" method="post">
				<div class="joinWrap">

					<!-- 		강아지 이름div		 -->
					<div class="joinDog">
						<div class="inputLabel">
							<label for="userJoinDogName">반려견 이름</label>
						</div>
						<div class="inputWithButton">
							<input type="text" class="inputUser" id="userJoinDogName"
								name="dogName" placeholder="1자 이상 최대 10자"
								value="${userJoinDogName}" />
							<button type="button" class="btnDel"></button>
						</div>
						<select id="dogSexSelect">
							<option value="option1">남</option>
							<option value="option2">여</option>
						</select>
					</div>
					<div class="txtErrorArea" style="">
						<p class="errTxtRed" id="userJoinMessageId" aria-live="assertive"></p>
					</div>

					<!-- 		견종선택 div		 -->
					<div class="joinDog">
						<div class="inputLabel">
							<label for="userJoinDogType">견종 선택</label>
						</div>
						<div class="selectDogType">
							<select id="dogTypeSelect">
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
							<input type="text" id="otherDogTypeInput" placeholder="기타 견종 입력"
								style="display: none;">
						</div>
					</div>
					<div class="txtErrorArea" style="">
						<p class="errTxtRed" id="userJoinMessageDogType"
							aria-live="assertive"></p>
					</div>

					<!-- 		무게div		 -->
					<div class="joinDog">
						<div class="inputLabel">
							<label for="userJoinDogWeight">반려견무게</label>
						</div>
						<div class="inputWithButton">
							<input type="text" class="inputUser" id="userJoinDogWeight"
								name="dogWeight" placeholder="반려견 무게를 써주세요" />
							<button type="button" class="btnDel"></button>
						</div>
					</div>

					<div class="txtErrorArea" style="">
						<p class="errTxtRed" id="userJoinMessagePwd" aria-live="assertive"></p>
					</div>

					<!-- 		입양일div		 -->
					<div class="joinDog">
						<div class="inputLabel">
							<label for="userJoinDogDate">반려견 입양일</label>
						</div>
						<div class="inputWithButton">
							<input class="inputUser" type="text" name="userName"
								id="userJoinDogDate" placeholder="입양날짜를 작성 해 주세요" />
							<button type="button" class="btnDel"></button>
						</div>
					</div>
					<div class="txtErrorArea" style="">
						<p class="errTxtRed" id="userJoinMessageDogDate"
							aria-live="assertive"></p>
					</div>
					<!-- 		예방접종이력 div		 -->
					<div class="joinDog">
						<div class="inputLabel">
							<label for="userJoinDogPill">예방접족이력</label>
						</div>
						<div class="selectDogPill">
							<select id="dogPillSelect">
								<option value="option1">1차</option>
								<option value="option2">2차</option>
								<option value="option1">3차</option>
								<option value="option2">4차</option>
								<option value="option1">5차</option>
								<option value="option2">6차</option>
							</select>
						</div>
					</div>
					<div class="txtErrorArea" style="">
						<p class="errTxtRed" id="userJoinMessageBirth"
							aria-live="assertive"></p>
					</div>

				</div>

				<div>
					<div class="changeBtn">
						<button type="button" onclick="toHumanInfoFnc();">회원정보</button>
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

function toHumanInfoFnc() {
	alert('toHumanInfoFnc 함수 호출됨');
	window.location.href = 'JoinForm.jsp';
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
</script>

</html>
