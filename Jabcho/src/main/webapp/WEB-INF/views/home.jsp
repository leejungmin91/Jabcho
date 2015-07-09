<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ page session="false"%>
<%
	String appKey 		= "551330758343154";
	String appSecret 	= "87eea895171903c9f7c360ee7373aa8e";
	//token get url
	// https://graph.facebook.com/oauth/access_token?grant_type=client_credentials&client_id=551330758343154&client_secret=87eea895171903c9f7c360ee7373aa8e
	// token = 551330758343154|6JJzDSrwInjIT5cs7xuy2cm-wtQ
	
	String url = "http://www.facebook.com/dialog/oauth?client_id="+
		appKey+"&redirect_uri=http://localhost:8080/test/fbdata.do&scope=email";
	
%>
<html lang="ko">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1" />
<meta name="description" content="" />
<meta name="author" content="" />
<!--[if IE]>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <![endif]-->
<!-- Favicon Icon -->
<link rel="icon"
	href="http://localhost:8080/test/resources/bootstrap/home/img/favicon.ico" />
<title>잡초</title>
<!-- home/bootstrap CORE CSS -->
<link
	href="http://localhost:8080/test/resources/bootstrap/home/css/bootstrap.css"
	rel="stylesheet" />
<!-- ION ICONS STYLES -->
<link
	href="http://localhost:8080/test/resources/bootstrap/home/css/ionicons.css"
	rel="stylesheet" />
<!-- FONT AWESOME ICONS STYLES -->
<link
	href="http://localhost:8080/test/resources/bootstrap/home/css/font-awesome.css"
	rel="stylesheet" />
<!-- CUSTOM CSS -->
<link
	href="http://localhost:8080/test/resources/bootstrap/home/css/style.css"
	rel="stylesheet" />


<!-- IE10 viewport hack  -->
<script
	src="http://localhost:8080/test/resources/bootstrap/home/js/ie-10-view-port.js"></script>

