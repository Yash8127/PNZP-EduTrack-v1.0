<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page
	import="java.util.*,com.school.DAO.FeesDAO,com.school.model.Fees"%>
<%@ page import="java.text.NumberFormat"%>
<%@ page import="java.util.Locale"%>

<jsp:include page="../common/layout-start.jsp" />

<div class="container-fluid">

	<div class="d-flex justify-content-between align-items-center mb-4">

		<h3 class="fw-bold">
			<i class="bi bi-cash-stack"></i> Fees
		</h3>

		<a href="addFees.jsp" class="btn btn-success"> Add Fees </a>

	</div>

	<%
	FeesDAO dao = new FeesDAO();
	List<Fees> list = dao.getAllFees();

	double collected = 0;
	double pending = 0;

	for (Fees f : list) {

		if (f.getStatus().equalsIgnoreCase("Paid"))
			collected += f.getAmount();

		else
			pending += f.getAmount();

	}

	NumberFormat nf = NumberFormat.getCurrencyInstance(new Locale("en", "IN"));
	%>

	<div class="row mb-4">

		<div class="col-md-4">

			<div class="card shadow border-0 text-center bg-success text-white">

				<div class="card-body">

					<h6>Total Collected</h6>

					<h3><%=nf.format(collected)%></h3>

				</div>

			</div>

		</div>

		<div class="col-md-4">

			<div class="card shadow border-0 text-center bg-danger text-white">

				<div class="card-body">

					<h6>Pending Fees</h6>

					<h3><%=nf.format(pending)%></h3>

				</div>

			</div>

		</div>

		<div class="col-md-4">

			<div class="card shadow border-0 text-center bg-primary text-white">

				<div class="card-body">

					<h6>Total Records</h6>

					<h3><%=list.size()%></h3>

				</div>

			</div>

		</div>

	</div>

	<div class="card shadow border-0">

		<div class="card-body">

			<table class="table table-hover table-bordered">

				<thead class="table-dark">

					<tr>
						<th>ID</th>
						<th>Student</th>
						<th>Amount</th>
						<th>Date</th>
						<th>Status</th>
						<th>Action</th>
					</tr>

				</thead>

				<tbody>

					<%
					for (Fees f : list) {

						String badge = "bg-success";

						if (f.getStatus().equals("Pending"))
							badge = "bg-danger";
					%>

					<tr>

						<td><%=f.getFeeId()%></td>

						<td><%=f.getStudentName()%></td>

						<td><%=nf.format(f.getAmount())%></td>

						<td><%=f.getFeeDate()%></td>

						<td><span class="badge <%=badge%>"> <%=f.getStatus()%>
						</span></td>

						<td>
							<button class="btn btn-danger btn-sm"
								onclick="confirmDelete('../DeleteFeesServlet?id=<%=f.getFeeId()%>')">
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
