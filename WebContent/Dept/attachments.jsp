<!DOCTYPE html>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.hypertrac.dao.database"%>
<%@page import="com.hypertrac.commons.Helper"%>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Hypertrac - Attachments</title>

<!-- Custom fonts for this template-->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body class="bg-gradient-primary">

	<div class="container">

		<!-- Outer Row -->
		<div class="row justify-content-center">

			<div class="col-xl-10 col-lg-12 col-md-9">

				<div class="card o-hidden border-0 shadow-lg my-5">
					<div class="card-body">
						<!-- Nested Row within Card Body -->
						<div class="row">
							<div class="col-lg-12 text-center">
								<h3 class="text-info">Attachments List</h3>
								<%
									Connection con = database.getConnection();
									Helper helper = new Helper();
									String idStr = helper.decrypt(request.getParameter("id"));
									int id = 0;
									try {
										id = Integer.parseInt(idStr);
									} catch (NumberFormatException ne) {
										ne.printStackTrace();
									}
									if (id > 0) {
										String sql = "SELECT * FROM applications_img WHERE fk_id=?";
										PreparedStatement ps = con.prepareStatement(sql);
										ps.setInt(1, id);
										ResultSet rs = null;
										rs = ps.executeQuery();
										while (rs.next()) {
								%>
								<strong>
									<a href="../../../images/service/<%=rs.getString(3)%>"
										download>
										<%
											out.println(rs.getString(3));
										%>
									</a>
								</strong><br/>
								<%
									}
									}
									con.close();
								%>
							</div>
						</div>
					</div>
				</div>

			</div>

		</div>

	</div>

	<!-- Bootstrap core JavaScript-->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="js/sb-admin-2.min.js"></script>

</body>

</html>