<%@ page
	import="java.util.*,com.school.DAO.ClassesDAO,com.school.model.Classes"%>

<jsp:include page="../common/layout-start.jsp" />

<div class="container-fluid">

	<!-- Header -->
	<div class="d-flex justify-content-between align-items-center mb-4">

		<h3 class="fw-bold">
			<i class="bi bi-person-plus"></i> Add Student
		</h3>

		<a href="viewStudents.jsp" class="btn btn-secondary"> <i
			class="bi bi-arrow-left"></i> Back
		</a>

	</div>

	<div class="row justify-content-center">

		<div class="col-md-8">

			<div class="card shadow border-0">

				<div class="card-body">

					<form action="../StudentServlet" method="post">

						<div class="row">

							<div class="col-md-6 mb-3">

								<label class="form-label fw-semibold">Student Name</label> <input
									type="text" name="studentName" class="form-control"
									placeholder="Enter student name" required>

							</div>

							<div class="col-md-6 mb-3">

								<label class="form-label fw-semibold">Gender</label> <select
									name="gender" class="form-select">

									<option>Male</option>
									<option>Female</option>

								</select>

							</div>

							<div class="col-md-6 mb-3">

								<label class="form-label fw-semibold">Age</label> <input
									type="number" name="age" class="form-control">

							</div>

							<div class="col-md-6 mb-3">

								<label class="form-label fw-semibold">Phone</label> <input
									type="text" name="phone" class="form-control">

							</div>

							<div class="col-md-6 mb-3">

								<label class="form-label fw-semibold">Class</label> <select
									name="classId" class="form-select">

									<%
									ClassesDAO dao = new ClassesDAO();
									List<Classes> list = dao.getAllClasses();

									for (Classes c : list) {
									%>

									<option value="<%=c.getClassId()%>">
										<%=c.getClassName()%> -
										<%=c.getSection()%>
									</option>

									<%
									}
									%>

								</select>

							</div>

							<div class="col-md-6 mb-3">

								<label class="form-label fw-semibold">Admission Date</label> <input
									type="date" name="admissionDate" class="form-control">

							</div>

							<div class="col-md-12 mb-3">

								<label class="form-label fw-semibold">Address</label>

								<textarea name="address" class="form-control" rows="3"></textarea>

							</div>

						</div>

						<div class="d-flex gap-2">

							<button type="submit" class="btn btn-primary">

								<i class="bi bi-save"></i> Save Student

							</button>

							<a href="viewStudents.jsp" class="btn btn-outline-secondary">

								Cancel </a>

						</div>

					</form>

				</div>

			</div>

		</div>

	</div>

</div>

<jsp:include page="../common/layout-end.jsp" />