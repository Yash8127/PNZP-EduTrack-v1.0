package com.school.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;

import java.io.IOException;

import com.school.DAO.ClassesDAO;
import com.school.model.Classes;

@WebServlet("/ClassesServlet")
public class ClassesServlet extends HttpServlet {

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		String className = req.getParameter("className");
		String section = req.getParameter("section");
		int deptId = Integer.parseInt(req.getParameter("deptId"));

		Classes c = new Classes();

		c.setClassName(className);
		c.setSection(section);
		c.setDeptId(deptId);

		ClassesDAO dao = new ClassesDAO();

		if (dao.addClass(c)) {

			res.sendRedirect("classes/viewClasses.jsp?msg=added");

		} else {

			res.sendRedirect("classes/addClass.jsp?msg=error");

		}

	}
}