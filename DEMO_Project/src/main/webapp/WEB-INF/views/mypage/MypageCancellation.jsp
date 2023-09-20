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
	border-bottom: 3px solid black;
	width: 150px;
	display: block;
	font-size: 30px;
	font-weight: bold;
	margin-top: 60px;
	margin-left: 30px;
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
}
.listColumn {
	float: left;
	height: 46px;
	font-size: 20px;
	text-align: center;
	display: flex; /* 수직 중앙 정렬을 위해 flexbox 사용 */
	align-items: center; /* 수직 중앙 정렬 설정 */
	justify-content: center; /* 수평 중앙 정렬 설정 */
 	background-color: grey; 
}

#listColumn1 {
	width: 70px;
}

#listColumn2 {
	width: 230px;
}

#listColumn3 {
	width: 124px;
}

#listColumn4 {
	width: 124px;
}

#listColumn5 {
	width: 195px;
}

#listColumn6 {
	width: 270px;
}

#listColumn1, #listColumn2, #listColumn3, #listColumn4, #listColumn5 {
	border-right: 1px solid black; /* 오른쪽 보더 추가 */
}

.listColumn {
	margin-bottom: 3px;
}
.listColumnEven {
    background-color: lightgrey;
}

.listColumnOdd {
    background-color: grey;
}
#pageForm{
	
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
			<div id="firstTitle">주문목록</div>
		</div>
		<div class="listColumnContainerDefault">
			<div id="listColumn1" class="listColumn">번호</div>
			<div id="listColumn2" class="listColumn">주문취소일</div>
			<div id="listColumn3" class="listColumn">주문번호</div>
			<div id="listColumn4" class="listColumn">회원번호</div>
			<div id="listColumn5" class="listColumn">아이디</div>
			<div id="listColumn6" class="listColumn">상품명</div>
		</div>
<!-- 		루프로하면 안된다 -->

		<c:forEach var="orderDto" items="${orderList}" varStatus="loop">
			<div class="listColumnContainer" onclick="mypageCancelFnc(${orderDto.ORDER_NO})">
				<div id="listColumn1" class="listColumn 
					${loop.index % 2 == 0 ? 'listColumnEven' : 'listColumnOdd'}">
						${totalCount - loop.index}
				</div>
				<div id="listColumn2" class="listColumn 
					${loop.index % 2 == 0 ? 'listColumnEven' : 'listColumnOdd'}">
						${orderDto.ORDER_CANCEL_DATE}
				</div>
				<div id="listColumn3" class="listColumn 
					${loop.index % 2 == 0 ? 'listColumnEven' : 'listColumnOdd'}">
						${orderDto.ORDER_NO}
				</div>
				<div id="listColumn4" class="listColumn 
					${loop.index % 2 == 0 ? 'listColumnEven' : 'listColumnOdd'}">
						${orderDto.MEMBER_NO}
				</div>
				<div id="listColumn5" class="listColumn 
					${loop.index % 2 == 0 ? 'listColumnEven' : 'listColumnOdd'}">
						${orderDto.MEMBER_ID}
				</div>
				<div id="listColumn6" class="listColumn 
					${loop.index % 2 == 0 ? 'listColumnEven' : 'listColumnOdd'}">
						${orderDto.PRODUCT_NAME}
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

			<form action="./cancelPage.do" id="pagingForm" method="post">
		      <input type="hidden" id="curPage" name="curPage"
		         value="${myPagingmap.myPagePaging.curPage}">
		    </form>

	<jsp:include page="/WEB-INF/views/Footer.jsp" />
</body>
<script type="text/javascript">
function mypageCancelFnc(no) {
	
	var url = './MypageCancellationDetail.do?orderNo=' + no;
	
    location.href= url;
	
}
</script>
</html>