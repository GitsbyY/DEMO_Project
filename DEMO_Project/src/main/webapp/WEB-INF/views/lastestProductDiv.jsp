<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <nav class='productNav2'>
   </nav>
  
<script type="text/javascript">
	function ajaxFnc() {
		$.ajax({
			url : "/DEMO_Project/lastestProductDiv.do",
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
	                    '<div>' + new Intl.NumberFormat().format(productDto.PRODUCT_PRICE) + '원</div>' +
	                    '<div>남은수량:' + productDto.PRODUCT_STOCK + '개</div>' +
	                    '</div>';
	
	                // 동적으로 생성된 제품 정보를 nav에 추가
	                $('nav.productNav2').append(productDiv);
	            }
			},
			error: function() {
				alert('실패');
	            }
		});
	}
	
	function viewProduct(no){
		location.href="./shop/viewProduct.do?no=" + no;
	}
	
	$(document).ready(function() {
		ajaxFnc();
	});
</script>