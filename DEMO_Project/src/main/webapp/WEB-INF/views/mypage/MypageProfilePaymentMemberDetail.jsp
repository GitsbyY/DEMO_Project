<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="/DEMO_Project/resources/js/jquery-3.7.1.js">
</script>
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

#divContainer{
	position:relative;
}

#firstTitle {
	width: 400px;
	display: block;
	font-size: 30px;
	font-weight: bold;
	margin-top: 60px;
	margin-left: 10px;
	margin-bottom: 25px;
}

tr, td {
	border: 1px solid black;
}

#infoContainer {
	display: flex;
}

#infoTable {
	margin-right: 40px;
	margin-left: 40px;
}

.infoTabalTR {
	height: 51px;
}

.infoTabalTdDefault {
	width: 120px;
	background-color: #FFBA69;
	font-size: 24px;
	text-align: left;
	margin-left: 5px;
}

.infoTabalTdData {
	width: 240x;
	font-size: 24px;
	margin-left: 10px;
}

.infoTabalTdDataInput {
	font-size: 24px;
	width: 200px;
}

#emoneyListDiv{
	width: 480px;
	height: 440px;
}

.emoneyListTitle {
	width: 481px;
	height: 100px;
	font-size: 24px;
	text-align: center;
	position: absolute;
    right: 91px;

}
.emoneyListTableDiv{
	width:100%;
	height:370px;
	overflow-y:auto;
	margin-top: 65px;
}

.emoneyListTable{
	width:100%;
	border-collapse: collapse;
	font-size: 24px;
	text-align: center;
}
.emoneyListTr{
	border-top: 1px solid black;
}

.emoneyListTr td:first-child{
	width: 145px;
	height: 51px;
	border-collapse: collapse;
	background-color: #DDDDDD;
}

.emonyList {
	font-size: 24px;
	text-align: center;
}

/* 모달 css 시작 */
.modal {
	display: none;
	position: fixed;
	z-index: 1;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgba(0, 0, 0, 0.4);
}

/* 모달 내용 스타일 */
.modal-content {
	background-color: #fefefe;
	margin: 15% auto;
	padding: 50px 20px 20px 20px;
	border: 1px solid #888;
	width: 30%;
	position: relative;
}

