package com.school.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;

import java.io.IOException;

import com.school.DAO.DepartmentDAO;

@WebServlet("/DeleteDepartmentServlet")
public class DeleteDepartmentServlet extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		int id = Integer.parseInt(req.getParameter("id"));

		DepartmentDAO dao = new DepartmentDAO();

		if (dao.deleteDepartment(id)) {

			res.sendRedirect("department/viewDepartments.jsp");
		} else {
			res.sendRedirect("department/viewDepartments.jsp?msg=error");
		}
	}
}
