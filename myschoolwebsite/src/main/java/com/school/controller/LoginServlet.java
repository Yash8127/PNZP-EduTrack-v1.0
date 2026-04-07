package com.school.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.school.utility.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String username = request.getParameter("username");
		String password = request.getParameter("password");

		try {
			Connection con = DBConnection.getConnection();

			String query = "SELECT * FROM users WHERE username=? AND password=?";
			PreparedStatement ps = con.prepareStatement(query);

			ps.setString(1, username);
			ps.setString(2, password);

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {

				String role = rs.getString("role");

				HttpSession session = request.getSession();
				session.setAttribute("username", username);
				session.setAttribute("role", role);

				// 🔥 ADMIN LOGIN
				if ("ADMIN".equals(role)) {
					response.sendRedirect("admin/dashboard.jsp");
				}

				// 🔥 TEACHER LOGIN
				else if ("TEACHER".equals(role)) {

					int teacherId = rs.getInt("teacher_id");

					// 👉 Get class_id from Teacher table
					PreparedStatement ps2 = con.prepareStatement("SELECT class_id FROM Teacher WHERE teacher_id=?");
					ps2.setInt(1, teacherId);

					ResultSet rs2 = ps2.executeQuery();

					int classId = 0;
					if (rs2.next()) {
						classId = rs2.getInt("class_id");
					}

					// 🔥 Store in session
					session.setAttribute("teacherId", teacherId);
					session.setAttribute("classId", classId);

					response.sendRedirect("teacher/teacher-dashboard.jsp");
				}

				// 🔥 STUDENT LOGIN
				else if ("STUDENT".equals(role)) {

					int studentId = rs.getInt("student_id");

					session.setAttribute("studentId", studentId);

					response.sendRedirect("student/student-dashboard.jsp");
				}

			} else {
				response.sendRedirect("auth/login.jsp?error=invalid");
			}

		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("auth/login.jsp?error=server");
		}
	}
}