<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DAENGDAENG</title>
<link rel="stylesheet" type="text/css" href="/DEMO_Project/resources/css/main.css">
<script type="text/javascript" src="/DEMO_Project/resources/js/jquery-3.7.1.js">
</script>
<style>
#bannerImg{
	width:100%;
	cursor: pointer;
}
#imgDiv{
	padding-top: 30px;
}
.productDivClass{
	height:350px;
	border: 1px solid black;
	display:inline-block;
}
#bestProductDiv{
	width:40%;
	height: 340px;
	padding: 0px 50px;
}
#lastestProductDiv{
	width:40%;
	float:right;
	height: 340px;
	padding: 0px 50px;
}
.productDivTitle{
	padding-top:20px;
	text-align:center;
	font-size: 20px;
}
.productDiv{
	float: left;
	margin: 15px 10px;
	padding: 10px;
	width: 130px;
	height: 230px;
	border: 1px solid black;
	text-align: center;
	position: relative;
	cursor: pointer;
}
.productImg{
	width: 130px;
	height: 130px;
}
.productNameDiv{
	white-space: nowrap;        /* 줄 바꿈 금지 */
    overflow: hidden;           /* 넘치는 부분 감춤 */
    text-overflow: ellipsis;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/Header.jsp"/>
	<c:if test="${empty sessionScope.member}">
		<script>
			location.href="./DEMO_Project/auth/login.do"
		</script>
	</c:if>

	<div id='mainContainer'>
		<div id='imgDiv'>
			<img id='bannerImg' src='/DEMO_Project/resources/img/banner.png' alt='배너 없음'
				onclick='location.href="./shop/viewProduct.do?no=1"'>
		</div>
		
		<hr>
		
		<div id='bestProductDiv' class='productDivClass'>
			<div class='productDivTitle'>댕댕 베스트 상품</div>
			<jsp:include page="/WEB-INF/views/bestProductDiv.jsp"/>
		</div>
		
		<div id='lastestProductDiv' class='productDivClass'>
			<div class='productDivTitle'>댕댕 최신 상품</div>
			<jsp:include page="/WEB-INF/views/lastestProductDiv.jsp"/>
		</div>
		
	</div>
	
	<jsp:include page="/WEB-INF/views/Footer.jsp"/>
</body>
</html>