<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.css" rel="stylesheet">

<!-- Custom fonts for this template -->
<link href="vendor/font-awesome/css/font-awesome.css"
	rel="stylesheet" type="text/css">

<!-- Custom styles for this template -->
<link href="css/sb-admin.css" rel="stylesheet">

</head>
<body>
	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" id="mainNav">
	
	<a class="navbar-brand" href="#"><i class="fa fa-fw fa-leaf" style="color:#ccff77"></i> ECO ELECTRIC CAR</a>
	<button class="navbar-toggler navbar-toggler-right" type="button"
		data-toggle="collapse" data-target="#navbarResponsive"
		aria-controls="navbarResponsive" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarResponsive">
		<ul class="navbar-nav navbar-sidenav" id="exampleAccordion">

			<li class="nav-item" data-toggle="tooltip" data-placement="right" title="station">
				<a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#collapseComponents" data-parent="#exampleAccordion">
				 	<i class="fa fa-fw fa-globe"></i>
					<span class="nav-link-text">충전소 찾기</span>
				</a>
				<ul class="sidenav-second-level collapse" id="collapseComponents">
					<li><a href="#">하위 항목1</a></li>
					<li><a href="#">하위 항목2</a></li>
					<li><a href="#">하위 항목3</a></li>
					<li><a href="#">하위 항목4</a></li>
				</ul>
			</li>

			<li class="nav-item" data-toggle="tooltip" data-placement="right" title="bookmark">
				<a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#collapseExamplePages"	data-parent="#exampleAccordion">
					<i class="fa fa-fw fa-star" style="color:#ffff99"></i>
					<span class="nav-link-text">즐겨찾기</span>
				</a>
				<ul class="sidenav-second-level collapse" id="collapseExamplePages">
					<li><a href="#">하위 항목1</a></li>
					<li><a href="#">하위 항목2</a></li>
					<li><a href="#">하위 항목3</a></li>
					<li><a href="#">하위 항목4</a></li>
				</ul>
			</li>
		    <li class="nav-item" data-toggle="tooltip" data-placement="right" title="qna">
		    	<a class="nav-link" href="#">
              		<i class="fa fa-fw fa-question-circle" style="color:lightblue"></i>
              		<span class="nav-link-text">QnA</span>
            	</a>
        	</li>
		</ul>

		<ul class="navbar-nav sidenav-toggler">
			<li class="nav-item"><a class="nav-link text-center"
				id="sidenavToggler"> <i class="fa fa-fw fa-angle-left"></i>
			</a></li>
		</ul>
		<ul class="navbar-nav ml-auto">
			<!--           <li class="nav-item">
            <form class="form-inline my-2 my-lg-0 mr-lg-2">검색어 입력하면 찾을 부분
              <div class="input-group">
                <input type="text" class="form-control" placeholder="검색어 입력">
                <span class="input-group-btn">
                  <button class="btn btn-primary" type="button">
                    <i class="fa fa-search"></i>
                  </button>
                </span>
              </div>
            </form>
          </li> 검색 부분-->
			<li class="nav-item">
				<!--             <a class="nav-link" data-toggle="modal" data-target="#exampleModal">
              <i class="fa fa-fw fa-sign-out"></i>
              	로그아웃
            </a> --> 
            <a class="nav-link" href="login.html">
            	<i class="fa fa-fw fa-sign-in"></i> 로그인
			</a>
			</li>
		</ul>
	</div>
	</nav>

</body>
</html>