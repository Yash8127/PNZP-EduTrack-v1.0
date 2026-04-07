package com.school.controller;

import java.io.IOException;
import java.sql.*;

import com.school.utility.DBConnection;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String name = request.getParameter("name");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String role = request.getParameter("role");

		try {
			Connection con = DBConnection.getConnection();

			int teacherId = 0;
			int studentId = 0;

			// 🔥 IF TEACHER → INSERT INTO Teacher TABLE
			if ("TEACHER".equals(role)) {

				String tQuery = "INSERT INTO Teacher(teacher_name) VALUES (?)";
				PreparedStatement ps1 = con.prepareStatement(tQuery, Statement.RETURN_GENERATED_KEYS);
				ps1.setString(1, name);
				ps1.executeUpdate();

				ResultSet rs = ps1.getGeneratedKeys();
				if (rs.next()) {
					teacherId = rs.getInt(1);
				}
			}

			// 🔥 IF STUDENT → INSERT INTO Student TABLE
			else if ("STUDENT".equals(role)) {

				String sQuery = "INSERT INTO Student(student_name) VALUES (?)";
				PreparedStatement ps2 = con.prepareStatement(sQuery, Statement.RETURN_GENERATED_KEYS);
				ps2.setString(1, name);
				ps2.executeUpdate();

				ResultSet rs = ps2.getGeneratedKeys();
				if (rs.next()) {
					studentId = rs.getInt(1);
				}
			}

			// 🔥 INSERT INTO USERS TABLE
			String query = "INSERT INTO users(name, username, password, role, teacher_id, student_id) VALUES (?, ?, ?, ?, ?, ?)";
			PreparedStatement ps = con.prepareStatement(query);

			ps.setString(1, name);
			ps.setString(2, username);
			ps.setString(3, password);
			ps.setString(4, role);

			if ("TEACHER".equals(role)) {
				ps.setInt(5, teacherId);
				ps.setNull(6, Types.INTEGER);
			} else if ("STUDENT".equals(role)) {
				ps.setNull(5, Types.INTEGER);
				ps.setInt(6, studentId);
			} else {
				ps.setNull(5, Types.INTEGER);
				ps.setNull(6, Types.INTEGER);
			}

			int n = ps.executeUpdate();

			if (n > 0) {
				response.sendRedirect("auth/login.jsp?success=1");
			} else {
				response.sendRedirect("auth/register.jsp?error=1");
			}

		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("auth/register.jsp?error=1");
		}
	}
}