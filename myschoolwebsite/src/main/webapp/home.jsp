<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page
	import="java.util.*,com.school.DAO.NoticeDAO,com.school.model.Notice"%>

<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="UTF-8">
<title>PNZP High School</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css"
	rel="stylesheet">

<style>

/* GLOBAL */
body {
	font-family: 'Poppins', sans-serif;
	background: #f8fafc;
}

/* NAVBAR */
.navbar {
	padding: 15px 0;
}

.navbar-brand {
	font-weight: 700;
	color: #1e3a8a !important;
}

.nav-link {
	color: #333 !important;
	margin: 0 10px;
}

.btn-login {
	border-radius: 25px;
}

/* HERO */
.hero {
	padding: 80px 0;
}

.hero h1 {
	font-size: 52px;
	font-weight: 700;
}

.hero span {
	color: #2563eb;
}

.hero p {
	color: #6b7280;
}

.btn-main {
	background: #2563eb;
	color: white;
	border-radius: 30px;
	padding: 10px 25px;
}

/* STATS */
.stats {
	background: white;
	border-radius: 15px;
	padding: 30px;
	margin-top: -50px;
	box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
}

.stat-box h3 {
	color: #2563eb;
}

/* FEATURES */
.feature-card {
	background: white;
	padding: 25px;
	border-radius: 15px;
	text-align: center;
	transition: .3s;
}

.feature-card:hover {
	transform: translateY(-10px);
}

/* SECTION TITLE */
.section-title {
	font-weight: 700;
	text-align: center;
	margin-bottom: 50px;
}

/* TEACHERS */
.teacher-card {
	background: white;
	padding: 20px;
	border-radius: 15px;
	text-align: center;
}

.teacher-card img {
	width: 100px;
	border-radius: 50%;
}

/* TESTIMONIAL */
.testimonial {
	background: #2563eb;
	color: white;
	border-radius: 15px;
	padding: 30px;
}

/* NOTICE */
.notice {
	background: white;
	padding: 15px;
	border-left: 5px solid #2563eb;
	margin-bottom: 10px;
}

/* FOOTER */
footer {
	background: #1e3a8a;
	color: white;
}
/* CAROUSEL IMAGE */
.carousel-img {
	height: 350px;
	object-fit: cover;
	border-radius: 15px;
}

/* DARK OVERLAY */
.carousel-overlay {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.4);
	border-radius: 15px;
}

/* TEXT ON IMAGE */
.carousel-caption-custom {
	position: absolute;
	bottom: 20px;
	left: 20px;
	color: white;
	z-index: 2;
}

.carousel-caption-custom h4 {
	font-weight: 700;
}

.carousel-caption-custom p {
	font-size: 14px;
}

/* MOBILE FIX */
@media ( max-width :768px) {
	.carousel-img {
		height: 250px;
	}
}
</style>

</head>

