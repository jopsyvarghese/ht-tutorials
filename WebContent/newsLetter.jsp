<!DOCTYPE html>
<%@page import="org.apache.jasper.JasperException"%>
<%@page import="java.sql.SQLIntegrityConstraintViolationException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.hypertrac.dao.database"%>
<%@page import="java.sql.Connection"%>
<html lang="en">
<head>
<meta charset="utf-8">
<title>HyperTrac</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">

<!-- Favicons -->
<link href="img/favicon.png" rel="icon">
<link href="img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,700,700i|Montserrat:300,400,500,700"
	rel="stylesheet">

<!-- Bootstrap CSS File -->
<link href="lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Libraries CSS Files -->
<link href="lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
<link href="lib/animate/animate.min.css" rel="stylesheet">
<link href="lib/ionicons/css/ionicons.min.css" rel="stylesheet">
<link href="lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">

<!-- Main Stylesheet File -->
<link href="css/style.css" rel="stylesheet">
<!-- =======================================================
    Theme Name: HyperTrac
    Theme URL: http://www.preatech.com/HyperTrac-bootstrap-business-template/
    Author: BootstrapMade.com
    License: http://www.preatech.com/license/
  ======================================================= -->
</head>

<body>

	<!--==========================
  Header
  ============================-->
	<header id="header" class="fixed-top">
		<div class="container">

			<div class="logo float-left">
				<!-- Uncomment below if you prefer to use an image logo -->
				<!-- <h1 class="text-light"><a href="#header"><span>HyperTrac</span></a></h1> -->
				<a href="#intro" class="scrollto"> <img src="img/logo.png"
					alt="" class="img img-fluid">
				</a>
			</div>

			<nav class="main-nav float-right d-none d-lg-block">
				<jsp:include page="header.jsp"></jsp:include>
			</nav>
			<!-- .main-nav -->

		</div>
	</header>
	<!-- #header -->

	<!--==========================
    Intro Section
  ============================-->
	<section id="about" class="clearfix">
		<div class="container text-center">
			<br /> <br /> <br /> <br />
			<%
				String email = request.getParameter("email");
				Connection con = database.getConnection();
				String sql = "INSERT INTO news_letter(email) VALUES(?)";
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setString(1, email);
				int i = 0;
				try {
					i = ps.executeUpdate();
				} catch (Exception se) {}
				if (i > 0) {
			%>
			<strong class="text-success">Thank you for subscribing to
				our newsletter. We will notify you for the upcoming updates.</strong>
			<%
				} else {
			%>
			<strong class="text-info">The Email ID you've provided is
				already subscribed to our newsletter or it cannot be added</strong>
			<%
				}
			%>
		</div>
	</section>
	<!-- #intro -->

	<!--==========================
    Footer
  ============================-->
	<footer id="footer">
		<jsp:include page="footer.jsp"></jsp:include>
	</footer>
	<!-- #footer -->

	<a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>
	<!-- Uncomment below i you want to use a preloader -->
	<!-- <div id="preloader"></div> -->

	<!-- JavaScript Libraries -->
	<script src="lib/jquery/jquery.min.js"></script>
	<script src="lib/jquery/jquery-migrate.min.js"></script>
	<script src="lib/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="lib/easing/easing.min.js"></script>
	<script src="lib/mobile-nav/mobile-nav.js"></script>
	<script src="lib/wow/wow.min.js"></script>
	<script src="lib/waypoints/waypoints.min.js"></script>
	<script src="lib/counterup/counterup.min.js"></script>
	<script src="lib/owlcarousel/owl.carousel.min.js"></script>
	<script src="lib/isotope/isotope.pkgd.min.js"></script>
	<script src="lib/lightbox/js/lightbox.min.js"></script>
	<!-- Contact Form JavaScript File -->
	<script src="contactform/contactform.js"></script>

	<!-- Template Main Javascript File -->
	<script src="js/main.js"></script>

</body>
</html>