<!-- HTML5 Shiv and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
	<!-- HEADER SECTION START-->
	<header id="header">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 logo-wrapper">
					<img
						src="http://localhost:8080/test/resources/bootstrap/home/img/logo.png"
						alt="" />
				</div>
				<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 text-right">
					<div class="menu-links scroll-me">

						<a href="main"> <i class="ion-ios-home-outline"></i></a> <span
							class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown"> Login <span class="caret"></span>
						</a> <!-- onClick="openW('https://www.facebook.com/dialog/oauth?client_id=551330758343154&redirect_uri=http%3A%2F%2Flocalhost:8080/test/home&state=914af6d6a447253b8370c1fa6055297c&sdk=php-sdk-3.2.3&display=popup','',600,350);" -->
							<ul class="dropdown-menu" role="menu">
								<li><a href="#" style="font-size: 20px; color: #4374D9;"
									onClick="facebookoauth()"><i
										class="fa fa-facebook-square fa-lg"></i>&nbsp;&nbsp;Facebook
										Login </a></li>
								<li><a href="#" style="font-size: 20px; color: #4374D9;"><i
										class="fa fa-twitter-square fa-lg"></i>&nbsp;&nbsp;Twitter
										Login </a></li>
								<li><a href="#" style="font-size: 20px; color: #4374D9;"><i
										class="fa fa-google-plus-square fa-lg"></i>&nbsp;&nbsp;Google
										Login </a></li>


							</ul></span>


					</div>
				</div>

			</div>


		</div>
	</header>
	<!-- HEADER SECTION END-->
	<!--HOME SECTION START  -->
	<div id="home">
		<div class="overlay">
			<div class="container">
				<div class="row scroll-me">
					<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
						<h1>잡초</h1>
						<h4>팀 커뮤니케이션이 쉬워진다</h4>

						<a href="#about" class="btn btn-custom btn-two">Explore
							Template</a> <a href="#email-subscribe"
							class="btn btn-custom btn-one">Subscribe Right Now </a>
					</div>
				</div>


			</div>
		</div>

	</div>
	<!--HOME SECTION END  -->
	<!-- ABOUT SECTION START-->
	<section id="about">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
					<h2 class="head-line">What Worth Here & Why ?</h2>
					<p>Morbi mollis lectus et ipsum sollicitudin varius. Aliquam
						tempus ante placerat, consectetur tellus nec, porttitor nulla.
						Maecenas a quam erat. Praesent vehicula ut magna sit amet
						ultrices.</p>
					<div class="row text-center">
						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
							<div class="row pad-bottom">
								<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
									<div class="icon-wrapper">
										<i class="ion-tshirt-outline"></i>
									</div>
									<h4>Responsive Design</h4>
									Consectetur adipiscing elit felis dolor .

								</div>
								<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
									<div class="icon-wrapper">
										<i class="ion-monitor"></i>
									</div>
									<h4>Awesome Features</h4>
									Consectetur adipiscing elit felis dolor .

								</div>
								<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
									<div class="icon-wrapper">
										<i class="ion-clipboard"></i>
									</div>
									<h4>Multipurpose Use</h4>
									Consectetur adipiscing elit felis dolor .
								</div>
							</div>

						</div>

					</div>

				</div>

				<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 text-center">
					<img
						src="http://localhost:8080/test/resources/bootstrap/home/img/phone.png"
						class="img-side" alt="" />
				</div>
			</div>
		</div>
	</section>
	<!-- ABOUT SECTION END-->
	<!-- CLIENTS SECTION START-->


	</section>
	<!-- FEATURES SECTION END-->
	<!-- SUBSCRIBE SECTION START-->
	<!--  
	<section id="email-subscribe">
		<div class="container">
			<div class="row text-center">
				<div
					class="col-lg-6 col-lg-offset-3 col-md-6 col-md-offset-3 col-sm-6 col-sm-offset-3 col-xs-12">
					<form action="subscribe.php" method="post" id="postcontent">
						<input type="email" name="email" class="form-control"
							placeholder="Enter Your E-mail Address..." required />
						<button type="submit" class="btn btn-subscribe">Notify Me
							!</button>
					</form>
				</div>
			</div>
		</div>
	</section>
	-->
	<footer>
		<div class="container">
			<div class="row text-center">
				<div class="col-lg-12 col-md-12 col-sm-12">
					&copy; 2015 Jabcho.com | by Jabcho </a>
				</div>

			</div>
		</div>
	</footer>
	<!-- FOOTER SECTION END-->

	<!-- JAVASCRIPT FILES PLACED AT THE BOTTOM TO REDUCE THE LOADING TIME  -->
	<!-- CORE JQUERY  SCRIPTS -->
	<script
		src="http://localhost:8080/test/resources/bootstrap/home/js/jquery-1.11.1.js"></script>
	<!-- home/bootstrap SCRIPTS  -->
	<script
		src="http://localhost:8080/test/resources/bootstrap/home/js/home/bootstrap.js"></script>
	<!-- SCROLLING SCRIPTS PLUGIN  -->
	<script
		src="http://localhost:8080/test/resources/bootstrap/home/js/jquery.easing.min.js"></script>
	<!-- CUSTOM SCRIPTS   -->
	<script
		src="http://localhost:8080/test/resources/bootstrap/home/js/custom.js"></script>
	<!-- FACEBOOK SCRIPTS   -->
	<script language="javascript"
		src="http://connect.facebook.net/ko_KR/all.js"></script>

	<!-- 윈도우 창  생성 -->
	<script type="text/javascript">
		function openW(url, idn, intWidth, intHeight, scroll) {
			window.open(url, idn, "width=" + intWidth + ", height=" + intHeight
					+ ",resizable=0,scrollbars=" + scroll);

		}
	</script>
	<script type="text/javascript">
	function facebookoauth() {
		window.location.href = '<%=url%>'
	}
</script>

</body>
</html>