.modal-table{
	border-collapse: collapse;
}
.modal-table tr td{
	margin-left: 10px;
    width: 300px;
    height: 30px;
    border-collapse: collapse;
}
.modal-table tr td:first-child {
    background-color: #dddddd;
}
/* 모달 닫기 버튼 스타일 */
.close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
	position: absolute;
	top: -1px;
    right: 10px;
}

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}
#chargeBtnDiv{
	font-weight: bold;
	background-color: #dddddd;
	width:100px;
	height: 30px;
	margin: 30px auto;
	padding-top: 10px;
	text-align: center;
	cursor: pointer;
}
#chargeAmount{
	border: none;
	height: 50px;
	font-size: 20px;
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

	<fmt:formatDate value="${memberDto.MEMBER_JOIN_DATE}"
		pattern="yy/MM/dd HH:mm:ss" var="formattedDate" />
	<fmt:formatDate value="${memberChargeList.MEMBER_CHARGE_DATE}"
		pattern="yy/MM/dd HH:mm:ss" var="formattedDateCharge" />

	<div id='divContainer'>
		<div id="firstTitle"
			style="color: #FFC4A3; margin-top: 50px; margin-bottom: 30px;">DAENGDAENG
			FAMILY</div>
		<div class='emoneyListTitle'>
			<table class="emoneyListTable">
				<tr class='emoneyListTr'>
					<td>충전 금액</td>
					<td style="background-color:white;width: 331px;">충전 날짜</td>
				</tr>
			</table>
		</div>
		<div id="infoContainer">
			
			<div id="infoTable">
				<table>
					<tr class="infoTabalTR">
						<td class="infoTabalTdDefault">회원번호</td>
						<td class="infoTabalTdData">${memberDto.MEMBER_NO}</td>
					</tr>
					<tr class="infoTabalTR">
						<td class="infoTabalTdDefault">회원아이디</td>
						<td class="infoTabalTdData">${memberDto.MEMBER_ID}</td>
					</tr>
					<tr class="infoTabalTR">
						<td class="infoTabalTdDefault">회원이름</td>
						<td class="infoTabalTdData">${memberDto.MEMBER_NAME}</td>
					</tr>
					<tr class="infoTabalTR">
						<td class="infoTabalTdDefault">가입일</td>
						<td class="infoTabalTdData">${formattedDate}</td>
					</tr>
					<tr class="infoTabalTR">
						<td class="infoTabalTdDefault">주문건수</td>
						<td class="infoTabalTdData">${memberDto.TOTALORDERS}</td>
					</tr>
					<tr class="infoTabalTR">
						<td class="infoTabalTdDefault">포인트</td>
						<td class="infoTabalTdData">
							<form action="../mypage/MypageProfilePaymentMemberDetailPointCtr.do"
								onsubmit="return checkPointStatus()" id="pointForm"
								method="post">
								<input type="hidden" name="memberNo" value="${memberDto.MEMBER_NO}" />
								<c:if test="${sessionScope.member.memberNo == 1}">
									<input type="text" id="pointChangeInput"
									class="infoTabalTdDataInput" name="memberPoint" style="text-align: right;"
									value="${memberDto.MEMBER_POINT}" />
									<input type="submit" value="수정">
								</c:if>
								<c:if test="${sessionScope.member.memberNo != 1}">
									<input type="text" id="pointChangeInput"
										class="infoTabalTdDataInput" name="memberPoint" style="text-align: right; border:none;"
										value="${memberDto.MEMBER_POINT}" readonly/>
								</c:if>
							</form>
						</td>
					</tr>
					<tr class="infoTabalTR">
						<td class="infoTabalTdDefault">E-money</td>
						<td class="infoTabalTdData">
							<form action="../mypage/MypageProfilePaymentMemberDetailEmoneyCtr.do"
								id="emoneyForm"
								method="post">
								<input type="hidden" name="memberNo" value="${memberDto.MEMBER_NO}" />
								<c:if test="${sessionScope.member.memberNo == 1}">
									<input type="text" class="infoTabalTdDataInput" id="pointEmoneyInput" 
										name="memberEmoney" value="${memberDto.MEMBER_EMONEY}" style="text-align: right;" />
									<input type="button" value="수정" onclick="checkEmoneyStatus();">
								</c:if>
								<c:if test="${sessionScope.member.memberNo != 1}">
									<input type="text" class="infoTabalTdDataInput" id="pointEmoneyInput" 
										name="memberEmoney" value="${memberDto.MEMBER_EMONEY}" style="text-align: right; border:none;"
											readonly/>
									<!-- 모달 버튼 -->
									<button type="button" onclick="openModal()">충전</button>
								</c:if>
								<!-- 모달 -->
								<div id="myModal" class="modal">
								    <!-- 모달 내용 -->
								    <div class="modal-content">
								    	<table class='modal-table'>
								    		<tr>
								    			<td>
								    				<div>충전 전 금액</div>
								    			</td>
								    			<td>
								    				<div id='chargeBeforeEmoney'>
								    					<fmt:formatNumber value="${memberDto.MEMBER_EMONEY}" pattern="#,##0" />원
								    				</div>
								    			</td>
								    		</tr>
								    		<tr>
								    			<td>
								    				<div>충전할 금액을 입력하세요</div>
								    			</td>
								    			<td>
								    				<input type='text' name='chargeAmount' id='chargeAmount'>
								    			</td>
								    		</tr>
								    		<tr>
								    			<td>
								    				<div>충전 후 금액</div>
								    			</td>
								    			<td>
								    				<div id='chargeAfterEmoney'>
								    					<fmt:formatNumber value="${memberDto.MEMBER_EMONEY}" pattern="#,##0" />원
								    				</div>
								    			</td>
								    		</tr>
								    	</table>
								    	<div id='chargeBtnDiv' onclick="memberChargeFnc();">충전</div>
								        <span class="close" onclick="closeModal()">&times;</span>
								    </div>
								
								</div>
							</form>
						</td>
					</tr>
				</table>
				
			</div>
			<div id="emoneyListDiv">
				<div class="emoneyListTableDiv">
					<table class="emoneyListTable">
						<c:forEach var="memberChargeDto" items="${memberChargeDto}"
							varStatus="loop">
							<tr class='emoneyListTr'>
								<td>
									<fmt:formatNumber value="${memberChargeDto.MEMBER_CHARGE_AMOUNT}" pattern="#,##0" />
								</td>
								<td>
									<fmt:formatDate
										pattern="yyyy-MM-dd HH:mm:ss"
										value="${memberChargeDto.MEMBER_CHARGE_DATE}" />
								</td>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/Footer.jsp" />
