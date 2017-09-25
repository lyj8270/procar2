<%@page import="java.util.ArrayList"%>
<%@page import="car.dto.AddressDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>ECO ELECTRIC CAR</title>

<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.css" rel="stylesheet">
<!-- Custom fonts for this template -->
<link href="vendor/font-awesome/css/font-awesome.css"
	rel="stylesheet" type="text/css">
<!-- Custom styles for this template -->
<link href="css/sb-admin.css" rel="stylesheet">
<!-- w3school -->
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
.mySlides {display:none;}
</style>
</head>

<body class="fixed-nav sticky-footer bg-dark">

	<!-- Navigation -->
	<jsp:include page="nav.jsp" />

	<!-- 본문 틀 -->
	<div class="content-wrapper">
		<div class="container-fluid"
			style="padding-top: 5%; padding-left: 10%; padding-right: 10%; padding-bottom: 5%"
			id="content">
			<!-- 본문 내용 -->
			
			<!-- 지역 선택 -->
			<div class="w3-half" style="padding-left: 2%; padding-right: 2%">
				<select class="w3-select w3-border-white" onchange="reqAddr(this.value)">
					<c:forEach items="${addrList}" var="data">
						<option value="${data.addrNum}">${data.addrName}</option>
					</c:forEach>
				</select>
			</div>
			
			<!-- 충전소 선택 -->
			<div class="w3-half" style="padding-left: 2%; padding-right: 2%">
				<select class="w3-select w3-border-white" id="selectStation" onchange="reqStation(this.value)">
				</select>
			</div>
			
			<br><br><br>
			
			<!-- Map 출력 -->
			<div id="map" style="width: 100%; height: 400px;"></div>
			<br><br>
			
			<div style="width:100%;">
				<table class="w3-table w3-bordered" id="print" >
				
				</table>
			</div>
			



			<!-- 본문 내용 끝 -->
		</div>
	</div>
	<!-- 본문 틀 끝 -->

	<!-- footer -->
	<jsp:include page="footer.jsp" />

	<!-- Logout Modal -->
	<jsp:include page="logoutModal.jsp" />

	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.js"></script>
	<script src="vendor/popper/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.js"></script>
	<script src="js/sb-admin.js"></script>

	<script type="text/javascript" src="js/httpRequest.js"></script>
	<script type="text/javascript">
		var data;
		
		function reqAddr(addrNum){
			console.log(1);
			sendRequest("addressStation", "addr="+addrNum, stationView, "POST");
		}
		
		function stationView(){
			if(httpRequest.readyState==4 && httpRequest.status==200 ){
				var tagInStation = "";
				var index;
				
				data = httpRequest.responseText.trim();
				data = JSON.parse(data);

				for(i=0 ; i<data.length ; i++){
					tagInStation += '<option value="'+i+'">'+data[i].sName+'</option>';
				}
				
				document.getElementById("selectStation").innerHTML = tagInStation;
			}
		}
		
		function reqStation(index){
			var tagInPrint = "";
			var sName = data[index].sName;
			var addr = data[index].addr;
			var type = data[index].type;
			var latitude = data[index].latitude;
			var longitude = data[index].longitude;
			
			tagInPrint = 
				'<tr><td style="width:30%"><strong>충전소 이름</strong></td><td>'+sName+'</td></tr>'+
				'<tr><td style="width:30%"><strong>주소</strong></td><td>'+addr+'</td></tr>'+
				'<tr><td style="width:30%"><strong>타입</strong></td><td>'+type+'</td></tr>';
			
			myMap(latitude, longitude);
			document.getElementById("print").innerHTML = tagInPrint;
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
	<script	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBjvtC_0Hr83DsKOtKr0oamgTdwyBtcuho&callback=myMap"></script>
	
</body>
</html>
