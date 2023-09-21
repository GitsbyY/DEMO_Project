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
	width: 157px;
	background-color: grey;
	font-size: 24px;
	text-align: center;
}
.infoTabalTdData{
	width: 247px;
	font-size: 24px;
}
.infoTabalTdData{
	font-size: 24px;
	margin-left: 10px;
}
.emoneyListTitle{
	width: 461px;
	height: 51px;
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

	<div id='divContainer'>
		<div class="title">
			<div id="firstTitle" style="color: #FFC4A3; margin-top: 50px; margin-bottom: 30px;">DAENGDAENG FAMILY</div>
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
						<td class="infoTabalTdData">${memberDto.MEMBER_JOIN_DATE}</td>
					</tr>
					<tr class="infoTabalTR">
						<td class="infoTabalTdDefault">주문건수</td>
						<td class="infoTabalTdData">${memberDto.PRODUCT_QUANTITY}</td>
					</tr>
					<tr class="infoTabalTR">
						<td class="infoTabalTdDefault">포인트</td>
						<td class="infoTabalTdData">
							${memberDto.MEMBER_POINT}
							<button style="float: right; width: 40px; height: 30px; margin-right: 10px;">수정</button>
						</td>
					</tr>
					<tr class="infoTabalTR">
						<td class="infoTabalTdDefault">이머니</td>
						<td class="infoTabalTdData">
							${memberDto.MEMBER_EMONEY}
							<button style="float: right; width: 40px; height: 30px; margin-right: 10px;">수정</button>
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
						<td>${memberChargeList.MEMBER_CHARGE_AMOUNT}</td>
						<td>${memberChargeList.MEMBER_CHARGE_DATE}</td>
					</c:forEach>
				</table>
			</div>
		</div>
		
	</div>
	<jsp:include page="/WEB-INF/views/Footer.jsp" />
</body>
<script type="text/javascript">

</script>
</html>