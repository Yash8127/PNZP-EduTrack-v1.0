<%@ page
	import="java.util.*,com.school.DAO.SubjectDAO,com.school.model.Subject"%>

<jsp:include page="../common/layout-start.jsp" />

<div class="container-fluid">

	<div class="d-flex justify-content-between align-items-center mb-4">

		<h3 class="fw-bold">
			<i class="bi bi-book"></i> Subjects
		</h3>

		<a href="addSubject.jsp" class="btn btn-success"> <i
			class="bi bi-plus"></i> Add Subject
		</a>

	</div>

	<div class="mb-3">

		<input type="text" id="searchSubject" class="form-control"
			placeholder="Search subject">

	</div>

	<div class="card shadow border-0">

		<div class="card-body">

			<div class="table-responsive">

				<table class="table table-hover align-middle" id="subjectTable">

					<thead class="table-dark">

						<tr>
							<th>ID</th>
							<th>Subject</th>
							<th>Teacher</th>
							<th>Class</th>
							<th>Action</th>
						</tr>

					</thead>

					<tbody>

						<%
						SubjectDAO dao = new SubjectDAO();
						List<Subject> list = dao.getAllSubjects();

						if (list.isEmpty()) {
						%>
						<tr>
							<td colspan="7" class="text-center text-muted">No Subjects
								Found</td>
						</tr>
						<%
						} else {
						for (Subject s : list) {
						%>

						<tr>

							<td><%=s.getSubjectId()%></td>

							<td><i class="bi bi-book text-primary"></i> <%=s.getSubjectName()%>
							</td>

							<td><%=s.getTeacherName()%></td>

							<td><%=s.getClassName()%></td>

							<td>

								<button class="btn btn-danger btn-sm"
									onclick="confirmDelete('../DeleteSubjectServlet?id=<%=s.getSubjectId()%>')">

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