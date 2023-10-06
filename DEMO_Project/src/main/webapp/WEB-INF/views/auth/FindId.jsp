<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>ID찾기</title>
	
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
  height: 100%;
  margin: 0;
  padding: 0;
}
form{
	margin-top: 200px;
}
body {
  display: flex;
  /* align-items: center; */
  justify-content: center;
  text-align: center;
}
div {
	display: block;
	align-items: center;
}
#findIdText{
	margin-top: 30px;
	text-align: left;
	color: #FFC4A3;
}
.inputTagWrap > #inputEmail, #inputPhone{
	height: 40px;
	width: 300px;
	margin-top: 3px;
	padding-left: 10px;
}
#findIdBtn{
	height: 40px;
	width: 100%;
	margin-top: 40px;
	border: none;
	background-color: #FFC4A3; 
}
#warning{
	font-size: 5px;
	color: red;
	text-align: left;
}
p{
	clear: both;
	font-size: 14px;
	float: left;
}
</style>
<script type="text/javascript" src="/DEMO_Project/resources/js/jquery-3.7.1.js">
</script>
</head>

<body>
	
	<form action="findIdCtr.do" method="post">
		<div>
			<h1 style="text-align: center; color: #FFC4A3; cursor: pointer;"
				onclick="location.href='/DEMO_Project/auth/login.do'">DAENGDAENG</h1>
			<div id="findIdText">ID 찾기</div>
			<div class="inputTagWrap">
				<div id="inputEmailDiv" class="inputTagWrap">
					<input id="inputEmail" name="memberEmail" type="text" 
						placeholder="이메일을 입력해주세요." onblur="checkMemberEmail()"> 
				</div>
				<p id="emailCheck" style="color: red; display: none;">EMAIL이 일치하지 않습니다.</p>
				<div id="inputPasswordDiv" class="inputTagWrap">
					<input id="inputPhone" name="memberPhone" 
						type="text" placeholder="전화번호를 입력해주세요." onblur="checkMemberPhone()">
				</div>
				<p id="phoneCheck" style="color: red; display: none;">정보가 일치하지 않습니다.</p>
			<c:if test="${not empty findFail}">
				<div id="warning">
					정보가 일치하지 않습니다.
				</div>
			</c:if>
			<div id="findIdBtnDiv">
				<button id="findIdBtn" type="submit">확인</button>
			</div>
		</div>
	</form>
	
</body>
	
<script type="text/javascript">

	//페이지가 로드될 때 초기 설정을 수행합니다.
	$(document).ready(function() {
	    // 초기에는 버튼을 비활성화합니다.
	    var findIdBtn = document.getElementById("findIdBtn");
	    
	    findIdBtn.disabled = true;	    
	    findIdBtn.style.backgroundColor = "#ccc";	    
	});
	
	//이메일 입력란을 떠날 때마다 호출되는 함수
	function checkMemberEmail() {
	    var memberEmail = document.getElementById("inputEmail").value;	    
	
	    // Ajax를 사용하여 memberCheck3.do로 이동
	    $.ajax({
	        url: "/DEMO_Project/auth/memberCheck3.do",
	        method: "POST",
	        data: { memberEmail: memberEmail},
	        success: function(response) {
	            if (response === false) {
	                document.getElementById("emailCheck").style.display = "block";
	            } else {
	                document.getElementById("emailCheck").style.display = "none";		            
	            }
	            
	        },
	        error: function() {
	            alert('에러 발생');
	        }
	    });
	}
	
	//전화번호 입력란을 떠날 때마다 호출되는 함수
	function checkMemberPhone() {
	    var memberPhone = document.getElementById("inputPhone").value;
	    var memberEmail = document.getElementById("inputEmail").value;
	
	    // Ajax를 사용하여 memberCheck4.do로 이동
	    $.ajax({
	        url: "/DEMO_Project/auth/memberCheck4.do",
	        method: "POST",
	        data: { memberEmail: memberEmail, 
	        	memberPhone: memberPhone},
	        success: function(response) {
	            if (response === false) {
	                document.getElementById("phoneCheck").style.display = "block";
	            } else {
	                document.getElementById("phoneCheck").style.display = "none";
	                var findIdBtn = document.getElementById("findIdBtn");
	                findIdBtn.disabled = false;
	                findIdBtn.style.backgroundColor = "#FFC4A3";
	                findIdBtn.style.cursor = "pointer";
	                
	            }
	            
	        },
	        error: function() {
	            alert('에러 발생');
	        }
	    });
	}
	

	
</script>

</html>
