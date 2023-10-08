<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<script type="text/javascript" src="/DEMO_Project/resources/js/jquery-3.7.1.js">

</script>

<style type="text/css">
.productDiv{
	float: left;
	margin: 15px 10px;
	padding: 10px;
	width: 130px;
	height: 230px;
	border: 1px solid black;
	text-align: center;
	position: relative;
	cursor: pointer;
}
.productImg{
	width: 130px;
	height: 130px;
}
.productNameDiv{
	white-space: nowrap;        /* 줄 바꿈 금지 */
    overflow: hidden;           /* 넘치는 부분 감춤 */
    text-overflow: ellipsis;
}
</style>
   <nav class='jqueryTest'>
		<c:if test="${empty productList}">
			<script>
			 	
				function ajaxFnc() {
					$.ajax({
						url : "/DEMO_Project/bestProductDiv.do",
						method : "POST",
						
						success: function(data) {
							// 요청이 성공하면 결과를 화면에 표시
							console.log('받은 데이터:', data);
							productList = data;
							// productList를 사용하여 각 제품 정보를 동적으로 생성
			                 for (var i = 0; i < productList.length; i++) {
			                    var productDto = productList[i];
			                    var imageUrl = '/DEMO_Project/image/Product/' + productDto.STORED_FILE_NAME;
			
			                    var productDiv = '<div class="productDiv" onclick="viewProduct(' + productDto.PRODUCT_NO + ')">' +
			                        '<img alt="image not found" class="productImg" src="' + imageUrl + '" /><br/>' +
			                        '<div class="productNameDiv">' + productDto.PRODUCT_NAME + '</div>' +
			                        '<div>' + new Intl.NumberFormat('ko-KR', { style: 'currency', currency: 'KRW' }).format(productDto.PRODUCT_PRICE) + '원</div>' +
			                        '<div>남은수량:' + productDto.PRODUCT_STOCK + '개</div>' +
			                        '</div>';
			
			                    // 동적으로 생성된 제품 정보를 nav에 추가
			                    $('nav.jqueryTest').append(productDiv);
			                }
						},
						error: function() {
							alert('실패');
				            }
					});
				}
				ajaxFnc();
			</script>
		</c:if>
   </nav>
  
<script type="text/javascript">
	function viewProduct(no){
		location.href="./shop/viewProduct.do?no=" + no;
	}
</script>