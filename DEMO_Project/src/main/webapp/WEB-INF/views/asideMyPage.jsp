<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- 	<aside> -->
<!-- 		<h1 class="asideH1tag">댕댕 쇼핑</h1> -->
<!-- 		<a class="asideATag" href="./mypage.do">주문목록</a><br> -->
<!-- 		<a class="asideATag">취소내역</a><br> -->
<!-- 		<a class="asideATag">쇼핑몰 결제관리</a><br><br>		 -->
<!-- 		<h1 class="asideH1tag">댕댕 프로필</h1> -->
<!-- 		<a class="asideATag">회원정보확인/수정</a><br> -->
<!-- 		<a class="asideATag">결제관리</a><br> -->
<!-- 	</aside> -->

<style>
.asideATagSelected {
	color: blue;
	font-weight: bold;
	text-decoration: none;
	margin-left: 35px;
	line-height: 2;
}
</style>

<aside>
	<h1 class="asideH1tag">댕댕 쇼핑</h1>

	<%-- 		<c:set var="cssinquiry" value="${sessionScope.customAside eq 'inquiry' ? 'curPageATag' : ''}" /> --%>
	<%-- 		<c:set var="cssannouncement" value="${sessionScope.customAside eq 'announcement' ? 'curPageATag' : ''}" /> --%>
	<%-- 		<a class="asideATag ${cssinquiry}" href="/DEMO_Project/board/customerService.do">1:1 상담문의</a><br> --%>
	<%-- 		<a class="asideATag ${cssannouncement}" href="/DEMO_Project/board/announcement.do">공지사항</a><br>          --%>
	<!-- 주문목록 메뉴 -->
	<c:set var="cssOrder" value="${sessionScope.myPageAside eq 'order' ? 'asideATagSelected' : 'asideATag'}" />
	<a class="${cssOrder}" href="/DEMO_Project/mypage/mypage.do">주문목록</a><br>

	<!-- 취소내역 메뉴 -->
	<c:set var="cssCancel" value="${sessionScope.myPageAside eq 'cancel' ? 'asideATagSelected' : 'asideATag'}" />
	<a class="${cssCancel}" href="/DEMO_Project/mypage/cancelPage.do">취소내역</a><br>

<!-- 	<!-- 쇼핑몰 결제관리 메뉴 --> -->
<%-- 	<c:set var="cssMallPay" value="${sessionScope.myPageAside eq 'mallPay' ? 'asideATagSelected' : 'asideATag'}" /> --%>
<%-- 	<a class="${cssMallPay}" href="${paymentUrl}">쇼핑몰 결제관리</a><br> --%>


	<h1 class="asideH1tag">댕댕 프로필</h1>

	<!-- 회원정보확인/수정 메뉴 -->
	<c:set var="cssMemberInfo" value="${sessionScope.myPageAside eq 'memberInfo' ? 'asideATagSelected' : 'asideATag'}" />
	<a class="${cssMemberInfo}" href="/DEMO_Project/mypage/mypageProfile.do">회원정보확인/수정</a><br>

	<!-- 결제관리 메뉴 -->
	<c:set var="cssMemberPay" value="${sessionScope.myPageAside eq 'memberPay' ? 'asideATagSelected' : 'asideATag'}" />
	<a class="${cssMemberPay}" href="/DEMO_Project/mypage/mypageProfilePayment.do">결제관리</a><br>

</aside>