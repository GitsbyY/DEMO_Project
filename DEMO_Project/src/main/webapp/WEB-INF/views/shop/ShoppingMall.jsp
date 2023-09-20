<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/DEMO_Project/resources/css/main.css">
<style type="text/css">

#search{
	float: right;	
	height: 35px;
	width: 220px;
	border-radius: 5px;
	padding-left: 10px;
	position: relative;
	margin-left:10px;
}

#searchButton{
	position: absolute;
	marign-top: 3px;
    margin-left: 310px;
    width: 18px;
    height: 30px;
}

#select{
	float: right;
	margin-right: 10px;
	margin-top: 18px;
	height: 20px;
	width: 100px;
	border-radius: 5px;
	font-size: 12px;
	font-weight: bold;
	background-color: #D3D3D3;
}

.optionTag{
	text-align: center;	
}
#btnDiv{
	clear: right;
	float: right;
	position: absolute;
	bottom: 10px;
	right: 5px;
}
#divContainer{
	position: relative;
}
.btnClass{
	width: 50px;
	height: 30px;
	margin-left: 10px;
}

#sortDiv {
	width: 100%;
	height: 40px;
	border: 1px solid black;
	text-align: right;
}

#productDiv{
	float: left;
	margin: 15px 10px;
	padding: 30px;
	width: 170px;
	height: 200px;
	border: 1px solid purple;
	text-align: center;
}

#resultContainer{
	height: 600px;
}
</style>
<meta charset="UTF-8">
<title>쇼핑몰 메인</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/Header.jsp"/>
	
	<jsp:include page="/WEB-INF/views/asideShop.jsp"/>
	
	<div id='divContainer'>
		<div id='sortDiv'>
			<form action="./shop.do" method="post" id='sortForm'>
				<input id="search" type="text" name="search"
					placeholder="상품명 검색"
					value="${pagingMap.search}"/>
		        <img src="/DEMO_Project/resources/img/Search.png"
		        	alt="제출" id="searchButton"/>
		        <input type="hidden" name="category"
		        	value="${pagingMap.category}">
				<select id="sortSelect" name="sort">
					<option class="optionTag"
						value="PRODUCT_PRICE ASC"
						<c:if test="${pagingMap.sort eq 'PRODUCT_PRICE ASC'}">
							selected
						</c:if>
						>낮은가격순</option>
					<option class="optionTag"
						value="PRODUCT_PRICE DESC"
						<c:if test="${pagingMap.sort eq 'PRODUCT_PRICE DESC'}">
							selected
						</c:if>
						>높은가격순</option>
				</select>
			</form>
		</div>
		<div id='resultContainer'>
			<c:forEach var="productDto" items="${productList}">
				<div id='productDiv'>
					<img alt="image not found" 
							src="<c:url value='/image/Product/${productDto.STORED_FILE_NAME}.png'/>"><br/>
					<div>
						${productDto.PRODUCT_NAME}
					</div>
					<div>
					<fmt:formatNumber value="${productDto.PRODUCT_PRICE}"
						type="number" />원
					</div>
					<div>
						남은수량:${productDto.PRODUCT_STOCK}개
					</div>
				</div>
			</c:forEach>
			<div id="btnDiv">
				<input class="btnClass" type="button" value="전체">
				<input class="btnClass" type="button" value="추가"
					onclick="location.href='./shop/add.do'">
				<input class="btnClass" type="button" value="삭제">
			</div>
		</div>
		<div>
			<jsp:include page="/WEB-INF/views/common/ShopPaging.jsp">
			<jsp:param value="${pagingMap}" name="pagingMap"/>
			</jsp:include>
			
			<!-- 	정보를 넘기기 위해서 폼을 만들었다 -->
			<form action="./shop.do" id="pagingForm" method="post">
			<input type="hidden" id="curPage" name="curPage"
		         value="${pagingMap.shopPaging.curPage}">
			</form>
		   
		</div>
		
	</div>
	

	
	<jsp:include page="/WEB-INF/views/Footer.jsp"/>
</body>

<script type="text/javascript">
	var sortSelectObj = document.getElementById("sortSelect");
	
	sortSelectObj.addEventListener("change", function() {
		document.getElementById("sortForm").submit();
	});
	
	var searchButtonObj = document.getElementById("searchButton");
	
	searchButtonObj.addEventListener("click", function() {
		document.getElementById("sortForm").submit();
	});
</script>
</html>