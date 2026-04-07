<jsp:include page="../common/layout-start.jsp" />

<div class="container-fluid">

	<div class="d-flex justify-content-between align-items-center mb-4">

		<h3 class="fw-bold">
			<i class="bi bi-journal-text"></i> Add Exam
		</h3>

		<a href="viewExams.jsp" class="btn btn-secondary"> Back </a>

	</div>

	<div class="card shadow border-0">

		<div class="card-body">

			<form action="../ExamServlet" method="post">

				<div class="row">

					<div class="col-md-6 mb-3">

						<label>Exam Name</label> <input type="text" name="examName"
							class="form-control" required>

					</div>

					<div class="col-md-6 mb-3">

						<label>Exam Date</label> <input type="date" name="examDate"
							class="form-control" required>

					</div>

				</div>

				<button class="btn btn-primary">Save Exam</button>

			</form>

		</div>

	</div>

</div>

<jsp:include page="../common/layout-end.jsp" />