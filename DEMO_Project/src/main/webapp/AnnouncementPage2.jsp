<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
aside{
   /* background-color: #E0EEEE; */
   float: left;
   width: 180px;
   height: 600px;
   margin-left: 17%;
   margin-right: 100px;
}
.aTag{
   margin-left: 35px;
   line-height: 2;
   font-weight: bold;
}

.H1tag{
   margin-left: 10px;
   line-height: 2.5;      
}  

#titleTable{
   margin-top: 30px;
   border: 1px solid gray;
   border-collapse: collapse;
   border-top: thick;
   border-left:thick;
   border-right:thick;
   margin-right: 15.5%;
   table-layout: fixed;   
}
th{
   
   font-size: 30px;
}

#firstTh{
   border-bottom: 2px solid black;
   width: 150px;
   display: block;     
}

#secondTh{
   width: 900px;   
}

#titleTag{
	color: blue;
}

</style>
<meta charset="UTF-8">
<title>공지사항 메인</title>
<!-- <link rel="stylesheet" type="text/css" href="css/mystyles.css"> -->
<!-- <script src="js/myscript.js"></script> -->
</head>
<body>
   <jsp:include page="/WEB-INF/views/Header.jsp"/>
   
   <aside>
      <h1 class="H1tag">고객센터</h1>
      <a class="aTag">1:1 상담문의</a><br>
      <a id="titleTag" class="aTag">공지사항</a><br>         
   </aside>
   <table id="titleTable">
      <tr>
         <th id="firstTh">공지사항</th>
         <th id="secondTh"></th>      
      </tr>            
   </table>
  
   <jsp:include page="/WEB-INF/views/Foot.jsp"/>
</body>
</html>