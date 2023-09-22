<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/DEMO_Project/resources/css/main.css">
<style type="text/css">

#routeDiv{
	width: 200px;
	padding: 10px;
	font-size: 14px;
}

#routeA{
	text-decoration:none;
	color:black;
}

#bodyContainer{
	display: flex;
	flex-flow: row;
}

#imgContainer{
	margin: 50px 100px;
	text-align: center;
}

#productImg {
	line-height: 150px;
	width: 300px;
	height: 300px;
}

#productImgContainer{
	width: 300px;
	height: 300px;
	border: 1px solid black;
}

#inputContainer{
	display:inline-block;
}

#type{
	float: right;
	font-size: 20px;
	font-weight: bold;
}
#typeTd{
	width: 220px;
}
select{
	height: 30px;
	width: 400px;
	font-size: 16px;
}
.inputName{
	height: 40px;
	width: 300px;
	font-size: 20px;
}
.btn{
	height: 30px;
	width: 80px;
	font-size: 20px;
	font-weight: bold;
}
#pointAccumulate{	
	border: 1px solid black;
	border-radius: 15px;
	font-size: 15px;
	text-align: center;
}
.midTd{
	width: 50px;
}
#price{
	color: red;
}
#inventory{
	font-weight: normal;
	font-size: 15px;
}
.inputTable{
	height: 50px;
}
#totalPrice{
	clear: right;
	float: right;
	margin-top: 100px;		 
}
.totalTd{
	width: 200px;
	text-align: right;
	font-size: 25px;
	font-weight: bold;
}
#totalPriceTd{
	color: red;
}
#adminBtn{
	margin-top: 100px;
	clear: right;
	float: right;
}
.adminBtn{
	width: 50px;
	height: 30px;
	background-color: red;
	border: none;
	color: white;
}
#goReview{
	clear: right;
	text-align: center;
	font-size: 25px;
}
#reviewSpan{
	color: blue;
}
#productDetailDiv{
	text-align:center;
	font-size: 32px;
}

#smarteditorContainer{
	margin: 0px auto;
	text-align: center;
	width: 860px;
}
#productDetailContent{
	display: flex;
	justify-content: center;
	align-content: center;
}

</style>
<script type="text/javascript" src="/DEMO_Project/resources/js/jquery-3.7.1.js">
</script>
<script type="text/javascript" src="/DEMO_Project/resources/smarteditor2-2.8.2.3/js/HuskyEZCreator.js"
	charset="utf-8">

