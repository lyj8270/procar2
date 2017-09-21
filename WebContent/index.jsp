<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">


<title>타이틀</title>

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
		<!-- 본문 내용 -->
		<div class="container-fluid" style="padding-top:10%;padding-left:5%;padding-right:5%;padding-bottom:10%">

			<div class="w3-content w3-section" style="max-width: 90%">
				<img class="mySlides w3-round-xlarge" src="img/american_made.jpg" style="width: 100%">
				<img class="mySlides w3-round-xlarge" src="img/baby_driver.jpg" style="width: 100%">
				<img class="mySlides w3-round-xlarge" src="img/taxi_driver.jpg" style="width: 100%">
			</div>

		</div>
		<!-- 본문 내용 끝 -->
	</div>
	<!-- 본문 틀 끝 -->

	<!-- footer -->
	<jsp:include page="footer.jsp" />

	<!-- logoutModal -->
	<jsp:include page="logoutModal.jsp" />
	
	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.js"></script>
	<script src="vendor/popper/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.js"></script>

	<!-- Custom scripts for this template -->
	<!-- nav 접기 부분 -->
	<script src="js/sb-admin.js"></script>
	
	<!-- slide -->
	<script>
		var myIndex = 0;
		carousel();
	
		function carousel() {
			var i;
			var x = document.getElementsByClassName("mySlides");
			for (i = 0; i < x.length; i++) {
				x[i].style.display = "none";
			}
			myIndex++;
			if (myIndex > x.length) {
				myIndex = 1
			}
			x[myIndex - 1].style.display = "block";
			setTimeout(carousel, 5000);
		}
	</script>
</body>
</html>
