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

.listColumnContainer {
	width: inherit;
	cursor: pointer;
	margin-bottom: 10px;
	height: 46px;
}
.listColumnContainerDefault{
	height: 46px;
	margin-bottom: 15px;
	background-color: #FFBA69; 
}
.listColumn {
	float: left;
	height: 46px;
	font-size: 20px;
	text-align: center;
	display: flex; /* 수직 중앙 정렬을 위해 flexbox 사용 */
	align-items: center; /* 수직 중앙 정렬 설정 */
	justify-content: center; /* 수평 중앙 정렬 설정 */
}

#listColumn1 {
	width: 79px;
}

#listColumn2 {
	width: 102px;
}

#listColumn3 {
	width: 194px;
}

#listColumn4 {
	width: 115px;
}

#listColumn5 {
	width: 136px;
}

#listColumn6 {
	width: 203px;
}
#listColumn7 {
	width: 168px;
}

#listColumn1, #listColumn2, #listColumn3, #listColumn4, #listColumn5, #listColumn6 {
	border-right: 1px solid black; /* 오른쪽 보더 추가 */
}

.listColumn {
	margin-bottom: 3px;
}
.listColumnEven {
    background-color: #F6F6F6;
}

.listColumnOdd {
    background-color: white;
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
		<div class="listColumnContainerDefault">
			<div id="listColumn1" class="listColumn">번호</div>
			<div id="listColumn2" class="listColumn">회원번호</div>
			<div id="listColumn3" class="listColumn">아이디</div>
			<div id="listColumn4" class="listColumn">이름</div>
			<div id="listColumn5" class="listColumn">주문건수</div>
			<div id="listColumn6" class="listColumn">e-money</div>
			<div id="listColumn7" class="listColumn">포인트</div>
		</div>
<!-- 		루프로하면 안된다 -->

		<c:forEach var="memberDto" items="${memberList}" varStatus="loop">
			<div class="listColumnContainer" onclick="MypageProfilePaymentMemberDetailFnc(${memberDto.MEMBER_NO})">
				<div id="listColumn1" class="listColumn 
					${loop.index % 2 == 0 ? 'listColumnEven' : 'listColumnOdd'}">
						${totalCount - loop.index}
				</div>
				<div id="listColumn2" class="listColumn 
					${loop.index % 2 == 0 ? 'listColumnEven' : 'listColumnOdd'}">
						${memberDto.MEMBER_NO}
				</div>
				<div id="listColumn3" class="listColumn 
					${loop.index % 2 == 0 ? 'listColumnEven' : 'listColumnOdd'}">
						${memberDto.MEMBER_ID}
				</div>
				<div id="listColumn4" class="listColumn 
					${loop.index % 2 == 0 ? 'listColumnEven' : 'listColumnOdd'}">
						${memberDto.MEMBER_NAME}
				</div>
				<div id="listColumn5" class="listColumn 
					${loop.index % 2 == 0 ? 'listColumnEven' : 'listColumnOdd'}">
						${memberDto.TOTAL_ORDERS}
				</div>
				<div id="listColumn6" class="listColumn 
					${loop.index % 2 == 0 ? 'listColumnEven' : 'listColumnOdd'}">
						${memberDto.MEMBER_EMONEY}
				</div>
				<div id="listColumn7" class="listColumn 
					${loop.index % 2 == 0 ? 'listColumnEven' : 'listColumnOdd'}">
						${memberDto.MEMBER_POINT}
				</div>
			</div>
		</c:forEach>
		<div id="pageStatus" style="margin-top: 50px;">
			<jsp:include page="/WEB-INF/views/common/MyPagePaging.jsp">
				<jsp:param value="${myPagingmap}" name="myPagingmap"/>
			</jsp:include>
		</div>
	</div>


	
<!-- 	정보를 넘기기 위해서 폼을 만들었다 -->

			<form action="./mypageProfilePayment.do" id="pagingForm" method="post">
		      <input type="hidden" id="curPage" name="curPage"
		         value="${myPagingmap.myPagePaging.curPage}">
		    </form>

	<jsp:include page="/WEB-INF/views/Footer.jsp" />
</body>
<script type="text/javascript">
function MypageProfilePaymentMemberDetailFnc(no) {
	
	var url = './MypageProfilePaymentMemberDetail.do?memberNo=' + no;
	
    location.href= url;
	
}
</script>
</html>