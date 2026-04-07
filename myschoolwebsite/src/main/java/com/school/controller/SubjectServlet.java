package com.school.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;

import java.io.IOException;

import com.school.DAO.SubjectDAO;
import com.school.model.Subject;

@WebServlet("/SubjectServlet")
public class SubjectServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		String name = req.getParameter("subjectName");
		int teacherId = Integer.parseInt(req.getParameter("teacherId"));
		int classId = Integer.parseInt(req.getParameter("classId"));

		Subject s = new Subject();

		s.setSubjectName(name);
		s.setTeacherId(teacherId);
		s.setClassId(classId);

		SubjectDAO dao = new SubjectDAO();

		if (dao.addSubject(s)) {

			res.sendRedirect("subject/viewSubjects.jsp?msg=added");

		} else {

			res.sendRedirect("subject/viewSubjects.jsp?msg=error");

		}

	}

}