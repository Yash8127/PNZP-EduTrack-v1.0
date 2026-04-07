<%@ page
	import="java.util.*,com.school.DAO.DepartmentDAO,com.school.model.Department"%>

<jsp:include page="../common/layout-start.jsp" />

<div class="container-fluid">

	<!-- Header -->

	<div class="d-flex justify-content-between align-items-center mb-4">

		<h3 class="fw-bold">
			<i class="bi bi-person-plus"></i> Add Teacher
		</h3>

		<a href="viewTeachers.jsp" class="btn btn-secondary"> <i
			class="bi bi-arrow-left"></i> Back
		</a>

	</div>


	<!-- Form Card -->

	<div class="card shadow border-0">

		<div class="card-body">

			<form action="../TeacherServlet" method="post">

				<div class="row">

					<!-- Teacher Name -->

					<div class="col-md-6 mb-3">

						<label class="form-label fw-semibold">Teacher Name</label> <input
							type="text" name="teacherName" class="form-control"
							placeholder="Enter teacher name" required>

					</div>


					<!-- Phone -->

					<div class="col-md-6 mb-3">

						<label class="form-label fw-semibold">Phone</label> <input
							type="text" name="phone" class="form-control"
							placeholder="Enter phone number" >

					</div>


					<!-- Email -->

					<div class="col-md-6 mb-3">

						<label class="form-label fw-semibold">Email</label> <input
							type="email" name="email" class="form-control"
							placeholder="Enter email">

					</div>


					<!-- Hire Date -->

					<div class="col-md-6 mb-3">

						<label class="form-label fw-semibold">Hire Date</label> <input
							type="date" name="hireDate" class="form-control">

					</div>


					<!-- Department Dropdown -->

					<div class="col-md-6 mb-3">

						<label class="form-label fw-semibold">Department</label> <select
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

				</div>


				<!-- Buttons -->

				<div class="mt-3">

					<button class="btn btn-primary">
						<i class="bi bi-save"></i> Save Teacher
					</button>

					<a href="viewTeachers.jsp" class="btn btn-outline-secondary">
						Cancel </a>

				</div>

			</form>

		</div>

	</div>

</div>

<jsp:include page="../common/layout-end.jsp" />