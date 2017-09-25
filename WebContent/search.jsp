<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	<jsp:include page="nav.jsp"/>

	<!-- 본문 틀 -->
	<div class="content-wrapper">
		<div class="container-fluid" style="padding-top:5%;padding-left:10%;padding-right:10%;padding-bottom:5%" id="content">
		<!-- 본문 내용 -->



			<div class="w3-half" style="padding-left:2%; padding-right:2%">
				<select class="w3-select w3-border-white" id="selectAddr" onclick="reqAddr()">
					<option value="" disabled selected>지역 선택</option>
					<option value="1">Option 1</option>
					<option value="2">Option 2</option>
					<option value="3">Option 3</option>
				</select>
			</div>
			
			<div class="w3-half" style="padding-left:2%; padding-right:2%">
				<select class="w3-select w3-border-white" id="selectStation">
					<option value="" disabled selected>충전소 선택</option>
					<option value="1">Option 1</option>
					<option value="2">Option 2</option>
					<option value="3">Option 3</option>
				</select>
			</div>
			
			<div id="print">
			</div>
	
			


				






			<!-- 본문 내용 끝 -->
		</div>
	</div>
	<!-- 본문 틀 끝 -->

	<!-- footer -->
	<jsp:include page="footer.jsp"/>

	<!-- Logout Modal -->
	<jsp:include page="logoutModal.jsp"/>
	
	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.js"></script>
	<script src="vendor/popper/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.js"></script>
	<script src="js/sb-admin.js"></script>
	
	<script type="text/javascript" src="js/httpRequest.js"></script>
	<script type="text/javascript">
		function reqAddr(){
			sendRequest("address", "command=addr", addrView, "POST");
		}
		
		function addrView(){
			if(httpRequest.readyState==4 && httpRequest.status==200 ){
				var tagInAddr = "";
				var index;
				
				var data = httpRequest.responseText.trim();
			
				
				alert(data);
				
				
				
				//alert(data);
				//var jsonArr = JSON.parse(data);
				//var jsonArr2 = eval("("+data+")");
				
				//alert(jsonArr[0].addrNum);
				//alert(jsonArr2[0].addrNum);
				
			}
		}
		

	</script>
	


</body>
</html>
