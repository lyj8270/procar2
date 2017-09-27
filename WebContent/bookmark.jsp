<%@page import="car.dto.StationDto"%>
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
			<div class="container-fluid"
				style="padding-top: 5%; padding-left: 10%; padding-right: 10%; padding-bottom: 5%;">
				<div class="w3-content w3-section" style="width: 100%">
					<h2>즐겨찾기</h2>
					<p>등록한 즐겨찾기 목록입니다</p>

					<!-- 본문 내용 -->
					<table class="w3-table w3-bordered" id="bookTable"
						style="width:100%;">
						<c:forEach items="${requestScope.bookmarkList}" var="data">
							<tr>
								<td>${data.sName}</td>
								<td>${data.addr}</td>
								<td>${data.type}</td>
							  	<td	onclick="viewMap('${data.sName}','${data.addr}','${data.latitude}','${data.longitude}')">
							  	<i class="fa fa-fw fa-map" style="color:#47C83E;cursor: pointer">
								</i>지도보기</td>
								<td>
								<i class="fa fa-fw fa-times" style="color:#DF4D4D;cursor: pointer"
								   id="${data.sId}"
								   onclick="deleteBookmark(this.id)"></i>
								</td>

							</tr>
						</c:forEach>
					</table>


					<!-- map modal -->
					<div id="id01" class="w3-modal">
						<div class="w3-modal-content w3-animate-zoom w3-card-4"
							style="padding: 3%">
							<header class="w3-container">
								<span
									onclick="document.getElementById('id01').style.display='none'"
									class="w3-button w3-display-topright">&times;</span>
								<div id="mapTitle"></div>
								<div id="mapAddr"></div>
							</header>
							<br>
							<br>
							<div class="w3-container">
								<div id="mapContent" style="width: 100%; height: 400px;"></div>
							</div>
						</div>
					</div>
				</div>
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

	<script>
		function deleteBookmark(sId) {
			var check = confirm("삭제 하시겠습니까?");
			if (check) {
				sendRequest("DeleteBookmark", "sId=" + sId, updateBookmark, "POST");
			} else {
				return;
			}
		}
	
		function updateBookmark() {
			if (httpRequest.readyState == 4 && httpRequest.status == 200) {
				var data = httpRequest.responseText.trim();
				var jsonData = JSON.parse(data);
				var tagInTable = "";
	
				for (i = 0; i < jsonData.length; i++) {
					tagInTable += '<tr>'
						+ '<td>' + jsonData[i].sName + '</td>'
						+ '<td>' + jsonData[i].addr + '</td>'
						+ '<td>' + jsonData[i].type + '</td>'
						+'<td onclick="viewMap(\'' + jsonData[i].sName + '\',\'' + jsonData[i].latitude + '\',\'' + jsonData[i].longitude + '\')">'
						+'<i class="fa fa-fw fa-map" style="color:#47C83E;cursor: pointer"></i>지도보기'
						+'</td>'
						+'<td>'
						+'<i class="fa fa-fw fa-times" style="color:#DF4D4D;cursor: pointer"'
						+'   id="' + jsonData[i].sId + '"'
						+'   onclick="deleteBookmark(this.id)"></i>'
						+'</td>'
						+'</tr>';
				}
				document.getElementById("bookTable").innerHTML = tagInTable;
			}
		}
	
		function viewMap(sName,addr, latitude, longitude) {
			document.getElementById('id01').style.display = 'block';
			document.getElementById('mapTitle').innerHTML = '<h2>' + sName + '</h2>';
			document.getElementById('mapAddr').innerHTML = addr;
			myMap(latitude, longitude);
		}
	
		function myMap(latitude, longitude) {
			var myLatlng = new google.maps.LatLng(latitude, longitude);
			var mapProp = {
				center : myLatlng,
				zoom : 18,
			};
			var map = new google.maps.Map(document.getElementById('mapContent'), mapProp);
			var marker = new google.maps.Marker({
				position : myLatlng
			});
			marker.setMap(map);
		}
	</script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBjvtC_0Hr83DsKOtKr0oamgTdwyBtcuho&callback=myMap"></script>
</body>
</html>
