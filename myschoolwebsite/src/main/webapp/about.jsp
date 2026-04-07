<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="UTF-8">
<title>About | PNZP High School</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css"
	rel="stylesheet">

<style>

/* SAME DESIGN SYSTEM AS HOME */
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
.hero-small {
	background: linear-gradient(to right, #2563eb, #1e3a8a);
	color: white;
	padding: 60px 0;
	text-align: center;
}

.hero-small h1 {
	font-weight: 700;
}

/* SECTION TITLE */
.section-title {
	font-weight: 700;
	text-align: center;
	margin-bottom: 40px;
}

/* CARDS */
.card-custom {
	border-radius: 15px;
	padding: 20px;
	text-align: center;
	background: white;
	transition: .3s;
}

.card-custom:hover {
	transform: translateY(-8px);
}

/* GALLERY */
.gallery-img {
	cursor: pointer;
	transition: 0.3s;
}

.gallery-img:hover {
	transform: scale(1.05);
}

/* ACHIEVEMENT */
.achievement {
	background: #2563eb;
	color: white;
	border-radius: 15px;
	padding: 40px;
}

/* FOOTER */
footer {
	background: #1e3a8a;
	color: white;
}
</style>

</head>

<body>

	<!-- NAVBAR (SAME AS HOME) -->
	<nav class="navbar navbar-expand-lg bg-white shadow-sm">
		<div class="container">
			<a class="navbar-brand">🎓 PNZP School</a>
			<div>
				<a class="nav-link d-inline" href="home.jsp">Home</a> <a
					class="nav-link d-inline fw-bold text-primary" href="about.jsp">About</a>
				<a class="nav-link d-inline" href="contact.jsp">Contact</a> <a
					class="btn btn-primary btn-login" href="auth/login.jsp">Login</a>
			</div>
		</div>
	</nav>

	<!-- HERO -->
	<section class="hero-small">
		<h1>About Our School</h1>
		<p class="mt-2">A campus of excellence, discipline, and success</p>
	</section>

	<!-- ABOUT -->
	<section class="container my-5">
		<div class="row align-items-center">

			<div class="col-md-6">
				<h3 class="fw-bold">Who We Are</h3>
				<p>
					PNZP High School is located at <b>Tellabadu, Maddipadu Mandal</b>.
					Spread across 13 acres of greenery, we provide a peaceful and
					modern learning environment.
				</p>
				<p>We focus on academics, discipline, sports, and overall
					student development.</p>
			</div>

			<div class="col-md-6 text-center">
				<img src="images/saraswathistatue.jpeg"
					class="img-fluid rounded shadow" style="max-width: 300px;">
			</div>

		</div>
	</section>

	<!-- FACILITIES -->
	<section class="container my-5">
		<h2 class="section-title">Our Facilities</h2>

		<div class="row g-4">

			<div class="col-md-4">
				<div class="card-custom shadow">
					<i class="bi bi-book fs-1 text-primary"></i>
					<h5 class="mt-3">Library</h5>
				</div>
			</div>

			<div class="col-md-4">
				<div class="card-custom shadow">
					<i class="bi bi-laptop fs-1 text-primary"></i>
					<h5 class="mt-3">Digital Classes</h5>
				</div>
			</div>

			<div class="col-md-4">
				<div class="card-custom shadow">
					<i class="bi  bi-house fs-1 text-primary"></i>
					<h5 class="mt-3">Labs</h5>
				</div>
			</div>

			<div class="col-md-4">
				<div class="card-custom shadow">
					<i class="bi bi-cup-hot fs-1 text-primary"></i>
					<h5 class="mt-3">Dining Hall</h5>
				</div>
			</div>

			<div class="col-md-4">
				<div class="card-custom shadow">
					<i class="bi bi-tree fs-1 text-primary"></i>
					<h5 class="mt-3">Green Campus</h5>
				</div>
			</div>

			<div class="col-md-4">
				<div class="card-custom shadow">
					<i class="bi bi-shield-check fs-1 text-primary"></i>
					<h5 class="mt-3">Safe Campus</h5>
				</div>
			</div>

		</div>
	</section>

	<!-- GALLERY -->
	<section class="container my-5">
		<h2 class="section-title">School Gallery</h2>

		<div class="row g-3">

			<div class="col-md-3">
				<img src="images/ground.jpeg"
					class="img-fluid rounded shadow gallery-img"
					onclick="openModal(this)">
			</div>

			<div class="col-md-3">
				<img src="images/class.jpeg"
					class="img-fluid rounded shadow gallery-img"
					onclick="openModal(this)">
			</div>

			<div class="col-md-3">
				<img src="images/class.jpeg"
					class="img-fluid rounded shadow gallery-img"
					onclick="openModal(this)">
			</div>

			<div class="col-md-3">
				<img src="images/class.jpeg"
					class="img-fluid rounded shadow gallery-img"
					onclick="openModal(this)">
			</div>

		</div>
	</section>

	<!-- MODAL -->
	<div class="modal fade" id="galleryModal" tabindex="-1">
		<div class="modal-dialog modal-lg modal-dialog-centered">
			<div class="modal-content">

				<div class="modal-body text-center">
					<img id="modalImage" class="img-fluid rounded">
				</div>

			</div>
		</div>
	</div>

	<!-- ACHIEVEMENTS -->
	<section class="container my-5">
		<div class="achievement text-center">
			<h3>Achievements & Excellence</h3>
			<p class="mt-3">Top GPA students are awarded prizes every year.</p>

			<h5 class="mt-3">🏆 Sports Champions</h5>
			<p>Volleyball • Kabaddi • Cricket • Athletics</p>
		</div>
	</section>

	<!-- FACULTY -->
	<section class="container my-5 text-center">
		<h2 class="section-title">Our Faculty</h2>
		<p class="fs-5">Dedicated teachers guiding students to success.</p>
	</section>

	<!-- FOOTER -->
	<footer class="text-center p-4">
		<h5>PNZP High School</h5>
		<p>Quality Education for Future Leaders</p>

		<div class="mb-2">
			<i class="bi bi-facebook me-3"></i> <i class="bi bi-instagram me-3"></i>
			<i class="bi bi-linkedin"></i>
		</div>

		<p>© 2026 All Rights Reserved</p>
	</footer>

	<script>
		function openModal(img) {
			document.getElementById("modalImage").src = img.src;
			new bootstrap.Modal(document.getElementById('galleryModal')).show();
		}
	</script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>