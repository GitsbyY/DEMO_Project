<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DAENGDAENG</title>
<link rel="stylesheet" type="text/css" href="/DEMO_Project/resources/css/main.css">
<style>
#bannerImg{
	width:100%;
}
#imgDiv{
	padding-top: 30px;
}
.productDiv{
	height:350px;
	border: 1px solid black;
	display:inline-block;
}
#bestProductDive{
	width:49%;
}
#lastestProductDive{
	width:49%;
	float:right;
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
			<img id='bannerImg' src='/DEMO_Project/resources/img/banner.png' alt='배너 없음'>
		</div>
		
		<hr>
		
		<div id='bestProductDive' class='productDiv'>
			
		</div>
		
		<div id='lastestProductDive' class='productDiv'>
			
		</div>
		
	</div>
	
	<jsp:include page="/WEB-INF/views/Footer.jsp"/>
</body>
</html>