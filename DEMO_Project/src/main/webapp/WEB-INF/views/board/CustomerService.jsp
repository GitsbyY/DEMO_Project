<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
#titleDiv {
	margin-top: 30px;
	border: 1px solid gray;
	border-collapse: collapse;
	border-top: thick;
	border-left: thick;
	border-right: thick;
	table-layout: fixed;
	font-size: 30px;
	margin-bottom: 10px;
	width: 100%;
}

#firstDiv {
	border-bottom: 2px solid black;
	width: 180px;
	display: block;
}

#secondTh {
	
}

#tableDiv {
	margin-top: 60px;
	clear: right;
	width: 100%;
}

th {
	border: 2px solid black;
	border-left: thick;
	border-right: thick;
	border-bottom: thick;
	height: 40px;
}

tr, td {
	border: 1px solid gray;
	border-left: thick;
	border-right: thick;
	height: 40px;
}

table {
	width: 100%;
	border-left: none;
	border-collapse: collapse;
	font-size: 16px;
}

#listColumn1 {
	width: 7%;
	background-color: #FFC4A3;
}

#listColumn2 {
	width: 10%;
	background-color: #FFC4A3;
}

#listColumn3 {
	width: 35%;
	background-color: #FFC4A3;
}

#listColumn4 {
	width: 10%;
	background-color: #FFC4A3;
}

#listColumn5 {
	width: 20%;
	background-color: #FFC4A3;
}

#listColumn6 {
	width: 15%;
	background-color: #FFC4A3;
}

.tdClass {
	text-align: center;
}

#pageDiv {
	margin-top: 30px;
	clear: right;
}

#writeBtnDiv {
	margin-top: 30px;
	float: right;
}

#writeBtn {
	background-color: #FFC4A3;
	border: none;
	color: white;
	width: 80px;
	height: 30px;
	font-size: 16px;
	font-weight: bold;
}
</style>
<meta charset="UTF-8">
<title>공지사항 메인</title>
<link rel="stylesheet" type="text/css"
	href="/DEMO_Project/resources/css/main.css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/Header.jsp" />

	<jsp:include page="/WEB-INF/views/asideCustomerService.jsp" />

	<div id='divContainer'>
		<div id="titleDiv">
			<div id="firstDiv">1:1 상담문의</div>
			<div id="secondDiv"></div>
		</div>

		<c:choose>
			<c:when test="${sessionScope.member.memberNo eq '1'}">
				<div id="tableDiv">
					<table>
						<tr>
							<th id="listColumn1" class="listColumn">번호</th>
							<th id="listColumn2" class="listColumn">질문유형</th>
							<th id="listColumn3" class="listColumn">제목</th>
							<th id="listColumn4" class="listColumn">작성자</th>
							<th id="listColumn5" class="listColumn">날짜</th>
							<th id="listColumn6" class="listColumn">상태</th>
						</tr>

						<c:forEach var="inquiryDto" items="${inquiryDtoList}">
							<tr>
								<td class="tdClass">${inquiryDto.INQUIRY_NO}</td>
								<td class="tdClass">${inquiryDto.INQUIRY_TYPE}</td>
								<td><a href='./listOne2.do?no=${inquiryDto.INQUIRY_NO}'>
										${inquiryDto.INQUIRY_TITLE} </a></td>
								<td class="tdClass">${inquiryDto.MEMBER_NAME}</td>
								<td class="tdClass"><fmt:formatDate
										pattern="yyyy-MM-dd HH:mm:ss"
										value="${inquiryDto.INQUIRY_CRE_DATE}" /></td>
								<td class="tdClass"><c:choose>
										<c:when test="${inquiryDto.INQUIRY_IS_REPLY eq 'N'}">
                              답변 대기중
                           </c:when>
										<c:when test="${inquiryDto.INQUIRY_IS_REPLY eq 'Y'}">
                              답변 완료
                           </c:when>
										<c:otherwise>

										</c:otherwise>
									</c:choose></td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</c:when>
			<c:otherwise>
				<div id="tableDiv">
					<table>
						<tr>
							<th id="listColumn1" class="listColumn">번호</th>
							<th id="listColumn2" class="listColumn">질문유형</th>
							<th id="listColumn3" class="listColumn">제목</th>
							<th id="listColumn4" class="listColumn">작성자</th>
							<th id="listColumn5" class="listColumn">날짜</th>
							<th id="listColumn6" class="listColumn">상태</th>
						</tr>
						<c:set var="index" value="0" scope="page" />
						<c:forEach var="inquiryDto" items="${inquiryDtoList}">
							<c:if
								test="${sessionScope.member.memberNo eq inquiryDto.MEMBER_NO}">
								<c:set var="index" value="${index + 1}" scope="page" />
								<tr>
									<td class="tdClass">${inquiryDto.INQUIRY_NO}</td>
									<td class="tdClass">${inquiryDto.INQUIRY_TYPE}</td>
									<td><a href='./listOne2.do?no=${inquiryDto.INQUIRY_NO}'>
											${inquiryDto.INQUIRY_TITLE} </a></td>
									<td class="tdClass">${inquiryDto.MEMBER_NAME}</td>
									<td class="tdClass"><fmt:formatDate
											pattern="yyyy-MM-dd HH:mm:ss"
											value="${inquiryDto.INQUIRY_CRE_DATE}" /></td>
									<td class="tdClass">
										<c:choose>
											<c:when test="${inquiryDto.INQUIRY_IS_REPLY eq 'N'}">
		                                			답변 대기중
		                             			</c:when>
											<c:when test="${inquiryDto.INQUIRY_IS_REPLY eq 'Y'}">
		                                			답변 완료
		                             			</c:when>
											<c:otherwise>
		
											</c:otherwise>
										</c:choose>
									</td>
								</tr>
							</c:if>
						</c:forEach>
					</table>
				</div>
			</c:otherwise>
		</c:choose>

		<c:choose>
			<c:when test="${sessionScope.member.memberNo ne '1'}">
				<div id="writeBtnDiv">
					<input id="writeBtn" type="button" value="문의하기"
						onclick="location.href = '/DEMO_Project/board/inquiryadd.do'">
				</div>
			</c:when>
			<c:otherwise>

			</c:otherwise>
		</c:choose>

		<div id="pageDiv">
			<jsp:include page="/WEB-INF/views/common/BoardPaging.jsp">
				<jsp:param value="${pagingMap}" name="pagingMap" />
			</jsp:include>

			<form action="./customerService.do" id='pagingForm' method="post">
				<input type="hidden" id='curPage' name='curPage'
					value="${pagingMap.boardPaging.curPage}">
			</form>
		</div>
	</div>



	<jsp:include page="/WEB-INF/views/Footer.jsp" />
</body>
</html>