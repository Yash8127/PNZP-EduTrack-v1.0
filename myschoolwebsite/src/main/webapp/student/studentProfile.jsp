<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.sql.*,java.util.*"%>
<%@ page import="com.school.utility.DBConnection"%>

<jsp:include page="../common/layout-start.jsp" />

<div class="container-fluid">

	<h3 class="fw-bold mb-4">
		<i class="bi bi-person"></i> Student Profile
	</h3>

	<%
	int studentId = Integer.parseInt(request.getParameter("id"));

	Connection con = DBConnection.getConnection();

	PreparedStatement ps;
	ResultSet rs;
	%>

	<!-- STUDENT INFORMATION -->

	<div class="card shadow mb-4">

		<div class="card-header fw-bold">Student Information</div>

		<div class="card-body">

			<table class="table table-bordered">

				<%
				ps = con.prepareStatement("SELECT s.*,c.class_name FROM Student s " + "JOIN Classes c ON s.class_id=c.class_id "
						+ "WHERE s.student_id=?");

				ps.setInt(1, studentId);

				rs = ps.executeQuery();

				if (rs.next()) {
				%>

				<tr>
					<th>ID</th>
					<td><%=rs.getInt("student_id")%></td>
				</tr>

				<tr>
					<th>Name</th>
					<td><%=rs.getString("student_name")%></td>
				</tr>

				<tr>
					<th>Gender</th>
					<td><%=rs.getString("gender")%></td>
				</tr>

				<tr>
					<th>Age</th>
					<td><%=rs.getInt("age")%></td>
				</tr>

				<tr>
					<th>Phone</th>
					<td><%=rs.getString("phone")%></td>
				</tr>

				<tr>
					<th>Class</th>
					<td><%=rs.getString("class_name")%></td>
				</tr>

				<tr>
					<th>Address</th>
					<td><%=rs.getString("address")%></td>
				</tr>

				<%
				}
				%>

			</table>

		</div>

	</div>

	<!-- FEES HISTORY -->

	<div class="card shadow mb-4">

		<div class="card-header fw-bold">Fees History</div>

		<div class="card-body">

			<table class="table table-bordered table-hover">

				<thead class="table-dark">

					<tr>
						<th>ID</th>
						<th>Amount</th>
						<th>Date</th>
						<th>Status</th>
					</tr>

				</thead>

				<tbody>

					<%
					ps = con.prepareStatement("SELECT * FROM Fees WHERE student_id=?");

					ps.setInt(1, studentId);

					rs = ps.executeQuery();

					while (rs.next()) {

						String badge = "bg-success";

						if (rs.getString("status").equals("Pending"))
							badge = "bg-danger";
					%>

					<tr>

						<td><%=rs.getInt("fee_id")%></td>

						<td>₹ <%=rs.getDouble("amount")%></td>

						<td><%=rs.getString("payment_date")%></td>

						<td><span class="badge <%=badge%>"> <%=rs.getString("status")%>
						</span></td>

					</tr>

					<%
					}
					%>

				</tbody>

			</table>

		</div>

	</div>

	<!-- SUBJECTS -->

	<div class="card shadow">

		<div class="card-header fw-bold">Subjects</div>

		<div class="card-body">

			<table class="table table-bordered">

				<thead class="table-dark">

					<tr>
						<th>ID</th>
						<th>Subject</th>
					</tr>

				</thead>

				<tbody>

					<%
					ps = con.prepareStatement("SELECT subject_id,subject_name FROM Subject");

					rs = ps.executeQuery();

					while (rs.next()) {
					%>

					<tr>

						<td><%=rs.getInt("subject_id")%></td>

						<td><%=rs.getString("subject_name")%></td>

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
