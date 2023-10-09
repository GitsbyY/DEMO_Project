<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>회원 탈퇴</title>
	
<style type="text/css">
html, body, div, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote,
	pre, a, abbr, address, big, cite, code, del, dfn, em, font, img, ins, q,
	s, samp, small, strike, strong, sub, sup, tt, var, b, u, i, ul, ol, li,
	dl, dt, dd, table, caption, tbody, tfoot, thead, tr, th, td, fieldset,
	form, label, legend, input, button, textarea, select {
	margin: 0;
	padding: 0;
}

html, body {
	margin: 0;
	padding: 0;
}
#errorDiv {
	background-color: #fefefe;
	margin: 150px auto;
	padding: 50px 20px 20px 20px;
	width: 500px;
	height: 500px;
	position: relative;
	font-size: 28px;
	text-align: center;
}
#pStyle {
	font-size: 54px;
	font-weight: bold;
	text-align: center;
	color: #FFC4A3;
	cursor: pointer;
	margin-bottom: 30px;
}

#divContainer{
	margin: 100px auto;
}

#button{
	padding-top: 10px;
	margin: auto;
	width: 145px;
	height: 40px;
	font-size: 24px;
	cursor:pointer;
	font-weight: bold;
	background-color: #FFC4A3;
	color: white;
	border: none;
	border-radius: 3px;"
}
</style>

</head>

<body>
	<c:if test="${sessionScope.member.memberNo == 1}">
		<script>
			alert('정상적으로 탈퇴시켰습니다.');
			location.href="/DEMO_Project/mypage/mypageProfileAdmin.do";
		</script>
	</c:if>
	<div id="errorDiv" >
		<p id="pStyle">DAENGDAENG</p>
		<div id='divContainer'>
			탈퇴가 정상적으로 되었습니다.<br>
			더 나은 댕댕이 되도록 노력하겠습니다.
		</div>
		<div id='button'
			onclick="location.href='/DEMO_Project/'">메인으로</div>
	</div>

</body>
	
<script type="text/javascript">
</script>

</html>
