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
			<div class="container-fluid"
				style="padding-top: 5%; padding-left: 10%; padding-right: 10%; padding-bottom: 5%">
				<h2>충전소 찾기</h2>
				<br>

				<!-- 지역 선택 -->
				<div class="w3-half" style="padding-left: 2%; padding-right: 2%">
					<select class="w3-select w3-border-white"
						onchange="reqAddr(this.value)">
						<c:forEach items="${addrList}" var="data">
							<option value="${data.addrNum}">${data.addrName}</option>
						</c:forEach>
					</select>
				</div>

				<!-- 충전소 선택 -->
				<div class="w3-half" style="padding-left: 2%; padding-right: 2%">
					<select class="w3-select w3-border-white" id="selectStation"
						onchange="reqStation(this.value)">
					</select>
				</div>

				<br>
				<br>
				<br>

				<!-- Map 출력 -->
				<div id="map" style="width: 100%; height: 400px;"></div>
				<br>
				<br>

				<div style="width: 100%;">
					<table class="w3-table w3-bordered" id="print">

					</table>
				</div>
				<br>
				<div id="bookmarkBtn" style="text-align: center"></div>


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

	<script type="text/javascript" src="js/httpRequest.js"></script>
	<script type="text/javascript">
		var data;
	
		function reqAddr(addrNum) {
			console.log(1);
			sendRequest("addressStation", "addr=" + addrNum, stationView, "POST");
		}
	
		function stationView() {
			if (httpRequest.readyState == 4 && httpRequest.status == 200) {
				var tagInStation = "";
				var index;
	
				data = httpRequest.responseText.trim();
				data = JSON.parse(data);
	
				for (i = 0; i < data.length; i++) {
					tagInStation += '<option value="' + i + '">' + data[i].sName + '</option>';
				}
	
				document.getElementById("selectStation").innerHTML = tagInStation;
			}
		}
	
		function reqStation(index) {
			var tagInPrint = "";
			var tagInBookmarkBtn = "";
			var sName = data[index].sName;
			var addr = data[index].addr;
			var type = data[index].type;
			var latitude = data[index].latitude;
			var longitude = data[index].longitude;
	
			tagInPrint = '<tr><td style="width:30%"><strong>충전소 이름</strong></td><td>' + sName + '</td></tr>' +
				'<tr><td style="width:30%"><strong>주소</strong></td><td>' + addr + '</td></tr>' +
				'<tr><td style="width:30%"><strong>타입</strong></td><td>' + type + '</td></tr>';
	
			tagInBookmarkBtn = '<button class="w3-button w3-white w3-border w3-round-large" onclick="addBookmark(' + data[index].sId + ')">' +
				'<i class="fa fa-fw fa-star" style="color:#FFFF00"></i>&nbsp;&nbsp;즐겨찾기 추가' +
				'</button>';
	
			myMap(latitude, longitude);
			document.getElementById("print").innerHTML = tagInPrint;
			document.getElementById("bookmarkBtn").innerHTML = tagInBookmarkBtn;
		}
	
		function addBookmark(sId) {
			sendRequest("AddBookmark", "sId=" + sId, resultBookmark, "POST");
		}
	
		function resultBookmark() {
			if (httpRequest.readyState == 4 && httpRequest.status == 200) {
				var result = httpRequest.responseText.trim();
				if (result == 0) {
					alert("이미 추가된 항목입니다");
					document.getElementById("bookmarkBtn").innerHTML = "즐겨찾기에 추가된 항목입니다";
				} else if (result == 1) {
					alert("즐겨찾기에 추가하였습니다");
					document.getElementById("bookmarkBtn").innerHTML = "즐겨찾기에 추가된 항목입니다";
				} else {
					alert("로그인 후 이용해주시기 바랍니다");
				}
	
			}
		}
	
	
	
		function myMap(latitude, longitude) {
			var myLatlng = new google.maps.LatLng(latitude, longitude);
	
			var mapProp = {
				center : myLatlng,
				zoom : 18,
			};
			var map = new google.maps.Map(document.getElementById("map"), mapProp);
			var marker = new google.maps.Marker({
				position : myLatlng
			});
			marker.setMap(map);
		}
	</script>

	<!-- 구글 지도 -->
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBjvtC_0Hr83DsKOtKr0oamgTdwyBtcuho&callback=myMap"></script>

</body>
</html>