</body>
<script type="text/javascript">
	
	var numberPattern = /^[0-9]+$/;
	var rangePattern = /^[0-9]{1,5}$/;
	
	function checkPointStatus() {
		var pointStatus = "${memberDto.MEMBER_POINT}";
		var memberNo = "${memberDto.MEMBER_NO}";
		var changePointStatus = document.getElementById("pointChangeInput").value;
		
		if(!numberPattern.test(changePointStatus)){
	    	alert('숫자만 입력가능합니다.');
	    	document.getElementById("pointChangeInput").value = pointStatus;
	    	return ;
	    }
		if(!rangePattern.test(changePointStatus)){
	    	alert('포인트는 100,000P 미만으로 수정 가능합니다.');
	    	document.getElementById("pointChangeInput").value = pointStatus;
	    	return ;
	    }
		
		var confirmPointChange = confirm(pointStatus + " 포인트를 "
				+ changePointStatus + " 로 바꾸시겠습니까?");
		if (confirmPointChange) {
			return true;
		} else {
			return false;
		}
	}

	function checkEmoneyStatus() {
		var emoneyStatus = "${memberDto.MEMBER_EMONEY}";
		var memberNo = "${memberDto.MEMBER_NO}";
		var changeEmoneyStatus = document.getElementById("pointEmoneyInput").value;
		
		if(!numberPattern.test(changeEmoneyStatus)){
	    	alert('숫자만 입력가능합니다.');
	    	document.getElementById("pointEmoneyInput").value = emoneyStatus;
	    	return ;
	    }
		if(!rangePattern.test(changeEmoneyStatus)){
	    	alert('이머니는 100,000원 미만으로 수정 가능합니다.');
	    	document.getElementById("pointEmoneyInput").value = emoneyStatus;
	    	return ;
	    }
		
		var confirmEmoneyChange = confirm(emoneyStatus + "이머니를 "
				+ changeEmoneyStatus + " 로 바꾸시겠습니까?");

		if (confirmEmoneyChange) {
			$('#emoneyForm').submit();
		} else {
			return ;
		}
	}
	
	function memberChargeFnc() {
		
		var chargeAmount = document.getElementById("chargeAmount").value;
		if(chargeAmount == 0){
			alert('충전 금액을 입력해주세요');
			return ;
		}
		if(!numberPattern.test(chargeAmount)){
	    	alert('숫자만 입력가능합니다.');
	    	document.getElementById("chargeAmount").value = 0;
	    	return ;
	    }
		if(!rangePattern.test(chargeAmount)){
	    	alert('이머니는 100,000원 미만으로 충전 가능합니다.');
	    	document.getElementById("chargeAmount").value = 0;
	    	return ;
	    }
		var confirmEmoneyChange = confirm("이머니 "
				+ chargeAmount + "를 충전하시겠습니까?");

		if (confirmEmoneyChange) {
			$('#emoneyForm').submit();
		} else {
			return ;
		}
	}
	
	 // 모달 열기
    function openModal() {
        document.getElementById('myModal').style.display = 'block';
    }

    // 모달 닫기
    function closeModal() {
        document.getElementById('myModal').style.display = 'none';
        $('#chargeAmount').val(0);
    	var chargeBeforeEmoney = parseInt($('#chargeBeforeEmoney').text().replace(/[^\d]/g, ''));
    	
    	$('#chargeAfterEmoney').text(new Intl.NumberFormat().format(chargeBeforeEmoney) + "원");
    }

    // 모달 외부 클릭 시 닫기
//     window.onclick = function(event) {
//         var modal = document.getElementById('myModal');
//         if (event.target == modal) {
//             modal.style.display = 'none';
//         }
//     }
    const chargeEmoneyObj = document.getElementById('chargeAmount');
    chargeEmoneyObj.addEventListener('change', inputChargeEmoneyFnc);
    
    function inputChargeEmoneyFnc() {
    	var chargeAmount = document.getElementById("chargeAmount").value;
		if(chargeAmount == 0){
			alert('충전 금액을 입력해주세요');
			return ;
		}
		if(!numberPattern.test(chargeAmount)){
	    	alert('숫자만 입력가능합니다.');
	    	document.getElementById("chargeAmount").value = 0;
	    }else if(!rangePattern.test(chargeAmount)){
	    	alert('이머니는 100,000원 미만으로 충전 가능합니다.');
	    	document.getElementById("chargeAmount").value = 0;
	    }
    	var chargeEmoney = parseInt($('#chargeAmount').val());
    	var chargeBeforeEmoney = parseInt($('#chargeBeforeEmoney').text().replace(/[^\d]/g, ''));
    	
    	$('#chargeAfterEmoney').text(new Intl.NumberFormat().format(chargeEmoney + chargeBeforeEmoney) + "원");
    }
    
</script>
</html>