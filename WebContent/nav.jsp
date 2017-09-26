<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>ECO EV</title>


  </head>

  <body>

    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
      <div class="container">
        <a class="navbar-brand js-scroll-trigger" href="index.jsp">
        <i class="fa fa-fw fa-leaf" style="color:#ccff77">
		</i>
		ECO EV</a>
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="address">�����Ұ˻�</a>
            </li>
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="Bookmark">���ã��</a>
            </li>
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="bbs?">QnA</a>
            </li>
            <li class="nav-item" id="printLogin">
            </li>
            
          </ul>
        </div>
      </div>
    </nav>
    
    <!-- �α��� ���� �Ǵ� -->
	<script type="text/javascript">
		var logId = "${sessionScope.logId}";
		console.log(logId);
		if(logId!=""){
			document.getElementById("printLogin").innerHTML = '<a class="nav-link js-scroll-trigger" data-toggle="modal" data-target="#exampleModal">�α׾ƿ�</a>';
		} else {
			document.getElementById("printLogin").innerHTML = '<a class="nav-link js-scroll-trigger" href="login.html">�α���</a>';
		}
		
	</script>


  </body>

</html>
