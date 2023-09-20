<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

	<aside>
    <h1 class="asideH1tag">댕댕 쇼핑몰</h1>
    <c:forEach var="category" begin="0" end="60" step="10">
        <c:set var="categoryName">
			<c:if test="${category eq 0}">전체</c:if>
			<c:if test="${category eq 10}">사료</c:if>
			<c:if test="${category eq 20}">간식</c:if>
			<c:if test="${category eq 30}">영양제</c:if>
			<c:if test="${category eq 40}">미용/목욕용품</c:if>
			<c:if test="${category eq 50}">장난감</c:if>
			<c:if test="${category eq 60}">기타</c:if>
        </c:set>
        <c:set var="cssClass" value="${category eq 0 ? 'curPageATag' : ''}" />
        <c:set var="cssClass" value="${category eq pagingMap.category ? 'curPageATag' : ''}" />
        <a class="asideATag ${cssClass}" href="./shop.do?category=${category eq 0 ? '' : category}">
            ${categoryName}
        </a><br>
    </c:forEach>

    <h1 class="asideH1tag">댕댕 게시판</h1>
    <a class="asideATag" href="/DEMO_Project/board/review.do">후기남겨요</a><br>
</aside>
