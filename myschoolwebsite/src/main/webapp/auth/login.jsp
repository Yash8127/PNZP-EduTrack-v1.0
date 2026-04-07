<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<title>Login - PNZP School</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css"
	rel="stylesheet">

<style>
body {
	font-family: 'Poppins', sans-serif;
	height: 100vh;
	background:
		url('https://images.unsplash.com/photo-1588072432836-e10032774350?q=80&w=1400')
		no-repeat center/cover;
}

.overlay {
	position: absolute;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.65);
}

/* GLASS CARD */
.card {
	border-radius: 20px;
	backdrop-filter: blur(12px);
	background: rgba(255, 255, 255, 0.12);
	color: white;
	animation: fadeIn 0.7s ease;
}

/* FLOATING INPUT */
.form-floating input {
	background: rgba(255, 255, 255, 0.2);
	border: none;
	color: white;
}

.form-floating label {
	color: #ddd;
}

/* BUTTON */
.btn-custom {
	background: #2563eb;
	border-radius: 30px;
	font-weight: 600;
}

.btn-custom:hover {
	background: #1e40af;
}

/* LINKS */
a {
	color: #c7d2fe;
	text-decoration: none;
}

a:hover {
	text-decoration: underline;
}

/* EYE ICON */
.toggle-eye {
	position: absolute;
	top: 50%;
	right: 15px;
	transform: translateY(-50%);
	cursor: pointer;
}

/* ANIMATION */
@
keyframes fadeIn {
	from {opacity: 0;
	transform: translateY(20px);
}

to {
	opacity: 1;
	transform: translateY(0);
}
}
</style>

</head>

<body>

	<div class="overlay"></div>

	<div class="container d-flex justify-content-center align-items-center"
		style="height: 100vh; position: relative;">

		<div class="col-md-4">

			<div class="card p-4 shadow-lg">

				<div class="text-center mb-3">
					<h4>🎓 PNZP School</h4>
					<small>Login to your account</small>
				</div>

				<form action="../LoginServlet" method="post">

					<!-- ROLE -->
					<div class="mb-3">
						<select name="role" class="form-control" required>
							<option value="">Login As</option>
							<option value="ADMIN">Admin</option>
							<option value="TEACHER">Teacher</option>
							<option value="STUDENT">Student</option>
						</select>
					</div>

					<!-- USERNAME -->
					<div class="form-floating mb-3">
						<input type="text" name="username" class="form-control"
							placeholder="Username" required> <label>Username</label>
					</div>

					<!-- PASSWORD -->
					<div class="form-floating mb-3 position-relative">
						<input type="password" name="password" id="password"
							class="form-control" placeholder="Password" required> <label>Password</label>
						<i class="bi bi-eye-slash toggle-eye" onclick="togglePassword()"></i>
					</div>

					<!-- OPTIONS -->
					<div class="d-flex justify-content-between mb-3">
						<div>
							<input type="checkbox"> Remember Me
						</div>
						<a href="#">Forgot Password?</a>
					</div>

					<button class="btn btn-custom w-100">Login</button>

				</form>

				<div class="text-center mt-3">
					<a href="register.jsp">Create new account</a>
				</div>

				<div class="text-center mt-2">
					<a href="../home.jsp" class="btn btn-light w-100">Back to Home</a>
				</div>

			</div>

		</div>

	</div>

	<script>
		function togglePassword() {
			let pass = document.getElementById("password");
			pass.type = pass.type === "password" ? "text" : "password";
		}
	</script>

</body>
</html>