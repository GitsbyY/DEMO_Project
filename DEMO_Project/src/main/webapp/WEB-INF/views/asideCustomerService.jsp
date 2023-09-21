<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
	<style>
	a{
		color: black;
		text-decoration-line: none;
	}

	</style>
	
	<aside>
		<h1 class="asideH1tag">고객센터</h1>
		<c:set var="cssinquiry" value="${sessionScope.customAside eq 'inquiry' ? 'curPageATag' : ''}" />
		<c:set var="cssannouncement" value="${sessionScope.customAside eq 'announcement' ? 'curPageATag' : ''}" />
		<a class="asideATag ${cssannouncement}" href="/DEMO_Project/board/announcement.do">공지사항</a><br>         
		<a class="asideATag ${cssinquiry}" href="/DEMO_Project/board/customerService.do">1:1 상담문의</a><br>
	</aside>
	
		<%-- <a class="asideATag ${varName}" href="./shop.do?category=${category eq 0 ? '' : category}">
            ${categoryName}
        </a><br>
		<a class="asideATag ${cssClass}" href="./shop.do?category=${category eq 0 ? '' : category}">
            ${categoryName} --%>