<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>


</head>
<body>
	<input type='hidden' id='productNo' value='${orderDto.productNo}'>
</body>
<script type="text/javascript">
	var productNo = $('#productNo').val();
	alert('결제가 오류났습니다.');
					//공통단은 언제 어디서나 가야하기 때문에 상대경로가 아닌 절대경로
	location.href='/DEMO_Project/shop/viewProduct.do?no=' + productNo;
</script>
</html>