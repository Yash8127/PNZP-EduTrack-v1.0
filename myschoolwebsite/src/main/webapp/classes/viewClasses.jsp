<%@ page
	import="java.util.*,com.school.DAO.ClassesDAO,com.school.model.Classes"%>

<jsp:include page="../common/layout-start.jsp" />

<div class="container-fluid">

	<!-- Page Header -->
	<div class="d-flex justify-content-between align-items-center mb-4">

		<h3 class="fw-bold">
			<i class="bi bi-diagram-3"></i> Classes
		</h3>

		<a href="addClass.jsp" class="btn btn-success"> <i
			class="bi bi-plus-circle"></i> Add Class
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
							<th>Class</th>
							<th>Section</th>
							<th>Department</th>
							<th width="150" class="text-center">Action</th>
						</tr>

					</thead>

					<tbody>

						<%
						ClassesDAO dao = new ClassesDAO();
						List<Classes> list = dao.getAllClasses();

						if (list.isEmpty()) {
						%>

						<tr>
							<td colspan="5" class="text-center text-muted">No Classes
								Found</td>
						</tr>

						<%
						} else {

						for (Classes c : list) {
						%>

						<tr>

							<td><%=c.getClassId()%></td>

							<td><i class="bi bi-book text-primary"></i> <%=c.getClassName()%>
							</td>

							<td><%=c.getSection()%></td>

							<td><%=c.getDepartmentName()%></td>

							<td class="text-center">

								<button class="btn btn-danger btn-sm"
									onclick="confirmDelete('../DeleteClassServlet?id=<%=c.getClassId()%>')">

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