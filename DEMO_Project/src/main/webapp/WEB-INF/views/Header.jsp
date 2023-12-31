<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div>
	<div id="headerSet" class="daengHeader">
		<div>
			<div id="daengLogo" class="logoSide"
				style="height: 75px; width: 75px;">
				<button id="daengLogoBtn" onclick="location.href='/DEMO_Project/'">
					<img alt="댕댕로고"
						src="/DEMO_Project/resources/img/imgHeader/logo.png"
						style="height: 80px; width: 90px; margin-top: 30px;">
				</button>
			</div>
			<div id="daengText" class="logoSide"
				style="height: 50px; width: 180px; margin-left: 10px; margin-top: 65px;">
				<button id="daengTxtBtn" onclick="location.href='/DEMO_Project/'">
					<h1>DAENGDAENG</h1>
				</button>
			</div>
		</div>
		<div>
			<div id="iconSet">
				<div class="buttonContainer">
					<div id="mallIcon" class="buttonSide"
						onclick="location.href = '/DEMO_Project/shop.do';">
						<button id="shopBtn">
							<img alt="쇼핑몰"
								src="/DEMO_Project/resources/img/imgHeader/cart.jpg">
							<p>쇼핑몰</p>
						</button>
					</div>
					<div id="mallBasket" class="buttonSide"
						onclick="location.href = '/DEMO_Project/cart.do';">
						<button id="cartBtn">
							<img alt="장바구니"
								src="/DEMO_Project/resources/img/imgHeader/basket.jpg">
							<p>장바구니</p>
						</button>
					</div>
					<div id="myDaeng" class="buttonSide"
						onclick="location.href = '/DEMO_Project/mypage/mypage.do';">
						<button id="myDaengBtn">
							<img alt="마이댕댕"
								src="/DEMO_Project/resources/img/imgHeader/customer.jpg">
							<p>마이댕댕</p>
						</button>
					</div>
					<div id="customerCenter" class="buttonSide"
						onclick="location.href = '/DEMO_Project/board/announcement.do';">
						<button id="customerCenterBtn">
							<img alt="고객센터"
								src="/DEMO_Project/resources/img/imgHeader/customcenter.jpg">
							<p>고객센터</p>
						</button>
					</div>
				</div>

				<div id="bottomRow">
					<a href="#" class="bottomRowButton" id="curEmoney">
						eMoney : 
						<fmt:formatNumber value="${sessionScope.member.memberEmoney}" pattern="#,##0" />
						원
					</a>
					<a href="#" class="bottomRowButton" id="memberNick" style="width: 90px;"> 
						${sessionScope.member.memberNickName}님
					</a>
					<a href="#" onclick="logoutFnc();"
					id="logoutButton" class="bottomRowButton">
						로그아웃
					</a>
				</div>
			</div>
		</div>
	</div>
	<hr>
</div>
<script type="text/javascript">

	function logoutFnc() {
		var result = confirm("로그아웃 하시겠습니까?");
		
		if(result){
			location.href = '/DEMO_Project/auth/login.do';
		}
		
	}
	
	document.addEventListener("DOMContentLoaded", function(){
	
		document.getElementById("curEmoney").addEventListener("click", function() {
		    var memberNo = ${sessionScope.member.memberNo};
		    var url = '/DEMO_Project/mypage/mypageProfilePayment.do?memberNo=' + memberNo;
		    location.href = url;
		});
		
		document.getElementById("memberNick").addEventListener("click", function() {
		    var url = '/DEMO_Project/mypage/mypageProfile.do';
		    location.href = url;
		});
		
	});
	
</script>
