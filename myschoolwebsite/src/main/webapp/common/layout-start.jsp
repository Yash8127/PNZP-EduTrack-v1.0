
<%
String uri = request.getRequestURI();
%>
<!DOCTYPE html>
<html>
<head>

<title>School Management System</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css"
	rel="stylesheet">

<style>
body {
	overflow-x: hidden;
}

/* Sidebar */
.sidebar {
	width: 240px;
	height: 100vh;
	background: linear-gradient(180deg, #1f2937, #111827);
	position: fixed;
	transition: 0.3s;
}

.sidebar.collapsed {
	width: 70px;
}

/* Hide text when collapsed */
.sidebar.collapsed .menu-text {
	display: none;
}

.sidebar.collapsed h5 {
	font-size: 0;
}

.sidebar.collapsed h5 i {
	font-size: 22px;
}

/* Menu */
.sidebar h5 {
	color: white;
	text-align: center;
	padding: 15px 0;
}

.sidebar .nav-link {
	color: #cbd5e1;
	padding: 12px 20px;
	font-size: 15px;
	display: flex;
	align-items: center;
	transition: 0.3s;
}

.sidebar .nav-link i {
	font-size: 18px;
	margin-right: 10px;
}

.sidebar.collapsed .nav-link i {
	margin-right: 0;
	text-align: center;
	width: 100%;
}

.sidebar .nav-link:hover {
	background: #374151;
	color: white;
}

.sidebar .nav-link.active {
	background: #2563eb;
	color: white;
}

/* Main Content */
.main-content {
	margin-left: 240px;
	transition: 0.3s;
}

.sidebar.collapsed+.main-content {
	margin-left: 70px;
}

/* Topbar */
.topbar {
	height: 60px;
	background: white;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
	display: flex;
	align-items: center;
	justify-content: space-between;
	padding: 0 20px;
}
</style>

</head>

<body>

	<div class="sidebar" id="sidebar">

		<h5>
			<i class="bi bi-mortarboard-fill"></i> <span class="menu-text">School
				Admin</span>
		</h5>

		<ul class="nav flex-column">

			<li><a
				class="nav-link <%=uri.contains("dashboard.jsp") ? "active" : ""%>"
				href="../admin/dashboard.jsp"> <i class="bi bi-speedometer2"></i>
					<span class="menu-text">Dashboard</span>
			</a></li>

			<li><a
				class="nav-link <%=uri.contains("Department") ? "active" : ""%>"
				href="../department/viewDepartments.jsp"> <i
					class="bi bi-building"></i> <span class="menu-text">Departments</span>
			</a></li>

			<li><a
				class="nav-link <%=uri.contains("Class") ? "active" : ""%>"
				href="../classes/viewClasses.jsp"> <i class="bi bi-diagram-3"></i>
					<span class="menu-text">Classes</span>
			</a></li>

			<li><a
				class="nav-link <%=uri.contains("Student") ? "active" : ""%>"
				href="../student/viewStudents.jsp"> <i class="bi bi-people"></i>
					<span class="menu-text">Students</span>
			</a></li>

			<li><a
				class="nav-link <%=uri.contains("Teacher") ? "active" : ""%>"
				href="../teacher/viewTeachers.jsp"> <i
					class="bi bi-person-badge"></i> <span class="menu-text">Teachers</span>
			</a></li>

			<li><a
				class="nav-link <%=uri.contains("Subject") ? "active" : ""%>"
				href="../subject/viewSubjects.jsp"> <i class="bi bi-book"></i> <span
					class="menu-text">Subjects</span>
			</a></li>

			<li><a
				class="nav-link <%=uri.contains("Exam") ? "active" : ""%>"
				href="../exams/viewExams.jsp"> <i class="bi bi-journal-check"></i>
					<span class="menu-text">Exams</span>
			</a></li>

			<li><a class="nav-link <%=uri.contains("Fee") ? "active" : ""%>"
				href="../fees/viewFees.jsp"> <i class="bi bi-cash-stack"></i> <span
					class="menu-text">Fees</span>
			</a></li>

			<li><a
				class="nav-link <%=uri.contains("Notice") ? "active" : ""%>"
				href="../notice/viewNotices.jsp"> <i
					class="bi bi-megaphone-fill"></i> <span class="menu-text">Notices</span>
			</a></li>
			<li><a
				class="nav-link <%=uri.contains("contact") ? "active" : ""%>"
				href="../contact/messages.jsp"> <i
					class="bi bi-envelope-fill"></i> <span class="menu-text">Contact
						Messages</span>
			</a></li>



			<li class="mt-3 border-top pt-2"><a class="nav-link text-danger"
				href="../LogoutServlet"
				onclick="return confirm('Are you sure you want to logout?')"> <i
					class="bi bi-box-arrow-right"></i> <span class="menu-text">Logout</span>
			</a></li>

		</ul>

	</div>

	<div class="main-content">

		<div class="topbar">

			<button class="btn btn-light" onclick="toggleSidebar()">
				<i class="bi bi-list"></i>
			</button>

			<div>
				<i class="bi bi-person-circle"></i> Admin
			</div>

		</div>

		<div class="p-4">