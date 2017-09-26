<%@page import="java.util.ArrayList"%>
<%@page import="car.dto.AddressDto"%> 
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">


    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.css" rel="stylesheet">

    <!-- Custom fonts for this template -->
    <link href="vendor/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>

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
		<div class="container-fluid" style="padding-top:5%;padding-left:10%;padding-right:10%;padding-bottom:5%;" id="content">
		<!-- 본문 내용 -->
		<c:forEach items="${requestScope.bookmarkList}" var="station" varStatus="status">
			<div class="w3-card-4 w3-half" style="width: 40% ; margin:3%">
				<header class="w3-container w3-light-grey" style="text-align: center; padding:2%">
					<h5>${station.sName}</h5>
				</header>
				<div class="w3-container">
					<p>${station.addr}</p>
					<hr>
					맵 넣을 부분
					<div id="map2" style="width: 100%; height: 200px;"></div>
					<p>기타</p>
					<br>
				</div>
				<button class="w3-button w3-block w3-dark-grey">삭제하기</button>
			</div>
		</c:forEach>
		



			<!-- 본문 내용 끝 -->
		</div>
	</div>
	<!-- 본문 틀 끝 -->
	</section>


<!-- Logout Modal -->
	<jsp:include page="logoutModal.jsp" />

	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.js"></script>
	<script src="vendor/popper/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.js"></script>
	<script src="js/sb-admin.js"></script>


	<script type="text/javascript">
	
		function getLatLng(index){
			var latitude = ${requestScope.bookmarkList[index].latitude};
			var longitude = ${requestScope.bookmarkList[index].longitude};;
			function myMap(latitude, longitude);
		}

		function myMap(latitude, longitude) {
			var myLatlng = new google.maps.LatLng(latitude, longitude);
	
			var mapProp = {
				center : myLatlng,
				zoom : 18,
			};
			var map = new google.maps.Map(document.getElementById("map2"), mapProp);
			var marker = new google.maps.Marker({
				position : myLatlng
			});
			marker.setMap(map);
		}
	</script>
	<!-- 구글 지도 -->
	<script	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBjvtC_0Hr83DsKOtKr0oamgTdwyBtcuho&callback=myMap"></script>

</body>
</html>
