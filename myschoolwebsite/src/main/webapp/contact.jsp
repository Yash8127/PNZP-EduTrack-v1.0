<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="UTF-8">
<title>Contact | PNZP High School</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css"
	rel="stylesheet">

<style>

/* SAME DESIGN SYSTEM */
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

/* HERO SMALL */
.hero-small {
	background: linear-gradient(to right, #2563eb, #1e3a8a);
	color: white;
	padding: 50px 0;
	text-align: center;
}

/* CARD */
.card-custom {
	border-radius: 15px;
	background: white;
}

/* SECTION TITLE */
.section-title {
	font-weight: 700;
	text-align: center;
	margin-bottom: 40px;
}

/* FOOTER */
footer {
	background: #1e3a8a;
	color: white;
}
</style>

</head>

<body>

	<!-- NAVBAR (SAME AS OTHER PAGES) -->
	<nav class="navbar navbar-expand-lg bg-white shadow-sm">
		<div class="container">
			<a class="navbar-brand">🎓 PNZP School</a>
			<div>
				<a class="nav-link d-inline" href="home.jsp">Home</a> <a
					class="nav-link d-inline" href="about.jsp">About</a> <a
					class="nav-link d-inline fw-bold text-primary" href="contact.jsp">Contact</a>
				<a class="btn btn-primary btn-login" href="auth/login.jsp">Login</a>
			</div>
		</div>
	</nav>

	<!-- HERO -->
	<section class="hero-small">
		<h2>Contact Us</h2>
		<p class="mt-2">We’d love to hear from you</p>
	</section>

	<!-- CONTACT SECTION -->
	<section class="container my-5">
		<div class="row g-4 align-items-stretch">

			<!-- CONTACT INFO -->
			<div class="col-md-5">
				<div class="card card-custom shadow p-4 h-100">

					<h4 class="fw-bold text-primary mb-3">Get in Touch</h4>

					<p>
						<i class="bi bi-geo-alt-fill text-primary me-2"></i> Tellabadu,
						Maddipadu Mandal
					</p>

					<p>
						<i class="bi bi-telephone-fill text-primary me-2"></i> +91 XXXXX
						XXXXX
					</p>

					<p>
						<i class="bi bi-envelope-fill text-primary me-2"></i>
						zp.highschool@gmail.com
					</p>

				</div>
			</div>

			<!-- CONTACT FORM -->
			<div class="col-md-7">
				<div class="card card-custom shadow p-4 h-100">

					<h4 class="fw-bold text-primary mb-3">Send Us a Message</h4>
					<%
					String success = request.getParameter("success");
					String error = request.getParameter("error");
					%>

					<%
					if (success != null) {
					%>
					<div class="alert alert-success text-center">Message sent
						successfully!</div>
					<%
					}
					%>

					<%
					if (error != null) {
					%>
					<div class="alert alert-danger text-center">Failed to send
						message. Try again.</div>
					<%
					}
					%>

					<form action="ContactServlet" method="post">

						<input type="text" name="name" class="form-control mb-3"
							placeholder="Your Name" required> <input type="email"
							name="email" class="form-control mb-3" placeholder="Email"
							required>

						<textarea name="message" class="form-control mb-3" rows="4"
							placeholder="Message" required></textarea>

						<button class="btn btn-primary w-100">Send Message</button>

					</form>

				</div>
			</div>

		</div>
	</section>

	<!-- MAP -->
	<section class="container my-5">
		<h2 class="section-title">Our Location</h2>

		<div class="ratio ratio-16x9 rounded shadow">
			<iframe
				src="https://www.google.com/maps?q=Tellababdu%20HO,%20Doddavaram,%20Maddipadu%20Mandal&t=&z=15&ie=UTF8&iwloc=&output=embed"
				style="border: 0;" allowfullscreen loading="lazy"> </iframe>
		</div>

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

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>