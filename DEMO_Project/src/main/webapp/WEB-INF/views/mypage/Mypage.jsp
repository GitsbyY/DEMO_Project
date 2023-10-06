<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
    background-color: #F6F6F6;
}

.listColumnOdd {
    background-color: white;
}
#pageForm{
	
}
#searchDiv{
	margin-top: 20px;
	text-align: right;
	height: 40px;
}

#sortSelect{   
   margin-top: 18px;
   height: 40px;
   width: 90px;
   border-radius: 5px;
   font-size: 16px;
   font-weight: bold;
 }

#search{   
   margin-top: 10px;
   height: 35px;
   width: 220px;
   border-radius: 5px;
   padding-left: 20px;
   vertical-align: middle;
   margin-bottom: 10px;
   font-size: 16px; 
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
					<div id="listColumn2" class="listColumn">주문일</div>
					<div id="listColumn3" class="listColumn">주문번호</div>
					<div id="listColumn4" class="listColumn">회원번호</div>
					<div id="listColumn5" class="listColumn">아이디</div>
					<div id="listColumn6" class="listColumn">상품명</div>
				</div>
		<!-- 		루프로하면 안된다 -->
		
				<c:forEach var="orderDto" items="${orderList}" varStatus="loop">
					<div class="listColumnContainer" onclick="mypageDetailFnc(${orderDto.ORDER_NO})">
						<div id="listColumn1" class="listColumn 
							${loop.index % 2 == 0 ? 'listColumnEven' : 'listColumnOdd'}">
								${totalCount - orderDto.RNUM + 1}
						</div>
						<div id="listColumn2" class="listColumn 
							${loop.index % 2 == 0 ? 'listColumnEven' : 'listColumnOdd'}">
								${orderDto.ORDER_DATE}
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
				<form action="./mypageAdmin.do" method="post" id='pagingForm'>
				<div id='searchDiv' style="position: relative;">
						<select id="sortSelect" name="category">
							<option value="productName"
								<c:if test="${myPagingmap.category eq 'productName'}">
									selected
								</c:if>
								>상품명</option>
								<option value="memberNo"
								<c:if test="${myPagingmap.category eq 'memberNo'}">
									selected
								</c:if>
								>회원번호</option>
								<option value="orderNo"
								<c:if test="${myPagingmap.category eq 'orderNo'}">
									selected
								</c:if>
								>주문번호</option>
								<option value="memberId"
								<c:if test="${myPagingmap.category eq 'memberId'}">
									selected
								</c:if>
								>아이디</option>

						</select> 
						<input id="search" type="text" name="search" placeholder="검색" value="${myPagingmap.search}"> 
						<img src="/DEMO_Project/resources/img/Search.png" alt="제출" id="searchButton" 
							style="position: absolute; right: 10px; top: 58.5%; cursor: pointer;" onclick="submitForm()">	
				</div>
				
				<div id="pageStatus" style="margin-top: 50px;">
					<jsp:include page="/WEB-INF/views/common/MyPagePaging.jsp">
						<jsp:param value="${myPagingmap}" name="myPagingmap"/>
					</jsp:include>
				</div>
				<input type="hidden" id="curPage" name="curPage"
				         value="${myPagingmap.myPagePaging.curPage}">
				</form>
			</div>
			
	<jsp:include page="/WEB-INF/views/Footer.jsp" />
</body>
<script type="text/javascript">
	
	document.getElementById("sortSelect").addEventListener("change", initializeValueFnc);
	
	function initializeValueFnc() {
		document.getElementById("search").value = "";
	}

	function mypageDetailFnc(no) {
		
		var url = './MypageDetail.do?orderNo=' + no;
		
	    location.href= url;
		
	}
	
	function submitForm() {
		document.getElementById("curPage").value = 1;
	    document.getElementById('pagingForm').submit();
	}
</script>
</html>