package com.school.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import java.io.IOException;

import com.school.DAO.ExamDAO;
import com.school.model.Exam;

@WebServlet("/ExamServlet")
public class ExamServlet extends HttpServlet {

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		String name = req.getParameter("examName");
		String date = req.getParameter("examDate");

		Exam e = new Exam();

		e.setExamName(name);
		e.setExamDate(date);

		ExamDAO dao = new ExamDAO();

		if (dao.addExam(e)) {

			res.sendRedirect("exams/viewExams.jsp?msg=added");

		} else {

			res.sendRedirect("exams/viewExams.jsp?msg=error");

		}

	}

}