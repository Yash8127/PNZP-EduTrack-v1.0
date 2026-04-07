<%@ page import="com.school.utility.DBConnection"%>
<%@ page import="java.sql.*"%>

<jsp:include page="../common/layout-start.jsp" />

<div class="container-fluid">

	<h2 class="fw-bold mb-4">Dashboard</h2>

	<%
	int departments = 0;
	int classes = 0;
	int students = 0;
	int teachers = 0;
	int subjects = 0;
	int exams = 0;
	int fees = 0;

	StringBuilder classNames = new StringBuilder();
	StringBuilder classCounts = new StringBuilder();

	try {

		Connection con = DBConnection.getConnection();
		Statement st = con.createStatement();
		ResultSet rs;

		rs = st.executeQuery("SELECT COUNT(*) FROM Department");
		if (rs.next())
			departments = rs.getInt(1);

		rs = st.executeQuery("SELECT COUNT(*) FROM Classes");
		if (rs.next())
			classes = rs.getInt(1);

		rs = st.executeQuery("SELECT COUNT(*) FROM Student");
		if (rs.next())
			students = rs.getInt(1);

		rs = st.executeQuery("SELECT COUNT(*) FROM Teacher");
		if (rs.next())
			teachers = rs.getInt(1);

		rs = st.executeQuery("SELECT COUNT(*) FROM Subject");
		if (rs.next())
			subjects = rs.getInt(1);

		rs = st.executeQuery("SELECT COUNT(*) FROM Exam");
		if (rs.next())
			exams = rs.getInt(1);

		rs = st.executeQuery("SELECT COUNT(*) FROM Fees");
		if (rs.next())
			fees = rs.getInt(1);

		rs = st.executeQuery("SELECT c.class_name, COUNT(s.student_id) total "
		+ "FROM Classes c LEFT JOIN Student s ON c.class_id=s.class_id " + "GROUP BY c.class_name");

		while (rs.next()) {

			classNames.append("'" + rs.getString("class_name") + "',");
			classCounts.append(rs.getInt("total") + ",");

		}

	} catch (Exception e) {
		e.printStackTrace();
	}
	%>

	<!-- STAT CARDS -->

	<div class="row g-4 mb-5">

		<div class="col-md-3">
			<div class="card shadow border-0 text-center p-3">
				<i class="bi bi-building fs-1 text-primary"></i>
				<h6 class="mt-2">Departments</h6>
				<h3><%=departments%></h3>
			</div>
		</div>

		<div class="col-md-3">
			<div class="card shadow border-0 text-center p-3">
				<i class="bi bi-diagram-3 fs-1 text-success"></i>
				<h6 class="mt-2">Classes</h6>
				<h3><%=classes%></h3>
			</div>
		</div>

		<div class="col-md-3">
			<div class="card shadow border-0 text-center p-3">
				<i class="bi bi-people fs-1 text-warning"></i>
				<h6 class="mt-2">Students</h6>
				<h3><%=students%></h3>
			</div>
		</div>

		<div class="col-md-3">
			<div class="card shadow border-0 text-center p-3">
				<i class="bi bi-person-badge fs-1 text-info"></i>
				<h6 class="mt-2">Teachers</h6>
				<h3><%=teachers%></h3>
			</div>
		</div>

		<div class="col-md-3">
			<div class="card shadow border-0 text-center p-3">
				<i class="bi bi-book fs-1 text-secondary"></i>
				<h6 class="mt-2">Subjects</h6>
				<h3><%=subjects%></h3>
			</div>
		</div>

		<div class="col-md-3">
			<div class="card shadow border-0 text-center p-3">
				<i class="bi bi-journal-text fs-1 text-dark"></i>
				<h6 class="mt-2">Exams</h6>
				<h3><%=exams%></h3>
			</div>
		</div>


		<div class="col-md-3">
			<div class="card shadow border-0 text-center p-3">
				<i class="bi bi-cash-stack fs-1 text-success"></i>
				<h6 class="mt-2">Fees</h6>
				<h3><%=fees%></h3>
			</div>
		</div>

	</div>

	<!-- CHARTS -->

	<div class="row">

		<div class="col-md-7">

			<div class="card shadow">

				<div class="card-header fw-bold">Students by Class</div>

				<div class="card-body">

					<canvas id="classChart" height="120"></canvas>

				</div>

			</div>

		</div>

		<div class="col-md-5">

			<div class="card shadow">

				<div class="card-header fw-bold">Students vs Teachers</div>

				<div class="card-body">

					<canvas id="studentChart" height="120"></canvas>

				</div>

			</div>

		</div>

	</div>

</div>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<script>
	const classChart = new Chart(document.getElementById('classChart'), {
		type : 'bar',
		data : {
			labels : [
<%=classNames.toString()%>
	],
			datasets : [ {
				label : 'Students',
				data : [
<%=classCounts.toString()%>
	],
				backgroundColor : '#0d6efd'
			} ]
		},
		options : {
			responsive : true,
			plugins : {
				legend : {
					display : false
				}
			}
		}
	});

	const studentChart = new Chart(document.getElementById('studentChart'), {
		type : 'doughnut',
		data : {
			labels : [ 'Students', 'Teachers' ],
			datasets : [ {
				data : [
<%=students%>
	,
<%=teachers%>
	],
				backgroundColor : [ '#ffc107', '#0dcaf0' ]
			} ]
		},
		options : {
			responsive : true
		}
	});
</script>

<jsp:include page="../common/layout-end.jsp" />
