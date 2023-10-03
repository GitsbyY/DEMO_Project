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

.productDiv{
	float: left;
	margin: 15px 10px;
	padding: 10px;
	width: 170px;
	height: 230px;
	border: 1px solid purple;
	text-align: center;
	position: relative;
}

.productImg{
	width: 150px;
	height: 150px;
}

#resultContainer{
	height: 600px;
}
.productNameDiv{
	white-space: nowrap;        /* 줄 바꿈 금지 */
    overflow: hidden;           /* 넘치는 부분 감춤 */
    text-overflow: ellipsis;
}
.hiddenClass{
	display:none;
}
.checkBoxClass{
	position:absolute;
	left: 5px;
    top: 5px;
}
</style>
<meta charset="UTF-8">
<title>쇼핑몰 메인</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/Header.jsp"/>
	
	<jsp:include page="/WEB-INF/views/asideShop.jsp"/>
	
	<div id='divContainer'>
		<form action="./shop.do" method="post" id='sortForm'>
			<div id='sortDiv'>
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
			
			</div>
			<div id='resultContainer'>
				<c:forEach var="productDto" items="${productList}">
					<div class='productDiv' onclick="viewProduct(${productDto.PRODUCT_NO})">
						<input type="checkbox" class="hiddenClass checkBoxClass"
							name="productNo" value="${productDto.PRODUCT_NO}">
						<img alt="image not found" class="productImg" 
								src="<c:url value='/image/Product/${productDto.STORED_FILE_NAME}'/>"><br/>
						<div class="productNameDiv">
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
				<c:if test='${sessionScope.member.memberNo == 1}'>
					<div id="btnDiv">
						<input class="btnClass adminBtnClass hiddenClass" type="button" value="전체"
							id="allCheckBox" onclick="allCheckboxFnc();">
						<input class="btnClass adminBtnClass hiddenClass" type="button" value="취소"
							onclick="hideDeleteFnc();">
						<input class="btnClass adminBtnClass viewClass" type="button" value="추가"
							onclick="location.href='./shop/add.do'">
						<input class="btnClass adminBtnClass viewClass" type="button" value="삭제"
							onclick="showDeleteFnc();">
						<input class="btnClass adminBtnClass hiddenClass" type="button" value="삭제"
							onclick="execDeleteFnc();">
					</div>
				</c:if>
			</div>
			<div>
				<jsp:include page="/WEB-INF/views/common/ShopPaging.jsp">
				<jsp:param value="${pagingMap}" name="pagingMap"/>
				</jsp:include>
				
				<!-- 	정보를 넘기기 위해서 폼을 만들었다 -->
				<input type="hidden" id="curPage" name="curPage"
			         value="${pagingMap.shopPaging.curPage}">
			   
			</div>
		</form>
	</div>
	

	
	<jsp:include page="/WEB-INF/views/Footer.jsp"/>
</body>

<script type="text/javascript">
	var functionEnabled = true;

	var sortSelectObj = document.getElementById("sortSelect");
	
	sortSelectObj.addEventListener("change", function() {
		var curPageObj = $("#curPage");
		curPageObj.val(1);
		document.getElementById("sortForm").submit();
	});
	
	var searchButtonObj = document.getElementById("searchButton");
	
	searchButtonObj.addEventListener("click", function() {
		var curPageObj = $("#curPage");
		curPageObj.val(1);
		document.getElementById("sortForm").submit();
	});
	
	function viewProduct(no){
		if(functionEnabled){
			location.href="./shop/viewProduct.do?no=" + no;
		}
	}
	
	function showDeleteFnc(){
		functionEnabled = !functionEnabled;
		var hiddenClassArray = Array.from(document.querySelectorAll(".hiddenClass"));
		var viewClassArray = Array.from(document.querySelectorAll(".viewClass"));

		for (var element of hiddenClassArray) {
		    element.style.display = "inline-block";
		}
		
		for (var element of viewClassArray) {
		    element.style.display = "none";
		}
	}
	
	function hideDeleteFnc(){
		functionEnabled = !functionEnabled;
		var hiddenClassArray = Array.from(document.querySelectorAll(".hiddenClass"));
		var viewClassArray = Array.from(document.querySelectorAll(".viewClass"));

		for (var element of viewClassArray) {
		    element.style.display = "inline-block";
		}
		
		for (var element of hiddenClassArray) {
		    element.style.display = "none";
		}
		
		const checkBoxObj = document.getElementById('allCheckBox');
	    
	    // 모든 제품 체크박스에 대한 jQuery 객체
	    const productCheckboxes = $('input[type="checkbox"]');
		if (checkBoxObj.value === "해제") {
	        // 전체 체크박스가 해제되었을 때, 모든 제품 체크박스를 해제
	        productCheckboxes.prop('checked', false);
	        checkBoxObj.value = "전체";
	    }
	}
	
	function allCheckboxFnc() {
	    const checkBoxObj = document.getElementById('allCheckBox');
	    
	    // 모든 제품 체크박스에 대한 jQuery 객체
	    const productCheckboxes = $('input[type="checkbox"]');
	    
	    if (checkBoxObj.value === "전체") {
	        // 전체 체크박스가 체크되었을 때, 모든 제품 체크박스를 선택
	        productCheckboxes.prop('checked', true);
	        checkBoxObj.value = "해제";
	    } else {
	        // 전체 체크박스가 해제되었을 때, 모든 제품 체크박스를 해제
	        productCheckboxes.prop('checked', false);
	        checkBoxObj.value = "전체";
	    }
	}
	
	function execDeleteFnc(){
		var checkboxes = document.querySelectorAll('input[type="checkbox"]');

        // 체크된 체크박스의 개수를 셉니다.
        var checkedCount = 0;
        checkboxes.forEach(function(checkbox) {
            if (checkbox.checked) {
                checkedCount++;
            }
        });

		if(checkedCount == 0){
			alert('선택한 상품이 없습니다.');
			return ;
		}
		if(confirm("상품을 삭제할 경우, 후기와 주문목록이 사라집니다.\n정말로 삭제하시겠습니까?")){
			var checkedProductNos = $('input[type="checkbox"]:checked').map(function () {
		        return this.value;
		    }).get();
		    // 배열을 JSON 문자열로 변환
		    var jsonString = JSON.stringify({ productNos: checkedProductNos });
			
		    location.href="/DEMO_Project/shop/delete.do?formData=" + jsonString;
		}
	}
</script>
</html>