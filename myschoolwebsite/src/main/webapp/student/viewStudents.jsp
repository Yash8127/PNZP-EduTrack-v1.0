<%@ page
	import="java.util.*,com.school.DAO.StudentDAO,com.school.model.Student"%>

<jsp:include page="../common/layout-start.jsp" />

<div class="container-fluid">

	<!-- Header -->
	<div class="d-flex justify-content-between align-items-center mb-4">

		<h3 class="fw-bold">
			<i class="bi bi-people"></i> Students
		</h3>

		<a href="addStudent.jsp" class="btn btn-success"> <i
			class="bi bi-person-plus"></i> Add Student
		</a>

	</div>

	<!-- Search Box -->
	<div class="mb-3">

		<input type="text" id="searchStudent" class="form-control"
			placeholder="Search student by name...">

	</div>

	<!-- Table Card -->
	<div class="card shadow border-0">

		<div class="card-body">

			<div class="table-responsive">

				<table class="table table-hover align-middle" id="studentTable">

					<thead class="table-dark">

						<tr>
							<th>ID</th>
							<th>Name</th>
							<th>Gender</th>
							<th>Age</th>
							<th>Phone</th>
							<th>Class</th>
							<th>Admission</th>
							<th>Action</th>
						</tr>

					</thead>

					<tbody>

						<%
						StudentDAO dao = new StudentDAO();
						List<Student> list = dao.getAllStudents();

						if (list.isEmpty()) {
						%>

						<tr>
							<td colspan="8" class="text-center text-muted">No Students
								Found</td>
						</tr>

						<%
						} else {

						for (Student s : list) {
						%>

						<tr>

							<td><%=s.getStudentId()%></td>

							<td><i class="bi bi-person-circle text-primary"></i> <a style="text-decoration: none" 
								href="../student/studentProfile.jsp?id=<%=s.getStudentId()%>">
									<%=s.getStudentName()%>
							</a></td>

							<td><%=s.getGender()%></td>

							<td><%=s.getAge()%></td>

							<td><%=s.getPhone()%></td>

							<td><span class="badge bg-info"> <%=s.getClassName()%>
							</span></td>

							<td><%=s.getAdmissionDate()%></td>

							<td>

								<button class="btn btn-danger btn-sm"
									onclick="confirmDelete('../DeleteStudentServlet?id=<%=s.getStudentId()%>')">

									<i class="bi bi-trash"></i> Delete

								</button>

							</td>

						</tr>

						<%
						}
						}
						%>

					</tbody>

				</table>

			</div>

		</div>

	</div>

</div>

<!-- Search Script -->

<script>

document.getElementById("searchStudent").addEventListener("keyup", function(){

let filter = this.value.toLowerCase();

let rows = document.querySelectorAll("#studentTable tbody tr");

rows.forEach(row => {

let name = row.cells[1].innerText.toLowerCase();

row.style.display = name.includes(filter) ? "" : "none";

});

});

</script>

<jsp:include page="../common/layout-end.jsp" />