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
#findPasswordText{
   margin-top: 30px;
   text-align: left;
   color: #FFC4A3;
}
.inputTagWrap > #inputEmail, #inputId{
   height: 40px;
   width: 300px;
   margin-top: 3px;
   padding-left: 10px;
}
#findPasswordBtn{
   height: 40px;
   width: 100%;
   margin-top: 40px;
   border: none;
   background-color: #ccc; 
}
#warning{
   font-size: 5px;
   color: red;
   text-align: left;
}
#btn{
	float: right;
	margin-top: 10px;
	width: 80px;
	height: 30px;
}
#verificationCode{
	clear: right;
	float: left;
	margin-top: 10px;
	height: 30px;
	width: 200px;
	padding-left: 10px;
}
#sendMailBtn{	
	margin-top: 10px;
	width: 120px;
	height: 30px;
	float: right;
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
   
   <form action="findPasswordCtr.do" method="post" onsubmit="">
      <div>
         <h1 style="text-align: center; color: #FFC4A3;"
         	onclick="location.href='/DEMO_Project/auth/login.do'">DAENGDAENG</h1>
         <div id="findPasswordText">비밀번호 찾기</div>
         <div class="inputTagWrap">
            <div id="inputIdDiv" class="inputTagWrap">
               <input id="inputId" name="memberId" type="text" 
                  placeholder="아이디를 입력해주세요." onblur="checkMemberId()"> 
            </div>
            <p id="idCheck" style="color: red; display: none;">ID가 일치하지 않습니다.</p>
            <div id="inputEmailDiv" class="inputTagWrap">
               <input id="inputEmail" name="memberEmail" 
                  type="text" placeholder="이메일을 입력해주세요." onblur="checkMemberEmail()">
            </div>
            <p id="emailCheck" style="color: red; display: none;">정보가 일치하지 않습니다.</p>
         <c:if test="${not empty findFail}">
            <div id="warning">
               정보가 일치하지 않습니다.
            </div>
         </c:if>
         <div>
         	<button id="sendMailBtn" type="button" onclick="sendVerificationEmail();">인증 메일 발송</button>
         </div>
         <div>
         	<input id="verificationCode" type="text" placeholder="인증코드를 입력하세요.">
         	
         	<input type="hidden" id="authNumber" value="">
         </div>
         <div>
         	<button id="btn" type="button" onclick="verifyCode();">인증하기</button>
         </div>
         <p id="success" style="color: blue; display: none;">인증 되었습니다.</p>
         <p id="fail" style="color: red; display: none;">인증에 실패했습니다.</p>
         
         <div id="findPasswordBtnDiv">
            <button id="findPasswordBtn" type="button" onclick="findPasswordFnc();">확인</button>
         </div>
      </div>
   </form>
   
</body>
   
<script type="text/javascript">

	//페이지가 로드될 때 초기 설정을 수행합니다.
	$(document).ready(function() {
	    // 초기에는 버튼을 비활성화합니다.
	    var findPasswordBtn = document.getElementById("findPasswordBtn");
	    findPasswordBtn.disabled = true;
	    findPasswordBtn.style.backgroundColor = "#ccc";
	});

	//이메일 입력란을 떠날 때마다 호출되는 함수
	function checkMemberEmail() {
	    var memberEmail = document.getElementById("inputEmail").value;
	    var memberId = document.getElementById("inputId").value;
	
	    // Ajax를 사용하여 memberCheck2.do로 이동
	    $.ajax({
	        url: "/DEMO_Project/auth/memberCheck2.do",
	        method: "POST",
	        data: { memberEmail: memberEmail, 
	        	memberId: memberId},
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


	//아이디 입력란을 떠날 때마다 호출되는 함수
	function checkMemberId() {
	    var memberId = document.getElementById("inputId").value;
	
	    // Ajax를 사용하여 memberCheck.do로 이동
	    $.ajax({
	        url: "/DEMO_Project/auth/memberCheck.do",
	        method: "POST",
	        data: { memberId: memberId },
	        success: function(response) {
	            if (response === false) {
	                document.getElementById("idCheck").style.display = "block";
	            } else {
	                document.getElementById("idCheck").style.display = "none";
	            }
	        },
	        error: function() {
	            alert('에러 발생');
	        }
	    });
	}
	
	function sendVerificationEmail() {
	    var email = document.getElementById("inputEmail").value;	    
	
	    // Ajax를 사용하여 emailCheck.do 로 이동
	    $.ajax({
			url : "/DEMO_Project/auth/emailCheck.do",
			method : "POST",
			data : {email : email}, 
			
			success: function(authNumber) {
				document.getElementById("authNumber").value = authNumber;
			    alert("이메일이 발송되었습니다.");
				
			},
			error: function() {
				alert('회원정보가 일치하지 않습니다.');
			}
			});
	}
	
	function verifyCode() {
		
		var verificationCode = document.getElementById("verificationCode").value;
        var authNumber = document.getElementById("authNumber").value;
        var successMessage = document.getElementById("success");
        var failMessage = document.getElementById("fail");
        var findPasswordBtn = document.getElementById("findPasswordBtn");      

        if (verificationCode === authNumber) {
            successMessage.style.display = "block";
            failMessage.style.display = "none";
            findPasswordBtn.disabled = false;
            findPasswordBtn.style.backgroundColor = "#FFC4A3";

        } else {
            successMessage.style.display = "none";
            failMessage.style.display = "block";
            findPasswordBtn.disabled = true;
            findPasswordBtn.style.backgroundColor = "#ccc";
        }
	    
	}
	
	function findPasswordFnc() {
	    document.forms[0].submit();
	}
	
   
</script>

</html>