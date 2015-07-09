<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ page session="true"%>
<%@ page import="java.net.URLEncoder "%>

<%
	String accessToken = (String) session.getAttribute("fbtoken");
	String logoutURL = "https://www.facebook.com/logout.php?next="
			+ URLEncoder.encode("http://localhost:8080/test/home",
					"UTF-8") + "&access_token=" + accessToken;
%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>잡초</title>
<!-- BOOTSTRAP STYLES-->
<link
	href="http://localhost:8080/test/resources/bootstrap/main/css/bootstrap.css"
	rel="stylesheet" />
<!-- FONTAWESOME STYLES-->
<link
	href="http://localhost:8080/test/resources/bootstrap/main/css/font-awesome.css"
	rel="stylesheet" />
<!-- MORRIS CHART STYLES-->
<link
	href="http://localhost:8080/test/resources/bootstrap/main/js/morris/morris-0.4.3.min.css"
	rel="stylesheet" />
<!-- CUSTOM STYLES-->
<link
	href="http://localhost:8080/test/resources/bootstrap/main/css/custom.css"
	rel="stylesheet" />
<!-- GOOGLE FONTS-->
<link href='http://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css' />
</head>
<body>
	<div id="wrapper">
		<nav class="navbar navbar-default navbar-cls-top " role="navigation"
			style="margin-bottom: 0">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".sidebar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="index.html">잡초</a>
			</div>

			<div
				style="color: white; padding: 15px 50px 5px 50px; float: right; font-size: 16px;">

				<c:forEach var="member" items="${result}">
					<td>${member.get_name()}</td>
				</c:forEach>

				&nbsp;님 환영합니다!&nbsp; <a href="<%=logoutURL%>"
					class="btn btn-danger square-btn-adjust">Logout</a>
			</div>
		</nav>
		<!-- /. NAV TOP  -->
		<nav class="navbar-default navbar-side" role="navigation">
			<div class="sidebar-collapse">
				<ul class="nav" id="main-menu">
					<li class="text-center"><img
						src="http://localhost:8080/test/resources/bootstrap/main/img/find_user.png"
						class="user-image img-responsive" /></li>


					<li><a class="active-menu" href="#"><i
							class="fa fa-dashboard fa-3x"></i> Dashboard</a></li>
					<li><a href="#"><i class="fa fa-users fa-3x"></i> Team</a></li>

				</ul>

			</div>

		</nav>
		<!-- /. NAV SIDE  -->
		<div id="page-wrapper">
			<div id="page-inner">
				<div class="row">
					<div class="col-md-12">
						<h2>Admin Dashboard</h2>
						<h5>Welcome Jhon Deo , Love to see you back.</h5>

						<form action="fileup" method="post" enctype="multipart/form-data">
							<input type="file" name="uploadfile" required="required">
							<input type="submit" value="작성">

						</form>

					</div>
				</div>
				<!-- /. ROW  -->
				<hr />
				<div class="row">
					<div class="col-md-3 col-sm-6 col-xs-6">
						<div class="panel panel-back noti-box">
							<span class="icon-box bg-color-red set-icon"> <i
								class="fa fa-envelope-o"></i>
							</span>
							<div class="text-box">
								<p class="main-text">120 New</p>
								<p class="text-muted">Messages</p>
							</div>
						</div>
					</div>
					<div class="col-md-3 col-sm-6 col-xs-6">
						<div class="panel panel-back noti-box">
							<span class="icon-box bg-color-green set-icon"> <i
								class="fa fa-bars"></i>
							</span>
							<div class="text-box">
								<p class="main-text">30 Tasks</p>
								<p class="text-muted">Remaining</p>
							</div>
						</div>
					</div>
					<div class="col-md-3 col-sm-6 col-xs-6">
						<div class="panel panel-back noti-box">
							<span class="icon-box bg-color-blue set-icon"> <i
								class="fa fa-bell-o"></i>
							</span>
							<div class="text-box">
								<p class="main-text">240 New</p>
								<p class="text-muted">Notifications</p>
							</div>
						</div>
					</div>
					<div class="col-md-3 col-sm-6 col-xs-6">
						<div class="panel panel-back noti-box">
							<span class="icon-box bg-color-brown set-icon"> <i
								class="fa fa-rocket"></i>
							</span>
							<div class="text-box">
								<p class="main-text">3 Orders</p>
								<p class="text-muted">Pending</p>
							</div>
						</div>
					</div>
				</div>

			</div>

		</div>

	</div>
	<!-- /. WRAPPER  -->
	<!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
	<!-- JQUERY SCRIPTS -->
	<script
		src="http://localhost:8080/test/resources/bootstrap/main/js/jquery-1.10.2.js"></script>
	<!-- BOOTSTRAP SCRIPTS -->
	<script
		src="http://localhost:8080/test/resources/bootstrap/main/js/bootstrap.min.js"></script>
	<!-- METISMENU SCRIPTS -->
	<script
		src="http://localhost:8080/test/resources/bootstrap/main/js/jquery.metisMenu.js"></script>
	<!-- MORRIS CHART SCRIPTS -->
	<script
		src="http://localhost:8080/test/resources/bootstrap/main/js/morris/raphael-2.1.0.min.js"></script>
	<script
		src="http://localhost:8080/test/resources/bootstrap/main/js/morris/morris.js"></script>
	<!-- CUSTOM SCRIPTS -->
	<script
		src="http://localhost:8080/test/resources/bootstrap/main/js/custom.js"></script>
	<script language="javascript"
		src="http://connect.facebook.net/ko_KR/all.js"></script>


</body>
</html>
