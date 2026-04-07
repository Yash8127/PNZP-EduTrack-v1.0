<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<title>Register - PNZP School</title>

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
		url('https://images.unsplash.com/photo-1596495578065-6e0763fa1178?q=80&w=1400')
		no-repeat center/cover;
}

.overlay {
	position: absolute;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.65);
}

.card {
	border-radius: 20px;
	backdrop-filter: blur(12px);
	background: rgba(255, 255, 255, 0.12);
	color: white;
	animation: fadeIn 0.7s ease;
}

.form-floating input, .form-select {
	background: rgba(255, 255, 255, 0.2);
	border: none;
	color: white;
}

.form-floating label {
	color: #ddd;
}

.btn-custom {
	background: #2563eb;
	border-radius: 30px;
	font-weight: 600;
}

.btn-custom:hover {
	background: #1e40af;
}

a {
	color: #c7d2fe;
	text-decoration: none;
}

.toggle-eye {
	position: absolute;
	top: 50%;
	right: 15px;
	transform: translateY(-50%);
	cursor: pointer;
}

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

		<div class="col-md-5">

			<div class="card p-4 shadow-lg">

				<div class="text-center mb-3">
					<h4>📝 Create Account</h4>
					<small>Join PNZP School</small>
				</div>

				<form action="../RegisterServlet" method="post">

					<div class="form-floating mb-3">
						<input type="text" name="name" class="form-control"
							placeholder="Full Name" required> <label>Full
							Name</label>
					</div>

					<div class="form-floating mb-3">
						<input type="text" name="username" class="form-control"
							placeholder="Username" required> <label>Username</label>
					</div>

					<div class="form-floating mb-3 position-relative">
						<input type="password" name="password" id="password"
							class="form-control" placeholder="Password" required> <label>Password</label>
						<i class="bi bi-eye-slash toggle-eye" onclick="togglePassword()"></i>
					</div>

					<select name="role" class="form-select mb-3" required>
						<option value="">Select Role</option>
						<option value="TEACHER">Teacher</option>
						<option value="STUDENT">Student</option>
					</select>

					<button class="btn btn-custom w-100">Register</button>

				</form>

				<div class="text-center mt-3">
					<a href="login.jsp">Already have account? Login</a>
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