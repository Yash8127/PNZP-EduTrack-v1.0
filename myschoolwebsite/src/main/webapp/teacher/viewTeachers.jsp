<%@ page
	import="java.util.*,com.school.DAO.TeacherDAO,com.school.model.Teacher"%>

<jsp:include page="../common/layout-start.jsp" />

<div class="container-fluid">

	<!-- Header -->

	<div class="d-flex justify-content-between align-items-center mb-4">

		<h3 class="fw-bold">
			<i class="bi bi-person-badge"></i> Teachers
		</h3>

		<a href="addTeacher.jsp" class="btn btn-success"> <i
			class="bi bi-person-plus"></i> Add Teacher
		</a>

	</div>

	<!-- Search Box -->

	<div class="mb-3">

		<input type="text" id="searchTeacher" class="form-control"
			placeholder="Search teacher by name...">

	</div>

	<!-- Table Card -->

	<div class="card shadow border-0">

		<div class="card-body">

			<div class="table-responsive">

				<table class="table table-hover align-middle" id="teacherTable">

					<thead class="table-dark">

						<tr>
							<th>ID</th>
							<th>Name</th>
							<th>Phone</th>
							<th>Email</th>
							<th>Department</th>
							<th>Hire Date</th>
							<th>Action</th>
						</tr>

					</thead>

					<tbody>

						<%
						TeacherDAO dao = new TeacherDAO();
						List<Teacher> list = dao.getAllTeachers();

						if (list.isEmpty()) {
						%>

						<tr>
							<td colspan="7" class="text-center text-muted">No Teachers
								Found</td>
						</tr>

						<%
						} else {

						for (Teacher t : list) {
						%>

						<tr>

							<td><%=t.getTeacherId()%></td>

							<td><i class="bi bi-person-circle text-primary"></i> <%=t.getTeacherName()%>
							</td>

							<td><%=t.getPhone()%></td>

							<td><%=t.getEmail()%></td>

							<td><span class="badge bg-info"> <%=t.getDeptName()%>
							</span></td>

							<td><%=t.getHireDate()%></td>

							<td>

								<button class="btn btn-danger btn-sm"
									onclick="confirmDelete('../DeleteTeacherServlet?id=<%=t.getTeacherId()%>')">

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

document.getElementById("searchTeacher").addEventListener("keyup", function(){

let filter = this.value.toLowerCase();

let rows = document.querySelectorAll("#teacherTable tbody tr");

rows.forEach(row => {

let name = row.cells[1].innerText.toLowerCase();

row.style.display = name.includes(filter) ? "" : "none";

});

});

</script>

<jsp:include page="../common/layout-end.jsp" />