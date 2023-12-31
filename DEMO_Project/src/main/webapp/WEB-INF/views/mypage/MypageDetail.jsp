<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>	
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
html, body, div, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote,
	pre, a, abbr, address, big, cite, code, del, dfn, em, font, img, ins, q,
	s, samp, small, strike, strong, sub, sup, tt, var, b, u, i, ul, ol, li,
	dl, dt, dd, table, caption, tbody, tfoot, thead, tr, th, td, fieldset,
	form, label, legend, input, button, textarea, select {
	margin: 0;
	padding: 0;
}
button{
	cursor: pointer;
}
#divTitle {
	border-bottom: 3px solid black;
	margin-top: 30px;
	margin-left: 50px;
	width: 150px;
	font-size: 30px;
	font-weight: bold;
	margin-bottom: 20px;
}

#divDetailContainer {
	width: 852px;
	text-align: center;
	margin: 0 auto; /* 가로 가운데 정렬을 위한 마진 설정 */
}

#divTop {
	height: 35px;
	border: 1px solid black;
	margin-bottom: 21px;
	font-size: 20px;
	font-weight : bold;
	text-align: left;
	background-color: #FFBA69; 
}
#divTop div {
    display: inline-block;
    margin-left: 5px;
    margin-top: 3px;
}
#firstTable {
	width: 852px;
	height: 196px;
	border-top: 3px solid black;
	margin-bottom: 24px;
	border-left: none;
	border-right: none;
}

#secondTable {
	width: 852px;
	height: 196px;
	border-left: none;
	border-right: none;
}

table {
	width: 100%;
	border-collapse: collapse;
}

th, td {
	padding: 10px;
	text-align: center;
}
.productImg{
	width:120px;
	height:120px;
	cursor: pointer;
}
</style>
<meta charset="UTF-8">
<title>주문상세 페이지</title>
<link rel="stylesheet" type="text/css"
	href="/DEMO_Project/resources/css/main.css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/Header.jsp" />

	<jsp:include page="/WEB-INF/views/asideMyPage.jsp" />
	<fmt:formatDate value="${orderDto.ORDER_DATE}" pattern="yyyy/MM/dd HH:mm:SS" var="formattedDate" />
	<fmt:formatDate value="${orderDto.ORDER_DATE}" pattern="yyyy-MM-dd HH:mm:SS" var="formattedDateDetail" />
	<fmt:formatNumber value="${orderDto.PRODUCT_PRICE}" pattern="#,###,###" var="formattedNumber" />
	<fmt:formatNumber value="${orderDto.PRODUCT_QUANTITY*orderDto.PRODUCT_PRICE}" pattern="#,###,###" var="formattedCapNumber" />
	<input type='hidden' id='productName' value='${orderDto.PRODUCT_NAME}'>
	<div id='divContainer'>
		<div id="divTitle">주문 상세</div>
		<div id='divDetailContainer'>

			<table id="firstTable">
				<thead>
					<tr style="border-bottom: 1px solid black;">
						<th style="width: 413px; font-size: 24px; font-weight: bold;">상품</th>
						<th style="width: 197px; font-size: 24px; font-weight: bold;">제품 가격</th>
						<th style="width: 242px; font-size: 24px; font-weight: bold;">진행 상태</th>
					</tr>
				</thead>
				<tbody>
				 
					<tr>
						<th rowspan="2" style="border-right: 1px solid black; display: table-cell; vertical-align: top;"">
							<div id="productNameImg" style="text-align: left; margin-top: 10px; font-size: 20px;">
								&nbsp;&nbsp;${orderDto.PRODUCT_NAME}
							</div>
							<div id="imgContainer" style="display: block; width : 300px; height: 120px; margin-left: 88px;">
