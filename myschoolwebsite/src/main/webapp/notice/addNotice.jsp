<jsp:include page="../common/layout-start.jsp" />

<div class="container-fluid">

	<!-- HEADER -->
	<div class="d-flex justify-content-between align-items-center mb-4">

		<h3 class="fw-bold">
			<i class="bi bi-megaphone-fill"></i> Add Notice
		</h3>

		<a href="viewNotices.jsp" class="btn btn-secondary"> Back </a>

	</div>

	<!-- FORM CARD -->
	<div class="card shadow border-0">

		<div class="card-body">

			<form action="../NoticeServlet" method="post">

				<!-- TITLE -->
				<div class="mb-3">
					<label class="form-label fw-bold">Notice Title</label> <input
						type="text" name="title" class="form-control"
						placeholder="Enter notice title" required>
				</div>

				<!-- DESCRIPTION -->
				<div class="mb-3">
					<label class="form-label fw-bold">Description</label>
					<textarea name="description" class="form-control" rows="4"
						placeholder="Enter notice description" required></textarea>
				</div>

				<!-- BUTTON -->
				<button type="submit" class="btn btn-success">Add Notice</button>

			</form>

		</div>

	</div>

</div>

<jsp:include page="../common/layout-end.jsp" />