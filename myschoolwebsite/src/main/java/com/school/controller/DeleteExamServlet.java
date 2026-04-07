package com.school.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import java.io.IOException;

import com.school.DAO.ExamDAO;

@WebServlet("/DeleteExamServlet")
public class DeleteExamServlet extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		int id = Integer.parseInt(req.getParameter("id"));

		ExamDAO dao = new ExamDAO();

		if (dao.deleteExam(id)) {

			res.sendRedirect("exams/viewExams.jsp?msg=deleted");

		} else {

			res.sendRedirect("exams/viewExams.jsp?msg=error");

		}

	}

}