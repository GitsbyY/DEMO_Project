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

.emoneyListTitle {
	width: 461px;
	height: 51px;
	font-size: 24px;
	text-align: center;
}

.emonyList {
	font-size: 24px;
	text-align: center;
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
		<div class="title">
			<div id="firstTitle"
				style="color: #FFC4A3; margin-top: 50px; margin-bottom: 30px;">DAENGDAENG
				FAMILY</div>
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
								<input type="text" id="pointChangeInput"
									class="infoTabalTdDataInput" name="memberPoint" style="text-align: right;"
									value="${memberDto.MEMBER_POINT}" />
								<c:if test="${sessionScope.member.memberNo == 1}">
								<input type="submit" value="수정">
								</c:if>
							</form>
						</td>
					</tr>
					<tr class="infoTabalTR">
						<td class="infoTabalTdDefault">E-money</td>
						<td class="infoTabalTdData">
							<form action="../mypage/MypageProfilePaymentMemberDetailEmoneyCtr.do"
								onsubmit="return checkEmoneyStatus()" id="emoneyForm"
								method="post">
								<input type="hidden" name="memberNo" value="${memberDto.MEMBER_NO}" />
								<input type="text" class="infoTabalTdDataInput" id="pointEmoneyInput" 
								name="memberEmoney" value="${memberDto.MEMBER_EMONEY}" style="text-align: right;" />
								<c:if test="${sessionScope.member.memberNo == 1}">
								<input type="submit" value="수정">
								</c:if>
							</form>
						</td>
					</tr>
				</table>
			</div>
			<div id="emoneyChargeList">
				<table>
					<tr>
						<td colspan="2" class="emoneyListTitle">이머니 충전 내역</td>
					</tr>
					<c:forEach var="memberChargeDto" items="${memberChargeList}"
						varStatus="loop">
						<tr>
							<td class="emonyList">${memberChargeList.MEMBER_CHARGE_AMOUNT}</td>
							<td class="emonyList">${formattedDateCharge}</td>
					</c:forEach>
				</table>
			</div>

		</div>

	</div>


	<jsp:include page="/WEB-INF/views/Footer.jsp" />
</body>
<script type="text/javascript">

function checkPointStatus(){
	var pointStatus = "${memberDto.MEMBER_POINT}";
    var memberNo = "${memberDto.MEMBER_NO}";
    var changePointStatus = document.getElementById("pointChangeInput").value;
    
    var confirmPointChange = confirm(pointStatus+ " 포인트를 " + changePointStatus + " 로 바꾸시겠습니까?" );
        if (confirmPointChange) {
        	return true;
        } else {
            return false; 
        }
    }


function checkEmoneyStatus(){
	 var emoneyStatus = "${memberDto.MEMBER_EMONEY}";
	 var memberNo = "${memberDto.MEMBER_NO}";
	 var changeEmoneyStatus = document.getElementById("pointEmoneyInput").value;
	 var confirmEmoneyChange = confirm(emoneyStatus + "이머니를 " + changeEmoneyStatus + " 로 바꾸시겠습니까?" );
  
	 if (confirmEmoneyChange) {
         return true; 
     } else {
         return false; 
     }
 }
	
</script>
</html>