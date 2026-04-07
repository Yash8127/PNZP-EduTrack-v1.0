package com.school.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;

import java.io.IOException;

import com.school.DAO.ClassesDAO;

@WebServlet("/DeleteClassServlet")
public class DeleteClassServlet extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		int id = Integer.parseInt(req.getParameter("id"));

		ClassesDAO dao = new ClassesDAO();

		if (dao.deleteClass(id)) {

			res.sendRedirect("classes/viewClasses.jsp?msg=deleted");

		} else {

			res.sendRedirect("classes/viewClasses.jsp?msg=error");

		}

	}
}