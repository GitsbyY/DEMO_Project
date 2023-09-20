<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
.inputname{
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

#smarteditor{
	text-align: center;
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
							<img id='productImg' alt='이미지를 첨부해주세요'>
						</div>
						<br/>
						<button>이미지 첨부</button>
						
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
									<input class="inputname" type="text" placeholder="상품명을 입력해주세요">
									<input class="btn" type="button" value="확인">
								</td>				
							</tr>
							<tr>
								<td id="price">
									0원
								</td>
								<td class="midTd"></td>
								<td rowspan="2">
									<input class="inputname" type="text" placeholder="가격을 입력해주세요">
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
									<input class="inputname" type="text" placeholder="수량을 입력해주세요">
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
				<div id="smarteditor">
					
					<textarea name="productDetailContent" id="productDetailContent"
						rows="20" cols="10"
						placeholder="내용을 입력해주세요"
						style="width: 500px"></textarea>
				
			</div>
		</form>
	</div>
	
	
	<jsp:include page="/WEB-INF/views/Footer.jsp"/>
</body>

<script>
	let oEditors = []
	
	smartEditor = function() {
		console.log("Naver SmartEdtior")
		nhn.husky.EZCreator.createInIFrame({
			oAppRef: oEditors,
			elPlaceHolder:"productDetailContent",
			sSkinURI: "/DEMO_Project/resources/smarteditor2-2.8.2.3/SmartEditor2Skin.html",
			fCreator: "createSEditor2"
		})
		
	}
	
	$(document).ready(function() {
		smartEditor()
	})
	
	submitPost = function() {
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
</script>
</html>