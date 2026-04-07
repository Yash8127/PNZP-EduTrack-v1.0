package com.school.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;

import java.io.IOException;

import com.school.DAO.SubjectDAO;

@WebServlet("/DeleteSubjectServlet")
public class DeleteSubjectServlet extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		int id = Integer.parseInt(req.getParameter("id"));

		SubjectDAO dao = new SubjectDAO();

		if (dao.deleteSubject(id)) {

			res.sendRedirect("subject/viewSubjects.jsp?msg=deleted");

		} else {

			res.sendRedirect("subject/viewSubjects.jsp?msg=error");

		}

	}

}