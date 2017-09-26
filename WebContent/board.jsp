<%@page import="java.util.ArrayList"%>
<%@page import="car.dto.AddressDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.css" rel="stylesheet">

<!-- Custom fonts for this template -->
<link href="vendor/font-awesome/css/font-awesome.css" rel="stylesheet"
	type="text/css">
<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'
	rel='stylesheet' type='text/css'>
<link
	href='https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic'
	rel='stylesheet' type='text/css'>

<!-- Plugin CSS -->
<link href="vendor/magnific-popup/magnific-popup.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/creative.css" rel="stylesheet">

<!-- w3school -->
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>

<body class="fixed-nav sticky-footer bg-dark">

	<!-- Navigation -->
	<jsp:include page="nav.jsp" />

	<section class="bg-primary" id="about">

	<!-- 본문 틀 -->
	<div class="content-wrapper">
		<!-- 본문 내용 -->
		<div class="container-fluid" style="padding-top:5%;padding-left:5%;padding-right:10%;padding-bottom:5%">
			<div class="w3-content w3-section" style="width: 100%">
				<h2>QnA Board</h2>
				<p>궁금한 사항을 남겨주세요</p>

				<div id="id01" class="w3-modal w3-animate-opacity">
					<div class="w3-modal-content w3-card-4">
						<header class="w3-container w3-">
							<span
								onclick="document.getElementById('id01').style.display='none'"
								class="w3-button w3-large w3-display-topright">&times;</span>
							<h3 id="header">내용</h3>
						</header>
						<div class="w3-container">
							<p id="textView"></p>
						</div>
						<footer class="w3-container w3-teal">
						</footer>
					</div>
				</div>
				<table class="table" style="width: 100%; border:1px solid #dddddd;">
					<thead>
						<tr>
							<th width="10%" style="background-color:#eeeeff; text-align: center;">NUM</th>
							<th width="25%" style="background-color:#eeeeff; text-align: center;">제목</th>
							<th width="25%" style="background-color:#eeeeff; text-align: center;">내용</th>
							<th width="20%" style="background-color:#eeeeff; text-align: center;">작성일시</th>
							<th colspan="2" width="20%" style="background-color:#eeeeff; padding-left:45px;">작성자</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${requestScope.board}" var="data">
						<tr>
							<td style="text-align: center;">${data.boardNum}</td>
							<td style="text-align: center;">${data.title}</td>
							<td style="text-align: center;">${data.content}</td>
							<td style="text-align: center;">${data.date}</td>
							<td style="text-align: right;">${data.id}</td>
							<td width="10%"><button value="${data.content}" onclick="textModal(value)" class="w3-button w3-light-gray" style="margin-left:40px;">보기</button></td>
						</tr>	
						</c:forEach>
					</tbody>
				</table>
				<a href="write.jsp" class = "btn btn-primary pull-right">글쓰기</a>
			</div>
		</div>
		<!-- 본문 내용 끝 -->
	</div>
	<!-- 본문 틀 끝 -->
	</section>
	<script type="text/javascript">
		function textModal(t){
			document.getElementById('id01').style.display="block";
			document.getElementById("textView").innerHTML = t;
		}
	</script>
	
	<!-- logoutModal -->
	<jsp:include page="logoutModal.jsp" />
	
	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.js"></script>
	<script src="vendor/popper/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.js"></script>

</body>
</html>
