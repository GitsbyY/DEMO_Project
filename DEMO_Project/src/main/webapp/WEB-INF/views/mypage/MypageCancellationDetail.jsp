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
</style>
<meta charset="UTF-8">
<title>주문상세 페이지</title>
<link rel="stylesheet" type="text/css"
	href="/DEMO_Project/resources/css/main.css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/Header.jsp" />

	<jsp:include page="/WEB-INF/views/asideMyPage.jsp" />
	<fmt:formatDate value="${orderDto.ORDER_DATE}" pattern="yyyy/MM/dd" var="formattedDate" />
	<fmt:formatDate value="${orderDto.ORDER_CANCEL_DATE}" pattern="yyyy/MM/dd" var="formattedCancelDate" />

	<div id='divContainer'>
		<div id="divTitle">취소 상세</div>
		<div id='divDetailContainer'>

			<div id="divTop">
				<div>${orderDto.ORDER_DATE}&nbsp;&nbsp;|</div>
				<div>${orderDto.ORDER_NO}&nbsp;&nbsp;|</div>
				<div>${orderDto.ORDER_CANCEL_DATE}&nbsp;&nbsp;|</div>
				<div>${orderDto.MEMBER_NO}&nbsp;&nbsp;|</div>
				<div>${orderDto.MEMBER_ID}</div>
			</div>

			<table id="firstTable">
				<thead>
					<tr style="border-bottom: 1px solid black;">
						<th style="width: 413px; font-size: 24px; font-weight: bold;">상품</th>
						<th style="width: 197px; font-size: 24px; font-weight: bold;">금액</th>
						<th style="width: 242px; font-size: 24px; font-weight: bold;">진행 상태</th>
					</tr>
				</thead>
				<tbody>
				 
					<tr>
						<th rowspan="2" style="border-right: 1px solid black;">
							<img src="" alt="상품 이미지">
							<input type="text" value="텍스트박스 내용">
						</th>
						<th style="font-size: 24px; font-weight: bold;">1개</th>
						<th rowspan="2" style="font-size: 24px; font-weight: bold; border-left: 1px solid black;">${orderDto.ORDER_STATUS}</th>
					</tr>
					<tr>
						<th style="font-size: 24px; font-weight: bold;">${orderDto.PRODUCT_PRICE}</th>
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
					<th style="font-size: 24px; font-weight: bold; text-align: left; padding-left: 10px; width: 210px;">결제일자</th>
					<th style="font-size: 24px; font-weight: bold; text-align: right; width: 210px; padding-right: 10px;"></th>
				</tr>
				<tr>
					<th style="font-size: 24px; font-weight: bold; text-align: left; padding-left: 10px; width: 210px;">주문접수번호</th>
					<th style="font-size: 24px; font-weight: bold; text-align: right; border-right: 1px solid black; padding-right: 15px; width: 210px;">${orderDto.ORDER_NO}</th>
					<th style="font-size: 24px; font-weight: bold; text-align: left; padding-left: 10px; width: 210px;">주문취소일</th>
					<th style="font-size: 24px; font-weight: bold; text-align: right; width: 210px; padding-right: 10px;">${formattedCancelDate}</th>
				</tr>
				
				</tbody>
			</table>

			<div id="divBottom">
				<div style="margin-top: 40px;">
					<input type="button" value="목록" 
						style="width: 145px; height: 50px; font-size: 24px; font-weight: bold;" onclick="window.location.href='/DEMO_Project/mypage/mypage.do';">	
				</div>
			</div>
			
		</div>
		
	</div>


	<jsp:include page="/WEB-INF/views/Footer.jsp" />
</body>
<script type="text/javascript">

</script>
</html>