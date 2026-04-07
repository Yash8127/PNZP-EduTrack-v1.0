<jsp:include page="../common/layout-start.jsp" />

<div class="container-fluid">

	<!-- Page Header -->
	<div class="d-flex justify-content-between align-items-center mb-4">

		<h3 class="fw-bold">
			<i class="bi bi-building"></i> Add Department
		</h3>

		<a href="viewDepartments.jsp" class="btn btn-secondary"> <i
			class="bi bi-arrow-left"></i> Back
		</a>

	</div>

	<!-- Form Card -->
	<div class="row justify-content-center">

		<div class="col-md-6">

			<div class="card shadow border-0">

				<div class="card-body">

					<form action="../DepartmentServlet" method="post">

						<div class="mb-3">

							<label class="form-label fw-semibold"> Department Name </label> <input
								type="text" name="deptName" class="form-control"
								placeholder="Enter Department Name" required>

						</div>

						<div class="d-flex gap-2">

							<button type="submit" class="btn btn-primary">

								<i class="bi bi-save"></i> Save Department

							</button>

							<a href="viewDepartments.jsp" class="btn btn-outline-secondary">

								Cancel </a>

						</div>

					</form>

				</div>

			</div>

		</div>

	</div>

</div>

<jsp:include page="../common/layout-end.jsp" />