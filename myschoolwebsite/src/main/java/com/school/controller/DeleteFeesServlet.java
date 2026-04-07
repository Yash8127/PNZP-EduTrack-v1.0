package com.school.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import java.io.IOException;

import com.school.DAO.FeesDAO;

@WebServlet("/DeleteFeesServlet")
public class DeleteFeesServlet extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		int id = Integer.parseInt(req.getParameter("id"));

		FeesDAO dao = new FeesDAO();

		if (dao.deleteFees(id)) {

			res.sendRedirect("fees/viewFees.jsp?msg=deleted");

		} else {

			res.sendRedirect("fees/viewFees.jsp?msg=error");

		}

	}

}