</script>
<meta charset="UTF-8">
<title>상품추가</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/Header.jsp"/>
	
	<div id="mainContainer">		
		<form action="./addCtr.do" method="post">
			<div id='routeDiv'>
				<a id='routeA'>댕댕홈</a>
				<a id='routeA'> > </a>
				<a id='routeA'>쇼핑몰</a>
				<a id='routeA'> > </a>
				<a id='routeA' style='color:blue;'>물품등록</a>
			</div>
				
			<div id='bodyContainer'>
				<div id='imgContainer'>
					<div id='productImgContainer'>
						<c:set var="row" value="${fileList}"/>
						<img id='productImg' alt='이미지를 첨부해주세요'
							src="<c:url value='/image/Product/${row.STORED_FILE_NAME}'/>">
					</div>
					<br/>
					<input type="file" name="file" id="fileInput" style="display:none"
						onchange="fileSelected(${row.STORED_FILE_NAME})">
					<label for="fileInput" style="background-color: white;
						border:2px solid black;">
						이미지 첨부
					</label>
					
				</div>
				
				<div id='inputContainer'>
					<table id="type">
						<tr class="inputTable">
							<td id="typeTd">상품 유형</td>
							<td class="midTd"></td>
							<td>
								<select name="productSort">
									<option>상품 유형을 선택해주세요</option>
									<option>사료</option>
									<option>간식</option>
									<option>영양제</option>
									<option>미용/목욕용품</option>
									<option>장난감</option>
									<option>기타</option>
								</select>
							</td>
						</tr>
						<tr class="inputTable">
							<td>
								상품명을 등록해주세요
							</td>
							<td class="midTd"></td>
							<td>
								<input class="inputName" id="inputProductName"
									type="text" placeholder="상품명을 입력해주세요">
								<input class="btn" type="button" value="확인">
							</td>				
						</tr>
						<tr>
							<td id="price">
								0원
							</td>
							<td class="midTd"></td>
							<td rowspan="2">
								<input class="inputName" id="inputProductPrice"
									type="text" placeholder="가격을 입력해주세요">
								<input class="btn" type="button" value="확인">
							</td>				
						</tr>
						<tr>
							<td id="pointAccumulate">
								최대 0P 적립
							</td>
							<td class="midTd"></td>
						</tr>
						<tr class="inputTable">
							<td id="inventory">
								상품재고: 0개
							</td>
							<td class="midTd"></td>
							<td>
								<input class="inputName" id="inputProductStock"
									type="text" placeholder="수량을 입력해주세요">
								<input class="btn" type="button" value="확인">
							</td>				
						</tr>				
					</table>
					<table id="totalPrice">
						<tr>
							<td id="totalPriceTd" class="totalTd">
								총 상품금액
							</td>
							<td class="totalTd">
								0원
							</td>
						</tr>			
					</table>
					<div id="adminBtn">
						<input class="adminBtn" type="button" value="수정">
						<input class="adminBtn" type="button" value="삭제">
						<input class="adminBtn" type="button" value="등록">
					</div>
				</div>
			</div>
			<div id="goReview">
				<span>해당상품 후기 </span>
				<span id="reviewSpan">보러가기</span>
				
			</div>
			<div id="productDetailDiv">상품 상세 설명</div>
			<div id="smarteditorContainer">
				
				<textarea name="productDetailContent" id="productDetailContent"
					rows="20" cols="10"
					placeholder="내용을 입력해주세요"></textarea>
				
			</div>
		</form>
	</div>
	
	
	<jsp:include page="/WEB-INF/views/Footer.jsp"/>
</body>

<script>
	let oEditors = []
	
	function smartEditor() {
		console.log("Naver SmartEdtior")
		nhn.husky.EZCreator.createInIFrame({
			oAppRef: oEditors,
			elPlaceHolder:"productDetailContent",
			sSkinURI: "/DEMO_Project/resources/smarteditor2-2.8.2.3/SmartEditor2Skin.html",
			fCreator: "createSEditor2"
		})
		
	}
	function fileSelected() {
		var imgSrc = document.getElementById('productImg').getAttribute('src');
		var parts = imgSrc.split('/');
		var storedFileName = parts[parts.length - 1];
		var fileInputObj = document.getElementById("fileInput");
		var file = fileInput.files[0];
        var formData = new FormData();
        formData.append('file', file);
        formData.append('storedFileName', storedFileName);
		$.ajax({
			url : "/DEMO_Project/shop/imgInsert.do",
			method : "POST",
			data : formData,
			processData: false,
            contentType: false,
			
			success: function(fileList) {
				// 요청이 성공하면 결과를 화면에 표시
				alert('이미지 업로드 성공');
				console.log(fileList);
				var file = fileList[0].stored_file_name;
		        var productImgContainer = document.getElementById("productImgContainer");

		        productImgContainer.innerHTML =
			        '<img id="productImg" alt="이미지를 첨부해주세요5" ' +
			        'src=\'<c:url value="/image/Product/' + file + '"/>\'>';
			},
			error: function() {
				alert('이미지 업로드 실패');
             }
		});
	}
	
	function submitPost() {
		oEditor.getById["productDetailContent"].exec("UPDATE_CONTENTS_FIELD", [])
		let content = document.getElementById("productDetailContent").value
		
		if(content == ''){
			alert("내용을 입력해주세요.")
			oEditors.getById["productDetailContent"].exec("FOCUS")
			return
		} else {
			console.log(content)
		}
	}
	
	$(document).ready(function() {
		smartEditor()
	})
	
</script>
</html>