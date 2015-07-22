<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ page session="true"%>
<%@ page import="java.net.URLEncoder "%>
<%@page import="org.apache.log4j.*"%>
<%!static Logger logger = Logger.getLogger("main.jsp"); //log4j를 위해%>

<%
	String accessToken = (String) session.getAttribute("fbtoken");
	String logoutURL = "https://www.facebook.com/logout.php?next="
			+ URLEncoder.encode("http://localhost:8080/test/home.do",
					"UTF-8") + "&access_token=" + accessToken;
	String session_fb_id = (String) session
			.getAttribute("session_fb_id");
	String session_id = (String) session.getAttribute("session_id");
	logger.info("session_id = " + session_id);
	if (session_id == null || session.equals("")) {
%>
<script>
	alert("세션 ID가 없습니다.");
</script>
<%
	response.sendRedirect("home.do");
	}
	session.setMaxInactiveInterval(60 * 60);
%>
<html lang="ko">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1" />
<meta name="description" content="" />
<meta name="author" content="" />

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

				&nbsp;님 환영합니다!&nbsp; <a href="#"
					class="btn btn-danger square-btn-adjust" onClick="ulogout()">Logout</a>
			</div>
		</nav>
		<!-- /. NAV TOP  -->
		<nav class="navbar-default navbar-side" role="navigation">
			<div class="sidebar-collapse">
				<ul class="nav" id="main-menu">
					<li class="text-center">
						<!--  <img
						src="http://localhost:8080/test/resources/bootstrap/main/img/find_user.png"
						class="user-image img-responsive" />--> <img
						src="https://graph.facebook.com/<%=session_fb_id%>/picture"
						class="user-image img-responsive" height="60" width="60" />
					</li>


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
						<h3>File UPLOAD</h3>
						<form action="fileup.do" method="post" enctype="multipart/form-data">
							<input type="file" name="uploadfile" required="required">
							<input type="submit" value="작성">

						</form>

						</br>
						<h3>File DOWNLOAD LIST</h3>
						</br>
						<fieldset>
							<table style="border: 1px; width: 400px;">
								<tr>
									<th style="width: 100px"></th>
									<th style="width: 300px">파일명</th>
									<th style="width: 100px">파일사이즈</th>
								</tr>

								<c:if test="${ !empty list }">
									<c:forEach items="${ list }" var="list">
										<tr>
											<td width="100px"></td>
											<td width="300px"><a
												href="filedown.do?fileName=${ list.getFileName() }">${ list.getFileName() }</a></td>
											<td width="100px">${ list.getFileSize() }</td>
										</tr>
									</c:forEach>
								</c:if>

								<c:if test="${ empty list }">
									<tr>
										<td colspan="5">등록된 게시물이 없습니다.</td>
									</tr>
								</c:if>
							</table>
						</fieldset>
						</br> </br>

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
		src="http://localhost:8080/test/resources/bootstrap/home/js/jquery-1.11.1.js"></script>
	<!-- BOOTSTRAP SCRIPTS -->
	<script
		src="http://localhost:8080/test/resources/bootstrap/main/js/bootstrap.min.js"></script>
	<!-- METISMENU SCRIPTS -->
	<script
		src="http://localhost:8080/test/resources/bootstrap/main/js/jquery.metisMenu.js"></script>

	<!-- CUSTOM SCRIPTS -->
	<script
		src="http://localhost:8080/test/resources/bootstrap/main/js/custom.js"></script>
	<script language="javascript"
		src="http://connect.facebook.net/ko_KR/all.js"></script>


	<script type="text/javascript">
	function ulogout() {
		<%session.invalidate();%>
		alert('UserLogout btn clicked');
		window.location.href = '<%=logoutURL%>
		'
		}
	</script>



</body>
</html>
