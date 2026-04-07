package com.school.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import java.io.IOException;

import com.school.DAO.TeacherDAO;

@WebServlet("/DeleteTeacherServlet")
public class DeleteTeacherServlet extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		int id = Integer.parseInt(req.getParameter("id"));

		TeacherDAO dao = new TeacherDAO();

		if (dao.deleteTeacher(id)) {

			res.sendRedirect("teacher/viewTeachers.jsp?msg=deleted");

		} else {

			res.sendRedirect("teacher/viewTeachers.jsp?msg=error");

		}

	}

}