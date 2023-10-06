<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<script type="text/javascript" src="/DEMO_Project/resources/js/jquery-3.7.1.js">

</script>

<style type="text/css">
nav > ul {
    list-style-type: none;
    padding: 0;
    overflow: hidden;
    background-color: white;
/*     width: 1000px; */ /* 넓이를 주면 고정  */
    display: table; /* table을 주면  요소의 내용에 맞게 자동으로 크기 */
    margin-left: auto;
    margin-right: auto;
    
}

nav > ul > li {
   float: left;
   margin-right: 10px;
}

nav > ul > li > a {
    display: block;
    color: black; 
    text-align: center;
    padding: 16px;
    text-decoration: none;
}

nav > ul > li > a:hover { 
     color: black; 
     background-color: white; 
     font-weight: bold;
     border: 1px solid gray; 
 }
span{   
   color: red;
} 
</style>

<script type="text/javascript">
   function goPage(pageNumber) {
      //자바스크립트
//       var curPageObj = document.getElementById('curPage');
//       curPageObj.value = pageNumber;
//       alert(curPageObj.value);
//       var pagingFormObj = document.getElementById('pagingForm');
//       pagingFormObj.submit();
      
      //제이쿼리
                  //$면 document # 은 아이디
      var curPageObj = $("#curPage")
      //셋
      curPageObj.val(pageNumber);
      //겟
//       alert(curPageObj.val());
      
      
      var pagingFormObj = $('#pagingForm');
      pagingFormObj.submit();
      
   }
   
   //이렇게 적으면 실제로 css가 변하게 된다.
   //css에 적용되는 방식이 jquery에 그대로 반영된다. >도 사용가능
//    window.onload = function(){
//       $('.jqueryTest').css('background-color','red');
//    }
//    window.onload = function() {
//       var a = document.getElementsByClassName('numClass');
      
//       for (var i = 0; i < a.length; i++) {
//          if (a[i].textContent == ${pagingMap.memberPaging.curPage}) {
//             a[i].style.backgroundColor = "red";
//          }
//       }
//    } -IC
</script>
   <nav class='jqueryTest'>
   
      <ul>
         <c:if test="${pagingMap.boardPaging.prevBlock ne 1}">
            <li>
<!--                                     EL 태그라서 get을 호출하는 매서드이다. -->
               <a href="#" onclick="goPage(${pagingMap.boardPaging.prevBlock});">
                  <span>≪</span>
               </a>
            </li>
         </c:if>
         
         <c:forEach var="num" begin="${pagingMap.boardPaging.blockBegin}" 
            end="${pagingMap.boardPaging.blockEnd}">
            <li>
               <a class='numClass' href="#" onclick="goPage(${num})"
                   <c:if test="${num == pagingMap.boardPaging.curPage}">
                           style="background-color: #FFC4A3;"
                       </c:if>>
                       ${num}
                    </a>
            </li>
         </c:forEach>

         <c:if test="${pagingMap.boardPaging.curBlock < pagingMap.boardPaging.totBlock}">
            <li>
               <a href="#" onclick="goPage(${pagingMap.boardPaging.nextBlock});">
                  <span>≫</span>
               </a>
            </li>
         </c:if>

      </ul>
   </nav>