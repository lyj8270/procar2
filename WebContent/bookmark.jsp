<%@page import="car.dto.StationDto"%>
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
		
			<!-- 지도 -->
			<div id="map" style="width:95%; height:500px; margin:5% auto" ></div>
			<div style="width:95%; margin:5% auto">
				<table class="w3-table w3-bordered" id="bookList"></table>
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
		/* 즐겨찾기 배열과 함수 선언 */
		var stations = [];
		function station(sId, sName, latitude, longitude, index){
			this.sId = sId;
			this.sName = sName;
			this.latitude = latitude;
			this.longitude = longitude;
			this.index = index;
			
			this.getSId = function(){
				return this.sId;
			};
			this.getSName = function(){
				return this.sName;
			};
			this.getLatitude = function(){
				return this.latitude;
			};
			this.getLongitude = function(){
				return this.longitude;
			};
			this.getIndex = function(){
				return this.index;
			};
		};
		
		/* JSON으로 값 받아와 객체 생성 후 배열에 저장, table에 표시 */
		var data = '${requestScope.bookmarkJson}';
		var jsonBookmark = JSON.parse(data);
		var tagInBookList = "";
		for(i=0; i < jsonBookmark.length ; i++){
			stations.push(new station(jsonBookmark[i].sId,jsonBookmark[i].sName,jsonBookmark[i].latitude,jsonBookmark[i].longitude,i));
			tagInBookList += "<tr id='bookmark"+i+"' onclick='selectBookmark(this.id)'><td>"+jsonBookmark[i].sName+"</td><td>"+jsonBookmark[i].addr+"</td><td>"+jsonBookmark[i].type+"</td><tr>";
		}
		document.getElementById("bookList").innerHTML = tagInBookList;
		
		/* map 출력, marker 출력 */
		function initMap() {
			var map = new google.maps.Map(document.getElementById('map'), {
				zoom : 7,
				center : {
					lat : 36.5,
					lng : 127.5
				}
			});
			setMarkers(map);
		}
		
		/* marker 생성 */
		function setMarkers(map) {
			for (var i = 0; i < stations.length; i++) {
				var temp = stations[i];
				console.log(temp.getLatitude());
				console.log(temp.getLongitude());
				var marker = new google.maps.Marker({
					position : {
						lat : Number(temp.getLatitude()),
						lng : Number(temp.getLongitude())
					},
					map : map,
					title : temp.getSName(),
					zIndex: temp.getIndex() 
				});
			}
		}
		
		
		function selectBookmark(sId){
			alert(sId);
		}
		
		
		
		
		
		
	</script>

	<!-- 구글 지도 -->
	<script	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBjvtC_0Hr83DsKOtKr0oamgTdwyBtcuho&callback=initMap">
	</script>
</body>
</html>