<!-- 								<img src="" alt="상품 이미지"> -->
								<a href="/DEMO_Project/shop/viewProduct.do?no=${orderDto.PRODUCT_NO}">
								<img alt="image not found" class="productImg" 
									src="<c:url value='/image/Product/${orderDto.STORED_FILE_NAME}'/>"
										onclick="goProductFnc(${orderDto.PRODUCT_NO});">
							</div>
						</th>
						<th style="font-size: 24px; font-weight: bold;">${orderDto.PRODUCT_QUANTITY} 개</th>
						<th rowspan="2" style="font-size: 24px; font-weight: bold; border-left: 1px solid black;">${orderDto.ORDER_STATUS}</th>
					</tr>
					<tr>
						<th style="font-size: 24px; font-weight: bold;">${formattedNumber}원</th>
					</tr>
			
			</table>

			<table id="secondTable">
				<tr>
					<th colspan="4" style="font-size: 24px; font-weight: bold; 
						text-align: left; margin-left: 5px; border-bottom: 3px solid black;">
					상세정보
					</th>
				</tr>
				<tr>
					<th style="font-size: 24px; font-weight: bold; text-align: left; padding-left: 10px; width: 210px;">주문일자</th>
					<th style="font-size: 24px; font-weight: bold; text-align: right; border-right: 1px solid black;  padding-right: 15px; width: 210px;">${formattedDate}</th>
					<th style="font-size: 24px; font-weight: bold; text-align: left; padding-left: 10px; width: 210px;">요청사항</th>
					<th style="font-size: 24px; font-weight: bold; text-align: right; width: 210px; padding-right: 10px;">
						<c:if test="${empty orderDto.ORDER_REQUEST}">없음</c:if>
						<c:if test="${not empty orderDto.ORDER_REQUEST}">${orderDto.ORDER_REQUEST}</c:if>
					</th>
				</tr>
				<tr>
					<th style="font-size: 24px; font-weight: bold; text-align: left; padding-left: 10px; width: 210px;">주문접수번호</th>
					<th style="font-size: 24px; font-weight: bold; text-align: right; border-right: 1px solid black; padding-right: 15px; width: 210px;">${orderDto.ORDER_NO}</th>
					<th style="font-size: 24px; font-weight: bold; text-align: left; padding-left: 10px; width: 210px;">결제금액</th>
					<th style="font-size: 24px; font-weight: bold; text-align: right; color: blue; width: 210px; padding-right: 10px;">${formattedCapNumber}원</th>
				</tr>
				
				</tbody>
			</table>
			<c:if test="${sessionScope.member.memberNo != 1 && orderDto.ORDER_STATUS eq '확정'}">
				<button type="button" onclick="goReviewFnc();" style="width: 90px; 
					height: 30px; font-size: 15px; font-weight: bold; background-color: #FFC4A3; 
						color: white; border: none; border-radius: 3px; float: right;">
							후기글쓰기
				</button>
			</c:if>
			
			
			<div id="divBottom">
				<div style="text-align: right; margin-top: 4px;">
					<c:if test="${orderDto.ORDER_STATUS eq '미확정'}">
						<!-- 주문 상태가 '취소'인 경우에만 아래 내용을 표시합니다. -->
						
						<form action="../order/orderCancelCtr.do"
							onsubmit="return checkOrderStatus()" id="cancelForm"
							method="post">
							<input type="hidden" name="orderNo" value="${orderDto.ORDER_NO}">
							<input type="submit" value="주문취소"
								style="width: 90px; height: 30px; font-size: 15px; 
									font-weight: bold; background-color: #FF3200; color: white; border: none; border-radius: 3px; float: right;">
						</form>
						<form action="../order/orderConfirmCtr.do"
							onsubmit="return checkOrderStatusConfirm()" id="confirmForm"
							method="post">
							<input type="hidden" name="orderNo" value="${orderDto.ORDER_NO}">
							<input type="submit" value="주문확정"
								style="width: 90px; height: 30px; font-size: 15px; 
									font-weight: bold; background-color: #FF3200; color: white; border: none; border-radius: 3px; margin-right: 10px;">
						</form>
					</c:if>
				</div>

				<div style="margin-top: 40px;">
					<input type="button" value="목록"
						style="width: 145px; height: 50px; font-size: 24px; cursor:pointer; 
							font-weight: bold; background-color: #FFC4A3; color: white; border: none; border-radius: 3px;"
						onclick="window.location.href='/DEMO_Project/mypage/mypage.do';">
				</div>
			</div>

		</div>
		
	</div>


	<jsp:include page="/WEB-INF/views/Footer.jsp" />
</body>
<script type="text/javascript">
function checkOrderStatus() {
    var orderStatus = "${orderDto.ORDER_STATUS}";
    var orderNo = "${orderDto.ORDER_NO}";
    if (orderStatus === '미확정') {
        var confirmCancel = confirm("정말 주문을 취소하시겠습니까?");
        if (confirmCancel) {
            return window.location.href = '../order/orderCancelCtr.do?orderNo=' + orderNo;; // 주문 취소 처리 페이지로 이동
        } else {
            return false; // 취소하지 않음
        }
    } else {
        alert("주문 취소가 불가능한 상태입니다.");
        return false; // 취소하지 않음
    }
}
function checkOrderStatusConfirm() {
    var orderStatus = "${orderDto.ORDER_STATUS}";
    var orderNo = "${orderDto.ORDER_NO}";
    if (orderStatus === '미확정') {
        var confirmConfirm = confirm("정말 주문을 확정하시겠습니까?");
        if (confirmConfirm) {
            return window.location.href = '../order/orderConfirmCtr.do?orderNo=' + orderNo;; // 주문 취소 처리 페이지로 이동
        } else {
            return false; // 취소하지 않음
        }
    } else {
        alert("주문 취소가 불가능한 상태입니다.");
        return false; // 취소하지 않음
    }
}

function goReviewFnc(){
	var productName = document.getElementById('productName').value;
	location.href='/DEMO_Project/board/reviewadd.do?productName=' + productName;	
}

function goProductFnc(no){
	location.href='/DEMO_Project/shop/viewProduct.do?no=' + no;
}
</script>
</html>