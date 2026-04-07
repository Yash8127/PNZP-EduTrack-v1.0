<%@ page
	import="java.util.*,com.school.DAO.NoticeDAO,com.school.model.Notice"%>

<jsp:include page="../common/layout-start.jsp" />

<div class="container-fluid">

	<!-- HEADER -->
	<div class="d-flex justify-content-between align-items-center mb-4">

		<h3 class="fw-bold">
			<i class="bi bi-megaphone-fill"></i> Notices
		</h3>

		<a href="addNotice.jsp" class="btn btn-success"> Add Notice </a>

	</div>

	<!-- TABLE CARD -->
	<div class="card shadow border-0">

		<div class="card-body">

			<table class="table table-bordered table-hover">

				<thead class="table-dark">

					<tr>
						<th>ID</th>
						<th>Title</th>
						<th>Description</th>
						<th>Action</th>
					</tr>

				</thead>

				<tbody>

					<%
					NoticeDAO dao = new NoticeDAO();
					List<Notice> list = dao.getAllNotices();

					for (Notice n : list) {
					%>

					<tr>

						<td><%=n.getId()%></td>

						<td><i class="bi bi-megaphone-fill text-primary me-2"></i> <%=n.getTitle()%>
						</td>

						<td><%=n.getDescription()%></td>

						<td>
							<button class="btn btn-danger btn-sm"
								onclick="confirmDelete('../DeleteNoticeServlet?id=<%=n.getId()%>')">

								<i class="bi bi-trash"></i> Delete

							</button>
						</td>


					</tr>

					<%
					}
					%>
					<%
					if (list.isEmpty()) {
					%>
					<tr>
						<td colspan="4" class="text-center text-muted">No notices
							available</td>
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