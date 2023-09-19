<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
.asideATagSelected{
	color: blue;
	font-weight: bold;
	text-decoration: none;
	margin-left: 35px;
	line-height: 2;
}
</style>

<aside>
    <h1 class="asideH1tag">댕댕 쇼핑</h1>
    <c:set var="currentPage" value="mypage" /> <!-- 현재 페이지를 설정 -->
    <c:url value="./mypage.do" var="mypageUrl" /> <!-- 현재 페이지의 URL을 설정 -->

    <!-- 주문목록 메뉴 -->
    <c:if test="${currentPage eq 'mypage'}">
        <a class="asideATagSelected" href="${mypageUrl}">주문목록</a><br>
    </c:if>
    <c:if test="${currentPage ne 'mypage'}">
        <a class="asideATag" href="${mypageUrl}">주문목록</a><br>
    </c:if>

    <!-- 취소내역 메뉴 -->
    <c:url value="./cancel.do" var="cancelUrl" />
    <c:if test="${currentPage eq 'cancel'}">
        <a class="asideATagSelected" href="${cancelUrl}">취소내역</a><br>
    </c:if>
    <c:if test="${currentPage ne 'cancel'}">
        <a class="asideATag" href="${cancelUrl}">취소내역</a><br>
    </c:if>

    <!-- 쇼핑몰 결제관리 메뉴 -->
    <c:url value="./payment.do" var="paymentUrl" />
    <c:if test="${currentPage eq 'payment'}">
        <a class="asideATagSelected" href="${paymentUrl}">쇼핑몰 결제관리</a><br>
    </c:if>
    <c:if test="${currentPage ne 'payment'}">
        <a class="asideATag" href="${paymentUrl}">쇼핑몰 결제관리</a><br>
    </c:if>

    <h1 class="asideH1tag">댕댕 프로필</h1>

    <!-- 회원정보확인/수정 메뉴 -->
    <c:url value="./profile.do" var="profileUrl" />
    <c:if test="${currentPage eq 'profile'}">
        <a class="asideATagSelected" href="${profileUrl}">회원정보확인/수정</a><br>
    </c:if>
    <c:if test="${currentPage ne 'profile'}">
        <a class="asideATag" href="${profileUrl}">회원정보확인/수정</a><br>
    </c:if>

    <!-- 결제관리 메뉴 -->
    <c:url value="./paymentManagement.do" var="paymentManagementUrl" />
    <c:if test="${currentPage eq 'paymentManagement'}">
        <a class="asideATagSelected" href="${paymentManagementUrl}">결제관리</a><br>
    </c:if>
    <c:if test="${currentPage ne 'paymentManagement'}">
        <a class="asideATag" href="${paymentManagementUrl}">결제관리</a><br>
    </c:if>
</aside>