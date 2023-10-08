<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시스템 오류</title>
<link rel="stylesheet" type="text/css" href="/DEMO_Project/resources/css/main.css">
<style>
#errorDiv{
	text-align: center;
	padding-top: 250px;
	font-size: 60px;
	font-weight: bold;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/Header.jsp"/>

	<div id='mainContainer'>
		<div id='errorDiv'>
			죄송합니다. 오류가 발생하였습니다.
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/Footer.jsp"/>
</body>
</html>