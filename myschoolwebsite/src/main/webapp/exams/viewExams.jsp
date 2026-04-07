<%@ page
	import="java.util.*,com.school.DAO.ExamDAO,com.school.model.Exam"%>

<jsp:include page="../common/layout-start.jsp" />

<div class="container-fluid">

	<div class="d-flex justify-content-between align-items-center mb-4">

		<h3 class="fw-bold">
			<i class="bi bi-journal-text"></i> Exams
		</h3>

		<a href="addExam.jsp" class="btn btn-success"> Add Exam </a>

	</div>

	<div class="card shadow border-0">

		<div class="card-body">

			<table class="table table-bordered table-hover">

				<thead class="table-dark">

					<tr>
						<th>ID</th>
						<th>Exam Name</th>
						<th>Date</th>
						<th>Action</th>
					</tr>

				</thead>

				<tbody>

					<%
					ExamDAO dao = new ExamDAO();

					List<Exam> list = dao.getAllExams();

					for (Exam e : list) {
					%>

					<tr>

						<td><%=e.getExamId()%></td>

						<td><%=e.getExamName()%></td>

						<td><%=e.getExamDate()%></td>

						<td>
							<button class="btn btn-danger btn-sm"
								onclick="confirmDelete('../DeleteExamServlet?id=<%=e.getExamId()%>')">

								<i class="bi bi-trash"></i> Delete

							</button>
						</td>

					</tr>

					<%
					}
					%>

				</tbody>

			</table>

		</div>

	</div>

</div>

<jsp:include page="../common/layout-end.jsp" />