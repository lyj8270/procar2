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

</head>

<body class="fixed-nav sticky-footer bg-dark">

	<!-- Navigation -->
	<jsp:include page="nav.jsp" />

	<!-- 본문 틀 -->
	<div class="content-wrapper">
		<!-- 본문 내용 -->
		<div class="container-fluid" style="padding-top:5%;padding-left:5%;padding-right:10%;padding-bottom:5%">
			<div class="w3-content w3-section" style="width: 100%">
				<h2>QnA Board</h2>
				<p>궁금한 사항을 남겨주세요</p>
				<form action="bbs" method="post">
					<table class="table table-striped" style="width: 100%; border:1px solid #dddddd;">
					<thead>
						<tr>
							<th colspan="2" style="background-color:#eeeeff; text-align: center;">게시판 글쓰기</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="text" class="form-control" placeholder="글제목" name="bbsTitle" maxlength="50"></td>
						</tr>
						<tr>
							<td><textarea type="text" class="form-control" placeholder="글내용" name="bbsContent" maxlength="2048" style="height:350px;"></textarea></td>
						</tr>
					</tbody>
				</table>	
				<input type="submit" class = "btn btn-primary pull-right" value="확인">
				</form>
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
</body>
</html>
