<%@ page
	import="java.util.*,com.school.DAO.DepartmentDAO,com.school.model.Department"%>

<jsp:include page="../common/layout-start.jsp" />

<div class="container-fluid">

	<!-- Page Header -->
	<div class="d-flex justify-content-between align-items-center mb-4">

		<h3 class="fw-bold">
			<i class="bi bi-diagram-3"></i> Add Class
		</h3>

		<a href="viewClasses.jsp" class="btn btn-secondary"> <i
			class="bi bi-arrow-left"></i> Back
		</a>

	</div>

	<div class="row justify-content-center">

		<div class="col-md-6">

			<div class="card shadow border-0">

				<div class="card-body">

					<form action="../ClassesServlet" method="post">

						<div class="mb-3">

							<label class="form-label fw-semibold"> Class Name </label> <input
								type="text" name="className" class="form-control"
								placeholder="Enter Class Name" required>

						</div>

						<div class="mb-3">

							<label class="form-label fw-semibold"> Section </label> <input
								type="text" name="section" class="form-control"
								placeholder="Enter Section (A/B/C)" required>

						</div>

						<div class="mb-3">

							<label class="form-label fw-semibold"> Department </label> <select
								name="deptId" class="form-select">

								<%
								DepartmentDAO dao = new DepartmentDAO();
								List<Department> list = dao.getAllDepartments();

								for (Department d : list) {
								%>

								<option value="<%=d.getDeptId()%>">
									<%=d.getDeptName()%>
								</option>

								<%
								}
								%>

							</select>

						</div>

						<div class="d-flex gap-2">

							<button type="submit" class="btn btn-primary">

								<i class="bi bi-save"></i> Save Class

							</button>

							<a href="viewClasses.jsp" class="btn btn-outline-secondary">

								Cancel </a>

						</div>

					</form>

				</div>

			</div>

		</div>

	</div>

</div>

<jsp:include page="../common/layout-end.jsp" />