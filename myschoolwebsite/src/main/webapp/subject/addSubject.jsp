<%@ page
	import="java.util.*,com.school.DAO.TeacherDAO,com.school.DAO.ClassesDAO,com.school.model.*"%>

<jsp:include page="../common/layout-start.jsp" />

<div class="container-fluid">

	<!-- Header -->
	<div class="d-flex justify-content-between align-items-center mb-4">

		<h3 class="fw-bold">
			<i class="bi bi-book"></i> Add Subject
		</h3>

		<a href="viewSubjects.jsp" class="btn btn-secondary"> <i
			class="bi bi-arrow-left"></i> Back
		</a>

	</div>

	<div class="row justify-content-center">

		<div class="col-md-8">

			<div class="card shadow border-0">

				<div class="card-body">

					<form action="../SubjectServlet" method="post">

						<div class="row">

							<!-- Subject Name -->

							<div class="col-md-6 mb-3">

								<label class="form-label fw-semibold">Subject Name</label> <input
									type="text" name="subjectName" class="form-control"
									placeholder="Enter subject name" required>

							</div>


							<!-- Teacher -->

							<div class="col-md-6 mb-3">

								<label class="form-label fw-semibold">Teacher</label> <select
									name="teacherId" class="form-select">

									<%
									TeacherDAO tdao = new TeacherDAO();
									List<Teacher> tlist = tdao.getAllTeachers();

									for (Teacher t : tlist) {
									%>

									<option value="<%=t.getTeacherId()%>">
										<%=t.getTeacherName()%>
									</option>

									<%
									}
									%>

								</select>

							</div>


							<!-- Class -->

							<div class="col-md-6 mb-3">

								<label class="form-label fw-semibold">Class</label> <select
									name="classId" class="form-select">

									<%
									ClassesDAO cdao = new ClassesDAO();
									List<Classes> clist = cdao.getAllClasses();

									for (Classes c : clist) {
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

						</div>


						<div class="d-flex gap-2">

							<button type="submit" class="btn btn-primary">

								<i class="bi bi-save"></i> Save Subject

							</button>

							<a href="viewSubjects.jsp" class="btn btn-outline-secondary">

								Cancel </a>

						</div>

					</form>

				</div>

			</div>

		</div>

	</div>

</div>

<jsp:include page="../common/layout-end.jsp" />