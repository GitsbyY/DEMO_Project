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
tr, td{
	border: 1px solid black;
}

#infoContainer{
	display: flex;
}

#infoTable{
	margin-right: 40px;
	margin-left: 40px;
}

.infoTabalTR{
	height: 51px;
}
.infoTabalTdDefault{
	width: 120px;
	background-color: #FFBA69; 
	font-size: 24px;
	text-align: left;
	margin-left: 5px;
}
.infoTabalTdData{
	width: 300x;
	font-size: 24px;
}
.infoTabalTdDataInput{
	font-size: 24px;
}
.emoneyListTitle{
	width: 461px;
	height: 51px;
	font-size: 24px;
	text-align: center;
}
.emonyList{
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
	
	<fmt:formatDate value="${memberDto.MEMBER_JOIN_DATE}" pattern="yy/MM/dd HH:mm:ss" var="formattedDate" />
	<fmt:formatDate value="${memberChargeList.MEMBER_CHARGE_DATE}" pattern="yy/MM/dd HH:mm:ss" var="formattedDateCharge" />

	<div id='divContainer'>
		<div class="title">
			<div id="firstTitle" style="color: #FFC4A3; margin-top: 50px; margin-bottom: 30px;">DAENGDAENG FAMILY</div>
		</div>
		<div id="infoContainer">
		<input type="hidden" name="memberNo" value="${memberDto.MEMBER_NO}"/>
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
						<td class="infoTabalTdData">${memberDto.TOTAL_ORDERS}</td>
					</tr>
					<tr class="infoTabalTR">
						<td class="infoTabalTdDefault">포인트</td>
						<td class="infoTabalTdData">
							<form action="../mypage/MypageProfilePaymentMemberDetailPointCtr.do" 
							onsubmit="return checkPointStatus()" id="PointForm" method="post">
							<input type="text" id="PointChangeInput" class="infoTabalTdDataInput" 
								name="pointStatus" value="${memberDto.MEMBER_POINT}"/>
							<button type="submit">수정</button>
							</form>
						</td>
					</tr>
					<tr class="infoTabalTR">
						<td class="infoTabalTdDefault">이머니</td>
						<td class="infoTabalTdData">
							<input type="text" class="infoTabalTdDataInput" value="${memberDto.MEMBER_EMONEY}"/>
							<button type="button">수정</button>
						</td>
					</tr>
				</table>
			</div>
			<div id="emoneyChargeList">
				<table>
					<tr>
						<td colspan="2" class="emoneyListTitle">이머니 충전 내역</td>
					</tr>
					<c:forEach var="memberChargeDto" items="${memberChargeList}" varStatus="loop">
					<tr>
						<td class="emonyList">${memberChargeList.MEMBER_CHARGE_AMOUNT}</td>
						<td class="emonyList">${formattedDateCharge}</td>
					</c:forEach>
				</table>
			</div>
			
		</div>
		
	</div>
	
	<div id="divBottom">
				<div style="text-align: right; margin-top: 4px;">
				<form action="../order/orderCancelCtr.do"  onsubmit="return checkOrderStatus()" 
				id="cancelForm" method="post">
    				<input type="hidden" name="orderNo" value="${orderDto.ORDER_NO}">
					<input type="submit" value="주문취소" 
						style="width: 90px; height: 30px; font-size: 15px;">
				</form>
				</div>
				
				<div style="margin-top: 40px;">
					<input type="button" value="목록" 
						style="width: 145px; height: 50px; font-size: 24px; font-weight: bold;" onclick="window.location.href='/DEMO_Project/mypage/mypage.do';">	
				</div>
			</div>
	
	<jsp:include page="/WEB-INF/views/Footer.jsp" />
</body>
<script type="text/javascript">
function checkOrderStatus() {
    var orderStatus = "${orderDto.ORDER_STATUS}";
    var memberNo = "${memberDto.MEMBER_NO}";
    var confirmPointChange = confirm("정말 주문을 취소하시겠습니까?");
        if (confirmCancel) {
            return window.location.href = '../order/orderCancelCtr.do?orderNo=' + orderNo; // 주문 취소 처리 페이지로 이동
        } else {
            return false; // 취소하지 않음
        }
    } else {
        alert("주문 취소가 불가능한 상태입니다.");
        return false; // 취소하지 않음
    }
}
function checkPointStatus() {
    var pointStatus = "${memberDto.MEMBER_POINT}";
    var memberNo = "${memberDto.MEMBER_NO}";
    var changePointStatus = document.getElementById("PointChangeInput");
    var confirmPointChange = confirm(changePointStatus + "포인트를 " + pointStatus + " 로 바꾸시겠습니까?" );
        if (confirmPointChange) {
            return window.location.href = '../mypage/MypageProfilePaymentMemberDetailPointCtr.do?memberNo=' 
            		+ memberNo; 
        } else {
            return false; 
        }
    }
}
</script>
</html>