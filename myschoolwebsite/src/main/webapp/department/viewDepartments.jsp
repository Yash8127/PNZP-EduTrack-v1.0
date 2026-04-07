<%@ page
	import="java.util.*,com.school.DAO.DepartmentDAO,com.school.model.Department"%>


<jsp:include page="../common/layout-start.jsp" />

<div class="container-fluid">

	<!-- Page Header -->
	<div class="d-flex justify-content-between align-items-center mb-4">

		<h3 class="fw-bold">
			<i class="bi bi-building"></i> Departments
		</h3>

		<a href="addDepartment.jsp" class="btn btn-success"> <i
			class="bi bi-plus-circle"></i> Add Department
		</a>

	</div>

	<!-- Table Card -->
	<div class="card shadow border-0">

		<div class="card-body">

			<div class="table-responsive">

				<table class="table table-hover align-middle">

					<thead class="table-dark">

						<tr>
							<th width="80">ID</th>
							<th>Department Name</th>
							<th width="150" class="text-center">Action</th>
						</tr>

					</thead>

					<tbody>

						<%
						DepartmentDAO dao = new DepartmentDAO();
						List<Department> list = dao.getAllDepartments();

						if (list.isEmpty()) {
						%>

						<tr>
							<td colspan="3" class="text-center text-muted">No
								Departments Found</td>
						</tr>

						<%
						} else {

						for (Department d : list) {
						%>

						<tr>

							<td><%=d.getDeptId()%></td>

							<td><i class="bi bi-diagram-3 text-primary"></i> <%=d.getDeptName()%>
							</td>

							<td class="text-center">

								<button class="btn btn-danger btn-sm"
									onclick="confirmDelete('../DeleteDepartmentServlet?id=<%=d.getDeptId()%>')">

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

<jsp:include page="../common/layout-end.jsp" />