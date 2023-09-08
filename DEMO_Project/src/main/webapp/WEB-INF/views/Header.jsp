<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Header</title>

<script type="text/javascript"></script>

<link rel="stylesheet" type="text/css" href="./resources/css/Header.css">
</head>

<body>

	<div>
		<div id="headerSet" class="daengHeader">
			<div>
				<div id="daengLogo" class="logoSide"
					style="height: 75px; width: 75px;">
					<img alt="댕댕로고" src="./resources/img/imgHeader/logo.png"
						style="height: 65px; width: 70px; margin-top: 10px;">
				</div>
				<div id="daengText" class="logoSide"
					style="height: 50px; width: 180px; margin-top: 20px;">
					<h1>DAENGDAENG</h1>
				</div>
			</div>
			<div>
				<div id="iconSet">
					<div class="buttonContainer">
						<div id="mallIcon" class="buttonSide">
							<img alt="쇼핑몰" src="./resources/img//imgHeader/cart.jpg">
							<p>쇼핑몰</p>
						</div>
						<div id="mallBasket" class="buttonSide">
							<img alt="장바구니" src="./resources/img//imgHeader/basket.jpg">
							<p>장바구니</p>
						</div>
						<div id="myDaeng" class="buttonSide">
							<img alt="마이댕댕" src="./resources/img//imgHeader/customer.jpg">
							<p>마이댕댕</p>
						</div>
						<div id="customerCenter" class="buttonSide">
							<img alt="장바구니" src="./resources/img//imgHeader/customcenter.jpg">
							<p>고객센터</p>
						</div>
					</div>
					<div id="bottomRow">
						<div id="curEMony" class="bottomRowButton">금액</div>
						<div id="loginName" class="bottomRowButton">관리자님</div>
						<div id="logoutButton" class="bottomRowButton">로그아웃</div>
					</div>
				</div>
			</div>
		</div>
		<hr>
	</div>
</body>

</html>
