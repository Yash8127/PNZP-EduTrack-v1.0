package com.school.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;

import java.io.IOException;

import com.school.DAO.DepartmentDAO;
import com.school.model.Department;

@WebServlet("/DepartmentServlet")
public class DepartmentServlet extends HttpServlet {

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		String deptName = req.getParameter("deptName");

		Department d = new Department();

		d.setDeptName(deptName);

		DepartmentDAO dao = new DepartmentDAO();

		if (dao.addDepartment(d)) {
		    res.sendRedirect("department/viewDepartments.jsp?msg=success");
		} else {
		    res.sendRedirect("department/viewDepartments.jsp?msg=error");
		}
	}

}
