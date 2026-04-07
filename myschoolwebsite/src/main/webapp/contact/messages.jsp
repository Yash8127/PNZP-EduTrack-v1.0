<%@ page
	import="java.util.*,com.school.DAO.ContactDAO,com.school.model.Contact"%>

<jsp:include page="../common/layout-start.jsp" />

<%
int currentPage = 1;
int recordsPerPage = 5;

if (request.getParameter("page") != null) {
	currentPage  = Integer.parseInt(request.getParameter("page"));
}

int start = (currentPage - 1) * recordsPerPage;

ContactDAO dao = new ContactDAO();
List<Contact> list = dao.getContactsByPage(start, recordsPerPage);

int totalRecords = dao.getContactCount();
int totalPages = (int) Math.ceil(totalRecords * 1.0 / recordsPerPage);
%>

<div class="container-fluid">

	<h3 class="fw-bold mb-4">
		<i class="bi bi-envelope-fill"></i> Contact Messages
	</h3>

	<div class="card shadow border-0">
		<div class="card-body">

			<table class="table table-hover align-middle">

				<thead class="table-dark">
					<tr>
						<th>ID</th>
						<th>Name</th>
						<th>Email</th>
						<th>Message</th>
						<th>Action</th>
					</tr>
				</thead>

				<tbody>

					<%
					if (list.isEmpty()) {
					%>
					<tr>
						<td colspan="5" class="text-center">No Data</td>
					</tr>
					<%
					} else {

					for (Contact c : list) {
					%>

					<tr>
						<td><%=c.getId()%></td>
						<td><%=c.getName()%></td>
						<td><%=c.getEmail()%></td>

						<td><%=c.getMessage().length() > 40 ? c.getMessage().substring(0, 40) + "..." : c.getMessage()%></td>

						<td>
							<button class="btn btn-info btn-sm text-white"
								onclick="viewMessage('<%=c.getName()%>','<%=c.getEmail()%>','<%=c.getMessage().replace("'", "\\'")%>')">
								<i class="bi bi-eye"></i>
							</button> <a
							href="<%=request.getContextPath()%>/DeleteContactServlet?id=<%=c.getId()%>"
							class="btn btn-danger btn-sm" onclick="return confirm('Delete?')">
								<i class="bi bi-trash"></i>
						</a>
						</td>
					</tr>

					<%
					}
					}
					%>

				</tbody>

			</table>

			<!-- PAGINATION -->
			<nav>
				<ul class="pagination justify-content-center">

					<%
					for (int i = 1; i <= totalPages; i++) {
					%>

					<li class="page-item <%=(i ==currentPage ? "active" : "")%>"><a
						class="page-link" href="	messages.jsp?page=<%=i%>"> <%=i%>
					</a></li>

					<%
					}
					%>

				</ul>
			</nav>

		</div>
	</div>

</div>

<!-- MODAL -->
<div class="modal fade" id="messageModal">
	<div class="modal-dialog">
		<div class="modal-content">

			<div class="modal-header bg-primary text-white">
				<h5>Message Details</h5>
				<button class="btn-close" data-bs-dismiss="modal"></button>
			</div>

			<div class="modal-body">
				<p>
					<strong>Name:</strong> <span id="modalName"></span>
				</p>
				<p>
					<strong>Email:</strong> <span id="modalEmail"></span>
				</p>
				<p>
					<strong>Message:</strong>
				</p>
				<p id="modalMessage"></p>
			</div>

		</div>
	</div>
</div>

<script>
function viewMessage(name,email,message){
	document.getElementById("modalName").innerText=name;
	document.getElementById("modalEmail").innerText=email;
	document.getElementById("modalMessage").innerText=message;

	new bootstrap.Modal(document.getElementById("messageModal")).show();
}
</script>

<jsp:include page="../common/layout-end.jsp" />