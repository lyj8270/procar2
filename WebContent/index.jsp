<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>ECO EV</title>

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

</head>

<body id="page-top">

	<!-- Navigation -->
	<jsp:include page="nav.jsp" />


	<header class="masthead">
		<div class="header-content">
			<div class="header-content-inner">
				<h1 id="homeHeading">전국 전기차 충전소 운영현황</h1>
				<hr>
				<h5>전기차 이용고객을 위하여 전국에 설치된 전기차 충전소 정보를 제공합니다.</h5>
				<h5>지역과 해당 충전소를 선택하시면, 더 자세한 정보를 확인하실 수 있습니다</h5>
				<!-- <a class="btn btn-primary btn-xl js-scroll-trigger" href="#about">Find Out More</a> -->
			</div>
		</div>
	</header>

	<section class="p-0">
		<div class="container-fluid">
			<div class="row no-gutter popup-gallery">

				<div class="col-lg-4 col-sm-6">
					<a class="portfolio-box" href="img/main_2.jpg">
						<img class="img-fluid" src="img/main_2.jpg" alt="">
						<div class="portfolio-box-caption">
							<div class="portfolio-box-caption-content">
								<div class="project-name">간편하고 빠르게</div>
								<div class="project-category text-faded">전국의 전기차 충전소 정보를 확인하세요</div>
							</div>
						</div>
					</a>
				</div>

				<div class="col-lg-4 col-sm-6">
					<a class="portfolio-box" href="img/main_3.jpg"> 
					<img class="img-fluid" src="img/main_3.jpg" alt="">
						<div class="portfolio-box-caption">
							<div class="portfolio-box-caption-content">
								<div class="project-name">충전 타입</div>
								<div class="project-category text-faded">충전 속도에 따라 급속, 완속으로 분류됩니다</div>
							</div>
						</div>
					</a>
				</div>

				<div class="col-lg-4 col-sm-6">
					<a class="portfolio-box" href="img/main_4.jpg"> <img
						class="img-fluid" src="img/main_4.jpg" alt="">
						<div class="portfolio-box-caption">
							<div class="portfolio-box-caption-content">
								<div class="project-name">환경부</div>
								<div class="project-category text-faded">전기차 충전소 운영은 환경부와 함께합니다</div>
							</div>
						</div>
					</a>
				</div>

			</div>
		</div>
	</section>

	<section id="contact">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 mx-auto text-center">
					<h2 class="section-heading">CONTACT</h2>
					<hr class="primary">
					<p>전기차 또는 ECO EV에 대해 궁금하신 점 물어봐주세요</p>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-4 ml-auto text-center">
					<i class="fa fa-copyright fa-3x sr-contact"></i>
					<p>임대호</p>
					<p>이용진</p>
				</div>
				<div class="col-lg-4 ml-auto text-center">
					<i class="fa fa-phone fa-3x sr-contact"></i>
					<p>123-456-6789</p>
					<p>123-456-6789</p>
				</div>
				<div class="col-lg-4 mr-auto text-center">
					<i class="fa fa-envelope-o fa-3x sr-contact"></i>
					<p><a href="mailto:your-email@your-domain.com">tigerho2@gmail.com</a></p>
					<p><a href="mailto:your-email@your-domain.com">leeyj8270@gmail.com</a></p>
				</div>
			</div>
		</div>
	</section>

	<!-- Logout Modal -->
	<jsp:include page="logoutModal.jsp" />


	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.js"></script>
	<script src="vendor/popper/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.js"></script>

	<!-- Plugin JavaScript -->
	<script src="vendor/jquery-easing/jquery.easing.js"></script>
	<script src="vendor/scrollreveal/scrollreveal.js"></script>
	<script src="vendor/magnific-popup/jquery.magnific-popup.js"></script>

	<!-- Custom scripts for this template -->
	<script src="js/creative.js"></script>

</body>

</html>
