<%@ page
	import="java.util.*,com.school.DAO.StudentDAO,com.school.model.Student"%>

<jsp:include page="../common/layout-start.jsp" />

<div class="container-fluid">

	<div class="d-flex justify-content-between align-items-center mb-4">

		<h3 class="fw-bold">
			<i class="bi bi-cash-stack"></i> Add Fees
		</h3>

		<a href="viewFees.jsp" class="btn btn-secondary">Back</a>

	</div>

	<div class="card shadow border-0">

		<div class="card-body">

			<form action="../FeesServlet" method="post">

				<div class="row">

					<div class="col-md-6 mb-3">

						<label>Student</label> <select name="studentId"
							class="form-select">

							<%
							StudentDAO dao = new StudentDAO();
							List<Student> list = dao.getAllStudents();

							for (Student s : list) {
							%>

							<option value="<%=s.getStudentId()%>">
								<%=s.getStudentName()%>
							</option>

							<%
							}
							%>

						</select>

					</div>

					<div class="col-md-6 mb-3">

						<label>Amount</label> <input type="number" name="amount"
							class="form-control">

					</div>

					<div class="col-md-6 mb-3">

						<label>Fee Date</label> <input type="date" name="feeDate"
							class="form-control">

					</div>

					<div class="col-md-6 mb-3">

						<label>Status</label> <select name="status" class="form-select">

							<option>Paid</option>
							<option>Pending</option>

						</select>

					</div>

				</div>

				<button class="btn btn-primary">Save Fees</button>

			</form>

		</div>

	</div>

</div>

<jsp:include page="../common/layout-end.jsp" />