<body>

	<!-- NAVBAR -->
	<nav class="navbar navbar-expand-lg bg-white shadow-sm">
		<div class="container">
			<a class="navbar-brand">🎓 PNZP School</a>
			<div>
				<a class="nav-link d-inline fw-bold text-primary" href="home.jsp">Home</a>
				<a class="nav-link d-inline" href="about.jsp">About</a> <a
					class="nav-link d-inline" href="contact.jsp">Contact</a> <a
					class="btn btn-primary btn-login" href="auth/login.jsp">Login</a>
			</div>
		</div>
	</nav>

	<!-- 🔹 WELCOME SECTION -->
	<section class="container-fluid text-center p-5"
		style="background: #eef2ff;">
		<h1 class="fw-bold text-primary">Welcome to PNZP High School</h1>
		<p class="lead text-muted">Shaping young minds for a better future
		</p>
	</section>

	<!-- HERO -->
	<section class="hero">
		<div class="container">
			<div class="row align-items-center">

				<div class="col-md-6">
					<h1>
						Your Kids <br> <span>Deserve The</span><br> Best
						Education
					</h1>
					<p class="mt-3">Active Learning, Expert Teachers & Safe
						Environment</p>
					<a href="contact.jsp" class="btn btn-main mt-3">Admission Now</a>
				</div>

				<div class="col-md-6">

					<!-- CAROUSEL START -->
					<div id="heroCarousel" class="carousel slide carousel-fade"
						data-bs-ride="carousel" data-bs-interval="3000"
						data-bs-pause="hover">

						<!-- Indicators -->
						<div class="carousel-indicators">
							<button type="button" data-bs-target="#heroCarousel"
								data-bs-slide-to="0" class="active"></button>
							<button type="button" data-bs-target="#heroCarousel"
								data-bs-slide-to="1"></button>
							<button type="button" data-bs-target="#heroCarousel"
								data-bs-slide-to="2"></button>
						</div>

						<!-- Slides -->
						<div class="carousel-inner rounded shadow">

							<!-- Slide 1 -->
							<div class="carousel-item active position-relative">
								<img
									src="https://images.unsplash.com/photo-1588072432836-e10032774350?q=80&w=1200"
									class="d-block w-100 carousel-img">

								<div class="carousel-overlay"></div>

								<div class="carousel-caption-custom">
									<h4>Quality Education</h4>
									<p>Building strong foundation for students</p>
								</div>
							</div>

							<!-- Slide 2 -->
							<div class="carousel-item position-relative">
								<img
									src="https://images.unsplash.com/photo-1596495578065-6e0763fa1178?q=80&w=1200"
									class="d-block w-100 carousel-img">

								<div class="carousel-overlay"></div>

								<div class="carousel-caption-custom">
									<h4>Smart Classrooms</h4>
									<p>Modern learning environment</p>
								</div>
							</div>

							<!-- Slide 3 -->
							<div class="carousel-item position-relative">
								<img
									src="https://images.unsplash.com/photo-1577896851231-70ef18881754?q=80&w=1200"
									class="d-block w-100 carousel-img">

								<div class="carousel-overlay"></div>

								<div class="carousel-caption-custom">
									<h4>Sports & Activities</h4>
									<p>All-round development</p>
								</div>
							</div>

						</div>

						<!-- Controls -->
						<button class="carousel-control-prev" type="button"
							data-bs-target="#heroCarousel" data-bs-slide="prev">
							<span class="carousel-control-prev-icon"></span>
						</button>

						<button class="carousel-control-next" type="button"
							data-bs-target="#heroCarousel" data-bs-slide="next">
							<span class="carousel-control-next-icon"></span>
						</button>

					</div>
					<!-- CAROUSEL END -->

				</div>

			</div>
		</div>
	</section>

	<!-- STATS -->
	<div class="container">
		<div class="stats row text-center">

			<div class="col-md-3 stat-box">
				<h3>500+</h3>
				<p>Students</p>
			</div>

			<div class="col-md-3 stat-box">
				<h3>25+</h3>
				<p>Teachers</p>
			</div>

			<div class="col-md-3 stat-box">
				<h3>15+</h3>
				<p>Classrooms</p>
			</div>

			<div class="col-md-3 stat-box">
				<h3>100%</h3>
				<p>Results</p>
			</div>

		</div>
	</div>

	<!-- 🔹 FACILITIES (FROM YOUR HTML) -->
	<section class="container my-5">
		<h2 class="section-title">Our Facilities</h2>

		<div class="row g-4">

			<div class="col-md-4">
				<div class="feature-card shadow">
					<i class="bi bi-book fs-1 text-primary"></i>
					<h5 class="mt-3">Library</h5>
					<p class="text-muted">Well-stocked library for students</p>
				</div>
			</div>

			<div class="col-md-4">
				<div class="feature-card shadow">
					<i class="bi bi-eyedropper fs-1 text-primary"></i>
					<h5 class="mt-3">Laboratories</h5>
					<p class="text-muted">Modern science & computer labs</p>
				</div>
			</div>

			<div class="col-md-4">
				<div class="feature-card shadow">
					<i class="bi bi-trophy fs-1 text-primary"></i>
					<h5 class="mt-3">Playground</h5>
					<p class="text-muted">Sports and physical activities</p>
				</div>
			</div>

		</div>
	</section>

	<!-- FEATURES -->
	<section class="container my-5">
		<h2 class="section-title">Start Learning in 3 Steps</h2>

		<div class="row">

			<div class="col-md-4">
				<div class="feature-card">
					<i class="bi bi-person-plus fs-1 text-primary"></i>
					<h5 class="mt-3">Apply</h5>
				</div>
			</div>

			<div class="col-md-4">
				<div class="feature-card">
					<i class="bi bi-check-circle fs-1 text-success"></i>
					<h5 class="mt-3">Enroll</h5>
				</div>
			</div>

			<div class="col-md-4">
				<div class="feature-card">
					<i class="bi bi-book fs-1 text-warning"></i>
					<h5 class="mt-3">Start</h5>
				</div>
			</div>

		</div>
	</section>

	<!-- ANNOUNCEMENTS -->
	<section class="container my-5">
		<h2 class="section-title">Latest Announcements</h2>

		<%
		NoticeDAO dao = new NoticeDAO();
		List<Notice> notices = dao.getAllNotices();

		for (Notice n : notices) {
		%>

		<div class="notice">
			<strong><%=n.getTitle()%></strong><br>
			<%=n.getDescription()%>
		</div>

		<%
		}
		%>
	</section>

	<!-- TESTIMONIAL -->
	<section class="container my-5">
		<div class="testimonial text-center">
			<h4>"Best school with excellent teachers and environment!"</h4>
			<p>- Parent Feedback</p>
		</div>
	</section>

	<!-- 🔹 FOOTER UPGRADE -->
	<footer class="text-center p-4">
		<h5>PNZP High School</h5>
		<p>Quality Education for Future Leaders</p>

		<div class="mb-2">
			<i class="bi bi-facebook me-3"></i> <i class="bi bi-instagram me-3"></i>
			<i class="bi bi-linkedin"></i>
		</div>

		<p>© 2026 All Rights Reserved</p>
	</footer>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>