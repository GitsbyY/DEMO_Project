<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>

<head>
   <meta charset="UTF-8">
   <title>비밀번호 찾기</title>
   
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
#findPwdText{
   margin-top: 30px;
   text-align: left;
   color: #FFC4A3;
}
#findPwdBtn{
   text-align: center;
}
#findPwdBtn > button{
   height: 40px;
   width: 150px;
   margin-top: 40px;
   border: none;
   background-color: #FFC4A3;
   font-size: 16px;   
}
#findPwdResult{
   margin-top: 30px;   
   height: 30px;
   font-weight: bold;
   font-size: 16px;
}
table {
   width: 500px;
   border: 2px solid black;
   border-collapse: collapse;
}
tr, td{
   height: 50px;      
}
#changePwd, #checkPwd{
   height: 35px;
   width: 250px;
   text-align: center;
   font-size: 15px;
}
.secondTd{   
}
</style>

</head>

<body>
   
   <%-- <form action="changePassword.do" method="post">
      <div>
         <h1 style="text-align: center; color: #FFC4A3;">DAENGDAENG</h1>
         <div id="findPwdText">비밀번호 변경</div>
            <div id="findPwdResult">
               <table>
                  <tr>
                     <td class="firstTd">변경 할 비밀번호</td>
                     <td class="secondTd">
                        <input id="changePwd" type="password" name="memberPassword" 
                           placeholder="비밀번호를 입력해주세요">
                        <input type="hidden" name="memberNo" value="${sessionScope.member.memberNo}">   
                     </td>
                  </tr>
                  <tr>
                     <td class="firstTd">비밀번호 재입력</td>
                     <td>
                        <input id="checkPwd" type="password" 
                           placeholder="비밀번호를 입력해주세요">
                     </td>
                  </tr>
               
               </table>
               <div id="findPwdBtn">
                  <button type="submit">비밀번호 변경</button>
               </div>               
            </div>
                     
         
      </div>
   </form> --%>
   
   <form action="changePassword.do" method="post" onsubmit="return checkPasswords()">
        <div>
            <h1 style="text-align: center; color: #FFC4A3;"
            	onclick="location.href='/DEMO_Project/auth/login.do'">DAENGDAENG</h1>
            <div id="findPwdText">비밀번호 변경</div>
            <div id="findPwdResult">
                <table>
                    <tr>
                        <td class="firstTd">변경 할 비밀번호</td>
                        <td class="secondTd">
                            <input id="changePwd" type="password" name="memberPassword" 
                                placeholder="비밀번호를 입력해주세요">
                            <input type="hidden" name="memberNo" value="${sessionScope.member.memberNo}">    
                        </td>
                    </tr>
                    <tr>
                        <td class="firstTd">비밀번호 재입력</td>
                        <td>
                            <input id="checkPwd" type="password" 
                                placeholder="비밀번호를 입력해주세요">
                        </td>
                    </tr>
                    
                </table>
                <p id="passwordMismatch" style="color: red; display: none; text-align: left;">
                </p>
                <div id="findPwdBtn">
                    <button type="submit">비밀번호 변경</button>
                </div>               
            </div>
        </div>
    </form>
   
</body>
   
<script type="text/javascript">
   function checkPasswords() {
	   //비밀번호 정규식
	 	var password1 = document.getElementById("changePwd").value; 
	 
		var pwdCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-]).{4,20}$/;
	   
		var msg = document.getElementById("passwordMismatch");
	   if (!pwdCheck.test(password1)) {
		   msg.style.display = "block";
			if (password1.length < 8) {
				msg.innerHTML = "최소 8자 이상이어야 합니다.";
			} else {
				msg.innerHTML = "영문과 숫자와 특수문자를 조합해서 입력해 주세요.";
			}
				return false;
		}
	   
       var password1 = document.getElementById("changePwd").value;
       var password2 = document.getElementById("checkPwd").value;
   
       if (password1 !== password2) {
           document.getElementById("passwordMismatch").style.display = "block";
           msg.innerHTML = "동일한 값을 입력해주세요.";
           return false;
       }
   
       return true;
              
   }
   


   
</script>

</html>